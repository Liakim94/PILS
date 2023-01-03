package kr.co.xicom.util;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.xicom.cmmn.web.EgovProperties;
import org.apache.log4j.Logger;

/**
 * @author developer
 *
 */
public class Utils {
	protected static Logger logger = Logger.getLogger(Utils.class);
	/*
	 * JDK 1.5부터 지원한다.
	 * 난수를 발생시켜 일정한 길이의 고유값을 만들어낸다.
	 */
	public static String getUUID() {
		
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
	
	public static String removeTag(String html) throws Exception {
		
		String regExp = "";
		regExp = html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		return regExp;
		
	}
	
	
	public static String getRandomChar(int arg) {
		
		char[] chars = "abcdefghijklmnopqrstuvwxyzABSDEFGHIJKLMNOPQRSTUVWXYZ1234567890".toCharArray();
		//Random r = new Random(System.currentTimeMillis());
		SecureRandom r = new SecureRandom();
		char[] id = new char[arg];
		for (int i = 0;  i < arg;  i++) {
		    id[i] = chars[r.nextInt(chars.length)];
		}
		return new String(id);
	}
	
	public static String getSHA256(String base){
		try{
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.update(base.getBytes());
	        byte[] hash = digest.digest();
	        StringBuffer hexString = new StringBuffer();
	
	        for (int i = 0; i < hash.length; i++) {
	            //String hex = Integer.toHexString(0x0679 & hash[i]);
	            String hex = Integer.toString((hash[i]&0xff) + 0x100, 16).substring(1);
	        	if(hex.length() == 1) hexString.append('0'); 
	            hexString.append(hex);
	        }
	        //출력
	        return hexString.toString(); 
	    } catch(Exception ex){
	    	logger.debug("error!");
	        //throw new RuntimeException(ex);
	    	return null;
	    }
		
	}
	
	/*확장별 아이콘 출력(fa fa-xx)*/
	public static String getFileExt(String ext){
		String fileExt = "";
		if(ext.toLowerCase().equals("zip") || ext.toLowerCase().equals("rar")){
			fileExt = "file-archive-o";
		}else if(ext.toLowerCase().equals("doc") || ext.toLowerCase().equals("docx")){
			fileExt = "file-word-o";
		}else if(ext.toLowerCase().equals("xls") || ext.toLowerCase().equals("xlsx")){
			fileExt = "file-excel-o";
		}else if(ext.toLowerCase().equals("ppt") || ext.toLowerCase().equals("pptx")){
			fileExt = "file-powerpoint-o";
		}else if(ext.toLowerCase().equals("mp4") || ext.toLowerCase().equals("avi") || ext.toLowerCase().equals("mov") || ext.toLowerCase().equals("wmv")){
			fileExt = "file-video-o";
		}else{
			fileExt = "file-o";
		}
		return fileExt;
	}
	
	/*파일크기 */
	public static String getFileSize(String bytes) throws UnsupportedEncodingException {
		double intBytes = Double.parseDouble(bytes);
		
		if(intBytes > 0){
		String[] s = {"bytes", "KB", "MB", "GB", "TB", "PB"};
		int e = (int) Math.floor(Math.log(Double.parseDouble(bytes))/Math.log(1024));
	       
        //if(e == 0) return "0 "+s[0]; 
		if(e == 0) return bytes+" "+s[0];
        else return Math.round((Double.parseDouble(bytes)/Math.pow(1024, Math.floor(e)))*1000)/1000+ " "+s[e];
        //return (bytes/Math.pow(1024, Math.floor(e))).toFixed(2)+" "+s[e];
		}else{
			return "0 bytes";
		}
			
	    //return str;
	}
	
	public static String resetDateFormat(String val){
		String returnValue = "";
		returnValue = val;
		//System.out.println("before : "+returnValue);
		if (returnValue == null || returnValue.trim().equals("")) {
			return val;
		}else{
			returnValue = returnValue.replaceAll("-", "").replaceAll(".", "");
		}
		//System.out.println("after : " + returnValue);
		return returnValue;
	}
	
	
	public static String getServerIP(){
		InetAddress local;
		String ip = "";
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
		} catch (UnknownHostException e) {
			logger.debug(e.getStackTrace());
		}
		return ip;
	}
	
	public static String getClientIP(HttpServletRequest request){
		String clientIp = null;
		clientIp = request.getHeader("X-FORWARDED-FOR");		
		if(clientIp == null) clientIp = request.getRemoteAddr();
		return clientIp;
	}
	
	public static String getAgent(HttpServletRequest request){
		String header = "";
		header = request.getHeader("User-Agent");
		return header;
	}
	
	public static String getBrowser(HttpServletRequest request) {

	       String header = request.getHeader("User-Agent");
		   if (header.indexOf("MSIE") > -1) {
		       return "MSIE";
		   } else if (header.indexOf("Trident") > -1) {   // IE11 문자열 깨짐 방지
		       return "Trident";
		   } else if (header.indexOf("Edge") > -1) {
		       return "Edge";
		   } else if (header.indexOf("Chrome") > -1) {
		       return "Chrome";
		   }  else if (header.indexOf("Opera") > -1) {
		       return "Opera";
		   } else if (header.indexOf("Safari") > -1) {
		       return "Safari";
		   }

		   return "Firefox";

		}
	public static String pathTraversal (String text) {
	    return text.replace("[&./\']", "");
	}
	
	
	/**
	 * ip주소 찾기
	 * @param request
	 * @return
	 */
	public static String getClientIpAddr(HttpServletRequest request) {
	  //출처 :: http://blog.naver.com/rapkuma?Redirect=Log&logNo=20036011030
	    String ip = request.getHeader("X-Forwarded-For");
	 
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getRemoteAddr();
	    }
	 
	    return ip;
	}

	public static boolean ipCheckWhitelist(HttpServletRequest request) {
        String [] loginIp = Utils.getClientIpAddr(request).trim().split(",");
        logger.debug("login IP : "+loginIp[0]);
        String [] ipList = EgovProperties.getProperty("Cms.ip.whitelist").trim().split("/");
        boolean acceptIp = true;
        for(String ip : ipList) {
            logger.debug("허용 IP :" + ip);
            if(loginIp[0].equals(ip)) {
                acceptIp = false;
            }
        }  
	    return acceptIp;
	}
	

}
