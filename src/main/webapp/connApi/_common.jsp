<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.security.PrivateKey"%>
<%@page import="com.dreamsecurity.sso.crypto.SSOCryptoApi"%>
<%@page import="com.dreamsecurity.sso.config.SSOConfig"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.net.URLEncoder"%>
<%-- <%@ page trimDirectiveWhitespaces="true" %> --%>
<%!
	boolean isNumber( String str ){
		Integer num = null;
		try{
			num = Integer.parseInt( str );
			return true;
		}catch( NumberFormatException e ){
			return false;
		}
	}

	String encStr( String str ){
		str = str.replace("+", "%2B");
		str = str.replace("=", "%3D");
		str = str.replace("/", "%2F");
		
		return str;
	}
%>
<%
	request.setCharacterEncoding("UTF-8");

	String contextPath = request.getContextPath();

	String propPath = request.getSession().getServletContext().getRealPath("/WEB-INF/properties/");
	Properties pro = new Properties();
	
	String DB_URL = null;
	String DB_USER = null;
	String DB_PASSWORD = null;
	String TABLE_NAME = null;
	String CI_COLUMN = null;
	String JDBC_DRIVER = null;
	String RETURN_URL = null;
	String JOIN_URL = null;
	String LOGIN_URL = null;
	
	//SSO
	SSOConfig.setHomeDir(request.getSession().getServletContext(), "/WEB-INF/dreamsecurity/s2s");
	SSOCryptoApi crypto = SSOCryptoApi.getInstance();

	FileInputStream fis = null;
	String fileName = propPath + "/connClient.properties";
	
	try {
		fis = new FileInputStream(fileName);
		pro.load(fis);
		
		DB_URL = pro.getProperty("DB_URL");
		DB_USER = pro.getProperty("DB_USER");
		DB_PASSWORD = pro.getProperty("DB_PASSWORD");
		TABLE_NAME = pro.getProperty("TABLE_NAME");
		CI_COLUMN = pro.getProperty("CI_COLUMN");
		JDBC_DRIVER = pro.getProperty("JDBC_DRIVER");
// 		RETURN_URL = pro.getProperty("RETURN_URL");
		JOIN_URL = pro.getProperty("JOIN_URL");
		LOGIN_URL = pro.getProperty("LOGIN_URL");
	} catch (IOException e) {
		System.out.println("[ERROR CODE : 10005]");
		e.printStackTrace();
	} finally {
		if (fis != null) {
			try {
				fis.close();
			} catch (IOException e) {
				System.out.println("[ERROR CODE : 10006]");
				e.printStackTrace();
			}
		}
	}
%>