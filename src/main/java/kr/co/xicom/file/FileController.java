package kr.co.xicom.file;

import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import kr.go.smes.fileservice.FileService;
//import kr.go.smes.fileservice.S3FileService;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import egovframework.rte.fdl.property.EgovPropertyService;
import kr.co.xicom.cmmn.web.EgovWebUtil;
import kr.co.xicom.cmmn.model.AttachVO;
import kr.co.xicom.util.Utils;

/**
 * @deprecated
 * FileProcess로 대체
 */
@Controller
public class FileController {
	protected final static Logger logger = Logger.getLogger(FileController.class);

	@Autowired
	private EgovPropertyService propertiesService;

	// 이상진 추가 2020-11-06
	// NAS 파일업로드 처리를 위한 S3FileService 정의
//	@Resource(name = "nasFileService")
//	private FileService fileService;

//	/*일반파일업로드*/
//	/**
//	 * @deprecated FileProcess.upload 로 대체 2020-12-16 이상진
//	 * @param files
//	 * @param rootPath
//	 * @param uploadPath
//	 * @param folderPath
//	 * @param request
//	 * @return
//	 */
//	public AttachVO upload(MultipartFile files, String rootPath, String uploadPath, String folderPath, HttpServletRequest request){
//
//		// 저장 경로 설정.
//		// uploadPath에 역슬래쉬(\) 문자 제거
//		String savePath = uploadPath.replace("\\", "/");
//		if (!savePath.endsWith("/")) {
//			savePath += "/";
//		}
//		if (!StringUtils.isEmpty(folderPath)) {
//			savePath += folderPath;
//		}
//		if (!savePath.endsWith("/")) {
//			savePath += "/";
//		}
//
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
//		String ymdPath = dateFormat.format(new Date());
//
//		savePath += ymdPath;
//
//		// 저장 파일명 설정
//		String fileName 	 = files.getOriginalFilename();
//		String fileExt		 = FilenameUtils.getExtension(fileName);
//		String savedFileName = Utils.getUUID() + "." + fileExt;
//		long fileSize		 = files.getSize();
//		String contentType	 = files.getContentType();
//
//		AttachVO vo = null;
//
//		try {
//
//			// S3FileService 싱글톤 생성
//			//S3FileService fileService = S3FileService.getInstance().init("insoftStandard", "http://192.168.0.36:9000", "admin", "tipa123123", "cobiz-dev");
//
//			// NAS 서버에 파일 저장
//			fileService.saveAsFile(savePath, savedFileName, files);
//
//			vo = new AttachVO();
//			vo.setFileNm(fileName);
//			vo.setFileSz(files.getSize());
//			vo.setSvFileNm(savedFileName);
//			vo.setFileExt(fileExt);
//			vo.setFileMime(contentType);
//
//			if (StringUtils.isEmpty(folderPath)) {
//				vo.setFilePath(ymdPath);
//			}
//			else {
//				vo.setFilePath(folderPath + "/" + ymdPath);
//			}
//		}
//		catch (Exception e) {
//			logger.debug(e.getStackTrace());
//
//		}
//
//		return vo;
//	}
//
//	public AttachVO upload(MultipartFile files, String rootPath, String uploadPath, String folderPath, HttpServletRequest request, String flag){
//		String tmpFileName = Utils.getUUID();
//		if(flag.equals("N")){
//			tmpFileName = files.getOriginalFilename();
//		}
//		String ext = "";
//		ext = files.getOriginalFilename();
//		ext = ext.substring(ext.lastIndexOf(".")+1);
//
//		Calendar cal = Calendar.getInstance();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//		String ymd = "", yyyy = "", mm = "", dd = "";
//		String ymdPath = "", savePath = "";
//
//		ymd = sdf.format(cal.getTime());
//
//		yyyy = ymd.substring(0, 4);
//		mm = ymd.substring(4, 6);
//		dd = ymd.substring(6);
//
//		ymdPath = yyyy + "/" + mm + "/" + dd;
//
//
//		//System.out.println(uploadPath+","+ymdPath);
//		try{
//			/*if(EgovWebUtil.nvl(folderPath).equals("")){
//				String rootPath = "";
//				rootPath = EgovWebUtil.nvl(propertiesService.getString("rootPath").toString().trim()).equals("")?request.getSession().getServletContext().getRealPath("/"):propertiesService.getString("rootPath").toString();
//				uploadPath = propertiesService.getString("rootPath").toString() + propertiesService.getString("uploadPath").toString() + ymdPath;
//			}else{
//				if(!uploadPath.endsWith("/")) uploadPath = uploadPath + "/" + ymdPath;
//				else uploadPath = uploadPath + ymdPath;
//			}*/
//
//			if(!rootPath.endsWith("/")) rootPath += "/";
//			if(!uploadPath.endsWith("/")) uploadPath += "/";
//
//			savePath = rootPath + uploadPath;
//
//			if(!EgovWebUtil.nvl(folderPath).trim().equals("")){
//				//if(!folderPath.endsWith("/")) folderPath += "/";
//				savePath += folderPath;
//			}
//
//
//			if(!savePath.endsWith("/")) savePath += "/";
//
//			if(!flag.equals("N")){
//				savePath += ymdPath;
//			}
//
//		}catch(Exception e){
//			logger.debug(e.getStackTrace());
//		}
//
//		File dir = null;
//		File newFile = null;
//		InputStream is = null;
//		OutputStream os = null;
//
//		AttachVO vo = null;
//
//		try {
//			dir = new File(savePath);
//
//			if(flag.equals("N")){
//				newFile = new File(savePath, tmpFileName); //확장자 미포함
//			} else {
//				newFile = new File(savePath, tmpFileName + "." + ext); //확장자 포함
//			}
//			if(!dir.exists()){
//				dir.mkdirs();
//			}
//			is = files.getInputStream();
//			os = new FileOutputStream(newFile);
//
//			FileCopyUtils.copy(is, os);
//
//			vo = new AttachVO();
//			vo.setFileNm(files.getOriginalFilename());
//			vo.setFileSz(files.getSize());
//			vo.setSvFileNm(newFile.getName());
//			vo.setFileExt(ext);
//			if(!EgovWebUtil.nvl(folderPath).trim().equals("")){
//				vo.setFilePath(folderPath+"/"+ymdPath);
//			}else{
//				vo.setFilePath(ymdPath);
//			}
//			vo.setFileMime(files.getContentType());
//
//
//			os.flush();
//			os.close();
//			is.close();
//
//		} catch (IOException e) {
//			logger.debug(e.getStackTrace());
//			//System.out.println(e.getStackTrace());
//		} catch(Exception e1){
//			logger.debug(e1.getStackTrace());
//			//System.out.println(e1.getStackTrace());
//		}finally{
//			if(is != null){
//				try{
//					is.close();
//				}catch(Exception e){logger.debug(e.getStackTrace());}
//			}
//			if(os != null){
//				try{
//					os.flush();
//					os.close();
//				}catch(Exception e){logger.debug(e.getStackTrace());}
//			}
//		}
//
//		return vo;
//	}
//
//

//
//	/**
//	 * @deprecated
//	 * FileProcess.uploadAs 메소드로 대체.
//	 */
//
//	public AttachVO upload(MultipartFile files, String rootPath, String uploadPath, String folderPath, String fileNm){
//		String tmpFileName = Utils.getUUID();
//
//		tmpFileName = fileNm;
//
//		String ext = "";
//		ext = files.getOriginalFilename();
//		ext = ext.substring(ext.lastIndexOf(".")+1);
//
//		Calendar cal = Calendar.getInstance();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//		String ymd = "", yyyy = "", mm = "", dd = "";
//		String ymdPath = "", savePath = "";
//
//		ymd = sdf.format(cal.getTime());
//
//		yyyy = ymd.substring(0, 4);
//		mm = ymd.substring(4, 6);
//		dd = ymd.substring(6);
//
//		ymdPath = yyyy + "/" + mm + "/" + dd;
//
//
//		//System.out.println(uploadPath+","+ymdPath);
//		try{
//			/*if(EgovWebUtil.nvl(folderPath).equals("")){
//				String rootPath = "";
//				rootPath = EgovWebUtil.nvl(propertiesService.getString("rootPath").toString().trim()).equals("")?request.getSession().getServletContext().getRealPath("/"):propertiesService.getString("rootPath").toString();
//				uploadPath = propertiesService.getString("rootPath").toString() + propertiesService.getString("uploadPath").toString() + ymdPath;
//			}else{
//				if(!uploadPath.endsWith("/")) uploadPath = uploadPath + "/" + ymdPath;
//				else uploadPath = uploadPath + ymdPath;
//			}*/
//
//			if(!rootPath.endsWith("/")) rootPath += "/";
//			if(!uploadPath.endsWith("/")) uploadPath += "/";
//
//			savePath = rootPath + uploadPath;
//
//			if(!EgovWebUtil.nvl(folderPath).trim().equals("")){
//				//if(!folderPath.endsWith("/")) folderPath += "/";
//				savePath += folderPath;
//			}
//
//
//			if(!savePath.endsWith("/")) savePath += "/";
//
//			//savePath += ymdPath;
//
//		}catch(Exception e){
//			logger.debug(e.getStackTrace());
//		}
//
//		File dir = null;
//		File newFile = null;
//		InputStream is = null;
//		OutputStream os = null;
//
//		AttachVO vo = null;
//
//		try {
//			dir = new File(savePath);
//			newFile = new File(savePath, tmpFileName + "." + ext); //확장자 포함
//			//newFile = new File(savePath, tmpFileName); //확장자 미포함
//			if(!dir.exists()){
//				dir.mkdirs();
//			}
//			is = files.getInputStream();
//			os = new FileOutputStream(newFile);
//
//			FileCopyUtils.copy(is, os);
//
//			vo = new AttachVO();
//			vo.setFileNm(files.getOriginalFilename());
//			vo.setFileSz(files.getSize());
//			vo.setSvFileNm(newFile.getName());
//			vo.setFileExt(ext);
//			if(!EgovWebUtil.nvl(folderPath).trim().equals("")){
//				vo.setFilePath(folderPath+"/"+ymdPath);
//			}else{
//				vo.setFilePath(ymdPath);
//			}
//			vo.setFileMime(files.getContentType());
//
//			//System.out.println("=================================================");
//            //System.out.println("======FileController upload 3====...newFile="+newFile.getPath()+"..folderPath="+folderPath+"..ext="+ext);
//            //System.out.println("=================================================");
//
//			os.flush();
//			os.close();
//			is.close();
//
//		} catch (IOException e) {
//			logger.debug(e.getStackTrace());
//			//System.out.println(e.getStackTrace());
//		} catch(Exception e1){
//			logger.debug(e1.getStackTrace());
//			//System.out.println(e1.getStackTrace());
//		}finally{
//			if(is != null){
//				try{
//					is.close();
//				}catch(Exception e){logger.debug(e.getStackTrace());}
//			}
//			if(os != null){
//				try{
//					os.flush();
//					os.close();
//				}catch(Exception e){logger.debug(e.getStackTrace());}
//			}
//		}
//
//		return vo;
//	}
//
//	/*스마트 업로드 */
//	/* 이상진 수정 2020-11-05 */
//
//	/**
//	 * @deprecated FileProcess.upload 로 대체.
//	 */
//	public static AttachVO upload(InputStream is, String rootPath, String uploadPath, String folderPath, String oriname){
//		AttachVO file = new AttachVO();
//
//		// uploadPath에 '\' (역슬래쉬) 문자가 따라오는 문제 해결
//		uploadPath = uploadPath.replace("\\", "/");
//
//		// 저장 경로 설정
//		String savePath = uploadPath;
//		if (!savePath.endsWith("/")) {
//			savePath += "/";
//		}
//		if (!StringUtils.isEmpty(folderPath)) {
//			savePath += folderPath;
//		}
//		if (!savePath.endsWith("/")) {
//			savePath += "/";
//		}
//
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
//		savePath += dateFormat.format(new Date());
//
//		// 저장 파일명 설정
//		String fileName = Utils.getUUID() + "." + FilenameUtils.getExtension(oriname);
//
//		try {
////			// S3FileService 싱글톤 생성
////			S3FileService fileService = S3FileService.getInstance().init("insoftStandard", "http://192.168.0.36:9000", "admin", "tipa123123", "cobiz-dev");
////			//S3FileService fileService = new S3FileService("insoftStandard", "http://192.168.0.36:9000", "admin", "tipa123123");
////
////			fileService.saveAsFile(savePath, fileName, is);
////
////			file.setSvFileNm(fileName);
////			file.setFilePath(savePath);
//
//		}
//		catch (Exception ex) {
//			logger.debug(ex.getStackTrace());
//		}
//		finally {
//			if (is != null) {
//				try {
//					is.close();
//				} catch (Exception e) {
//					logger.debug(e.getStackTrace());
//				}
//			}
//		}
//
//		return file;
//	}

//	public AttachVO upload(CommonsMultipartFile files, String rootPath, String uploadPath, String folderPath) {
//		String tmpFileName = Utils.getUUID();
//		String ext = "";
//		ext = files.getOriginalFilename();
//		ext = ext.substring(ext.lastIndexOf(".")+1);
//
//		Calendar cal = Calendar.getInstance();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//		String ymd = "", yyyy = "", mm = "", dd = "";
//		String ymdPath = "", savePath = "";
//
//		ymd = sdf.format(cal.getTime());
//
//		yyyy = ymd.substring(0, 4);
//		mm = ymd.substring(4, 6);
//		dd = ymd.substring(6);
//
//		ymdPath = yyyy + "/" + mm + "/" + dd;
//
//
//		try{
//			if(!rootPath.endsWith("/")) rootPath += "/";
//			if(!uploadPath.endsWith("/")) uploadPath += "/";
//
//			savePath = rootPath + uploadPath;
//
//			if(!EgovWebUtil.nvl(folderPath).trim().equals("")){
//				//if(!folderPath.endsWith("/")) folderPath += "/";
//				savePath += folderPath;
//			}
//
//
//			if(!savePath.endsWith("/")) savePath += "/";
//
//			savePath += ymdPath;
//
//		}catch(Exception e){
//			logger.debug(e.getStackTrace());
//		}
//
//		File dir = null;
//		File newFile = null;
//		InputStream is = null;
//		OutputStream os = null;
//
//		AttachVO vo = null;
//
//		try {
//			dir = new File(savePath);
//			newFile = new File(savePath, tmpFileName + "." + ext); //확장자 포함
//			//newFile = new File(savePath, tmpFileName); //확장자 미포함
//			if(!dir.exists()){
//				dir.mkdirs();
//			}
//			is = files.getInputStream();
//			os = new FileOutputStream(newFile);
//
//			FileCopyUtils.copy(is, os);
//
//			vo = new AttachVO();
//			vo.setFileNm(files.getOriginalFilename());
//			vo.setFileSz(files.getSize());
//			vo.setSvFileNm(newFile.getName());
//			vo.setFileExt(ext);
//			if(!EgovWebUtil.nvl(folderPath).trim().equals("")){
//				vo.setFilePath(folderPath+"/"+ymdPath);
//			}else{
//				vo.setFilePath(ymdPath);
//			}
//			vo.setFileMime(files.getContentType());
//
//			//System.out.println("=================================================");
//            //System.out.println("======FileController upload 5====...newFile="+newFile.getPath()+"..folderPath="+folderPath+"..ext="+ext);
//            //System.out.println("=================================================");
//
//
//			os.flush();
//			os.close();
//			is.close();
//
//		} catch (IOException e) {
//			logger.debug(e.getStackTrace());
//			//System.out.println(e.getStackTrace());
//		} catch(Exception e1){
//			logger.debug(e1.getStackTrace());
//			//System.out.println(e1.getStackTrace());
//		}finally{
//			if(is != null){
//				try{
//					is.close();
//				}catch(Exception e){logger.debug(e.getStackTrace());}
//			}
//			if(os != null){
//				try{
//					os.flush();
//					os.close();
//				}catch(Exception e){logger.debug(e.getStackTrace());}
//			}
//		}
//
//		return vo;
//	}


