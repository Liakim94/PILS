package kr.go.smes.util;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.net.URLEncoder;

/**
 * Request와 관련된 유틸 모음.
 * @author WildRain
 * @since 2022-02-17
 */
public class RequestUtils {

    /**
     * 클라이언트 IP 추출.
     * 참조 : https://www.lesstif.com/software-architect/proxy-client-ip-x-forwarded-for-xff-http-header-20775886.html
     * 참조 : https://j-dev.tistory.com/entry/Spring-Client-Ip-%EA%B0%80%EC%A0%B8%EC%98%A4%EA%B8%B0
     * @param request
     * @return
     */
    public static String getClientIp(HttpServletRequest request) {

        //
        // 톰캣 IPv4 주소 반환 참조 : https://ooz.co.kr/138
        //

        String ip = request.getHeader("X-Forwarded-For");
        if (StringUtils.isNotEmpty(ip)) {
            ip = StringUtils.trimToNull(ip.split(",")[0]);
        }

        //String ip = StringUtils.trimToNull(request.getHeader("X-Forwarded-For").split(",")[0]);
        //String ip = StringUtils.trimToNull(StringUtils.sp  .getSplitValue(request.getHeader("X-Forwarded-For"), ",", 0));

        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("x-real-ip");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("x-original-forwarded-for");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("HTTP_X_FORWARDED");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("HTTP_X_CLUSTER_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("HTTP_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("HTTP_FORWARDED");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("HTTP_VIA");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("REMOTE_ADDR");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getRemoteAddr();
        }

        return ip;
    }

    /**
     * 첨부파일 다운로드 시 한글 파일명 깨짐 방지를 위한 처리.
     * 출처 : https://eastglow.github.io/back-end/2018/11/06/Java-%ED%8C%8C%EC%9D%BC-%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C-%EC%8B%9C-%ED%95%9C%EA%B8%80-%EB%B0%8F-%ED%8A%B9%EC%88%98%EB%AC%B8%EC%9E%90-%EA%B9%A8%EC%A7%90,-%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C-%EB%B6%88%EA%B0%80-%EC%98%A4%EB%A5%98.html
     * @param request
     * @param originalFileName
     * @return
     * @author WildRain
     * @since 2022-06-07
     */
    public static String encodeFileName(HttpServletRequest request, String originalFileName) {

        String browser = getBrowser(request);
        String result = null;
        try {
            if (browser.equals("MSIE") ||
                browser.equals("Trident") ||
                browser.equals("Edge")) {
                result = URLEncoder.encode(originalFileName, "UTF-8").replaceAll("\\+", "%20");
            }
            else {
                result = new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1");
            }
        }
        catch(Exception e){
            result = originalFileName;
        }
        return result;

    }

    /**
     * 인수로 전달 받은 HttpServletRequest를 이용하여 접속 브라우저 확인.
     * 출처: https://zelkun.tistory.com/entry/JSPSERVLETSPRING-한글파일-다운로드-파일명-처리 [Tsunami:티스토리]
     * @param request
     * @return
     * @author WildRain
     * @since 2022-06-07
     */
    public static String getBrowser(HttpServletRequest request) {
        String userAgent = request.getHeader("User-Agent");
        if (userAgent.indexOf("MSIE") > -1
            || userAgent.indexOf("Trident") > -1 //IE11
            || userAgent.indexOf("Edge") > -1) {
            return "MSIE";
        }
        else if(userAgent.indexOf("Chrome") > -1) {
            return "Chrome";
        }
        else if(userAgent.indexOf("Opera") > -1) {
            return "Opera";
        }
        else if(userAgent.indexOf("Safari") > -1) {
            return "Safari";
        }
        else if(userAgent.indexOf("Firefox") > -1){
            return "Firefox";
        }
        else{
            return null;
        }
    }
}
