package kr.co.xicom.front.controller;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.cmmn.EgovExcepHndlr;
import kr.co.xicom.cms.service.BoardService;
import kr.co.xicom.front.model.BbsQnaVO;
import kr.co.xicom.front.service.CoworkBbsQnaService;
import kr.co.xicom.service.MessageSource;
import kr.co.xicom.util.Alerts;
import kr.co.xicom.util.NullUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import java.util.Map;
//import kr.go.smes.ems.EmsClient;
//import kr.go.smes.ems.EmsResponse;

//@RequestMapping(value="/bbsQna")
@Controller
public class CoworkBbsQnaController extends Alerts{
	
    private static final Logger LOGGER = LoggerFactory.getLogger(EgovExcepHndlr.class);
	@Autowired
	private CoworkBbsQnaService service;

	/**
	* 1:1문의 목록
	* @param 	
	* @return 	
	* @exception BusinessLogicException
	*/
	@GetMapping(value="/qnaList.do")
	public ModelAndView list(ModelMap model,
			@ModelAttribute("BbsQnaVO")BbsQnaVO bbsQnaVO,
			HttpSession session,
			HttpServletRequest request, 
			HttpServletResponse response)throws Exception{
			
			ModelAndView mav = new ModelAndView("main/qna/list");

			/*페이징 초기설정*/
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(bbsQnaVO.getPageIndex());	// 현재페이지 
			paginationInfo.setRecordCountPerPage(15);					// 한 페이지당 게시물갯수
			paginationInfo.setPageSize(bbsQnaVO.getPageSize());
			
			bbsQnaVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			bbsQnaVO.setLastIndex(paginationInfo.getLastRecordIndex());
			bbsQnaVO.setPageUnit(paginationInfo.getRecordCountPerPage());

			Map<String, Object> rs = new HashMap<String, Object>();
			rs = service.list(bbsQnaVO);

			int totalCnt = 0;
			totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
			paginationInfo.setTotalRecordCount(totalCnt);
			
			mav.addObject("totalCnt", rs.get("resultCnt"));
			mav.addObject("list", rs.get("resultList"));
			mav.addObject("paginationInfo", paginationInfo);
			mav.addObject("vo", bbsQnaVO);
			mav.addObject("rwx", request.getAttribute("rwx"));

			
			return mav; 
	}



	/**
	* 1:1문의 등록 화면
	* @param 	
	* @return 	
	* @exception BusinessLogicException
	*/
	@GetMapping(value="/qnaPost.do")
	public ModelAndView post(ModelMap model,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		
			ModelAndView mav = new ModelAndView("main/qna/post");
			
			return mav;
	}
	/**
	* 1:1문의 등록 
	* @param 	
	* @return 	
	* @exception BusinessLogicException
	*/
	@RequestMapping(value="/qnaPost.do",  method={RequestMethod.POST})
	public void doPost(ModelMap model,
			@ModelAttribute("BbsQnaVO")BbsQnaVO bbsQnaVO,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{

			try {
				int result = service.insertBbsQna(bbsQnaVO);

				if(result > 0){
				    
					request.setAttribute("hid", "");
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
	
	/**
	* 비밀번호 확인
	* @param 	
	* @return 	
	* @exception BusinessLogicException
	*/
	@ResponseBody
	@RequestMapping(value="/chkPasswd.do", method={RequestMethod.POST})
	public String chkPasswd(ModelMap model,
			@RequestParam(value="no") int no,
			@RequestParam(value ="passwd") String passwd,
			@ModelAttribute("BbsQnaVO")BbsQnaVO bbsQnaVO,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception {

		bbsQnaVO.setNo(no);
		bbsQnaVO.setPasswd(passwd);

		int result =0;
		try {
			result = service.chkPasswd(bbsQnaVO);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		if (result == 1) {
			return "1";
		} else {
			return "0";

		}
	}
	
	/**
	* 1:1문의 상세 화면
	* @param 	
	* @return 	
	* @exception BusinessLogicException
	*/
	@GetMapping(value="/qnaView.do")
	public ModelAndView view(ModelMap model,
			@ModelAttribute("BbsQnaVO")BbsQnaVO bbsQnaVO,
			@RequestParam(value="no") int no,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{

			ModelAndView mav = new ModelAndView("main/qna/view");

			bbsQnaVO.setNo(no);
			BbsQnaVO rs = service.getBbsQnabyId(bbsQnaVO);

			if(rs == null){
				writeAlert("비정상적인 접근입니다.", request, response);
			}

			mav.addObject("rs", rs);
			mav.addObject("vo", bbsQnaVO);

			return mav;
	}
	
	/**
	* 1:1문의 답변 화면
	* @param 	
	* @return 	
	* @exception BusinessLogicException
	*/
	@GetMapping(value="/qnaRepost.do")
	public ModelAndView repost(ModelMap model,
			@ModelAttribute("BbsQnaVO")BbsQnaVO bbsQnaVO,
			@RequestParam(value="no") int no,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		
			ModelAndView mav = new ModelAndView("main/qna/repost");

			bbsQnaVO.setNo(no);
			BbsQnaVO rs = service.getBbsQnabyId(bbsQnaVO);
			
			mav.addObject("rs", rs);
			mav.addObject("vo", bbsQnaVO);
			
			return mav;
	}
	/**
	* 1:1문의 답변
	* @param 	
	* @return 	
	* @exception BusinessLogicException
	*/
	@RequestMapping(value="/qnaRepost.do",  method={RequestMethod.POST})
	public void doRepost(ModelMap model,
			@ModelAttribute("BbsQnaVO")BbsQnaVO bbsQnaVO,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{

		try {
			int result = service.repostBbsQna(bbsQnaVO);

			if(result > 0){

				request.setAttribute("hid", "");
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