	/*파일다운로드*/

//	/**
//	 * @deprecated
//	 * FileProcess.download로 대체
//	 */
//	public static void download(HttpServletRequest request, HttpServletResponse response, String rootPath, String uploadPath, String filePath, String savedFileName, String fileName){
//
//		// S3FileService NAS 저장 경로 예시 : upload/board/2020/11/06
//		// rootPath 	: S3FileService 이용 시 불필요한 데이터
//		// uploadPath	: upload/
//		// filePath		: board/2020/11/06
//
//		String browser = Utils.getBrowser(request);
//
//		try{
//
//			// uploadPath에 역슬래쉬(\) 문자 제거
//			uploadPath = uploadPath.replace("\\", "/");
//
//			if(!uploadPath.endsWith("/")) {
//				uploadPath += "/";
//			}
//
//			// NAS 파일 저장 경로 설정.
//			String folderPath = uploadPath + filePath;
//
//			// S3FileService 싱글톤 생성
//			S3FileService fileService = S3FileService.getInstance().init("insoftStandard", "http://192.168.0.36:9000", "admin", "tipa123123", "cobiz-dev");
//
//			byte[] content = fileService.getBytes(folderPath, savedFileName);
//
//			String encodedFilename = encodeFileName(browser, fileName);
//
//			response.setContentType("application/octet-stream;charset=UTF-8");
//			response.setHeader("Content-Disposition", "attachment; filename=\""+encodedFilename+"\"");
//			response.setHeader("Content-Transper-Encoding", "binary");
//			response.setContentLength(content.length);
//			response.getOutputStream().write(content, 0, content.length);
//			response.getOutputStream().close();
//
//		}
//		catch(Exception ex) {
//			//System.out.println("============="+e.getMessage());
//			logger.debug(ex.getStackTrace());
//		}
//
//	}

//	private static String encodeFileName(String browser, String fileName) throws  Exception {
//
//		String encodedFilename = null;
//
//		if(browser.equals("MSIE")){
//			encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
//		}
//		else if(browser.equals("Trident")){
//			encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
//		}
//		else if(browser.equals("Firefox")){
//			encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
//			encodedFilename = URLDecoder.decode(encodedFilename);
//		}
//		else if(browser.equals("Opera")){
//			encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
//		}
//		else if(browser.equals("Chrome")){
//			StringBuffer sb = new StringBuffer();
//			for (int i = 0; i < fileName.length(); i++) {
//				char c = fileName.charAt(i);
//				if (c > '~') {
//					sb.append(URLEncoder.encode("" + c, "UTF-8"));
//				} else {
//					sb.append(c);
//				}
//			}
//			encodedFilename = sb.toString();
//		}
//		else if(browser.equals("Safari")){
//			encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1")+ "\"";
//			encodedFilename = URLDecoder.decode(encodedFilename);
//		}
//		else {
//			encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1")+ "\"";
//		}
//
//		return encodedFilename;
//	}

