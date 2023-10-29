package kr.co.xicom.front.controller;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.*;
import kr.co.xicom.front.service.AgreementService;
import kr.co.xicom.front.service.BoardService;
import kr.co.xicom.front.service.ConsultingService;
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
import kr.co.xicom.util.Alerts;


@RequestMapping("/join")
@Controller
public class JoinController extends Alerts{

    @Autowired
    private ConsultingService consultingService;
    @Autowired
    private AgreementService agreementService;
    @Autowired
    private BoardService boardService;


    //제도 설명
    @GetMapping(value = "/concept.do")
    public ModelAndView concept() throws Exception {
        ModelAndView mav = new ModelAndView("join/apply/join_concept");
        return mav;
    }

    //동행기업 신청 main
    @GetMapping(value = "/joinMain.do")
    public ModelAndView main() throws Exception {
        ModelAndView mav = new ModelAndView("join/apply/join_apply_main");
        return mav;
    }

    @GetMapping(value = "/joinApply.do")
    public ModelAndView apply(@ModelAttribute("frmApply") CmpMemberVo cmpVO,
                              HttpServletRequest request,
                              HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();
        String userId=(String)session.getAttribute("sessionId");
        String bizNo=(String)session.getAttribute("sessionBizNo");

        if(userId==null || userId==""){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인이 필요합니다.'); location.href='"+request.getContextPath()+"/main/login.do"+"';</script>");
            out.flush();
        }
        if(consultingService.checkBizno(bizNo) > 0){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('신청 내역이 있습니다.'); history.back(); </script>");
            out.flush();
        }
        ModelAndView mav = new ModelAndView("join/apply/join_apply");

        mav.addObject("bizNo", bizNo);
        return mav;
    }

    @PostMapping(value = "/checkBizno.do")
    public void checkBizno(@RequestParam("bizNo") String bizNo, HttpServletResponse response) throws Exception {
        PrintWriter out = response.getWriter();
        if (consultingService.checkBizno(bizNo) > 0) {
            out.print(false);
        } else {
            out.print(true);
        }
    }


