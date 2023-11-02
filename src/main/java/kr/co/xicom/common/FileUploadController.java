package kr.co.xicom.common;

import kr.go.smes.fileservice.FileService;
import kr.go.smes.util.RequestUtils;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

/**
 * FileUploader용 Controller.
 * @author WildRain
 * @since 2021-12-22
 */
@Controller
public class FileUploadController {

    private static final Logger LOGGER = LoggerFactory.getLogger(FileUploadController.class);

    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/files/upload.do")
    public void upload(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 파라미터 추출
        String targetFolderPath = request.getParameter("targetFolderPath");
        long maxFileSize        = Long.parseLong(request.getParameter("maxFileSize"));
        int maxFileCount        = Integer.parseInt(request.getParameter("maxFileCount"));
        long savedFileSize      = Long.parseLong(request.getParameter("savedFileSize"));
        int savedFileCount      = Integer.parseInt(request.getParameter("savedFileCount"));

        // MultipartFile 추출
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> files = multipartHttpServletRequest.getFiles("files");

        try {

            // 업로드 처리할 파일이 없다면 바로 리턴.
            if (files == null || files.size() == 0) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                PrintWriter writer = response.getWriter();
                writer.write("{\"message\":\"업로드할 파일이 없습니다.\"}");
                return;
            }
            // maxFileCount 제한
            if (savedFileCount >= maxFileCount) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                PrintWriter writer = response.getWriter();
                writer.write(String.format("{\"message\":\"파일 수량이 너무 많습니다. %d개 이상 업로드 할 수 없습니다.\"}", maxFileCount));
                return;
            }
            if ((files.size() + savedFileCount) > maxFileCount) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                PrintWriter writer = response.getWriter();
                writer.write(String.format("{\"message\":\"파일 수량이 너무 많습니다. %d개 이상 업로드 할 수 없습니다.\"}", maxFileCount));
                return;
            }
            // maxFileSize 제한
            if (savedFileSize >= maxFileSize) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                PrintWriter writer = response.getWriter();
                writer.write(String.format("{\"message\":\"파일이 너무 큽니다. %s 이상 업로드 할 수 없습니다.\"}", toFileSize(maxFileSize)));
                return;
            }
            long presentFileSize = 0;
            for (MultipartFile file : files) {
                presentFileSize += file.getSize();
            }
            if ((savedFileSize + presentFileSize) > maxFileSize) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                PrintWriter writer = response.getWriter();
                writer.write(String.format("{\"message\":\"파일이 너무 큽니다. %s 이상 업로드 할 수 없습니다.\"}", toFileSize(maxFileSize)));
                return;
            }

            if (StringUtils.isEmpty(targetFolderPath)) {
                targetFolderPath = "files";
            }

            if (StringUtils.endsWith(targetFolderPath, "/")) {
                targetFolderPath = StringUtils.chop(targetFolderPath);
            }

            LocalDate now = LocalDate.now();
            int year = now.getYear();
            int month = now.getMonthValue();
            int day = now.getDayOfMonth();

            String savedFolderPath = String.format("%s/%d/%d/%d/", targetFolderPath, year, month, day);

            String resultJson = "[";
            //List<SavedFileInfo> savedFileList = new ArrayList<SavedFileInfo>();

            for (MultipartFile file : files) {

                if (file.getOriginalFilename().isEmpty()) {
                    // TODO
                }
                else {
                    String fileName      = file.getOriginalFilename();
                    String contentType   = file.getContentType();
                    String extension     = FilenameUtils.getExtension(fileName);
                    long fileSize        = file.getSize();
                    String savedFileName = String.format("%s.%s", UUID.randomUUID(), extension);

                    // 파일 저장 처리
                    fileService.saveAsFile(savedFolderPath + savedFileName, file);

                    LOGGER.debug(String.format("FileUploader name: %s, type: %s, size: %d, savedPath: %s, savedFileName: %s", fileName, contentType, fileSize, savedFolderPath, savedFileName));

                    // 저장 정보 추가
                    resultJson += String.format("{\"name\":\"%s\",\"type\":\"%s\",\"size\":%d,\"savedPath\":\"%s\",\"savedFileName\":\"%s\"},", fileName, contentType, fileSize, savedFolderPath, savedFileName);

                }
            }
            resultJson = StringUtils.chop(resultJson);
            resultJson += "]";

            response.setStatus(HttpServletResponse.SC_OK);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            PrintWriter writer = response.getWriter();
            writer.write(String.format("{\"files\" : %s }", resultJson));
            //return;
        }
        catch (Exception ex) {
            LOGGER.error("FileUploader Error", ex);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            PrintWriter writer = response.getWriter();
            writer.write(String.format("{\"message\" : %s }", ex.getMessage()));
            //return;
        }
    }

    private String toFileSize(long fileSize) {
        if (fileSize < 1024) {
            return fileSize + " byte";
        }
        else if (fileSize < (1024 * 1024)) {
            return Math.round(((fileSize / 1024.0) * 100) / 100.0) + " KB";
        }
        else {
            return Math.round(((fileSize / 1024.0 / 1024.0) * 100) / 100.0) + " MB";
        }
    }

    /**
     * 파일 다운로드 처리.
     * FileController.makeDownloadLink()로 만들어진 다운로드 링크 전용 액션이다.
     * @param encodedFileInfo '실제저장경로||오리지널파일명' 형태의 파일정보를 Base64로 encode한 문자열.
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping(value="/files/download.do")
    public void download(@RequestParam(value="file") String encodedFileInfo,
                         HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        try {

            // 파라미터로 넘어온 encodedFileInfo값은 Base64로 encode되어
            // 있는 값이므로 Base64로 decode 한다.
            // Base64 decode 참조 : https://recordsoflife.tistory.com/331
            String decodedFileInfo = new String(Base64.decodeBase64(encodedFileInfo.getBytes(StandardCharsets.UTF_8)));

            // 파일 정보 추출.
            String[] fileInfos = decodedFileInfo.split("\\|\\|");
            // 파일 저장 경로.
            String savedFilePath = fileInfos[0];
            // 오리지널 파일명
            String fileName = fileInfos[1];
            // 파일명 디코드
            fileName = URLDecoder.decode(fileName, "UTF-8");

            // 파일 추출
            byte[] content = fileService.getBytes(savedFilePath);

            // 파일명 인코딩
            // WildRain 수정 2022-06-07
            // IE 등에서 다운로드 시 한글 파일명 깨지는 문제 해결.
            String encodeFileName = RequestUtils.encodeFileName(request, fileName); // new String(fileName.getBytes("UTF-8"), "ISO-8859-1");

            if (content != null && content.length > 0) {
                response.setContentType("application/x-msdownload");
                response.setHeader("Content-Disposition", "attachment;filename=\"" + encodeFileName + "\";");
                response.setContentLength(content.length);
                response.getOutputStream().write(content, 0, content.length);
                response.getOutputStream().close();
            }
            else {
                throw new FileNotFoundException("");
            }
        }
        catch (Exception ex) {
            LOGGER.error(ex.getMessage());
        }
    }

    /**
     * FileController를 이용한 Download Link를 생성한다.
     * @param savedFilePath 실제 저장 경로, 저장된 파일명 포함
     * @param originalFileName 오리지널 파일명
     * @return savedFilePath와 fileName을 '||' 구분자로 연결한 문자열을 Base64로 encode하여 반환한다.
     *         ('/files/download.do?file=' 경로를 포함한다.)
     * @throws Exception
     *
     * [ Jsp에서 호출하는 방법]
     *
     *  1. 아래와 같이 참조를 import 한다.
     *      ex) <%@ page import="com.ktr.exptcert.web.FileController" %>
     *
     *  2. c:url 테그를 이용하여 링크를 만든다.
     *      ex) <a href="<c:url value="${FileController.makeDownloadLink(filePath, fileName)}"/>">다운로드</a>
     */
    public static String makeDownloadLink(String savedFilePath, String originalFileName) throws Exception {
        String encodedFileName = URLEncoder.encode(originalFileName, "UTF-8");
        String fileInfo = savedFilePath + "||" + encodedFileName;
        // Base64 encode 참조 : https://recordsoflife.tistory.com/331
        String encodedFileInfo = new String(Base64.encodeBase64(fileInfo.getBytes(StandardCharsets.UTF_8)));
        encodedFileInfo = URLEncoder.encode(encodedFileInfo, "UTF-8")
                         .replaceAll("\\+", "%20")
                         .replaceAll("\\%21", "!")
                         .replaceAll("\\%27", "'")
                         .replaceAll("\\%28", "(")
                         .replaceAll("\\%29", ")")
                         .replaceAll("\\%7E", "~");
        return String.format("/files/download.do?file=%s", encodedFileInfo);
    }

    public static String makeDownloadLink(String savedFilePath) throws Exception {
        String fileName = FilenameUtils.getName(savedFilePath);
        return makeDownloadLink(savedFilePath, fileName);
    }
    public static String makeDownloadLink(String savedFilePath, String originalFileName, String downloadName) throws Exception {
        String encodedFileName = URLEncoder.encode(originalFileName, "UTF-8");
        String fileInfo = savedFilePath + "||" + encodedFileName;
        // Base64 encode 참조 : https://recordsoflife.tistory.com/331
        String encodedFileInfo = new String(Base64.encodeBase64(fileInfo.getBytes("EUC-KR")));
        encodedFileInfo = URLEncoder.encode(encodedFileInfo, "UTF-8")
                .replaceAll("\\+", "%20")
                .replaceAll("\\%21", "!")
                .replaceAll("\\%27", "'")
                .replaceAll("\\%28", "(")
                .replaceAll("\\%29", ")")
                .replaceAll("\\%7E", "~");
        return String.format("/files/downloadForPerf.do?file=%s", encodedFileInfo + "&downloadName="+ downloadName);
    }
    @RequestMapping(value="/files/downloadForPerf.do")
    public void downloadForPerf(@RequestParam(value="file") String encodedFileInfo,@RequestParam(value="downloadName")String downloadName,
                         HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        try {
            encodedFileInfo = RequestUtils.encodeFileName(request, encodedFileInfo);
            String decodedFileInfo = new String(Base64.decodeBase64(encodedFileInfo.getBytes("EUC-KR")));

            // 파일 정보 추출.
            String[] fileInfos = decodedFileInfo.split("\\|\\|");
            // 파일 저장 경로.
            String savedFilePath = fileInfos[0];
            savedFilePath = URLDecoder.decode(savedFilePath, "UTF-8");
            // 파일 추출
            byte[] content = fileService.getBytes(savedFilePath);

            if (content != null && content.length > 0) {
                response.setContentType("application/x-msdownload");
                response.setHeader("Content-Disposition", "attachment;filename="+ new String(downloadName.getBytes("UTF-8"), "ISO-8859-1"));
                response.setContentLength(content.length);
                response.getOutputStream().write(content, 0, content.length);
                response.getOutputStream().close();
            }
            else {
                throw new FileNotFoundException("");
            }
        }
        catch (Exception ex) {
            LOGGER.error(ex.getMessage());
        }
    }
}
