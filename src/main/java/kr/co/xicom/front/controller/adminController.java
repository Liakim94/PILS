package kr.co.xicom.front.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.*;
import kr.co.xicom.front.service.AdminService;
import kr.co.xicom.front.service.AgreementService;
import kr.co.xicom.front.service.BoardService;
import kr.co.xicom.front.service.ConsultingService;
import org.apache.commons.io.FilenameUtils;
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
    @Autowired
    AgreementService agreementService;

    /**
     * 동행기업 신청 현황
     */
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
                return "redirect:/admin/join/list.do";
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
        try {
            cmpVO =consultingService.getViewByBizNo(cmpVO);
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

    /**
     * 동행기업 추천 현황
     */
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

    /**
     * 컨설팅 신청 현황
     * */
    @GetMapping(value = "/consulting/list.do")
    public ModelAndView conList(@ModelAttribute("consultingVO") ConsultingVO vo,
                                HttpSession session,
                                HttpServletRequest request,
                                HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("admin/con_list");

        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(vo.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(vo.getPageSize());

        vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
        vo.setLastIndex(paginationInfo.getLastRecordIndex());
        vo.setPageUnit(paginationInfo.getRecordCountPerPage());

        Map<String, Object> rs = new HashMap<String, Object>();
        rs = adminService.consultList(vo);

        int totalCnt = 0;
        totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("list", rs.get("resultList"));
        mav.addObject("paginationInfo", paginationInfo);
        return mav;
    }
    @GetMapping(value = "/consulting/view.do")
    public ModelAndView conView(ModelMap model,
                                @ModelAttribute("consultingVO") ConsultingVO vo,
                                HttpServletRequest request,
                                HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("/admin/con_view");

        try {
            ConsultingVO rs = consultingService.viewConsulting(vo);

            if (rs == null) {
                return new ModelAndView("common/error.jsp");
            }
            mav.addObject("rs", rs);
//            mav.addObject("st", sttus);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }

    //수정 화면
    @RequestMapping(value = "/consulting/edit.do", method = {RequestMethod.GET})
    public ModelAndView consultEdit( @ModelAttribute("consultingVO") ConsultingVO vo,
                                     HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView("admin/con_edit");


        try {
            ConsultingVO rs = consultingService.viewConsulting(vo);
            rs.setBizNo1(rs.getBizNo().substring(0, 3));
            rs.setBizNo2(rs.getBizNo().substring(3, 5));
            rs.setBizNo3(rs.getBizNo().substring(5, 10));
            String[] email = rs.getEmail().split("@");
            rs.setEmail1(email[0]);
            rs.setEmail2(email[1]);
            if (rs == null) {
                return new ModelAndView("common/error.jsp");
            }
            mav.addObject("consultingVO", rs);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }

    //수정 처리
    @RequestMapping(value = "/consulting/edit.do", method = {RequestMethod.POST})
    public String doConsultEdit(@ModelAttribute("consultingVO") ConsultingVO vo) throws Exception {

        try {
            String bizNo = vo.getBizNo1() + vo.getBizNo2() + vo.getBizNo3();
            vo.setBizNo(bizNo);
            String email = vo.getEmail1() + '@' + vo.getEmail2();
            vo.setEmail(email);

            int result = consultingService.consultEdit(vo);

            if (result > 0) {
                return "redirect:/admin/consulting/view.do?seq=" + vo.getSeq();
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }
    //수정 처리
    @RequestMapping(value = "/consulting/delete.do", method = {RequestMethod.POST})
    public String consultDelete(@ModelAttribute("consultingVO") ConsultingVO vo) throws Exception {

        try {
            int result = consultingService.consultDelete(vo);

            if (result > 0) {
                return "redirect:/admin/consulting/list.do";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }


    /**
     * 담당자 현황
     */
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
    public ModelAndView memDetail(@ModelAttribute("frmDelete") CmpMemberVo cmpVO
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
    //담당자 승인 처리
    @PostMapping(value = "/approve.do")
    @ResponseBody
    public String approve(@ModelAttribute("frmDelete") CmpMemberVo cmpVO) throws Exception {
        try{
            cmpVO.setAuth_cd("M102");
            int result = adminService.approveMem(cmpVO);
        }catch(Exception e){
            System.out.println(e.toString());
        }
        return  "forward:/common/error.jsp";
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

    /**
     * 걸어온 발자취 게시판 관리
     * */
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
    /**
     * 카드뉴스
     * */
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

    /**
     * 원재료 가격정보 관리
     * */
    @RequestMapping(value = "/price/list.do", method = {RequestMethod.GET})
    public ModelAndView priceInfoList(@ModelAttribute("BoardVO") BoardVO boardVO) throws Exception {

        ModelAndView mav = new ModelAndView("admin/price_list");

        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(boardVO.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(boardVO.getPageSize());

        boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
        boardVO.setPageUnit(paginationInfo.getRecordCountPerPage());
        int bbsId = 8;
        boardVO.setBbsId(bbsId);
        boardVO.setStat("1");

        Map<String, Object> result = new HashMap<String, Object>();
        result = boardService.list(boardVO);
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

    @GetMapping(value = "/price/view.do")
    public ModelAndView priceInfoView(@ModelAttribute("BoardVO") BoardVO boardVO) throws Exception {

        ModelAndView mav = new ModelAndView("admin/price_view");
        int bbsId=8;
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
    @GetMapping(value = "/price/post.do")
    public ModelAndView priceInfoPost(@ModelAttribute("post") BoardVO boardVO) throws Exception {

        ModelAndView mav =  new ModelAndView("admin/price_post");
        int bbsId=8;
        String menu = boardService.getMenu(bbsId);

        mav.addObject("bbsId", bbsId);
        mav.addObject("post", boardVO);
        mav.addObject("bbsNm", menu);
        return mav;
    }
    @PostMapping(value = "/price/post.do")
    public String doPriceInfoPost(@ModelAttribute("post") BoardVO boardVO) throws Exception {
        boardVO.setBbsId(8);
        boardVO.setStat("1");
        int result = adminService.readyPost(boardVO,null);

        if (result > 0) {
            return "redirect:/admin/price/view.do?boardSeq=" + boardVO.getBoardSeq();
        }
        else {
            return "forward:/common/error.jsp";
        }
    }
    @GetMapping(value = "/price/edit.do")
    public ModelAndView priceInfoEdit(@ModelAttribute("edit") BoardVO boardVO) throws Exception {

        ModelAndView mav = new ModelAndView("admin/price_edit");
        int bbsId=8;
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

    @PostMapping(value = "/price/edit.do")
    public String doPriceEdit( @ModelAttribute("edit") BoardVO boardVO) throws Exception {
        int bbsId=8;
        boardVO.setBbsId(bbsId);
        int result = adminService.updatePost(boardVO);

        if (result > 0) {
            return "redirect:/admin/price/view.do?boardSeq=" + boardVO.getBoardSeq();
        }
        else {
            return "forward:/common/error.jsp";
        }
    }

    @PostMapping("/price/delete.do")
    public String priceInfoDelete( @ModelAttribute("post") BoardVO boardVO) throws Exception {
        boardVO.setBbsId(8);
        int result = boardService.updateStat(boardVO);
        if (result > 0) {
            return "redirect:/admin/price/list.do";
        }
        return "forward:/common/error.jsp";
    }

    /**
     *  메인 배너 관리
     *  */
    @RequestMapping(value = "/banner/list.do", method = {RequestMethod.GET})
    public ModelAndView banList(@ModelAttribute("BannerVo") BannerVO vo) throws Exception {

        ModelAndView mav = new ModelAndView("admin/banner_list");

        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(vo.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(vo.getPageSize());

        vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
        vo.setLastIndex(paginationInfo.getLastRecordIndex());
        vo.setPageUnit(paginationInfo.getRecordCountPerPage());
        vo.setStts(1);

        Map<String, Object> result = adminService.banList(vo);

        int totalCnt = Integer.parseInt(String.valueOf(result.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("rs", result.get("resultList"));
        mav.addObject("totalCnt", result.get("resultCnt"));
        mav.addObject("paginationInfo", paginationInfo);

        return mav;
    }
    @GetMapping(value = "/banner/post.do")
    public ModelAndView banPost(@ModelAttribute("post") BannerVO vo) throws Exception {
        ModelAndView mav =  new ModelAndView("admin/banner_post");
        return mav;
    }
    @PostMapping(value = "/banner/post.do")
    public String doBanPost(@ModelAttribute("post") BannerVO vo) throws Exception {
        vo.setStts(1);
        int result = adminService.banPost(vo);

        if (result > 0) {
            return "redirect:/admin/banner/view.do?banSeq=" + vo.getBanSeq();
        }
        else {
            return "forward:/common/error.jsp";
        }
    }
    @GetMapping(value = "/banner/edit.do")
    public ModelAndView banEdit(@ModelAttribute("edit") BannerVO vo) throws Exception {

        ModelAndView mav =  new ModelAndView("admin/banner_edit");
        BannerVO rs = adminService.bannerView(vo);
        mav.addObject("edit", rs);
        return mav;
    }
    @PostMapping(value = "/banner/edit.do")
    public String doBanEdit(@ModelAttribute("edit") BannerVO vo) throws Exception {
        int result = adminService.bannerEdit(vo);

        if (result > 0) {
            return "redirect:/admin/banner/view.do?banSeq=" + vo.getBanSeq();
        }
        else {
            return "forward:/common/error.jsp";
        }
    }
    @GetMapping(value = "/banner/view.do")
    public ModelAndView banView(@ModelAttribute("delete") BannerVO vo) throws Exception {

        ModelAndView mav = new ModelAndView("admin/banner_view");
        BannerVO rs = adminService.bannerView(vo);

        mav.addObject("rs", rs);

        return mav;
    }
    @PostMapping("/banner/delete.do")
    public String bannerDelete( @ModelAttribute("delete") BannerVO vo) throws Exception {
        vo.setStts(0);
        int result = adminService.bannerDelete(vo);
        if (result > 0) {
            return "redirect:/admin/banner/list.do";
        }
        return "forward:/common/error.jsp";
    }

    /**
     *  상담하기 연락처 관리
     *  */
    @RequestMapping(value = "/qna/contact.do", method = {RequestMethod.GET})
    public ModelAndView contact(@ModelAttribute("ContactVO") ContactVO vo) throws Exception {

        ModelAndView mav = new ModelAndView("admin/contact_list");

        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(vo.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(vo.getPageSize());

        vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
        vo.setLastIndex(paginationInfo.getLastRecordIndex());
        vo.setPageUnit(paginationInfo.getRecordCountPerPage());

        Map<String, Object> rs = adminService.contact(vo);

        int totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("rs", rs.get("resultList"));
        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("paginationInfo", paginationInfo);

        return mav;
    }
    @GetMapping(value = "/qna/conPost.do")
    public ModelAndView conPost(@ModelAttribute("post") ContactVO vo) throws Exception {
        ModelAndView mav =  new ModelAndView("admin/contact_post");
        return mav;
    }
    @PostMapping(value = "/qna/conPost.do")
    public String doConPost(@ModelAttribute("post") ContactVO vo) throws Exception {
        int result = adminService.conPost(vo);

        if (result > 0) {
            return "redirect:/admin/qna/conView.do?seq=" + vo.getSeq();
        }
        else {
            return "forward:/common/error.jsp";
        }
    }
    @GetMapping(value = "/qna/conEdit.do")
    public ModelAndView conEdit(@ModelAttribute("edit") ContactVO vo) throws Exception {

        ModelAndView mav = new ModelAndView("admin/contact_edit");
        ContactVO rs = adminService.conView(vo);
        mav.addObject("rs",rs);
        return mav;

    }
    //수정 처리
    @PostMapping(value = "/qna/conEdit.do")
    public String doConEdit(@ModelAttribute("edit") ContactVO vo) throws Exception {

        int rs = adminService.conEdit(vo);
        if (rs > 0) {
            return "redirect:/admin/qna/conView.do?seq=" + vo.getSeq();
        }
        else {
            return "forward:/common/error.jsp";
        }
    }
    @GetMapping(value = "/qna/conView.do")
    public ModelAndView conView(@ModelAttribute("delete")ContactVO vo) throws Exception {

        ModelAndView mav = new ModelAndView("admin/contact_view");
        ContactVO rs = adminService.conView(vo);
        mav.addObject("rs", rs);

        return mav;
    }
    @PostMapping("/qna/delete.do")
    public String conDelete( @ModelAttribute("delete") ContactVO vo) throws Exception {
        int result = adminService.conDelete(vo);
        if (result > 0) {
            return "redirect:/admin/qna/contact.do";
        }
        return "forward:/common/error.jsp";
    }

    /**
     * 동행기업 실적 관리
    */
    @GetMapping("/perf/list.do")
    public ModelAndView perfList(@ModelAttribute("vo") PerformanceVO vo
            ,HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView("admin/perf_list");
        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(vo.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(vo.getPageSize());

        vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
        vo.setLastIndex(paginationInfo.getLastRecordIndex());
        vo.setPageUnit(paginationInfo.getRecordCountPerPage());

        Map<String, Object> rs = adminService.perfList(vo);
        int totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("rs", rs.get("resultList"));
        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("paginationInfo", paginationInfo);
        mav.addObject("vo", vo);
        return mav;
    }
    @GetMapping(value = "/perf/view.do")
    public ModelAndView perfView(@ModelAttribute("frmDelete") PerformanceVO vo,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("admin/perf_view");
        PerformanceVO rs = adminService.perfView(vo);
        if(rs != null) {
            //첨부파일 다운로드명 변경
            if(!rs.getIntrlck().equals("")) {
                rs.setIntrlckDownloadFileNm(rs.getCmp_nm());
            }
            if(!rs.getChange().equals("")) {
                rs.setChangeDownloadFileNm(rs.getCmp_nm());
            }
            if(!rs.getIntrlck_perf().equals("")){
                rs.setIntrlckPerfDownloadFileNm( rs.getCmp_nm());
            }
            if(!rs.getEtc().equals("")){
                rs.setEtcDownloadFileNm( rs.getCmp_nm());
            }
            mav.addObject("rs", rs);
            return mav;
        }else {
            return new ModelAndView("common/error.jsp");
        }
    }
    @PostMapping(value = "/perf/delete.do")
    public String perfDelete(@ModelAttribute("frmDelete") PerformanceVO vo) throws Exception {
        try {
            int result = adminService.perfDelete(vo.getSeq());
            if (result > 0) {
                return "redirect:/admin/perf/list.do";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }
    //수정 화면
    @GetMapping(value = "/perf/edit.do")
    public ModelAndView perfEdit(@ModelAttribute("frmEdit") PerformanceVO vo
            ) throws Exception {
        ModelAndView mav = new ModelAndView("admin/perf_edit");
        try {
            PerformanceVO rs = adminService.perfView(vo);
            if (rs == null) {
                System.out.println("비정상적인 접근입니다.");
            }
            mav.addObject("frmEdit", rs);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }
    //수정 처리
    @RequestMapping(value = "/perf/edit.do", method = {RequestMethod.POST})
    public String doPerfEdit(@ModelAttribute("frmEdit") PerformanceVO vo) throws Exception {
        try {
            int result = adminService.perfEdit(vo);
            if (result > 0) {
                return "redirect:/admin/perf/list.do";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }
    /**
     * 연동표 작성예시 관리
     */
    @GetMapping(value = "/agree/list.do")
    public ModelAndView agree(@ModelAttribute("agreeVO")AgreementVO vo) throws Exception {
        ModelAndView mav = new ModelAndView("admin/agree_list");

        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(vo.getPageIndex());
        paginationInfo.setRecordCountPerPage(15);
        paginationInfo.setPageSize(vo.getPageSize());

        vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
        vo.setLastIndex(paginationInfo.getLastRecordIndex());
        vo.setPageUnit(paginationInfo.getRecordCountPerPage());

        Map<String, Object> rs = agreementService.agreeList(vo);
        int totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("rs", rs.get("resultList"));
        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("paginationInfo", paginationInfo);
        return mav;
    }
    @GetMapping(value = "/agree/post.do")
    public ModelAndView agreePost(@ModelAttribute("agreeVO")AgreementVO vo) throws Exception {
        ModelAndView mav = new ModelAndView("admin/agree_post");
        return mav;
    }
    @RequestMapping(value = "/agree/post.do", method = {RequestMethod.POST})
    public void doAgreePost(HttpSession session,
                        HttpServletRequest request,
                        HttpServletResponse response,
                        @ModelAttribute("agreeVO") AgreementVO vo
    ) throws Exception {
        vo.setId((String)session.getAttribute("sessionId"));
        vo.setType_cd("M101");
        try {
            int result = agreementService.apply(vo);
            if (result > 0) {

                response.sendRedirect(request.getContextPath() + "/admin/agree/view.do?seq="+vo.getSeq());

            } else {
                PrintWriter writer = response.getWriter();
                response.setContentType("text/html; charset=UTF-8;");
                request.setCharacterEncoding("utf-8");
                writer.println("<script type='text/javascript'>");
                writer.println("alert('데이터 저장 중 오류가 발생하였습니다.'); history.back(); </script>");
                writer.flush();
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
    @GetMapping(value = "/agree/view.do")
    public ModelAndView agreeView(@ModelAttribute("agreeVO") AgreementVO vo,
                                  HttpServletRequest request,
                                  HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("admin/agree_view");

        try {
            AgreementVO rs = agreementService.agreeViewAdmin(vo);

            if (rs == null) {
                PrintWriter writer = response.getWriter();
                response.setContentType("text/html; charset=UTF-8;");
                request.setCharacterEncoding("utf-8");
                writer.println("<script type='text/javascript'>");
                writer.println("alert('데이터 저장 중 오류가 발생하였습니다.'); history.back(); </script>");
                writer.flush();
            }

            mav.addObject("rs", rs);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }
    @GetMapping(value = "/agree/edit.do")
    public ModelAndView agreeEdit(@ModelAttribute("agreeVO") AgreementVO vo) throws Exception {
        ModelAndView mav = new ModelAndView("admin/agree_edit");;
        try {
            AgreementVO rs = agreementService.agreeViewAdmin(vo);
            if (rs == null) {
                return new ModelAndView("common/error.jsp");
            }
            mav.addObject("agreeVO", rs);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }
    //수정 처리
    @RequestMapping(value = "/agree/edit.do", method = {RequestMethod.POST})
    public String doAgreeEdit(@ModelAttribute("agreeVO") AgreementVO vo) throws Exception {
        try {
            int result = agreementService.agreeEdit(vo);

            if (result > 0) {
                return "redirect:/admin/agree/view.do?seq="+vo.getSeq();
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }
    //삭제 처리
    @RequestMapping(value = "/agree/delete.do", method = {RequestMethod.POST})
    public String doAgreeDelete(@ModelAttribute("agreeVO") AgreementVO vo) throws Exception {
        try {
            int result = agreementService.agreeDeleteAdmin(vo);

            if (result > 0) {
                return "redirect:/admin/agree/list.do";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }

}
