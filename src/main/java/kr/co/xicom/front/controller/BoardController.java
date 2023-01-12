package kr.co.xicom.front.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.xicom.file.FileProcess;
import kr.co.xicom.front.service.MediaService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.BoardVO;
import kr.co.xicom.front.service.BoardService;
import kr.co.xicom.util.Alerts;

@RequestMapping("/cmm")
@Controller
public class BoardController extends Alerts{
	public static String admSeq	= "1";
	@Autowired
	private BoardService boardService;
	@Autowired
	private FileProcess fileProcess;
	@Autowired
	private MediaService mediaService;

	/**
	 * 게시판 목록
	 * 
	 * @param
	 * @return
	 * @exception BusinessLogicException
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
	 * 게시판 상세
	 * 
	 * @param
	 * @return
	 * @exception BusinessLogicException
	 */
	@RequestMapping(value = "/boardView.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView boardView(
			ModelMap model, 
			@ModelAttribute("BoardVO") BoardVO boardVO,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session
			) throws Exception {
		ModelAndView mav = null; 
		mav = new ModelAndView("communication/board/board_view");
		
		int seq = Integer.parseInt(request.getParameter("no"));
		int bbsNo = Integer.parseInt(request.getParameter("bbsId"));

		// 게시물 상세
		boardVO.setBoardSeq(seq); // 게시물 번호
		boardVO.setStat("1");
		boardVO.setBbsId(bbsNo);
		BoardVO rs = boardService.getView(boardVO);
		
		
		if(rs == null){
			writeAlert("존재하지 않는 게시물입니다.", request, response);
		}
		
		//HttpSession session = request.getSession();
		
		// 첨부파일 리스트
		AttachVO attachVO = new AttachVO();
		attachVO.setBoardSeq(seq);
		List<AttachVO> attach = null;
//		attach = attachService.list(attachVO);


		// 조회수 증가
		boardService.read(boardVO);
				
		mav.addObject("rs", rs);
//		mav.addObject("attach", attach);
		mav.addObject("action", request.getParameter("action"));
		mav.addObject("menuNo", request.getAttribute("menuNo"));
		mav.addObject("menuName", request.getAttribute("menuName"));
		mav.addObject("bbsId", request.getParameter("bbsId"));
		mav.addObject("rwx", request.getAttribute("rwx"));
		
		return mav;
	}
	
