<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.File" %>
<%@page import="java.util.List" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@page import="kr.co.xicom.file.FileController" %>
<%@page import="kr.co.xicom.front.model.AttachVO" %>
<%@page import="kr.co.xicom.cmmn.web.EgovWebUtil" %>
<%@page import="kr.co.xicom.cmmn.web.EgovProperties" %>


<%
	try{
		
		String rootPath = "";//EgovProperties.getProperty("RootPath");
		String uploadPath = "";//EgovProperties.getProperty("UploadPath");
		
		rootPath = EgovWebUtil.nvl(EgovProperties.getProperty("RootPath").toString().trim()).equals("")?request.getSession().getServletContext().getRealPath("/"):EgovProperties.getProperty("RootPath").toString();
		uploadPath = EgovWebUtil.nvl(EgovProperties.getProperty("UploadPath").toString().trim()).equals("")?"upload":EgovProperties.getProperty("UploadPath").toString();
		
		out.clear();
		out=pageContext.pushBody();
 
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		FileItemFactory factory = new DiskFileItemFactory( 1024, new File(rootPath + uploadPath));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(2048000000);
		List<FileItem> items = upload.parseRequest(request);
		String url = request.getContextPath()+"/common/editor/photo_uploader/callback.do?";
		for(int i=0; i< items.size(); i++){
			FileItem item = items.get(i);
			if(!item.isFormField() && !"".equals(item.getName())){
				//AttachVO vo = FileManager.setSmartFileItem(item.getInputStream(), item.getName());
				AttachVO vo = FileController.upload(item.getInputStream(), rootPath, uploadPath, "photo", item.getName());
				url +="&newfile="+vo.getFilePath()+"/"+vo.getSvFileNm()+"&filename="+item.getName()+"&filesize="+String.valueOf(item.getSize());
			}else{
				url +="&"+item.getFieldName()+"="+item.getString();
			}
		}
		response.sendRedirect(url);
			
	}catch(Exception e){
		if(!e.getClass().getName().equals("org.apache.catalina.connector.ClientAbortException")) e.printStackTrace();
	}
%>
