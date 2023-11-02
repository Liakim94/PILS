package kr.co.xicom.front.controller;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.CmpSttusVO;
import kr.co.xicom.front.model.ConsultingVO;
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
import java.util.List;

@RequestMapping("/front")
@Controller
public class ConsultingController extends Alerts {
    @Autowired
    private ConsultingService consultingService;

    //컨설팅 신청 준비 중 화면
//    @GetMapping(value = "/consulting/temp.do")
//    public ModelAndView temp() throws Exception {
//        ModelAndView mav = new ModelAndView("con_temp");
//        return mav;
//    }
    //컨설팅 신청 화면
    @GetMapping(value = "/consulting/apply.do")
    public ModelAndView apply(@ModelAttribute("consultingVO") ConsultingVO vo,
                              HttpServletRequest request,
                              HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("communication/consulting/con_apply");
        return mav;
    }

    @RequestMapping(value = "/consulting/apply.do", method = {RequestMethod.POST})
    public void doApply(ModelMap model,
                        @ModelAttribute("consultingVO") ConsultingVO vo,
                        HttpServletRequest request, HttpSession session,
                        HttpServletResponse response) throws Exception {

        try {
            String bizNo = vo.getBizNo1() + vo.getBizNo2() + vo.getBizNo3();
            vo.setBizNo(bizNo);
            String email = vo.getEmail1() + '@' + vo.getEmail2();
            vo.setEmail(email);

            int result = consultingService.insertConsulting(vo);
            if (result > 0) {

                response.sendRedirect(request.getContextPath() + "/front/consulting/view.do?seq="+vo.getSeq());


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
    @GetMapping(value="/consulting/confirm.do")
    public ModelAndView conCheck(@ModelAttribute("consultingVO") ConsultingVO vo) {
        ModelAndView mav = new ModelAndView("communication/consulting/con_check");
        return mav;
    }

    @PostMapping(value="/consulting/confirm.do")
    public void doConCheck(@ModelAttribute("consultingVO") ConsultingVO vo
            ,HttpServletResponse response, HttpServletRequest request) throws Exception {
        Integer rs = consultingService.consultCheck(vo);
        if(rs == null){
            PrintWriter writer = response.getWriter();

            response.setContentType("text/html; charset=UTF-8;");
            request.setCharacterEncoding("utf-8");
            writer.println("<script type='text/javascript'>");
            writer.println("alert('이메일 또는 비밀번호를 확인해주세요.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.flush();
        }else {
            response.sendRedirect(request.getContextPath() + "/front/consulting/view.do?seq="+rs);
        }
    }

    //신청 상세 화면
    @GetMapping(value = "/consulting/view.do")
    public ModelAndView conView(ModelMap model,
                                @ModelAttribute("consultingVO") ConsultingVO vo,
                                HttpServletRequest request,
                                HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("communication/consulting/con_view");

        try {
            ConsultingVO rs = consultingService.viewConsulting(vo);

            if (rs == null) {
                writeAlert("비정상적인 접근입니다.", request, response);
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
    public ModelAndView conEdit( @ModelAttribute("consultingVO") ConsultingVO vo,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView("communication/consulting/con_edit");


        try {
            ConsultingVO rs = consultingService.viewConsulting(vo);

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

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }

    //수정 처리
    @RequestMapping(value = "/consulting/edit.do", method = {RequestMethod.POST})
    public String doConEdit(@ModelAttribute("consultingVO") ConsultingVO vo) throws Exception {

        try {
            String bizNo = vo.getBizNo1() + vo.getBizNo2() + vo.getBizNo3();
            vo.setBizNo(bizNo);
            String email = vo.getEmail1() + '@' + vo.getEmail2();
            vo.setEmail(email);

            int result = consultingService.consultEdit(vo);

            if (result > 0) {
                return "redirect:/front/consulting/view.do?seq=" + vo.getSeq();
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
                return "redirect:/front/qna/main.do";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }



}
