package kr.co.xicom.cms.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.cmmn.web.EgovWebUtil;
import kr.co.xicom.cms.service.QnaService;
import kr.co.xicom.front.model.BbsQnaVO;

@RequestMapping(value="cms/qna")
@Controller
public class CmsQnaController {

	public static String admSeq	= "1";
	public static String admName = "관리자";
	public static final String ACCIP	= "127.0.0.1";
	
	@Autowired
	private QnaService service;
	
	/**
	* 1:1문의 목록
	* @param 	
	* @return 	
	* @exception BusinessLogicException
	*/
	@GetMapping(value="/list.do")
	public ModelAndView list(ModelMap model,
			@ModelAttribute("BbsQnaVO")BbsQnaVO bbsQnaVO,
			@RequestParam(value="action", defaultValue="n") String action,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{
			
			ModelAndView mav = new ModelAndView("cms/qna/list");
			
			
			/*페이징 초기설정*/
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(bbsQnaVO.getPageIndex());	// 현재페이지 
			paginationInfo.setRecordCountPerPage(15);					// 한 페이지당 게시물갯수
			paginationInfo.setPageSize(bbsQnaVO.getPageSize());
			
			bbsQnaVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			bbsQnaVO.setLastIndex(paginationInfo.getLastRecordIndex());
			bbsQnaVO.setPageUnit(paginationInfo.getRecordCountPerPage());
			
			if(EgovWebUtil.nvl(action).equals("n")){
				bbsQnaVO.setStat("n");
			}
			else if (EgovWebUtil.nvl(action).equals("y")){
				bbsQnaVO.setStat("y");
			}
			else bbsQnaVO.setStat("n");
			
			
			Map<String, Object> rs = new HashMap<String, Object>();
			rs = service.list(bbsQnaVO);
			

			int totalCnt = 0;
			totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
			
			paginationInfo.setTotalRecordCount(totalCnt);
			
			mav.addObject("totalCnt", rs.get("resultCnt"));
			mav.addObject("list", rs.get("resultList"));
			mav.addObject("paginationInfo", paginationInfo);
			mav.addObject("vo", bbsQnaVO);
			mav.addObject("menuNo", request.getAttribute("menuNo"));
			mav.addObject("menuName", request.getAttribute("menuName"));
			mav.addObject("rwx", request.getAttribute("rwx"));
			
			return mav; 
	}        
	
	/**
	* 1:1문의 상세 화면
	* @param 	
	* @return 	
	* @exception BusinessLogicException
	*/
	@GetMapping(value="/view.do")
	public ModelAndView view(ModelMap model,
			@ModelAttribute("BbsQnaVO")BbsQnaVO bbsQnaVO,
			@RequestParam(value="no") int no,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		
			ModelAndView mav = new ModelAndView("cms/qna/view");
			
			bbsQnaVO.setNo(no);
			BbsQnaVO rs = service.getBbsQnabyId(bbsQnaVO);
			
			mav.addObject("rs", rs);
			mav.addObject("vo", bbsQnaVO);
			
			return mav;
	}
	
	/**
	* 1:1문의 수정 화면
	* @param 	
	* @return 	
	* @exception BusinessLogicException
	*/
	@GetMapping(value="/edit.do")
	public ModelAndView edit(ModelMap model,
			@ModelAttribute("BbsQnaVO")BbsQnaVO bbsQnaVO,
			@RequestParam(value="no") int no,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		
			ModelAndView mav = new ModelAndView("cms/qna/edit");
			
			
			bbsQnaVO.setNo(no);
			BbsQnaVO rs = service.getBbsQnabyId(bbsQnaVO);
			
			mav.addObject("rs", rs);
			
			return mav;
	}
	/**
	* 1:1문의 수정
	* @param 	
	* @return 	
	* @exception BusinessLogicException
	*/
	@RequestMapping(value="/edit.do",  method={RequestMethod.POST})
	public void doEdit(ModelMap model,
			@ModelAttribute("BbsQnaVO")BbsQnaVO bbsQnaVO,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{
			
			String clientIp = request.getHeader("X-FORWARDED-FOR");
			
			if(clientIp == null) clientIp = request.getRemoteAddr();
			
			bbsQnaVO.setIp(clientIp);
			
			int result = 0;
			result = service.updateBbsQna(bbsQnaVO);
			
			if(result > 0){
				response.sendRedirect(request.getContextPath()+"/cms/qna/list.do"); 
				
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
			
	}

}
