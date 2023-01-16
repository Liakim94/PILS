package kr.co.xicom.front.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.BoardVO;
import kr.co.xicom.front.service.BoardService;
import kr.co.xicom.util.Alerts;

@RequestMapping("/cmm")
@Controller
public class BoardController extends Alerts{

	@Autowired
	private BoardService boardService;


	/**
	 * 게시판 목록
	 */
	@RequestMapping(value = "/boardList.do", method={RequestMethod.GET})
	public ModelAndView boardList(
			ModelMap model,
			@ModelAttribute("BoardVO") BoardVO boardVO,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session
			) throws Exception {
		ModelAndView mav = null;
		mav = new ModelAndView("communication/board/board_list");

		/*페이징 초기설정*/
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());	// 현재페이지
		paginationInfo.setRecordCountPerPage(15);					// 한 페이지당 게시물갯수
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setPageUnit(paginationInfo.getRecordCountPerPage());

		int bbsNo = Integer.parseInt(request.getParameter("bbsId"));
		boardVO.setBbsId(bbsNo);
		boardVO.setStat("1");

		/*데이터 가져오기*/
		Map<String, Object> rs = new HashMap<String, Object>();
		rs = boardService.list(boardVO);
		// 게시판 이름 가져오는 메소드
		String menu = boardService.getMenu(bbsNo);

