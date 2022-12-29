<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ include file="/connApi/_common.jsp" %>
<%
	String userInfo = request.getParameter("result"); //암호화된 정보를 받아오기

	System.out.println( "userInfo :::: " + userInfo );

	userInfo = userInfo.replace("&quot;", "\"");

	System.out.println( "userInfo :::: " + userInfo );

	String bizno = null;
	String mberType = null;

	// JSON 파싱
	JSONParser parser = new JSONParser();
	JSONObject arr = (JSONObject)( parser.parse( userInfo ) );
	JSONArray obj = (JSONArray)( arr.get("result") );
	JSONObject info = (JSONObject)( obj.get(0) );
	
	// 에러가 발생했을 경우 넘겨받은 에러코드 처리를 위한 부분
	if( isNumber(userInfo) )// connServer error
	{
		%>
		<script>alert( "[ERROR CODE : " + <%=userInfo%> + "]" );</script>
		<%
	}
	else
	{
		String[] result = new String[ info.size() ];
		Iterator i = info.keySet().iterator();
		Object key = null;
		String value = null;
		
		while( i.hasNext() ) 
		{
			if( info.get("ci") != null && !info.get("ci").equals("") )
			{
				if( info.get("bizno") != null && !info.get("bizno").equals("") )
					mberType = "A102";
				else
					mberType = "A101";
				
				key = i.next();
				
				if( info.get( key ) != null )
				{
					//복호화 했을 경우
					value = String.valueOf( info.get( key ) );
					
						if( key.equals( "name" ) )//이름의 경우 복호화시 한글이기 때문에 정보를 넘겨줄 경우 인코딩 하여 다시 넘겨줌
						{
							value = new String( crypto.decryptSym( value ) );
							value = URLEncoder.encode( value, "UTF-8" );
						}
						else if( key.equals( "ci" ) )
						{
							value = new String( crypto.decryptSym( value ) );
						}
						else
						{
							value = new String( crypto.decryptSym( value ) );
						}
					
					info.put(key, value);
					
					System.out.println( "[mberCk.jsp] member info decrypt [" + key + "] ==> " + value );
				}
				else
				{
					info.put(key, null);
				}
			}
		}
		
		info.put("mberType", mberType);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<meta name="format-detection" content="telephone=no"/>
<title>[중소벤처24] 회원 선택 화면</title>
<link rel="stylesheet" href="/connApi/assets/style/common.css" type="text/css"/>
<link rel="stylesheet" href="/connApi/assets/style/default.css" type="text/css"/>
<script src="/connApi/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function init(){
		var userInfo = <%=info%>;//복호화했을경우

		$.each( userInfo, function(key, val){
			$( "#" + key ).val( val );
		});
	}

	function existMember(){
		//기존 회원일 경우 해당 사이트 로그인 화면 URL로 변경
		var loginUrl = "<%=LOGIN_URL%>";
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
	
	function newMember(){
		var joinUrl = "<%=JOIN_URL%>";
		var obj = {};
			obj.existYn = "N";
			obj.joinUrl = joinUrl;
			obj.bizno = $("#bizno").val(); 
			obj.ci = $("#ci").val();
			obj.name = $("#name").val();
			obj.email = $("#email").val();
			obj.hp = $("#hp").val();
		
		if( window.opener )
		{
			window.opener.postMessage( obj, "*" );
			window.close();
		}
		else
		{
			location.href = joinUrl;
		}
	}
</script>
</head>
<body onload="init()">
<!-- action url 수정 필요 -->
<form id="frm" method="post" action="<%=JOIN_URL%>">
	<input type="hidden" name="bizno" id="bizno" value=""/>
	<input type="hidden" name="ci" id="ci" value=""/>
	<input type="hidden" name="name" id="name" value=""/>
	<input type="hidden" name="email" id="email" value=""/>
	<input type="hidden" name="hp" id="hp" value=""/>
</form>
	<!-- 팝업창 가로(420px) -->
    <div class="login-popup">
        <div class="inner">
            <p class="subj-txt">선택하신 사이트에 본인인증 정보가 없습니다.</p>
            <p class="cont-txt">기존 회원이신 경우 로그인 후 본인인증을 진행해 주시기 바라며, 신규회원이신 경우 회원가입을 완료하기 위해 추가정보 입력 후 회원가입을 완료해 주시기 바랍니다.</p>
        </div>
        <div class="btn-wrap type01">
            <a href="javascript:void(0)" onclick="existMember()" class="btn gray">기존 회원</a>
            <a href="javascript:void(0)" onclick="newMember()" class="btn blue">신규 회원</a>
        </div>
    </div>
</body>
</html>