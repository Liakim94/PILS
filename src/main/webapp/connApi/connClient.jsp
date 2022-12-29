<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.* , javax.sql.*, java.io.* , java.net.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ include file="/connApi/_common.jsp" %>
<%@ include file="/magicsso/common.jsp" %>
<%!
    public String sendPostHttps(String userCi, String type, String bizno) throws Exception {
        String url = "https://www.smes.go.kr/connApi/connServer.jsp";
        String params = "CI=" + userCi + "&TYPE=" + type + "&BIZNO=" + bizno;//type j : jsp, a : asp
        
        URL obj = new URL(url);
        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
        
        con.setRequestProperty("content-type", "application/x-www-form-urlencoded");
        con.setRequestMethod("POST");
        con.setConnectTimeout(10000);       
        con.setReadTimeout(5000);           
        con.setDoOutput(true);              
        
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes( params );
        wr.flush();
        wr.close();
        
        int responseCode = con.getResponseCode();
    
        Charset charset = Charset.forName("UTF-8");
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(),charset));
        String inputLine;
        StringBuffer response = new StringBuffer();
    
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        
        in.close();
        
        return response.toString();
    }
%>
<%
    String decUserCi = null;
    String existCi = null;
    String ci = (String)session.getAttribute("SSO_USER_CI");
    System.out.println( "[connClient.jsp] SSO_USER_CI ==> " + ci );
    
    Object oBizrNo = session.getAttribute("SSO_BIZRNO");
    String bizno = null;
    String decBizno = null;
    System.out.println( "[connClient.jsp] decBizno ==> " + decBizno );
    
    decUserCi = new String(crypto.decryptSym(ci));
    
    System.out.println( "[connClient.jsp] decUserCi ==> " + decUserCi );
    
    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    String sql = null;
    
    if(oBizrNo != null) {
        System.out.println( "[connClient.jsp] session 있음" );
        
        bizno = (String)session.getAttribute("SSO_BIZRNO");
        if( bizno != null && !bizno.equals("") ) {
            System.out.println( "[connClient.jsp] bizno null 아님" );
            decBizno = new String( crypto.decryptSym(bizno) );
            
            if( decBizno.equals("null") )
                decBizno = "";

            System.out.println( "[connClient.jsp] decBizno ==> " + decBizno );
        }else{
            System.out.println( "[connClient.jsp] bizno null" );
            decBizno = "";
        }
    }
    else
    {
        System.out.println( "[connClient.jsp] session 없음" );
        decBizno = "";
    }
    
    // 사업자 등록번호 체크 필요   
    //기업회원
    sql = "SELECT " + CI_COLUMN + " FROM " + TABLE_NAME + " WHERE " + CI_COLUMN + "='" + decUserCi + "' AND cmp_regist_no = '" + decBizno +"'";

/*  String decUserCi = null;
    String existCi = null;
    String ci = (String)session.getAttribute("SSO_USER_CI");
    System.out.println( "[connClient.jsp] SSO_USER_CI ==> " + ci );
    decUserCi = new String(crypto.decryptSym(ci));
    
    System.out.println( "[connClient.jsp] decUserCi ==> " + decUserCi );
    
    String bizno = (String)session.getAttribute("SSO_BIZRNO");
    String decBizno = new String(crypto.decryptSym(bizno)); 

    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    String sql = "SELECT " + CI_COLUMN + " FROM " + TABLE_NAME + " WHERE " + CI_COLUMN + "='" + decUserCi + "' AND COM_REG_NUM = '" + decBizno +"'";
    
    System.out.println( "sql :::: " + sql ); */
    
    try{
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        stmt = conn.createStatement();
        pstmt = conn.prepareStatement( sql );
        rs = pstmt.executeQuery();

        while (rs.next()) {
            existCi = rs.getString( CI_COLUMN );
            System.out.println( "[connClient.jsp] DATABASE CI VALUE ==> " + ci );
        }
    }catch( SQLException e ){
        System.out.println( "[connClient.jsp] [ERROR CODE : 10000]" );
        e.printStackTrace();
    }finally{
        if( rs != null ){
            try{
                rs.close();
            }catch( SQLException e ){
                System.out.println( "[ERROR CODE : 10005]" );
                e.printStackTrace();
            }
        }
        
        if( pstmt != null ){
            try{
                pstmt.close();
            }catch( SQLException e ){
                System.out.println( "[ERROR CODE : 10003]" );
                e.printStackTrace();
            }
        }
        
        if( stmt != null ){
            try{
                stmt.close();
            }catch( SQLException e ){
                System.out.println( "[ERROR CODE : 10002]" );
                e.printStackTrace();
            }
        }
        
        if( conn != null ){
            try{
                conn.close();
            }catch( SQLException e ){
                System.out.println( "[ERROR CODE : 10001]" );
                e.printStackTrace();
            }
        }
    }

    if ( existCi == null || existCi.equals("") ) {
        %>
        <script>
            function existMember(){
                var loginUrl = "http://www.smes.go.kr/cobiz/102";
                var obj = {};
                    obj.existYn = "Y";
                    obj.loginUrl = loginUrl;
                if( window.opener )
                {
                    window.opener.postMessage( obj, "*" );
                    window.close();
                }
                else
                {
                    location.href = loginUrl;
                }
            }
            
            existMember();
        </script>       
<!--         TRY{ -->
<!--             STRING ENCCI = URLENCODER.ENCODE( CI, "UTF-8" ); -->
<!--             STRING ENCBIZNO = URLENCODER.ENCODE( BIZNO, "UTF-8" ); -->
<!--             STRING RESULT = SENDPOSTHTTPS( ENCCI, "J", ENCBIZNO ); -->
<!--             SYSTEM.OUT.PRINTLN( "[CONNCLIENT.JSP] MEMBER INFO ==> " + RESULT ); -->
<!--             STRING ENCVALUE = URLENCODER.ENCODE(RESULT, "UTF-8"); -->
<!--             SESSION.INVALIDATE(); -->
<!--             RESPONSE.SENDREDIRECT( CONTEXTPATH + "/CONNAPI/MBERCK.JSP?RESULT=" + ENCVALUE ); -->
<!--         } CATCH ( EXCEPTION E ) { -->
<!--             SYSTEM.OUT.PRINTLN( "[CONNCLIENT.JSP] [ERROR CODE : 10004]" ); -->
<!--             E.PRINTSTACKTRACE(); -->
<!--         } -->
        <%
    } else {
        %>
        <script>
            function existMember(){
                //기존 회원일 경우 해당 사이트 로그인 화면 URL로 변경
                var loginUrl = "<%=RELAY_STATE%>";
                var obj = {};
                    obj.existYn = "Y";
                    obj.loginUrl = loginUrl;
                if( window.opener )
                {
                    window.opener.postMessage( obj, "*" );
                    window.close();
                }
                else
                {
                    location.href = loginUrl;
                }
            }
            
            existMember();
        </script>       
        <%
    }
%>