		int totalCnt = 0;
		totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));

		paginationInfo.setTotalRecordCount(totalCnt);

		mav.addObject("totalCnt", rs.get("resultCnt"));
		mav.addObject("list", rs.get("resultList"));
		mav.addObject("paginationInfo", paginationInfo);
		mav.addObject("vo", boardVO);
		mav.addObject("menuNo", request.getAttribute("menuNo"));
		mav.addObject("menuName", request.getAttribute("menuName"));
		mav.addObject("bbsId", request.getParameter("bbsId"));
		mav.addObject("rwx", request.getAttribute("rwx"));
		mav.addObject("bbsNm", menu);

		return mav;
	}

	/**
	 * 게시판 상세 조회
	 */
	@GetMapping(value = "/boardView.do")
	public ModelAndView boardView(@ModelAttribute("BoardVO") BoardVO boardVO,
								  HttpServletRequest request,
								  HttpServletResponse response,
								  HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView("communication/board/board_view");

		// WildRain 수정 2023-01-13
		// request.getParameter()를 이용하지 않고,
		// ModelAttibute("BoardVO")에 매핑된 boardSeq와 bbsId를 이용하도록 변경하였다.

		// 게시물 상세
		boardVO.setStat("1");
		// ModelAttribute를 이용하여 boardVO에는 이미 boardSeq값과 bbsId값이 지정되 있다.
		BoardVO rs = boardService.getView(boardVO);

		if (rs == null) {
			writeAlert("존재하지 않는 게시물입니다.", request, response);
		}

		// 첨부파일 리스트
		// WildRain 수정 2023-01-13
		// 해당 게시글에 첨부된 파일들 이므로 boardService에 getAttachList() 메소드를 구현 이용한다.
		List<AttachVO> attachList = boardService.getAttachList(boardVO);

		// 조회수 증가
		boardService.read(boardVO);
		//게시판 이름
		int bbsNo = Integer.parseInt(request.getParameter("bbsId"));
		String menu = boardService.getMenu(bbsNo);

		mav.addObject("rs", rs);
		mav.addObject("action", request.getParameter("action"));
		mav.addObject("menuNo", request.getAttribute("menuNo"));
		mav.addObject("menuName", request.getAttribute("menuName"));
		mav.addObject("bbsId", request.getParameter("bbsId"));
		mav.addObject("rwx", request.getAttribute("rwx"));
		mav.addObject("bbsNm", menu);
		// WildRain 추가 2023-01-13
		// 첨부파일 리스트 추가.
		mav.addObject("attachList", attachList);

		return mav;
	}

	/**
	 * 게시물 등록
	 */
	@RequestMapping(value = "/boardPost.do", method={RequestMethod.GET})
	public ModelAndView boardPost(@ModelAttribute("frmPost") BoardVO boardVO,
			                      HttpServletRequest request) throws Exception {

		ModelAndView mav = null;
		mav = new ModelAndView("communication/board/board_post");

		mav.addObject("menuNo", request.getAttribute("menuNo"));
		mav.addObject("menuName", request.getAttribute("menuName"));
		mav.addObject("bbsId", request.getParameter("bbsId"));
		mav.addObject("frmPost", boardVO);

		return mav;
	}

	/**
	 * 게시물 등록 처리
	 */
	@RequestMapping(value = "/boardPost.do", method={RequestMethod.POST})
	public String doBoardPost(@ModelAttribute("frmPost") BoardVO boardVO,
							  HttpSession session) throws Exception {

		int result = boardService.add(boardVO, null);


		if (result > 0) {
			return "redirect:boardView.do?boardSeq=" + boardVO.getBoardSeq() + "&bbsId=" + boardVO.getBbsId();
		}
		else{
			return "forward:/common/error.jsp";
		}

	}

	/**
	 * 게시물 수정
	 */
	@GetMapping(value = "/boardEdit.do")
	public ModelAndView boardEdit(@ModelAttribute("frmPost") BoardVO boardVO,
	                              HttpServletRequest request,
	                              HttpServletResponse response ) throws Exception {

		ModelAndView mav = new ModelAndView("communication/board/board_edit");

		// WildRain 수정 2023-01-13
		// ModelAttribute("frmPost")를 이용하면... 이미 boardVO에 boardSeq와 bbsId값이 매핑된다.
		// boardVO.setBoardSeq(Integer.parseInt(no));

		BoardVO rs = boardService.getView(boardVO);

		if(rs == null){
			writeAlert("존재하지 않는 게시물입니다.", request, response);
		}

		// 첨부파일 리스트
		// WildRain 수정 2023-01-13
		List<AttachVO> attachList = this.boardService.getAttachList(boardVO);
		if (attachList != null && attachList.size() > 0) {
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String jsonFileList = gson.toJson(attachList);
			rs.setJsonFileList(jsonFileList);
		}

		// 화면에서 필요한 게시글의 정보는 모두 rs에 지정하자.
		mav.addObject("frmPost", rs);
		//mav.addObject("bbsId", request.getParameter("bbsId"));
		// WildRain 추가 2023-01-13
		//mav.addObject("attachList", attachList);

		return mav;
	}

	/**
	 * 게시물 수정 처리
	 */
	@PostMapping(value = "/boardEdit.do")
	public String doBoardEdit(@ModelAttribute("BoardVO") BoardVO boardVO,
							  @RequestParam(value="action", required = false) String action,
							  HttpSession session) throws Exception {

		int result = boardService.update(boardVO, null,"board");

		if (result > 0) {
			return "redirect:boardView.do?boardSeq=" + boardVO.getBoardSeq() + "&bbsId=" + boardVO.getBbsId();
		}
		else{
			return "forward:/common/error.jsp";
		}
	}

	/**
	 * 게시물 삭제 처리
	 */
	@PostMapping(value = "/boardDelete.do")
	public String doBoardDelete(@ModelAttribute("BoardVO") BoardVO boardVO,
								HttpServletRequest request,
								HttpServletResponse response,
								HttpSession session ) throws Exception {

		int result = 0;

		try {

			result = boardService.updateStat(boardVO);

			if(result == 0){
				writeDbErrorAlert(request, response);
				return null;
			}
			else{
				return  "redirect:boardList.do?bbsId="+boardVO.getBbsId();
			}

		}
		catch (Exception e) {
			logger.error("BOARD EDIT ERROR!");
			writeAlert("처리 중 서버 에러가 발생하였습니다.", request, response);
			return null;
		}
	}

}
