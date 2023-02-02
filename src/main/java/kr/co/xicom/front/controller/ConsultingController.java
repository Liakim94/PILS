package kr.co.xicom.front.controller;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.CmpSttusVO;
import kr.co.xicom.front.service.ConsultingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import kr.co.xicom.util.Alerts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/front")
@Controller
public class ConsultingController extends Alerts {
    @Autowired
    private ConsultingService consultingService;

    //컨설팅 신청 준비 중 화면
    @GetMapping(value = "/consulting/temp.do")
    public ModelAndView temp() throws Exception {
        ModelAndView mav = new ModelAndView("communication/consulting/con_temp");
        return mav;
    }
    //컨설팅 신청 화면
    @GetMapping(value = "/consulting/apply.do")
    public ModelAndView apply(HttpSession session,
                              HttpServletRequest request,
                              HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("communication/consulting/con_apply");
        return mav;
    }

    @RequestMapping(value = "/consulting/apply.do", method = {RequestMethod.POST})
    public void doApply(ModelMap model,
                        @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                        @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
                        HttpServletRequest request, HttpSession session,
                        HttpServletResponse response) throws Exception {

        try {
            String bizNo = cmpVO.getBizNo1() + cmpVO.getBizNo2() + cmpVO.getBizNo3();
            cmpVO.setBizNo(bizNo);
            String email = cmpVO.getEmail1() + '@' + cmpVO.getEmail2();
            cmpVO.setEmail(email);
            cmpVO.setMem_cd("M301");
            stVO.setBizNo(bizNo);
            cmpVO.setId(session.getId());
            cmpVO.setManagement_cd("M501");
            int result = consultingService.insertConsulting(cmpVO, stVO);
            if (result > 0) {

                response.sendRedirect(request.getContextPath() + "/front/consulting/view.do?bizNo="+cmpVO.getBizNo());


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
    @RequestMapping(value = "/conChkPw.do", method = {RequestMethod.POST})
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
    @GetMapping(value = "/consulting/view.do")
    public ModelAndView conView(ModelMap model,
                                @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                                @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
                                @RequestParam(value = "bizNo") String bizNo,
                                HttpServletRequest request,
                                HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("communication/consulting/con_view");

        cmpVO.setBizNo(bizNo);
        cmpVO.setMem_cd("M301");
        try {
            List<CmpSttusVO> sttus = consultingService.getCmpSttus(stVO);

            CmpMemberVo rs = consultingService.getViewByBizNo(cmpVO);
            rs.setBizNo1(rs.getBizNo().substring(0, 3));
            rs.setBizNo2(rs.getBizNo().substring(3, 5));
            rs.setBizNo3(rs.getBizNo().substring(5, 10));
            if (rs == null) {
                writeAlert("비정상적인 접근입니다.", request, response);
            }
            mav.addObject("rs", rs);
            mav.addObject("st", sttus);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }

    //수정 화면
    @RequestMapping(value = "/consulting/edit.do", method = {RequestMethod.GET})
    public ModelAndView conEdit(
            ModelMap model,
            @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
            @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
            @RequestParam(value = "bizNo") String bizNo,
            HttpServletRequest request,
            HttpServletResponse response
    ) throws Exception {
        ModelAndView mav = new ModelAndView("communication/consulting/con_edit");

        cmpVO.setBizNo(bizNo);
        cmpVO.setMem_cd("M301");
        try {
            List<CmpSttusVO> sttus = consultingService.getCmpSttus(stVO);
            CmpMemberVo rs = consultingService.getViewByBizNo(cmpVO);
            rs.setBizNo1(rs.getBizNo().substring(0, 3));
            rs.setBizNo2(rs.getBizNo().substring(3, 5));
            rs.setBizNo3(rs.getBizNo().substring(5, 10));
            String[] email = rs.getEmail().split("@");
            rs.setEmail1(email[0]);
            rs.setEmail2(email[1]);
            if (rs == null) {
                writeAlert("비정상적인 접근입니다.", request, response);
            }

            mav.addObject("rs", rs);
            mav.addObject("st", sttus);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }

    //수정 처리
    @RequestMapping(value = "/consulting/edit.do", method = {RequestMethod.POST})
    public String doConEdit(
            ModelMap model,
            @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
            @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
            HttpServletRequest request,
            HttpServletResponse response,
            HttpSession session) throws Exception {

        try {
            String bizNo = cmpVO.getBizNo1() + cmpVO.getBizNo2() + cmpVO.getBizNo3();
            cmpVO.setBizNo(bizNo);
            String email = cmpVO.getEmail1() + '@' + cmpVO.getEmail2();
            cmpVO.setEmail(email);
            stVO.setBizNo(bizNo);

            int result = consultingService.update(cmpVO, stVO);

            if (result > 0) {
                return "redirect:conView.do?bizNo=" + cmpVO.getBizNo();
            } else {

                return "forward:/common/error.jsp";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "";
    }

    @GetMapping(value="/consulting/confirm.do")
    public ModelAndView conCheck() {
        ModelAndView mav = new ModelAndView("communication/consulting/con_check");
        return mav;
    }

    @PostMapping(value="/consulting/confirm.do")
    public void doConCheck(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
                            ,HttpServletResponse response, HttpServletRequest request) throws Exception {
        String bizNo = cmpVO.getBizNo1() + cmpVO.getBizNo2() + cmpVO.getBizNo3();
        cmpVO.setBizNo(bizNo);
        int result = consultingService.conCheck(cmpVO);
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/front/consulting/view.do?bizNo="+cmpVO.getBizNo());
        }
        PrintWriter writer = response.getWriter();

        response.setContentType("text/html; charset=UTF-8;");
        request.setCharacterEncoding("utf-8");
        writer.println("<script type='text/javascript'>");
        writer.println("alert('비밀번호를 확인해주세요.');");
        writer.println("history.back();");
        writer.println("</script>");
        writer.flush();
    }

}
