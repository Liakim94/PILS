package kr.co.xicom.front.controller;

import kr.co.xicom.front.model.CmpMemberVo;
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

@Controller
public class ConsultingController {
    @Autowired
    private ConsultingService service;

    @GetMapping(value="/consulting.do")
    public ModelAndView apply(HttpSession session,
                             HttpServletRequest request,
                             HttpServletResponse response)throws Exception {

        ModelAndView mav = new ModelAndView("main/consulting/apply");
        return mav;
    }

    @RequestMapping(value="/consulting.do",  method={RequestMethod.POST})
    public void doApply(ModelMap model,
                       @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                       HttpServletRequest request,
                       HttpServletResponse response)throws Exception{

        try {
            String bizNo=request.getParameter("bizNo1")+'-'+request.getParameter("bizNo2")+'-'+request.getParameter("bizNo3");
            cmpVO.setBizNo(bizNo);
            String email=request.getParameter("email1")+'@'+request.getParameter("email2");
            cmpVO.setEmail(email);

            int result = service.insertConsulting(cmpVO);
            int result2 = service.insertMemberInfo(cmpVO);

            if(result  > 0 && result2>0){

                response.sendRedirect(request.getContextPath()+"/qnaList.do");

            }else{
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

}
