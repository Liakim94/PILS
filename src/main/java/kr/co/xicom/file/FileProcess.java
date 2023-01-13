package kr.co.xicom.file;


import kr.co.xicom.exception.businessException;
import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.util.Utils;
import kr.go.smes.fileservice.FileService;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * 파일 업로드 처리기.
 * 파일 업로드 처리시 FileController를 이용하였으나
 * property 이용 및 의존성 주입 처리를 위하여 FileController의 일부 기능을
 * FileProcess로 이관하여 구현 함.
 * @author 이상진
 * @since 2020-12-16
 */
@Service("fileProcess")
public class FileProcess {

    // Logger
    protected final static Logger logger = Logger.getLogger(FileProcess.class);

    // 이상진 추가 2020-11-06
    // NAS 파일업로드 처리를 위한 S3FileService 정의
    @Resource(name = "nasFileService")
    private FileService fileService;

    // 이상진 추가 2020-12-16
    // UploadPath를 메소드에 파라미터로 받지 않고
    // 그냥 여기서 프로퍼티 값을 이용한다.
    @Value("${UploadPath}")
    private String uploadPath;

    /**
     * 일반 파일 업로드
     * @param files         저장할 MultipartFile
     * @param folderPath    저장할 경로
     * @return
     */
    public AttachVO upload(MultipartFile files, String folderPath){
        return upload(files, folderPath, "Y");
    }

    public AttachVO upload(MultipartFile files, String folderPath, String flag) {

        // 저장 경로 설정
        String ymdPath          = makeYmdPath();
        String savePath         = makeSavePath(folderPath, ymdPath, flag);
        // 저장 파일명 설정
        String fileName         = files.getOriginalFilename();
        String fileExt          = FilenameUtils.getExtension(fileName);
        String savedFileName    = fileName;

        if (flag.equals("N")) {
            // 원본 파일명으로 저장
            savedFileName = fileName;
        }
        else {
            // 파일명을 변경하여 저장
            savedFileName = Utils.getUUID() + "." + fileExt;
        }

        AttachVO vo = null;

        try {

            // 파일 저장
            fileService.saveAsFile(savePath, savedFileName, files);

            vo = new AttachVO();
            vo.setFileNm(fileName);
            vo.setFileSz(files.getSize());
            vo.setSvFileNm(savedFileName);
            vo.setFileExt(fileExt);
            vo.setFileMime(files.getContentType());

            if (StringUtils.isEmpty(folderPath)) {
                vo.setFilePath(ymdPath);
            }
            else {
                vo.setFilePath(folderPath + "/" + ymdPath);
            }

        }
        catch (Exception ex) {
            logger.error("UPLOAD ERROR");
        }

        return vo;
    }

