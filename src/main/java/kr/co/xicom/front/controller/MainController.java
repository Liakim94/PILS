package kr.co.xicom.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.PrintWriter;

/**
 * 
 * 메인
 *
 */

@Controller
public class MainController {
	@Autowired
	LoginService loginService;

	@GetMapping(value = "/index.do")
	public ModelAndView main(ModelMap model,		
			HttpServletRequest request,
			HttpServletResponse response)
			throws Exception {
		
		ModelAndView mav = new ModelAndView("main");
		return mav;
	}

	@GetMapping("/login.do")
	public ModelAndView login(ModelMap model,
							  HttpServletRequest request,
							  HttpServletResponse response)throws Exception{

		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	@RequestMapping(value="/login.do", method= {RequestMethod.POST})
	public String memberLogin( @ModelAttribute("CmpMemberVo") CmpMemberVo vo,
							  HttpServletRequest request,
							  HttpServletResponse response) throws Exception {

		int login = loginService.memberLogin(vo);

		if(login == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", vo.getId());
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

		return "redirect:/index.do";
	}
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/index.do";
	}

}
