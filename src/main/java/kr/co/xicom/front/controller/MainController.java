package kr.co.xicom.front.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.*;
import kr.co.xicom.front.service.ConsultingService;
import kr.co.xicom.front.service.MainService;
import kr.go.smes.ems.EmsClient;
import kr.go.smes.ems.EmsResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 메인
 */

@RequestMapping("/main")
@Controller
public class MainController {
    @Autowired
    MainService mainService;
    @Autowired
    private ConsultingService consultingService;

    @Resource
    private EmsClient emsClient;

    @GetMapping(value = "/index.do")
    public ModelAndView main(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVo,
                             @ModelAttribute("BannerVO")BannerVO bannerVO) throws Exception {
        ModelAndView mav = new ModelAndView("main");

        cmpVo.setMem_cd("M302"); //회원구분
        Map<String, Object> rs = new HashMap<String, Object>();
        rs = consultingService.list(cmpVo);

        List<BannerVO> banner = mainService.bannerAll(bannerVO);

        mav.addObject("banner", banner);
        mav.addObject("list", rs.get("resultList"));
        mav.addObject("cnt", rs.get("resultCnt"));
        mav.addObject("joinCmpCnt", rs.get("joinCmpCnt"));
        return mav;
    }

    @GetMapping("/login.do")
    public ModelAndView login(ModelMap model,
                              HttpServletRequest request,
                              HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("login");
        return mav;
    }

