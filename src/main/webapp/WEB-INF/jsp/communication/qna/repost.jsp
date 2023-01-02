<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>

<head>
<title></title>
	<script src="${pageContext.request.contextPath }/editor/naver/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<script>
	var oEditors = [];
	$(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "txta",
			sSkinURI: "${pageContext.request.contextPath }/editor/naver/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});
	});
</script>
<script>
	// submit
	function fn_submit(){

		var frm = document.getElementById('frmWrite');

		oEditors.getById["txta"].exec("UPDATE_CONTENTS_FIELD", []);

		var ir1 = $("#txta");

		if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
			alert("답변을 작성하세요.");
			return false;
		}

		$("#frmWrite").submit();
	}


</script>

<page:applyDecorator name="menu" />
<div class="article">	
	<div class="content">
	<!-- 컨텐츠 start -->
		<form name="frmWrite" id="frmWrite" method="post" action="${pageContext.request.contextPath}/qnaRepost.do">
		<input type="hidden" name="passwd" value="${rs.passwd}"/>
		<input type="hidden" name="headnum" value="${rs.headnum}"/>
		<input type="hidden" name="id" value="${rs.id}"/>
		<div class="tbl-wrap separate2 mb50">
		    <table class="tbl-list02">
		  <colgroup>
		      <col width="17%" />
		      <col width="*" />
		  </colgroup>
		        <tbody>
		            <tr>
		                <th class="txt_alcnt" scope="row">이름</th>
						<td><input value="관리자" name="name" readonly></td>
		            </tr>
		            <tr>
		                <th class="txt_alcnt" scope="row">제목 </th>
		                <td>
		                    <input  value="&nbsp;ㄴ>[Re]${rs.title }" name="title" readonly>
		                </td>
		            </tr>
		            <tr>
		                <th class="txt_alcnt" scope="row">내용</th>
		                <td>${rs.body }</td>
		            </tr>
					<tr>
						<th class="txt_alcnt" scope="row">답변</th>
						<td>
							<textarea id="txta" class="form-control"  name="body" ></textarea>
						</td>
					</tr>
		        </tbody>
		    </table>
		</div>
		<div class="btn-wrap type04">
			<button type="submit" class="btn blue" onclick="fn_submit()">저장</button>
		    <a href="${pageContext.request.contextPath}/qnaList.do" class="btn blue">취소</a>
		</div>
		</form>
     <!-- 컨텐츠 end -->
	</div>
</div>
