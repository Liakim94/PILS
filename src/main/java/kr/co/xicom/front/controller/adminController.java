package kr.co.xicom.front.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.*;
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
import java.io.PrintWriter;
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
    @GetMapping(value = "/join/view.do")
    public ModelAndView joinView(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                             @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
                             @RequestParam(value = "bizNo") String bizNo) throws Exception {

        ModelAndView mav = new ModelAndView("admin/join_view");

        cmpVO.setBizNo(bizNo);
        cmpVO.setMem_cd("M302");

//            List<CmpSttusVO> sttus = consultingService.getCmpSttus(stVO);
            List<AttachVO> attachList = consultingService.getAttachList(cmpVO);

            CmpMemberVo rs = consultingService.getViewByBizNo(cmpVO);
            rs.setBizNo1(rs.getBizNo().substring(0, 3));
            rs.setBizNo2(rs.getBizNo().substring(3, 5));
            rs.setBizNo3(rs.getBizNo().substring(5, 10));
//            if (rs == null && sttus == null) {
                if (rs == null) {
                System.out.println("비정상적인 접근입니다.");
            }

            mav.addObject("rs", rs);
//            mav.addObject("st", sttus);
            mav.addObject("attachList", attachList);

        return mav;
    }
    //동행기업 삭제하기
    @PostMapping(value = "/join/view.do")
    public String deleteCmp(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO) throws Exception{
        try {
            int result = adminService.deleteCmp(cmpVO.getBizNo());
            if (result > 0) {
                return "redirect:/admin/management/list.do";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }
    //동행기업 정보 수정하기
    @GetMapping(value = "/join/edit.do")
    public ModelAndView joinEdit(@ModelAttribute("frmEdit") CmpMemberVo cmpVO,
                                 @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
                                 @RequestParam(value = "bizNo") String bizNo) throws Exception {

        ModelAndView mav = new ModelAndView("admin/join_edit");

        cmpVO.setBizNo(bizNo);
        cmpVO.setMem_cd("M302");
        try {
            cmpVO = adminService.memInfo(cmpVO);
            cmpVO.setBizNo1(cmpVO.getBizNo().substring(0, 3));
            cmpVO.setBizNo2(cmpVO.getBizNo().substring(3, 5));
            cmpVO.setBizNo3(cmpVO.getBizNo().substring(5, 10));

            stVO.setBizNo(bizNo);
//            List<CmpSttusVO> sttus = consultingService.getCmpSttus(stVO);

            List<AttachVO> attachList = this.consultingService.getAttachList(cmpVO);
            if (attachList != null && attachList.size() > 0) {
                Gson gson = new GsonBuilder().setPrettyPrinting().create();
                String jsonFileList = gson.toJson(attachList);
                cmpVO.setJsonFileList(jsonFileList);
            }

            mav.addObject("frmEdit", cmpVO);
//            mav.addObject("st", sttus);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }
    //수정 처리
    @PostMapping(value = "/join/edit.do")
    public String doJoinEdit(
            @ModelAttribute("frmEdit") CmpMemberVo cmpVO,
            @ModelAttribute("CmpSttusVO") CmpSttusVO stVO) throws Exception {

        try {
            String bizNo = cmpVO.getBizNo1() + cmpVO.getBizNo2() + cmpVO.getBizNo3();
            cmpVO.setBizNo(bizNo);
            stVO.setBizNo(bizNo);

//            int result = consultingService.updateJoin(cmpVO, stVO,null);
            int result = consultingService.updateJoin(cmpVO, null);


            if (result > 0) {
                return "redirect:/admin/join/view.do?bizNo="+bizNo;
            } else {

                return "forward:/common/error.jsp";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }

    //동행기업 추천 현황
    @GetMapping(value = "/recom/list.do")
    public ModelAndView recomList(@ModelAttribute("RcmdVO")RcmdVO vo) throws Exception {

        ModelAndView mav = new ModelAndView("admin/recom_list");

        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(vo.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(vo.getPageSize());

        vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
        vo.setLastIndex(paginationInfo.getLastRecordIndex());
        vo.setPageUnit(paginationInfo.getRecordCountPerPage());

        Map<String, Object> rs = adminService.recomList(vo);
        int totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("paginationInfo", paginationInfo);
        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("rs", rs.get("resultList"));

        return mav;
    }
    @GetMapping(value = "/recom/view.do")
    public ModelAndView recomView(@ModelAttribute("RcmdVO")RcmdVO vo,
                                  @RequestParam(value = "no") int no ) throws Exception {

        ModelAndView mav = new ModelAndView("admin/recom_view");

        try {
            RcmdVO rs = consultingService.rcmdView(no);
            rs.setApp_bizNo1(rs.getApply_bizno().substring(0, 3));
            rs.setApp_bizNo2(rs.getApply_bizno().substring(3, 5));
            rs.setApp_bizNo3(rs.getApply_bizno().substring(5, 10));
            rs.setRcmd_bizNo1(rs.getRcmd_bizno().substring(0, 3));
            rs.setRcmd_bizNo2(rs.getRcmd_bizno().substring(3, 5));
            rs.setRcmd_bizNo3(rs.getRcmd_bizno().substring(5, 10));
            if (rs == null ) {
                System.out.println("비정상적인 접근입니다.");
            }
            mav.addObject("rs", rs);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }

    //컨설팅 신청 현황
    @GetMapping(value = "/consulting/list.do")
    public ModelAndView conList(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
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
        rs = adminService.conList(cmpVO);

        int totalCnt = 0;
        totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("list", rs.get("resultList"));
        mav.addObject("paginationInfo", paginationInfo);
        return mav;
    }

    //담당자 현황
    @GetMapping("/management/list.do")
    public ModelAndView memManage(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
                                  ) throws Exception {
        ModelAndView mav = new ModelAndView("admin/mem_list");
        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(cmpVO.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(cmpVO.getPageSize());

        cmpVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        cmpVO.setLastIndex(paginationInfo.getLastRecordIndex());
        cmpVO.setPageUnit(paginationInfo.getRecordCountPerPage());

        try {
            Map<String, Object> rs = adminService.memManageList(cmpVO);
            List<CmpMemberVo> cmpVOList = (List<CmpMemberVo>) rs.get("resultList");
            cmpVOList.forEach(vo -> {
                vo.setMbphno(vo.getMbphno().replaceAll("(?<=.{9}).","*"));
            });
            cmpVOList.forEach(vo -> {
                if(vo.getName().length()<3){
                    vo.setName(vo.getName().replaceAll("(?<=.{1}).","*"));
                }
                vo.setName(vo.getName().replaceFirst("(?<=.{1}).","*"));

            });

            int totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
            paginationInfo.setTotalRecordCount(totalCnt);

            if (rs.get("resultList") == null) {
                ModelAndView error = new ModelAndView("common/error.jsp");
                return error;
            }
            mav.addObject("totalCnt", rs.get("resultCnt"));
            mav.addObject("rs", rs.get("resultList"));
            mav.addObject("paginationInfo", paginationInfo);
            mav.addObject("vo", cmpVO);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }
    //상세 화면
    @GetMapping(value = "/memDetail.do")
    public ModelAndView memDetail(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
            ,@RequestParam("id") String id) throws Exception {
        ModelAndView mav = new ModelAndView("admin/mem_view");
        cmpVO.setId(id);
        try {
            CmpMemberVo rs = adminService.memEdit(cmpVO);
            if (rs == null) {
                System.out.println("비정상적인 접근입니다.");
            }
            mav.addObject("rs", rs);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }
    //담당자 삭제 처리
    @PostMapping(value = "/memDetail.do")
    public String memDelete(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO) throws Exception {
        try {
            int result = adminService.deleteMem(cmpVO.getBizNo(), cmpVO.getId());

            if (result > 0) {
                return "redirect:/admin/management/list.do";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }
    //수정 화면
    @GetMapping(value = "/memEdit.do")
    public ModelAndView memEdit(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
                                ,@RequestParam("id") String id) throws Exception {
        ModelAndView mav = new ModelAndView("admin/mem_edit");
        cmpVO.setId(id);
        try {
            CmpMemberVo rs = adminService.memEdit(cmpVO);
            String[] email = rs.getEmail().split("@");
            rs.setEmail1(email[0]);
            rs.setEmail2(email[1]);
            if (rs == null) {
                System.out.println("비정상적인 접근입니다.");
            }
            mav.addObject("rs", rs);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }
    //수정 처리
    @RequestMapping(value = "/memEdit.do", method = {RequestMethod.POST})
    public String doMemEdit(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                            @RequestParam("id") String id) throws Exception {
        cmpVO.setId(id);
        try {
            String email = cmpVO.getEmail1() + '@' + cmpVO.getEmail2();
            cmpVO.setEmail(email);
            int result = adminService.updateMem(cmpVO);

            if (result > 0) {
                return "redirect:/admin/management/list.do";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }

    @GetMapping(value = "/changePw.do")
        public ModelAndView change(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
                                   ,@RequestParam("id") String id) throws Exception {
        ModelAndView mav = new ModelAndView("admin/mem_changePw");
        cmpVO.setId(id);
        mav.addObject("rs", cmpVO);
        return mav;
    }

    @RequestMapping(value = "/changePw.do", method = {RequestMethod.POST})
    public void changePw(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
                        ,HttpServletResponse response
                        ,HttpServletRequest request) throws Exception {

        int result = adminService.changePw(cmpVO);
        if(result>0){
            response.sendRedirect(request.getContextPath() + "/admin/management/list.do");
        }
        PrintWriter writer = response.getWriter();

        response.setContentType("text/html; charset=UTF-8;");
        request.setCharacterEncoding("utf-8");
        writer.println("<script type='text/javascript'>");
        writer.println("alert('데이터 저장 중 오류가 발생하였습니다.');");
        writer.println("history.back();");
        writer.println("</script>");
        writer.flush();
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
        List<AttachVO> attachList = this.adminService.getAttachList(vo);
        if (attachList != null && attachList.size() > 0) {
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            String jsonFileList = gson.toJson(attachList);
            vo.setJsonFileList(jsonFileList);
        }
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
    public ModelAndView readyEdit(@ModelAttribute("edit") BoardVO boardVO) throws Exception {

        ModelAndView mav = new ModelAndView("admin/ready_edit");
        int bbsId=6;
        boardVO.setBbsId(bbsId);
        BoardVO rs = boardService.getView(boardVO);
        //게시판 이름
        String menu = boardService.getMenu(bbsId);
        // 첨부파일 리스트
        List<AttachVO> attachList = this.boardService.getAttachList(boardVO);
        if (attachList != null && attachList.size() > 0) {
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            String jsonFileList = gson.toJson(attachList);
            rs.setJsonFileList(jsonFileList);
        }
        mav.addObject("edit", rs);
        mav.addObject("bbsNm", menu);
        return mav;
    }

    @PostMapping(value = "/ready/edit.do")
    public String doReadyEdit( @ModelAttribute("post") BoardVO boardVO) throws Exception {
        int bbsId=6;
        boardVO.setBbsId(bbsId);
        int result = adminService.updatePost(boardVO);

        if (result > 0) {
            return "redirect:/admin/ready/view.do?boardSeq=" + boardVO.getBoardSeq();
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