    @RequestMapping(value = "/login.do", method = {RequestMethod.POST})
    public void memberLogin(@ModelAttribute("CmpMemberVo") CmpMemberVo vo,
                            HttpServletRequest request,
                            HttpServletResponse response) throws Exception {

        int login = mainService.memberLogin(vo);

        if (login == 1) {
            String bizNo = mainService.memberBizno(vo.getId());
            HttpSession session = request.getSession();
            session.setAttribute("sessionId", vo.getId());
            session.setAttribute("auth_cd", mainService.memAuthCd(vo.getId()));
            session.setAttribute("sessionBizNo", bizNo);
            response.sendRedirect(request.getContextPath() + "/main/index.do");
        } else {
            PrintWriter writer = response.getWriter();

            response.setContentType("text/html; charset=UTF-8;");
            request.setCharacterEncoding("utf-8");
            writer.println("<script type='text/javascript'>");
            writer.println("alert('아이디 또는 비밀번호를 확인해주세요.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.flush();
        }
    }
    @GetMapping("/mbrApply.do")
    public ModelAndView mbrApply(@ModelAttribute("mbrApply") CmpMemberVo cmpVO,ModelMap model,
                              HttpServletRequest request,
                              HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("mbr_apply");
        return mav;
    }
    @PostMapping(value = "/checkId.do")
    public void checkId(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
        PrintWriter out = response.getWriter();
        if (consultingService.checkId(id) > 0) {
            out.print(false);
        } else {
            out.print(true);
        }
    }

    @RequestMapping(value = "/mbrApply.do", method = {RequestMethod.POST})
    public void doMbrApply(@ModelAttribute("mbrApply") CmpMemberVo cmpVO,
                            HttpServletRequest request,
                            HttpServletResponse response) throws Exception {

        try {
            String bizNo = cmpVO.getBizNo1() + cmpVO.getBizNo2() + cmpVO.getBizNo3();
            cmpVO.setBizNo(bizNo);
            String email = cmpVO.getEmail1() + '@' + cmpVO.getEmail2();
            cmpVO.setEmail(email);
            cmpVO.setManagement_cd("M501"); //담당자구분코드
            int result = mainService.mbrApply(cmpVO);
            if (result > 0) {
                // 담당자 신청 알림 메일 발송
                try {
                    EmsResponse ems = emsClient.send("pis@win-win.or.kr", "납품대금 연동제 담당자 신청이 등록되었습니다.", "메일내용");
                    String status = ems.isSuccess() ? "SUCCESS" : "FAIL";
                    System.out.println(status);
                }catch(Exception e){
                    System.out.println(e.toString()+"담당자 신청 알림 메일 발송");
                }
                response.sendRedirect(request.getContextPath() + "/main/mbr.do?id=" + cmpVO.getId());

            } else {
                PrintWriter writer = response.getWriter();

                response.setContentType("text/html; charset=UTF-8;");
                request.setCharacterEncoding("utf-8");
                writer.println("<script type='text/javascript'>");
                writer.println("alert('데이터 저장 중 오류가 발생하였습니다.');");
                writer.println("history.back();");
                writer.println("</script>");
                writer.flush();
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
    @GetMapping("/mbr.do")
    public ModelAndView mbrApplyView(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO, ModelMap model,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("mbr_apply_view");
        try{
            CmpMemberVo rs = mainService.getViewById(cmpVO);
            rs.setBizNo1(rs.getBizNo().substring(0, 3));
            rs.setBizNo2(rs.getBizNo().substring(3, 5));
            rs.setBizNo3(rs.getBizNo().substring(5, 10));
            if (rs == null) {
                System.out.println("비정상적인 접근입니다.");
            }
            mav.addObject("rs", rs);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
            return mav;
    }
    @GetMapping("/logout.do")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/main/index.do";
    }

    /**
     * 마이페이지
     */

    @GetMapping(value = "/myPage.do")
    public ModelAndView view(ModelMap model,
                             @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                             @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
                             HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {

        ModelAndView mav = new ModelAndView("myPage/myPage");
        String bizNo = (String) session.getAttribute("sessionBizNo");

        cmpVO.setBizNo(bizNo);
        cmpVO.setMem_cd("M302");
        stVO.setBizNo(bizNo);
        try {
            CmpMemberVo rs = mainService.getMemInfo(cmpVO);
            if(rs == null){
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('동행기업 신청 후 확인 가능합니다.'); history.back(); </script>");
                out.flush();
            }
            List<AttachVO> attachList = consultingService.getAttachList(cmpVO);
//            List<CmpSttusVO> sttus = consultingService.getCmpSttus(stVO);

            rs.setBizNo1(cmpVO.getBizNo().substring(0, 3));
            rs.setBizNo2(cmpVO.getBizNo().substring(3, 5));
            rs.setBizNo3(cmpVO.getBizNo().substring(5, 10));
//            if (cmpVO == null && sttus == null) {
                if (cmpVO == null) {
                System.out.println("비정상적인 접근입니다.");
            }

            mav.addObject("rs", rs);
//            mav.addObject("st", sttus);
            mav.addObject("attachList", attachList);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }


    //수정 화면
    @GetMapping(value = "/myPage/joinEdit.do")
    public ModelAndView joinEdit(@ModelAttribute("frmEdit") CmpMemberVo cmpVO,
                                @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
                                HttpSession session) throws Exception {

        ModelAndView mav = new ModelAndView("myPage/myPage_edit");
        String bizNo= (String) session.getAttribute("sessionBizNo");
        cmpVO.setBizNo(bizNo);
        cmpVO.setMem_cd("M302");
        try {
            cmpVO = mainService.getMemInfo(cmpVO);
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
    @PostMapping(value = "/myPage/joinEdit.do")
    public String doJoinEdit(
            @ModelAttribute("frmEdit") CmpMemberVo cmpVO,
            @ModelAttribute("CmpSttusVO") CmpSttusVO stVO) throws Exception {

        try {

//            int result = consultingService.updateJoin(cmpVO, stVO,null);
            int result = consultingService.updateJoin(cmpVO,null);

            if (result > 0) {
                return "redirect:/main/myPage.do";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }

    /**
     * 담당자 관리 메뉴 (개인정보 수정)
     */
    @GetMapping("/mem/management.do")
    public ModelAndView memManage(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
                                    ,HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView("myPage/member_list");
        cmpVO.setId((String) session.getAttribute("sessionId"));
        try {
            List<CmpMemberVo> result = mainService.memManage(cmpVO);
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
//    @GetMapping("/mem/memAdd.do")
//    public ModelAndView memAdd(HttpSession session) throws Exception{
//        ModelAndView mav = new ModelAndView("myPage/member_add");
//        return mav;
//    }

//    @RequestMapping(value = "/mem/memAdd.do",method = {RequestMethod.POST})
//    public void doMemAdd(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
//                          , HttpSession session
//                          , HttpServletResponse response
//                          , HttpServletRequest request) throws Exception {
//        cmpVO.setManagement_cd("M502");
//        cmpVO.setBizNo((String) session.getAttribute("sessionBizNo"));
//        String email = cmpVO.getEmail1() + '@' + cmpVO.getEmail2();
//        cmpVO.setEmail(email);
//            int result = mainService.memAdd(cmpVO);
//            if(result>0){
//                response.sendRedirect(request.getContextPath() + "/main/management.do");
//            }
//                PrintWriter writer = response.getWriter();
//
//                response.setContentType("text/html; charset=UTF-8;");
//                request.setCharacterEncoding("utf-8");
//                writer.println("<script type='text/javascript'>");
//                writer.println("alert('데이터 저장 중 오류가 발생하였습니다.');");
//                writer.println("history.back();");
//                writer.println("</script>");
//                writer.flush();
//        }
    //수정 화면
    @GetMapping(value = "/mem/memEdit.do")
    public ModelAndView memEdit(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
                                ,HttpServletRequest request
                                ,HttpSession session
                                ) throws Exception {
        ModelAndView mav = new ModelAndView("myPage/member_edit");

        cmpVO.setBizNo((String) session.getAttribute("sessionBizNo"));
        cmpVO.setId((String)session.getAttribute("sessionId"));
        try {
            CmpMemberVo rs = mainService.memEdit(cmpVO);
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
    @RequestMapping(value = "/mem/memEdit.do", method = {RequestMethod.POST})
    public String doMemEdit(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                            HttpSession session) throws Exception {
        try {
            cmpVO.setBizNo((String) session.getAttribute("sessionBizNo"));
            cmpVO.setId((String)session.getAttribute("sessionId"));
            String email = cmpVO.getEmail1() + '@' + cmpVO.getEmail2();
            cmpVO.setEmail(email);
            int result = mainService.updateMem(cmpVO);

            if (result > 0) {
                return "redirect:management.do";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }
    @GetMapping(value = "/mem/changePw.do")
    public ModelAndView change(HttpSession session) throws Exception{
        ModelAndView mav = new ModelAndView("myPage/changePw");
        return mav;
    }

    @RequestMapping(value = "/mem/changePw.do", method = {RequestMethod.POST})
    public void changePw(HttpSession session
                         ,@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
                         ,HttpServletResponse response
                         ,HttpServletRequest request) throws Exception {

        int result = mainService.changePw(cmpVO);
        if(result>0){
            response.sendRedirect(request.getContextPath() + "/main/mem/management.do");
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
     * 동행기업 실적 제출
     */
    @GetMapping("/perf/list.do")
    public ModelAndView perfList(@ModelAttribute("vo") PerformanceVO vo
            ,HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView("myPage/perf_list");
        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(vo.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(vo.getPageSize());

        vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
        vo.setLastIndex(paginationInfo.getLastRecordIndex());
        vo.setPageUnit(paginationInfo.getRecordCountPerPage());

        Map<String, Object> rs = mainService.perfList((String)session.getAttribute("sessionId"));
        int totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("rs", rs.get("resultList"));
        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("paginationInfo", paginationInfo);
        return mav;
    }
    @GetMapping(value = "/perf/apply.do")
    public ModelAndView perfApply(@ModelAttribute("frmApply") PerformanceVO vo,
                                  HttpServletRequest request,
                                  HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("myPage/perf_apply");
        return mav;
    }

    @PostMapping(value = "/perf/apply.do")
    public String doPerfApply(@ModelAttribute("frmApply") PerformanceVO vo,
                              HttpSession session) throws Exception {
        vo.setUser_id((String)session.getAttribute("sessionId"));
        int result = mainService.perfApply(vo);
        if (result > 0) {
            return "redirect:/main/perf/view.do?seq="+vo.getSeq();
        }
        else {
            return "forward:/common/error.jsp";
        }
    }
    @GetMapping(value = "/perf/view.do")
    public ModelAndView perfView(@ModelAttribute("frmDelete") PerformanceVO vo,
                                  HttpServletRequest request,
                                  HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("myPage/perf_view");
        PerformanceVO rs = mainService.perfView(vo);
        if(rs != null) {
            if(!rs.getIntrlck().equals("")) {
                rs.setIntrlckDownloadFileNm(rs.getCmp_nm());
            }
            if(!rs.getChange().equals("")) {
                rs.setChangeDownloadFileNm(rs.getCmp_nm());
            }
            if(!rs.getIntrlck_perf().equals("")){
                rs.setIntrlckPerfDownloadFileNm(rs.getCmp_nm());
            }
            if(!rs.getEtc().equals("")){
                rs.setEtcDownloadFileNm(rs.getCmp_nm());
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
            int result = mainService.perfDelete(vo.getSeq());
            if (result > 0) {
                return "redirect:/main/perf/list.do";
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
        ModelAndView mav = new ModelAndView("myPage/perf_edit");
        try {
            PerformanceVO rs = mainService.perfView(vo);
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
            int result = mainService.perfEdit(vo);
            if (result > 0) {
                return "redirect:/main/perf/list.do";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }
    /**
     * 인트로 페이지 출력
     * @return
     * @throws Exception
     */
    @RequestMapping("/intro.do")
    public String intro() throws Exception {
        return "intro";
    }

    @RequestMapping(value = "/mailTest.do")
    public void mailTest(@RequestParam String target,
                         HttpServletResponse response) {

        try {
            if (StringUtils.isEmpty(target)) {
                target = "wildrain@u-cube.kr";
            }

            EmsResponse result = emsClient.send(target, "납품대금 연동제 클라우드 이메일 발송 테스트", "납품대금 연동제 클라우드 이메일 발송 테스트");

            String status = result.isSuccess() ? "SUCCESS" : "FAIL";

            PrintWriter printWriter = response.getWriter();
            printWriter.println("<html><head><title>SmsTest Result!</title></head><body><h1>" + status + "</h1><h2>" + result.getErrorCode() + "</h2></body></html>");
            printWriter.flush();
            printWriter.close();

        }
        catch (Exception ex) {
            String message = ex.getMessage();
            try {
                PrintWriter printWriter = response.getWriter();
                printWriter.println("<html><head><title>FAIL!</title></head><body><h1>" + message + "</h1></body></html>");
                printWriter.flush();
                printWriter.close();
            }
            catch (Exception exx) {
                exx.printStackTrace();
            }
        }
    }
}