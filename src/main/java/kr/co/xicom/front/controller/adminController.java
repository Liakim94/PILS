package kr.co.xicom.front.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.BoardVO;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.TraceVO;
import kr.co.xicom.front.service.AdminService;
import kr.co.xicom.front.service.BoardService;
import kr.co.xicom.front.service.ConsultingService;
import kr.co.xicom.front.service.MainService;
import kr.co.xicom.util.HtmlTagUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/admin")
@Controller
public class adminController {
    @Autowired
    ConsultingService consultingService;
    @Autowired
    AdminService adminService;
    @Autowired
    BoardService boardService;

    //동행기업 신청 현황
    @GetMapping(value = "/join/list.do")
    public ModelAndView joinList(ModelMap model,
                                 @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                                 HttpSession session,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("admin/join_list");

        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(cmpVO.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(cmpVO.getPageSize());

        cmpVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        cmpVO.setLastIndex(paginationInfo.getLastRecordIndex());
        cmpVO.setPageUnit(paginationInfo.getRecordCountPerPage());
        cmpVO.setMem_cd("M302"); //회원구분

        Map<String, Object> rs = new HashMap<String, Object>();
        rs = adminService.joinList(cmpVO);

        int totalCnt = 0;
        totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("list", rs.get("resultList"));
        mav.addObject("paginationInfo", paginationInfo);
        mav.addObject("vo", cmpVO);

        return mav;
    }

    //컨설팅 신청 현황
    @GetMapping(value = "/consulting/list.do")
    public ModelAndView conList(ModelMap model,
                                @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                                HttpSession session,
                                HttpServletRequest request,
                                HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("admin/con_list");

        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(cmpVO.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(cmpVO.getPageSize());

        cmpVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        cmpVO.setLastIndex(paginationInfo.getLastRecordIndex());
        cmpVO.setPageUnit(paginationInfo.getRecordCountPerPage());
        cmpVO.setMem_cd("M301"); //회원구분

        Map<String, Object> rs = new HashMap<String, Object>();
        rs = consultingService.list(cmpVO);

        int totalCnt = 0;
        totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("list", rs.get("resultList"));
        mav.addObject("paginationInfo", paginationInfo);
        mav.addObject("vo", cmpVO);
        return mav;
    }

    //담당자 현황
    @GetMapping("/management/list.do")
    public ModelAndView memManage(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
            , HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView("admin/mem_list");
        cmpVO.setBizNo((String) session.getAttribute("sessionBizNo"));
        try {
            List<CmpMemberVo> result = adminService.memManageList(cmpVO);
            if (result == null) {
                ModelAndView error = new ModelAndView("common/error.jsp");
                return error;
            }
            mav.addObject("rs", result);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }

    //걸어온 발자취 게시판 관리
    @RequestMapping("/trace/list.do")
    public ModelAndView traceList(@ModelAttribute("TraceVo") TraceVO vo) throws Exception {
        ModelAndView mav = new ModelAndView("admin/trace_list");

        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(vo.getPageIndex());
        paginationInfo.setRecordCountPerPage(15);
        paginationInfo.setPageSize(vo.getPageSize());

        vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
        vo.setLastIndex(paginationInfo.getLastRecordIndex());
        vo.setPageUnit(paginationInfo.getRecordCountPerPage());

        Map<String, Object> result = new HashMap<String, Object>();
        result = adminService.traceList(vo);

        int totalCnt = 0;
        totalCnt = Integer.parseInt(String.valueOf(result.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("rs", result.get("resultList"));
        mav.addObject("totalCnt", result.get("resultCnt"));
        mav.addObject("paginationInfo", paginationInfo);

        return mav;
    }

    @GetMapping("/trace/post.do")
    public ModelAndView tracePost(@ModelAttribute("post") TraceVO vo) throws Exception {
        ModelAndView mav = new ModelAndView("admin/trace_post");
        return mav;
    }

    @PostMapping("/trace/post.do")
    public String doTracePost(@ModelAttribute("post") TraceVO vo) throws Exception {
        int result = adminService.tracePost(vo,null);

        if (result > 0) {
            return "redirect:/admin/trace/view.do?seq="+vo.getSeq();
        } else {
            return "forward:/common/error.jsp";
        }
    }

    @RequestMapping("/trace/view.do")
    public ModelAndView traceView(@RequestParam(value = "seq") int seq
            , @ModelAttribute("TraceVO") TraceVO vo) throws Exception {
        ModelAndView mav = new ModelAndView("admin/trace_view");
        vo.setSeq(seq);
        vo = adminService.traceView(seq);
        List<AttachVO> attachList = adminService.getAttachList(vo);

        mav.addObject("rs", vo);
        mav.addObject("attachList", attachList);

        return mav;
    }

    @RequestMapping("/trace/edit.do")
    public ModelAndView traceEdit(@RequestParam(value = "seq") int seq
            , @ModelAttribute("edit") TraceVO vo) throws Exception {
        ModelAndView mav = new ModelAndView("admin/trace_edit");
        vo = adminService.traceView(seq);
        mav.addObject("edit", vo);

        return mav;
    }
    @PostMapping("/trace/edit.do")
    public String doTraceEdit(@ModelAttribute("edit") TraceVO vo) throws Exception {
        int result = adminService.traceUpdate(vo);
        if (result > 0) {
            return "redirect:/admin/trace/view.do?seq=" + vo.getSeq();
        }
        return "forward:/common/error.jsp";
    }


    @RequestMapping("/trace/delete.do")
    public String traceDelete(@RequestParam(value = "seq") int seq
            , @ModelAttribute("TraceVO") TraceVO vo) throws Exception {
        vo.setSeq(seq);
        int result = adminService.traceDelete(seq,vo);
        if (result > 0) {
            return "redirect:/admin/trace/list.do";
        }
        return "forward:/common/error.jsp";
    }
    //카드뉴스
    @RequestMapping(value = "/ready/list.do", method = {RequestMethod.GET})
    public ModelAndView readyList(@ModelAttribute("BoardVO") BoardVO boardVO) throws Exception {

        ModelAndView mav = new ModelAndView("admin/ready_list");

        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(boardVO.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(boardVO.getPageSize());

        boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
        boardVO.setPageUnit(paginationInfo.getRecordCountPerPage());
        int bbsId = 6;
        boardVO.setBbsId(bbsId);
        boardVO.setStat("1");

        Map<String, Object> result = new HashMap<String, Object>();
        result = boardService.list(boardVO);
        // 게시판 이름 가져오는 메소드
        String menu = boardService.getMenu(bbsId);

        int totalCnt = 0;
        totalCnt = Integer.parseInt(String.valueOf(result.get("resultCnt")));

        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("rs", result.get("resultList"));
        mav.addObject("totalCnt", result.get("resultCnt"));
        mav.addObject("paginationInfo", paginationInfo);
        mav.addObject("bbsId", bbsId);
        mav.addObject("bbsNm", menu);


        return mav;
    }

    @GetMapping(value = "/ready/view.do")
    public ModelAndView readyView(@ModelAttribute("BoardVO") BoardVO boardVO) throws Exception {

        ModelAndView mav = new ModelAndView("admin/ready_view");
        int bbsId=6;
        boardVO.setBbsId(bbsId);
        boardVO.setStat("1");
        BoardVO rs = boardService.getView(boardVO);
        String menu = boardService.getMenu(bbsId);
        List<AttachVO> attachList = boardService.getAttachList(boardVO);

        mav.addObject("rs", rs);
        mav.addObject("bbsId", bbsId);
        mav.addObject("bbsNm", menu);
        mav.addObject("attachList", attachList);

        return mav;
    }
    @GetMapping(value = "/ready/post.do")
    public ModelAndView readyPost(@ModelAttribute("post") BoardVO boardVO) throws Exception {

        ModelAndView mav =  new ModelAndView("admin/ready_post");
        int bbsId=6;
        String menu = boardService.getMenu(bbsId);

        mav.addObject("bbsId", bbsId);
        mav.addObject("post", boardVO);
        mav.addObject("bbsNm", menu);
        return mav;
    }
    @PostMapping(value = "/ready/post.do")
    public String doReadyPost(@ModelAttribute("post") BoardVO boardVO) throws Exception {
        boardVO.setBbsId(6);
        boardVO.setStat("1");
        int result = adminService.readyPost(boardVO,null);

        if (result > 0) {
            return "redirect:/admin/ready/view.do?boardSeq=" + boardVO.getBoardSeq();
        }
        else {
            return "forward:/common/error.jsp";
        }

    }

    @GetMapping(value = "/ready/edit.do")
    public ModelAndView readyEdit(@ModelAttribute("post") BoardVO boardVO) throws Exception {

        ModelAndView mav = new ModelAndView("admin/ready_edit");
        int bbsId=6;
        boardVO.setBbsId(bbsId);
        BoardVO rs = boardService.getView(boardVO);
        //게시판 이름
        String menu = boardService.getMenu(bbsId);

        mav.addObject("post", rs);
        mav.addObject("bbsNm", menu);
        return mav;
    }

    @PostMapping(value = "/ready/edit.do")
    public String doReadyEdit( @ModelAttribute("post") BoardVO boardVO) throws Exception {
        int bbsId=6;
        boardVO.setBbsId(bbsId);
        int result = adminService.updatePost(boardVO);

        if (result > 0) {
            return "redirect:/front/board/view.do?boardSeq=" + boardVO.getBoardSeq();
        }
        else {
            return "forward:/common/error.jsp";
        }
    }

    @PostMapping("/ready/delete.do")
    public String readyDelete( @ModelAttribute("post") BoardVO boardVO) throws Exception {
        boardVO.setBbsId(6);
        int result = boardService.updateStat(boardVO);
        if (result > 0) {
            return "redirect:/admin/ready/list.do";
        }
        return "forward:/common/error.jsp";
    }
}
