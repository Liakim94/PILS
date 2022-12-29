package kr.co.xicom.editor;

import egovframework.rte.fdl.property.EgovPropertyService;
import kr.co.xicom.cmmn.model.AttachVO;
import kr.co.xicom.cmmn.web.EgovWebUtil;
import kr.co.xicom.file.FileProcess;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
* @Class   Name : EditorController.java
* @Description : Editor Controller 클래스
* @Modification Information
*
* 2018.02.22. / 전중재 / 최초생성
*
*/

@Controller
public class EditorController {

	protected final Logger logger = Logger.getLogger(EditorController.class);
	
	@Autowired
	private EgovPropertyService propertiesService;

	// 이상진 추가 2020-12-16
	// FileController to FileProcess
	@Autowired
	private FileProcess fileProcess;

	@RequestMapping(value="/common/editor/photo_uploader/callback5.do", method=RequestMethod.GET)
	public void callback5(
			@RequestHeader(value = "file-name")String fileName,
			@RequestHeader(value = "file-size")String fileSize,
			@RequestParam(value = "newfile")String fileNewName,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{

		// 이상진 수정 2020-11-05
		// S3FileService를 적용하여 NAS 서버에 파일을 저장하도록 수정하면서
		// 파라미터 fileNewName에 uploadPath 부분까지 추가 되었으므로
		// 아래의 uploadPath 처리를 제거한다.
		//String uploadPath = "";
		//uploadPath = EgovWebUtil.nvl(propertiesService.getString("uploadPath").toString().trim()).equals("")?"upload":propertiesService.getString("uploadPath").toString();

		PrintWriter out = response.getWriter();
		String fileNewName2 = EgovWebUtil.filePathBlackList(fileNewName);
		out.append("&bNewLine=true&sFileName=" + fileName + "&sFileURL=" + request.getContextPath() + "/" + fileNewName2);
		out.flush();
		out.close();
	}

	@RequestMapping(value="/common/editor/photo_uploader/callback.do", method=RequestMethod.GET)
	public void callback(
			@RequestParam(value = "filename")String fileName,
			@RequestParam(value = "filesize")String fileSize,
			@RequestParam(value = "newfile")String fileNewName,
			@RequestParam(value = "callback")String callback,
			@RequestParam(value = "callback_func")String callbackFunc,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String uploadPath = "";
		uploadPath = EgovWebUtil.nvl(propertiesService.getString("uploadPath").toString().trim()).equals("")?"upload":propertiesService.getString("uploadPath").toString();


		response.sendRedirect(callback+"?callback_func="+callbackFunc+"&bNewLine=true&sFileName="+fileName+"&sFileURL="+request.getContextPath()+"/"+uploadPath+fileNewName);
	}

	// 이상진 추가 2020-12-16
//	@Value("${RootPath}")
//	private String rootPath;

	// 이상진 추가 2020-12-16
	@Value("${UploadPath}")
	private String uploadPath;

	// 이상진 추가 2020-12-16

	/**
	 * 에디터 사진 첨부 image upload 처리.
	 * 기존에 FileUploaderHtml5.jsp에서 처리하던 로직을 EditorController로 이관 함.
	 * QuickPhotoPopup.js 파일에서 FileUploaderHtml5.jsp를 이용하지 않고
	 * /common/editor/photo_uploader/upload.do를 이용하도록 변경하였음.
	 * @param request	HttpRequest
	 * @param response	HttpResponse
	 */
	@RequestMapping(value = "/common/editor/photo_uploader/upload.do")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
		try {

			// 이상진 수정 2020-12-16
			// FileController to FileProcess
			//AttachVO vo = FileController.upload(request.getInputStream(), rootPath, uploadPath, "photo", request.getHeader("file-name"));
			AttachVO vo = fileProcess.upload(request.getInputStream(), "photo", request.getHeader("file-name"));

			response.sendRedirect(request.getContextPath() + "/common/editor/photo_uploader/callback5.do?newfile=" + vo.getFilePath() + "/" + vo.getSvFileNm());
		}
		catch(Exception ex) {
			logger.error("EDITOR ERROR");
		}
	}

	/**
	 * 에디터 전용 이미지 다운로더.
	 * urlrewrite를 통한 이미지 다운로드 전용이다.
	 * /webapp/WEB-INF/urlrewrite.xml 참조.
	 * @param filePath
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/editor/photo/download.do")
	public void imageDownload(HttpServletRequest request, HttpServletResponse response, @RequestParam("filePath") String filePath) throws Exception {

		try {
			fileProcess.download(request, response, filePath);
		}
		catch (Exception ex) {
		    logger.error("DOWNLOAD ERROR");
		}

	}

}
