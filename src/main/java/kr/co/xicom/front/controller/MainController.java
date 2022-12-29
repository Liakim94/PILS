package kr.co.xicom.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 메인
 *
 */

@Controller
public class MainController {

	@GetMapping(value = "/index.do")
	public ModelAndView main(ModelMap model,		
			HttpServletRequest request,
			HttpServletResponse response)
			throws Exception {
		
		ModelAndView mav = new ModelAndView("main/main");
		return mav;
	}

	@GetMapping("/login.do")
	public ModelAndView login(ModelMap model,
							  HttpServletRequest request,
							  HttpServletResponse response)throws Exception{

		ModelAndView mav = new ModelAndView("main/login");
		return mav;
	}

}