	/**
	 * 게시물 등록
	 * 
	 * @param
	 * @return
	 * @exception BusinessLogicException
	 */
	@RequestMapping(value = "/boardPost.do", method={RequestMethod.GET})
	public ModelAndView boardPost(
			ModelMap model, 
			@ModelAttribute("BoardVO") BoardVO boardVO,
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception {
		ModelAndView mav = null;
		mav = new ModelAndView("communication/board/board_post");
//		mav = new ModelAndView("communication/board/post");

		mav.addObject("menuNo", request.getAttribute("menuNo"));
		mav.addObject("menuName", request.getAttribute("menuName"));
		mav.addObject("bbsId", request.getParameter("bbsId"));
		mav.addObject("vo", boardVO);


		return mav;
	}
	
	/**
	 * 게시물 등록 처리
	 * 
	 * @param
	 * @return
	 * @exception BusinessLogicException
	 */
	@RequestMapping(value = "/boardPost.do", method={RequestMethod.POST})
	public String doBoardPost(
			ModelMap model, 
			@ModelAttribute("BoardVO") BoardVO boardVO,
			@ModelAttribute("AttachVO") AttachVO attchVO,
			HttpServletRequest request, 
			HttpServletResponse response,
			HttpSession session
			) throws Exception {
		
		//HttpSession session = request.getSession();

		int result = boardService.add(boardVO,attchVO);
		if(result > 0){
			if(boardVO.getStat().equals("1")){
				return "redirect:boardList.do?bbsId="+boardVO.getBbsId();
			}else{
				return "redirect:boardEdit.do?no="+boardVO.getBbsId();
			}
		}else{
			return "forward:/common/error.jsp";
		}
		
	}
	
	/**
	 * 게시물 수정
	 * 
	 * @param
	 * @return
	 * @exception BusinessLogicException
	 */
	@RequestMapping(value = "/boardEdit.do", method={RequestMethod.GET})
	public ModelAndView boardEdit(
			ModelMap model, 
			@ModelAttribute("BoardVO") BoardVO boardVO,
			@RequestParam(value="no", required=true) String no,
			HttpServletRequest request,
			HttpServletResponse response
			) throws Exception {
		ModelAndView mav = null;
		mav = new ModelAndView("communication/board/board_edit");
		boardVO.setBoardSeq(Integer.parseInt(no));

		BoardVO rs = boardService.getView(boardVO);

		if(rs == null){
			writeAlert("존재하지 않는 게시물입니다.", request, response);
		}
		// 첨부파일 리스트
//		AttachVO attachVO = new AttachVO();
//		attachVO.setBoardSeq(seq);
//		List<AttachVO> attach = null;
//		attach = attachService.list(attachVO);

		mav.addObject("rs", rs);
		mav.addObject("bbsId", request.getParameter("bbsId"));

		return mav;
	}
	
	/**
	 * 게시물 수정 처리
	 * 
	 * @param
	 * @return
	 * @exception BusinessLogicException
	 */
	@RequestMapping(value = "/boardEdit.do", method={RequestMethod.POST})
	public String doBoardEdit(
			ModelMap model, 
			@ModelAttribute("BoardVO") BoardVO boardVO,
			@RequestParam(value="action", required=false) String action,
			@ModelAttribute("AttachVO") AttachVO attchVO,
			HttpServletRequest request, 
			HttpServletResponse response,
			HttpSession session
			) throws Exception {

		int result = boardService.update(boardVO,attchVO,"board");

		if(result > 0){
			if(boardVO.getStat().equals("1")){
				return "redirect:boardList.do?bbsId="+boardVO.getBbsId();
			}else if(boardVO.getStat().equals("9")){
				return "redirect:boardEdit.do?no="+boardVO.getBbsId();
			} else {
				return "redirect:boardList.do?action="+action;
			}
		}else{

			return "forward:/common/error.jsp";
		}
		
	}
	
	/**
	 * 게시물 삭제 처리
	 * 
	 * @param
	 * @return
	 * @exception BusinessLogicException
	 */
	@RequestMapping(value = "/boardDelete.do", method={RequestMethod.POST})
	public String doBoardDelete(
			ModelMap model, 
			@ModelAttribute("BoardVO") BoardVO boardVO,
			@ModelAttribute("AttachVO") AttachVO attchVO,
			HttpServletRequest request, 
			HttpServletResponse response,
			HttpSession session
			) throws Exception {

		int result = 0;
		
		try {

			result = boardService.updateStat(boardVO);
	
			if(result == 0){
				writeDbErrorAlert(request, response);
				return null;
			}else{
				return  "redirect:boardList.do?bbsId="+boardVO.getBbsId();
			}
		
		} catch (Exception e) {
			logger.error("BOARD EDIT ERROR!");
			writeAlert("처리 중 서버 에러가 발생하였습니다.", request, response);
			return null;
		}
		
	}
	/**
	 * dropzone 파일업로드
	 * @param
	 * @return
	 * @exception Exception 예외 전파
	 */
	@RequestMapping(value="/media/upload.do", method=RequestMethod.POST)
	public String upload(ModelMap model,
						 @ModelAttribute("AttachVO") AttachVO attachVO,
						 HttpServletRequest request,
						 HttpServletResponse response,
						 HttpSession session
	) throws Exception{

		model.clear();
		String folderPath = "media";
		//System.out.println("넘어온값"+attachVO);
		//System.out.println("start==============/media/upload.do====================="+attachVO.getFile().length+","+attachVO.getFile()[0].getOriginalFilename());
		// 이상진 수정 2020-12-16
		// FileController to FileProcess
		//FileController fm = new FileController();
		Map<String, String> map = new HashMap<String, String>();
		if(attachVO.getFile() != null){
			for(int i = 0; i < attachVO.getFile().length; i++){
				if(!attachVO.getFile()[i].isEmpty() && attachVO.getFile()[i].getSize() > 0){
					BufferedImage bi = null;
//					String rootPath = "";
//					String uploadPath = "";
					String subType = "";
					String subTypeMin[] = null;

					// 이상진 수정 2020-12-16
					// FileController to FileProcess
					//rootPath = EgovWebUtil.nvl(propertiesService.getString("rootPath").toString().trim()).equals("")?request.getSession().getServletContext().getRealPath("/"):propertiesService.getString("rootPath").toString();
					//uploadPath = EgovWebUtil.nvl(propertiesService.getString("uploadPath").toString().trim()).equals("")?"upload":propertiesService.getString("uploadPath").toString();
					//AttachVO files = fm.upload(attachVO.getFile()[i], rootPath, uploadPath, folderPath, request);
					AttachVO files = fileProcess.upload(attachVO.getFile()[i], folderPath);

					map.put("originalFilename", files.getFileNm());
					map.put("filename", files.getSvFileNm());
					map.put("filesize", String.valueOf(files.getFileSz()));
					//map.put("folderpath", files.getFolderPath());
					map.put("filepath", files.getFilePath());
					map.put("fileext", files.getFileExt());
					map.put("filetype", files.getFileMime());

					subType = files.getFileMime();

					subTypeMin = subType.split("/");
					if(subTypeMin[0].equals("image")) {
						try{
							File file = new File("/upload/" +files.getFilePath()+"/", FilenameUtils.getName("/upload/" +files.getFilePath()+"/"+files.getSvFileNm()));
							bi = ImageIO.read(file);
							files.setFileMeta(String.valueOf(bi.getWidth())+"x"+String.valueOf(bi.getHeight()));
						}catch(Exception e) {
							logger.error("FILE UPLOAD ERROR");
						}
					}

					if(session.getAttribute("ADMSEQ") != null) admSeq = session.getAttribute("ADMSEQ").toString();

					files.setRegSeq(Integer.parseInt(admSeq));
					files.setUpdSeq(Integer.parseInt(admSeq));


					int result = 0;
					result = mediaService.add(files);
					map.put("mdaseq", String.valueOf(files.getAttchSeq()));
				}
			}
		}
		//System.out.println("end===================================");
		model.addAttribute("response", map);
		return "jsonView";
	}


}
