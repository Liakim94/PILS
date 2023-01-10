package kr.co.xicom.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.CmpSttusVO;
import kr.co.xicom.front.service.ConsultingService;
import kr.co.xicom.front.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.PrintWriter;
import java.util.List;

/**
 * 
 * 메인
 *
 */

@RequestMapping("/main")
@Controller
public class MainController {
	@Autowired
	LoginService loginService;
	@Autowired
	private ConsultingService consultingService;

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
	public void memberLogin( @ModelAttribute("CmpMemberVo") CmpMemberVo vo,
							  HttpServletRequest request,
							  HttpServletResponse response) throws Exception {

		int login = loginService.memberLogin(vo);

		if(login == 1) {
			String bizNo = loginService.memberInfo(vo.getId());
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", vo.getId());
			session.setAttribute("sessionBizNo",bizNo);
			response.sendRedirect(request.getContextPath()+"/main/index.do");
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
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/main/index.do";
	}
	@GetMapping(value="/myPage.do")
	public ModelAndView view(ModelMap model,
							 @ModelAttribute("CmpMemberVo")CmpMemberVo cmpVO,
							 @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
							 HttpSession session)throws Exception {

		ModelAndView mav = new ModelAndView("myPage");
		String bizNo =(String) session.getAttribute("sessionBizNo");
				
		cmpVO.setBizNo(bizNo);
		cmpVO.setMem_cd("M302");
		try {
			List<CmpSttusVO> sttus = consultingService.getCmpSttus(stVO);

			CmpMemberVo rs = consultingService.getViewByBizNo(cmpVO);
			rs.setBizNo1(rs.getBizNo().substring(0, 3));
			rs.setBizNo2(rs.getBizNo().substring(3, 5));
			rs.setBizNo3(rs.getBizNo().substring(5, 10));
			if (rs == null && sttus == null) {
				System.out.println("비정상적인 접근입니다.");
			}

			mav.addObject("rs", rs);
			mav.addObject("st", sttus);

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}
	//수정 화면
	@RequestMapping(value = "/joinEdit.do", method={RequestMethod.GET})
	public ModelAndView joinEdit(
			ModelMap model,
			@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
			@ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
			HttpServletRequest request,
			HttpSession session
	) throws Exception {
		ModelAndView mav = new ModelAndView("myPage_edit");

		cmpVO.setBizNo((String) session.getAttribute("sessionBizNo"));
		cmpVO.setMem_cd("M302");
		try {
			List<CmpSttusVO> sttus = consultingService.getCmpSttus(stVO);
			CmpMemberVo rs = consultingService.getViewByBizNo(cmpVO);
			rs.setBizNo1(rs.getBizNo().substring(0,3));
			rs.setBizNo2(rs.getBizNo().substring(3,5));
			rs.setBizNo3(rs.getBizNo().substring(5,10));
			String[] email=rs.getEmail().split("@");
			rs.setEmail1(email[0]);
			rs.setEmail2(email[1]);
			if(rs == null){
				System.out.println("비정상적인 접근입니다.");
			}

			mav.addObject("rs", rs);
			mav.addObject("st",sttus);

		}  catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}

	//수정 처리
	@RequestMapping(value = "/joinEdit.do", method={RequestMethod.POST})
	public String doJoinEdit(
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

			int result = consultingService.updateJoin(cmpVO, stVO);

			if (result > 0) {
				return "redirect:myPage.do";
			} else {

				return "forward:/common/error.jsp";
			}
		}catch (Exception e){
			System.out.println(e.toString());
		}
		return "forward:/common/error.jsp";

	}
}