    /* 스마트 업로드 */
    public AttachVO upload(InputStream inputStream, String folderPath, String fileName){

        // 저장 경로 설정
        String savePath = makeSavePath(folderPath, makeYmdPath());
        // 저장 파일명 설정
        String savedFileName = Utils.getUUID() + "." + FilenameUtils.getExtension(fileName);

        AttachVO vo = new AttachVO();

        try {

            // 파일 저장
            fileService.saveAsFile(savePath, savedFileName, inputStream);

            vo.setSvFileNm(savedFileName);
            vo.setFilePath(savePath);

        }
        catch (Exception ex) {
            logger.debug(ex.getStackTrace());
        }
        finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (Exception e) {
                    logger.debug(e.getStackTrace());
                }
            }
        }

        return vo;
    }

    /**
     * 파일 업로드. 지정된 saveFileName으로 파일을 저장한다.
     * @param file          저장할 MultipartFile
     * @param folderPath    저장 경로
     * @param saveFileName  저장 할 파일명
     * @return 저장된 파일명을 반환한다.
     */
    public String uploadAs(MultipartFile file, String folderPath, String saveFileName) {

        if (file == null) {
            try {
                throw new businessException("FILE NULL ERROR!");
            } catch (businessException e) {
                logger.error("FILE NULL ERROR!");
            }
        }

        if (StringUtils.isEmpty(saveFileName)) {
            try {
                throw new businessException("SAVEFILENAME EMPTY ERROR!");
            } catch (businessException e) {
                logger.error("SAVEFILENAME EMPTY ERROR!!");
            }
        }

        // 저장 경로 설정
        // 년월일을 포함한 경로를 설정하지 않는다.
        String savePath = makeSavePath(folderPath, null, "N");

        // 저장 파일명 설정
        String fileName = file.getOriginalFilename();
        String fileExt  = FilenameUtils.getExtension(fileName);
        String savedFileName = saveFileName;

        try {
            // 파일 저장
            fileService.saveAsFile(savePath, savedFileName, file);
        }
        catch (Exception ex) {
            logger.error("UPLOAD ERROR");
        }

        return savedFileName;
    }

    /**
     * 다운로드 처리.
     * @param request       HttpServletRequest
     * @param response      HttpServletResponse
     * @param filePath      파일 저장 경로
     * @param savedFileName 저장된 파일 명
     * @param fileName      원본 파일 명
     */
    public void download(HttpServletRequest request, HttpServletResponse response, String filePath, String savedFileName, String fileName){

        // S3FileService NAS 저장 경로 예시 : upload/board/2020/11/06
        // rootPath 	: S3FileService 이용 시 불필요한 데이터
        // uploadPath	: upload/
        // filePath		: board/2020/11/06

        try{

            // uploadPath에 역슬래쉬(\) 문자 제거
            uploadPath = uploadPath.replace("\\", "/");

            if(!uploadPath.endsWith("/")) {
                uploadPath += "/";
            }

            // NAS 파일 저장 경로 설정.
            String folderPath = uploadPath + filePath;

            byte[] content = fileService.getBytes(folderPath, savedFileName);

            String encodedFilename = encodeFileName(Utils.getBrowser(request), fileName);

            response.setContentType("application/octet-stream;charset=UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename=\""+encodedFilename+"\"");
            response.setHeader("Content-Transper-Encoding", "binary");
            response.setContentLength(content.length);
            response.getOutputStream().write(content, 0, content.length);
            response.getOutputStream().close();

        }
        catch(Exception ex) {
            logger.error("UPLOAD ERROR");
        }
    }

    /**
     * 에디터 전용 이미지 다운로더.
     * urlRewrite를 통한 다운로드 전용이다.
     * @param request       HttpServletRequest
     * @param response      HttpServletResponse
     * @param filePath      이미지명을 포함한 정체 경로
     */
    public void download(HttpServletRequest request, HttpServletResponse response, String filePath) {

        try {

            byte[] content = fileService.getBytes(filePath);

            String fileName = FilenameUtils.getName(filePath);

            String encodedFileName = encodeFileName(Utils.getBrowser(request), fileName);

            response.setContentType("application/x-msdownload");
            response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\";");
            response.setContentLength(content.length);
            response.getOutputStream().write(content, 0, content.length);
            response.getOutputStream().close();

        }
        catch (Exception ex) {
            logger.error("EDITOR DOWNLOAD ERROR");
        }
    }

    private String encodeFileName(String browser, String fileName) throws  Exception {

        String encodedFilename = null;

        if(browser.equals("MSIE")){
            encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
        }
        else if(browser.equals("Trident")){
            encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
        }
        else if(browser.equals("Firefox")){
            encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
            encodedFilename = URLDecoder.decode(encodedFilename);
        }
        else if(browser.equals("Opera")){
            encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
        }
        else if(browser.equals("Chrome")){
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < fileName.length(); i++) {
                char c = fileName.charAt(i);
                if (c > '~') {
                    sb.append(URLEncoder.encode("" + c, "UTF-8"));
                } else {
                    sb.append(c);
                }
            }
            encodedFilename = sb.toString();
        }
        else if(browser.equals("Safari")){
            encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1")+ "\"";
            encodedFilename = URLDecoder.decode(encodedFilename);
        }
        else {
            encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1")+ "\"";
        }

        return encodedFilename;
    }

    private String makeSavePath(String folderPath, String ymdPath) {
        return makeSavePath(folderPath, ymdPath, "Y");
    }

    private String makeSavePath(String folderPath, String ymdPath, String flag) {

        // 저장 경로 구성
        // uploadPath + folderPath + ymdPath
        // upload/photo/2020/12/01/

        String savePath = uploadPath.replace("\\", "/");

        if (!savePath.endsWith("/")) {
            savePath += "/";
        }

        if(!StringUtils.isEmpty(folderPath)){
            savePath += folderPath;
        }

        if (!savePath.endsWith("/")) {
            savePath += "/";
        }

        // ymdPath를 포함할지 여부
        if (!flag.equals("N")) {
            savePath += ymdPath;
        }

        return savePath;
    }

    private String makeYmdPath() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        return  dateFormat.format(new Date());
    }

    public void showPopupImage(HttpServletRequest request, HttpServletResponse response, String filePath, String originalFileName) throws Exception {
        // NAS에서 파일 추출
        //byte[] content = fileService.getBytes(filePath);

        byte[] content = fileService.getBytes(filePath, originalFileName);

        System.out.println("=========================");
        if (content != null && content.length > 0) {
            // 파일 이미지는 저장시 확장자를 저장하지 않아, 원본 이미지명을 이용하여 파일 확장자를 확인한다.
            String contentType = "application/x-msdownload";
            String fileExt = FilenameUtils.getExtension(originalFileName);

            if ("asf".equals(fileExt)) { contentType = "video/x-ms-asf"; }
            else if ("asp".equals(fileExt)) { contentType = "text/asp"; }
            else if ("avi".equals(fileExt)) { contentType = "video/x-msvideo"; }
            else if ("bmp".equals(fileExt)) { contentType = "image/bmp"; }
            else if ("css".equals(fileExt)) { contentType = "text/css"; }
            else if ("doc".equals(fileExt)) { contentType = "application/msword"; }
            else if ("exe".equals(fileExt)) { contentType = "application/octet-stream"; }
            else if ("gif".equals(fileExt)) { contentType = "image/gif"; }
            else if ("htm".equals(fileExt)) { contentType = "text/html"; }
            else if ("html".equals(fileExt)) { contentType = "text/html"; }
            else if ("ico".equals(fileExt)) { contentType = "image/x-icon"; }
            else if ("java".equals(fileExt)) { contentType = "text/plain"; }
            else if ("jpeg".equals(fileExt)) { contentType = "image/jpeg"; }
            else if ("jpg".equals(fileExt)) { contentType = "image/jpeg"; }
            else if ("js".equals(fileExt)) { contentType = "application/x-javascript"; }
            else if ("mp3".equals(fileExt)) { contentType = "audio/mpeg3"; }
            else if ("mpeg".equals(fileExt)) { contentType = "video/mpeg"; }
            else if ("mpg".equals(fileExt)) { contentType = "audio/mpeg"; }
            else if ("png".equals(fileExt)) { contentType = "image/png"; }
            else if ("ppt".equals(fileExt)) { contentType = "application/vnd.ms-powerpoint"; }
            else if ("swf".equals(fileExt)) { contentType = "application/x-shockwave-flash"; }
            else if ("txt".equals(fileExt)) { contentType = "application/octet-stream"; }
            else if ("xls".equals(fileExt)) { contentType = "application/ms-excel"; }
            else if ("xml".equals(fileExt)) { contentType = "application/xml"; }
            else if ("zip".equals(fileExt)) { contentType = "application/zip"; }
            else { contentType = "application/x-msdownload"; }

            String browser = getBrowser(request);
            String encodeFileName = getDisposition(originalFileName, browser);

            response.setContentType(contentType);
            response.setHeader("Content-Disposition", "attachment;filename=\"" + encodeFileName + "\";");
            response.setContentLength(content.length);
            response.getOutputStream().write(content, 0, content.length);
            response.getOutputStream().close();


        }
    }

    public static String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        } else if(header.indexOf("rv:11.0") > -1){
            return "IE11";
        }
        return "Firefox";
    }

    public static String getDisposition(String filename, String browser)throws Exception {
        String encodedFilename = null;
        String fName = filename;
        if (browser.equals("MSIE")) {
            fName = fName.replaceAll("\r", "").replaceAll("\n", "");

            fName =  java.net.URLDecoder.decode(fName, "8859_1");
            fName =  java.net.URLEncoder.encode(fName, "UTF-8");

            encodedFilename = fName.replaceAll("\\+", " ");


        } else if (browser.equals("Firefox")) {
            encodedFilename =
                    "\"" + new String(fName.getBytes("UTF-8"), "8859_1") + "\"";
        } else if (browser.equals("Opera")) {
            encodedFilename =
                    "\"" + new String(fName.getBytes("UTF-8"), "8859_1") + "\"";
        } else if (browser.equals("Chrome")) {
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < fName.length(); i++) {
                char c = fName.charAt(i);
                if (c > '~') {
                    sb.append(URLEncoder.encode("" + c, "UTF-8"));
                } else {
                    sb.append(c);
                }
            }
            encodedFilename = sb.toString();
        } else if (browser.equals("IE11")) {
            fName = fName.replaceAll("\r", "").replaceAll("\n", "");

            fName =  java.net.URLEncoder.encode(fName, "utf-8");

            encodedFilename = fName.replaceAll("\\+", " ");
        }else {
            //throw new RuntimeException("Not supported browser");
            //else가 들어와도 ie 처럼 처리
            fName = fName.replaceAll("\r", "").replaceAll("\n", "");

            fName =  java.net.URLDecoder.decode(fName, "8859_1");
            fName =  java.net.URLEncoder.encode(fName, "UTF-8");

            encodedFilename = fName.replaceAll("\\+", " ");
        }
        return encodedFilename;
    }

    public void downloadFile(HttpServletResponse response, Map<String,String> params) throws UnsupportedEncodingException {
        String filePath = params.get("imgUrlAddr");
        String systemFilenm = params.get("imgFileNm");
        //String userFilenm = vo.getUserFilenm();
    }

}