    @RequestMapping(value = "/joinApply.do", method = {RequestMethod.POST})
    public void doApply(@ModelAttribute("frmApply") CmpMemberVo cmpVO,
                        HttpServletRequest request,
                        HttpServletResponse response) throws Exception {

        try {
            HttpSession session = request.getSession();
            cmpVO.setBizNo((String)session.getAttribute("sessionBizNo"));
            cmpVO.setMem_cd("M302"); //동행기업회원구분코드
//            int result = consultingService.insertJoinApply(cmpVO, stVO,null);
            int result = consultingService.insertJoinApply(cmpVO, null);
            if (result > 0) {

                response.sendRedirect(request.getContextPath() + "/join/joinView.do?bizNo=" + cmpVO.getBizNo());

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

    //비밀번호 확인
    @ResponseBody
    @RequestMapping(value = "/joinChkPw.do", method = {RequestMethod.POST})
    public String chkPasswd(ModelMap model,
                            @RequestParam(value = "bizNo") String bizNo,
                            @RequestParam(value = "passwd") String passwd,
                            @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                            HttpServletRequest request,
                            HttpServletResponse response) throws Exception {

        cmpVO.setBizNo(bizNo);
        cmpVO.setPasswd(passwd);

        int result = 0;
        try {
            result = consultingService.conChkPw(cmpVO);
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        if (result == 1) {
            return "1";
        } else {
            return "0";

        }
    }

    //신청 상세 화면
    @GetMapping(value = "/joinView.do")
    public ModelAndView view(ModelMap model,
                             @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                             @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
                             @RequestParam(value = "bizNo") String bizNo) throws Exception {

        ModelAndView mav = new ModelAndView("join/apply/join_view");

        cmpVO.setBizNo(bizNo);
        cmpVO.setMem_cd("M302");
        try {
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

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }

    //동행기업 참여 추천
    @GetMapping(value = "/recom.do")
    public ModelAndView recommend(@ModelAttribute("frmRecom") RcmdVO vo) throws Exception {
        ModelAndView mav = new ModelAndView("join/apply/join_recom");
        return mav;
    }

    @PostMapping(value = "/recom.do")
    public void doRecom(@ModelAttribute("frmRecom") RcmdVO vo, HttpServletRequest request,
                        HttpServletResponse response) throws Exception {
        try {
            int result = consultingService.insertRecom(vo);
            if (result > 0) {
                response.sendRedirect(request.getContextPath() + "/join/recom/view.do?no=" + vo.getRcmd_no());

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

    @GetMapping(value = "/recom/view.do")
    public ModelAndView recomView(@ModelAttribute("RcmdVO") RcmdVO vo,
                                  @RequestParam(value = "no") int no) throws Exception {
        ModelAndView mav = new ModelAndView("join/apply/join_recom_view");

        try {
            RcmdVO rs = consultingService.rcmdView(no);
            rs.setApp_bizNo1(rs.getApply_bizno().substring(0, 3));
            rs.setApp_bizNo2(rs.getApply_bizno().substring(3, 5));
            rs.setApp_bizNo3(rs.getApply_bizno().substring(5, 10));
            rs.setRcmd_bizNo1(rs.getRcmd_bizno().substring(0, 3));
            rs.setRcmd_bizNo2(rs.getRcmd_bizno().substring(3, 5));
            rs.setRcmd_bizNo3(rs.getRcmd_bizno().substring(5, 10));
            if (rs == null) {
                System.out.println("비정상적인 접근입니다.");
            }
            mav.addObject("rs", rs);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }

    //약정서 작성 첫 화면
    @GetMapping(value = "/agreeMain.do")
    public ModelAndView agreeMain(HttpSession session,
                                  HttpServletRequest request,
                                  HttpServletResponse response
            , @ModelAttribute("AgreementVO") AgreementVO vo) throws Exception {

        ModelAndView mav = new ModelAndView("join/agreement/agree_main");
        String result = agreementService.agreeChk(session.getId());
        mav.addObject("rs", result);
        mav.addObject("id", session.getId());
        return mav;
    }

    //약정서 작성하기
    @GetMapping(value = "/agree.do")
    public ModelAndView agree(HttpSession session,
                              HttpServletRequest request,
                              HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("join/agreement/agree_apply");
        return mav;
    }

    @RequestMapping(value = "/agree.do", method = {RequestMethod.POST})
    public void doAgree(HttpSession session,
                        HttpServletRequest request,
                        HttpServletResponse response,
                        @ModelAttribute("AgreementVO") AgreementVO vo
    ) throws Exception {
        vo.setId(session.getId());
        try {
            int result = agreementService.apply(vo);
            if (result > 0) {

                response.sendRedirect(request.getContextPath() + "/join/agreeView.do");

            } else {
                writeAlert("데이터 저장 중 오류가 발생하였습니다.", request, response);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }

    }

    @GetMapping(value = "/agreeView.do")
    public ModelAndView agreeView(@ModelAttribute("AgreementVO") AgreementVO vo,
                                  HttpSession session,
                                  HttpServletRequest request,
                                  HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("join/agreement/agree_view");

        try {
            AgreementVO rs = agreementService.agreeView(session.getId());

            if (rs == null) {
                writeAlert("비정상적인 접근입니다.", request, response);
            }

            mav.addObject("rs", rs);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }

    //약정서 미리보기
    @GetMapping(value = "/agree/preview.do")
    public ModelAndView agreePreView(@ModelAttribute("AgreementVO") AgreementVO vo,
                                     HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView("join/agreement/agree_preview");
        AgreementVO rs = agreementService.agreeView(session.getId());
        mav.addObject("rs", rs);

        return mav;
    }

    @GetMapping("/agreeDelete.do")
    public String agreeDelete(@RequestParam("id") String id) throws Exception {
        int result = agreementService.agreeDelete(id);
        if (result > 0) {
            return "redirect:/join/agree.do";
        }
        return "forward:/common/error.jsp";
    }

    //연동표 작성 예시 보기
    @GetMapping(value = "/ex/temp.do")
    public ModelAndView agreeTemp() throws Exception {
        ModelAndView mav = new ModelAndView("join/agreement/agree_temp");
        return mav;
    }

    //연동절차 알아보기
    @GetMapping(value = "/process/info.do")
    public ModelAndView process() throws Exception {
        ModelAndView mav = new ModelAndView("join/process");
        return mav;
    }

    //동행기업 실적 제출하기
    @GetMapping(value = "/perf/main.do")
    public ModelAndView perfMain() throws Exception {
        ModelAndView mav = new ModelAndView("join/perf/main");
        return mav;
    }

    //도입 준비하기
    @GetMapping(value = "/ready.do")
    public ModelAndView joinReady() throws Exception {
        ModelAndView mav = new ModelAndView("join/join_ready");
        return mav;
    }

    //표준 미연동계약서 작성하기
    @GetMapping(value = "/contract.do")
    public ModelAndView contract() throws Exception {
        ModelAndView mav = new ModelAndView("join/contract");
        return mav;
    }
    //표준 미연동계약서 작성하기
    @GetMapping(value = "/notice.do")
    public ModelAndView notice() throws Exception {
        ModelAndView mav = new ModelAndView("join/notice");
        return mav;
    }
    //원재료 가격정보 제공 사이트
    @GetMapping(value = "/priceInfo.do")
    public ModelAndView priceInfo(@ModelAttribute("BoardVO") BoardVO boardVO) throws Exception {
        ModelAndView mav = new ModelAndView("join/price/price_list");
        int bbsId = 8;
        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(boardVO.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(boardVO.getPageSize());

        boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
        boardVO.setPageUnit(paginationInfo.getRecordCountPerPage());
        boardVO.setBbsId(bbsId);
        boardVO.setStat("1");

        Map<String, Object> rs = new HashMap<String, Object>();
        rs = boardService.readyList(boardVO);
        int totalCnt = 0;
        totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("list", rs.get("resultList"));
        mav.addObject("paginationInfo", paginationInfo);
        return mav;
    }
    @GetMapping(value = "/priceInfoView.do")
    public ModelAndView priceInfoView(@ModelAttribute("BoardVO") BoardVO boardVO,
                                  HttpServletRequest request,
                                  HttpServletResponse response,
                                  HttpSession session) throws Exception {

        ModelAndView mav = new ModelAndView("join/price/price_detail");
        int bbsId=8;
        boardVO.setBbsId(bbsId);
        boardVO.setStat("1");
        BoardVO rs = boardService.getView(boardVO);

        if (rs == null) {
            writeAlert("존재하지 않는 게시물입니다.", request, response);
        }
        List<AttachVO> attachList = boardService.getAttachList(boardVO);

        mav.addObject("rs", rs);
        mav.addObject("attachList", attachList);

        return mav;
    }
}
