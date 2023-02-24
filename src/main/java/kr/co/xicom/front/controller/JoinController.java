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

@RequestMapping("/join")
@Controller
public class JoinController {

    @Autowired
    private ConsultingService consultingService;
    @Autowired
    private AgreementService agreementService;
    @Autowired
    private BoardService boardService;


    //동행기업 신청 main
    @GetMapping(value = "/joinMain.do")
    public ModelAndView main( ) throws Exception {
        ModelAndView mav = new ModelAndView("join/apply/join_main");
        return mav;
    }
    @GetMapping(value = "/joinApply.do")
    public ModelAndView apply(@ModelAttribute("frmApply") CmpMemberVo cmpVO,
                              HttpServletRequest request,
                              HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("join/apply/join_apply");
        mav.addObject("frmPost", cmpVO);
        return mav;
    }
    @PostMapping(value ="/checkId.do")
    public void checkId(@RequestParam("id")String id,HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        if(consultingService.checkId(id) >0){
            out.print(false);
        }else {
            out.print(true);
        }
    }
    @PostMapping(value ="/checkBizno.do")
    public void checkBizno(@RequestParam("bizNo")String bizNo,HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        if(consultingService.checkBizno(bizNo) >0){
            out.print(false);
        } else {
            out.print(true);
        }
    }


    @RequestMapping(value = "/joinApply.do", method = {RequestMethod.POST})
    public void doApply(@ModelAttribute("frmApply") CmpMemberVo cmpVO,
                        @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
                        HttpServletRequest request,
                        HttpServletResponse response) throws Exception {

        try {
            String bizNo = cmpVO.getBizNo1() + cmpVO.getBizNo2() + cmpVO.getBizNo3();
            cmpVO.setBizNo(bizNo);
            String email = cmpVO.getEmail1() + '@' + cmpVO.getEmail2();
            cmpVO.setEmail(email);
            cmpVO.setMem_cd("M302"); //동행기업회원구분코드
            stVO.setBizNo(bizNo);
            cmpVO.setManagement_cd("M501"); //담당자구분코드
            int result = consultingService.insertJoinApply(cmpVO, stVO,null);
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
            List<CmpSttusVO> sttus = consultingService.getCmpSttus(stVO);
            List<AttachVO> attachList = consultingService.getAttachList(cmpVO);

            CmpMemberVo rs = consultingService.getViewByBizNo(cmpVO);
            rs.setBizNo1(rs.getBizNo().substring(0, 3));
            rs.setBizNo2(rs.getBizNo().substring(3, 5));
            rs.setBizNo3(rs.getBizNo().substring(5, 10));
            if (rs == null && sttus == null) {
                System.out.println("비정상적인 접근입니다.");
            }

            mav.addObject("rs", rs);
            mav.addObject("st", sttus);
            mav.addObject("attachList", attachList);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }
    //동행기업 참여 추천
    @GetMapping(value = "/joinRecom.do")
    public ModelAndView apply() throws Exception {

        ModelAndView mav = new ModelAndView("join/apply/join_recom");
        return mav;
    }
    //약정서 작성 첫 화면
    @GetMapping(value = "/agreeMain.do")
    public ModelAndView agreeMain(HttpSession session,
                                  HttpServletRequest request,
                                  HttpServletResponse response
                                 ,@ModelAttribute("AgreementVO") AgreementVO vo) throws Exception {

        ModelAndView mav = new ModelAndView("join/agreement/agree_main");
        String result = agreementService.agreeChk(session.getId());
        mav.addObject("rs",result);
        mav.addObject("id",session.getId());
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
    @GetMapping(value = "/agreeView.do")
    public ModelAndView agreeView(@ModelAttribute("AgreementVO") AgreementVO vo,
                            HttpSession session) throws Exception {

        ModelAndView mav = new ModelAndView("join/agreement/agree_view");

        try {
            AgreementVO rs = agreementService.agreeView(session.getId());

            if (rs == null ) {
                System.out.println("비정상적인 접근입니다.");
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
    public String agreeDelete(@RequestParam("id")String id)throws Exception{
        int result = agreementService.agreeDelete(id);
        if(result>0){
            return "redirect:/join/agree.do";
        }
        return  "forward:/common/error.jsp";
    }
    //실제 사례 보기 준비 중 화면
    @GetMapping(value = "/ex/temp.do")
    public ModelAndView agreeTemp() throws Exception {
        ModelAndView mav = new ModelAndView("join/agreement/agree_temp");
        return mav;
    }
    //남품대금 연동절차 알아보기
    @GetMapping(value = "/process/info.do")
    public ModelAndView process() throws Exception {
        ModelAndView mav = new ModelAndView("join/process");
        return mav;
    }
    //동행기업 실적 제출하기
    @GetMapping(value = "/joinSubmit.do")
    public ModelAndView joinSubmit() throws Exception {
        ModelAndView mav = new ModelAndView("join/join_submit");
        return mav;
    }
    //동행기업 제도 설명
    @GetMapping(value = "/concept.do")
    public ModelAndView concept() throws Exception {
        ModelAndView mav = new ModelAndView("join/join_concept");
        return mav;
    }
}