	// 이상진 추가 2020-11-06
//	/**
//	 * 에디터 전용 이미지 다운로더.
//	 * @param filePath
//	 * @param response
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/image/download.do")
//	public void imageDownload(@RequestParam("filePath") String filePath, HttpServletResponse response) throws Exception {
//
//		// NAS 서버에서 파일 추출.
//		byte[] content = fileService.getBytes(filePath);
//
//		String fileName = FilenameUtils.getName(filePath);
//
//		if (content != null && content.length > 0) {
//
//			response.setContentType("application/x-msdownload");
//			response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\";");
//			response.setContentLength(content.length);
//			response.getOutputStream().write(content, 0, content.length);
//			response.getOutputStream().close();
//
//		}
//		else {
//			response.setContentType("application/x-msdownload");
//
//			PrintWriter printwriter = response.getWriter();
//			printwriter.println("<html>");
//			printwriter.println("<br><br><br><h2>Could not get file name:<br>" + fileName + "</h2>");
//			printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
//			printwriter.println("<br><br><br>&copy; webAccess");
//			printwriter.println("</html>");
//			printwriter.flush();
//			printwriter.close();
//		}
//
//	}

//	@RequestMapping(value = "/image/upload.do")
//	public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
//		try {
//			System.out.println("FileUploaderHtml5.jsp");
//			String rootPath = "";//EgovProperties.getProperty("RootPath");
//			String uploadPath = "";//EgovProperties.getProperty("UploadPath");
//
////			rootPath = EgovWebUtil.nvl(EgovProperties.getProperty("RootPath").toString().trim()).equals("")?request.getSession().getServletContext().getRealPath("/"):EgovProperties.getProperty("RootPath").toString();
////			uploadPath = EgovWebUtil.nvl(EgovProperties.getProperty("UploadPath").toString().trim()).equals("")?"upload":EgovProperties.getProperty("UploadPath").toString();
//
//
//			//System.out.println(EgovPropertyService.this.getString("rootPath"));
//
//			//AttachVO vo = FileManager.setSmartFileItem(request.getInputStream(), request.getHeader("file-name"));
//			AttachVO vo = FileController.upload(request.getInputStream(), rootPath, uploadPath, "photo", request.getHeader("file-name"));
//
//			response.sendRedirect(request.getContextPath()+"/common/editor/photo_uploader/callback5.do?newfile="+vo.getFilePath()+"/"+vo.getSvFileNm());
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
}
