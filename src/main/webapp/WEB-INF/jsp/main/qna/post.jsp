<%@ page trimDirectiveWhitespaces="true" %>
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
			elPlaceHolder: "cont",
			sSkinURI: "${pageContext.request.contextPath }/editor/naver/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});
	});

	$(function(){
		$(document).on('change', 'input[name="id"]', function(){
		// $("input:radio[name='radio']").change(function(){

			if($("input[name=id]:checked").val() == "0"){
				$("input:text[name=passwd]").attr("disabled",false);

			}else if($("input[name=id]:checked").val() == "1"){
				$("input:text[name=passwd]").attr("disabled",true);
			}
		});
	});

	// submit
	function fn_submit(){

		var frm = document.getElementById('frmWrite');

		if( frm.name.value == "" )  {
			alert("작성자를 입력하세요.");
			return false;
		}
		if( frm.id.value == "" )  {
			alert("공개여부를 선택하세요.");
			return false;
		}
		if( frm.passwd.value == "" && document.getElementById('ChkBox2').checked )  {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if( frm.title.value == "" )  {
			alert("제목을 입력하세요.");
			return false;
		}

		oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);

		var ir1 = $("#cont");
		var ir2 = $("#cont").val();
		if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
			alert("내용을 입력하세요.");
			return false;
		}

		$("#frmWrite").submit();
	}

</script>

<page:applyDecorator name="menu" />
<div class="article">	
	<div class="content">
	<!-- 컨텐츠 start -->
		<form name="frmWrite" id="frmWrite" method="post" action="${pageContext.request.contextPath}/qnaPost.do">

		<div class="tbl-wrap separate2 mb50">
		    <table class="tbl-list02">
		        <caption>회원수정 목록</caption>
		  <colgroup>
		      <col width="17%" />
		      <col width="*" />
		  </colgroup>
		        <tbody>
		            <tr>
		                <th class="txt_alcnt" scope="row">작성자</th>
		                <td>
							<input type="text" class="uni_input_text wdh100" id="name" name="name" placeholder="작성자 입력" value="" />
						</td>
		            </tr>
					<tr><th class="txt_alcnt" scope="row">공개여부</th>
						<td>공개<input type="radio" name="id" id="ChkBox1" value="1">
							비공개<input type="radio" name="id" id="ChkBox2" value="0"></td>
					</tr>
					<tr>
						<th class="txt_alcnt" scope="row">비밀번호</th>
						<td>
							<input type="text" class="uni_input_text wdh100" name="passwd" id="passwd" placeholder="비밀번호 입력" value="" />
						</td>
					</tr>
		            <tr>
		                <th class="txt_alcnt" scope="row">제목</th>
		                <td>
		                    <input type="text" class="uni_input_text wdh100" name="title" id="title" placeholder="제목 입력" value="" />
		                </td>
		            </tr>
		            <tr>
		                <th class="txt_alcnt" scope="row">내용</th>
		                <td>
							<textarea id="cont"  class="form-control"  name="body"></textarea>
		                </td>
		            </tr>
		        </tbody>
		    </table>
		</div>
		<div class="btn-wrap type04">
			<button type="button" class="btn blue" onclick="fn_submit()">저장</button>
		    <a href="${pageContext.request.contextPath}/qnaList.do" class="btn blue">취소</a>
		</div>
		</form>
     <!-- 컨텐츠 end -->
	</div>
</div>
	