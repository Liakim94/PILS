<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="kr.co.xicom.file.FileController" %>
<%@page import="kr.co.xicom.front.model.AttachVO" %>
<%@page import="kr.co.xicom.cmmn.web.EgovWebUtil" %>
<%@page import="kr.co.xicom.cmmn.web.EgovProperties" %>
 
<%
	try {
		String rootPath = "D:\\eGovFrameDev-3.8.0-64bit\\workspace\\cobiz\\src\\main\\webapp\\WEB-INF\\resources";//EgovProperties.getProperty("RootPath");
		String uploadPath = "upload/";//EgovProperties.getProperty("UploadPath");
		
		//rootPath = EgovWebUtil.nvl(EgovProperties.getProperty("RootPath").toString().trim()).equals("")?request.getSession().getServletContext().getRealPath("/"):EgovProperties.getProperty("RootPath").toString();
		//uploadPath = EgovWebUtil.nvl(EgovProperties.getProperty("UploadPath").toString().trim()).equals("")?"upload":EgovProperties.getProperty("UploadPath").toString();
		
		
		//AttachVO vo = FileManager.setSmartFileItem(request.getInputStream(), request.getHeader("file-name"));
		AttachVO vo = FileController.upload(request.getInputStream(), rootPath, uploadPath, "photo", request.getHeader("file-name"));
				
		response.sendRedirect(request.getContextPath()+"/common/editor/photo_uploader/callback5.do?newfile="+vo.getFilePath()+"/"+vo.getSvFileNm());
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
