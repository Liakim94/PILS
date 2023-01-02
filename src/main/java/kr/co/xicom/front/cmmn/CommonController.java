package kr.co.xicom.front.cmmn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CommonController {

	/**
	 * Header 화면
	 * 
	 * @param
	 * @return
	 * @exception BusinessLogicException
	 */
	@GetMapping(value = "/header.do")
	public ModelAndView header(ModelMap model,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)
			throws Exception {
		ModelAndView mav = null;
		mav = new ModelAndView("template/front/header");
		
		return mav;
	}
	
	/**
	 * Footer 화면
	 * 
	 * @param
	 * @return
	 * @exception BusinessLogicException
	 */
	@GetMapping(value = "/footer.do")
	public ModelAndView footer(ModelMap model,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)
			throws Exception {
		ModelAndView mav = null;
		mav = new ModelAndView("template/front/footer");
		return mav;
	}
	
	
	/**
	 * Menu 화면
	 * 
	 * @param
	 * @return
	 * @exception BusinessLogicException
	 */
	@GetMapping(value = "/menu.do")
	public ModelAndView menu(ModelMap model,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)
			throws Exception {
		ModelAndView mav = null;
		mav = new ModelAndView("template/front/menu");
		return mav;
	}
	@GetMapping(value = "/menu2.do")
	public ModelAndView menu2(ModelMap model,
							 HttpServletRequest request,
							 HttpServletResponse response,
							 HttpSession session)
			throws Exception {
		ModelAndView mav = null;
		mav = new ModelAndView("template/front/menu2");
		return mav;
	}
	
	/**
	 * location 화면
	 * 
	 * @param
	 * @return
	 * @exception BusinessLogicException
	 */
	@GetMapping(value = "/location.do")
	public ModelAndView location(ModelMap model,
			HttpServletRequest request,
			HttpServletResponse response)
			throws Exception {
		ModelAndView mav = null;
		mav = new ModelAndView("template/front/location");
		return mav;
	}
	
	
	
	/**
	 * 접근거부 화면
	 * 
	 * @param
	 * @return
	 * @exception BusinessLogicException
	 */
	@GetMapping(value = "/deny.do")
	public ModelAndView deny(ModelMap model,
			HttpServletRequest request,
			HttpServletResponse response)
			throws Exception {
		ModelAndView mav = null;
		mav = new ModelAndView("common/deny");
		return mav;
	}
	

}
