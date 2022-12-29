<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="fx" prefix="fx" %>
<%
//session id와 lastaccessedtime를 sid에 저장하여 그 id에서 그 시각에 생성되는
//고유의 문자열을 만든다.
String sid = session.getId()+session.getLastAccessedTime();
//attribute에 hid라는 이름으로 담는다.
//hid 와 sid 는 같은 값
session.setAttribute("hid", sid);
%>
<head>
<title>${menuName }</title>

</head>
<script>
$(function(){                 
	
	$("#frmWrite").validate({
		ignore: "",   
	    rules: {
	    	name:{required:true},
	    	title:{required:true},
	    	body:{required:true}
	    },
	    onkeyup:false,
	    onclick:false,
	    onfocusout:false,   
	    messages: {
	     	name:{required:"이름을 입력하세요."},
	    	title:{required:"제목을 입력하세요."},
	    	body:{required:"내용을 입력하세요."}
	    },        
	    submitHandler: function (frm) {

	    	frm.submit();
	    	
	    },
	    showErrors:function(errorMap, errorList){
			if(!$.isEmptyObject(errorList)){
		       	$.each(errorList, function() {
	            	alert(this.message); //summary += " * " + this.message + "<br>" ;
	            	return false;
	        	});
			}
		}
	});
	
	
	
});

</script>

<page:applyDecorator name="menu" />
<div class="article">	
	<page:applyDecorator name="location" />
	<div class="content">
	<!-- 컨텐츠 start -->
		<form name="frmWrite" id="frmWrite" method="post" action="${pageContext.request.contextPath}/cowork/bbsQna/edit.do">        
		<input type="hidden" name="id" value="${sessionScope.ID }">
		<input type="hidden" name="no" value="${rs.no }">
		<input type="hidden" name="sid" value="<%=sid %>"/>
		<input type="hidden" name="name" value="${rs.name }">
		<div class="tbl-wrap separate2 mb50">
		    <table class="tbl-list02">
		        <caption>회원수정 목록</caption>
		  <colgroup>
		      <col width="17%" />
		      <col width="*" />
		  </colgroup>
		        <tbody>
		            <tr>
		                <th class="txt_alcnt" scope="row">이름</th>
		                <td>${rs.name }</td>
		            </tr>
		            <tr>
		                <th class="txt_alcnt" scope="row">제목</th>
		                <td>
		                    <input type="text" class="uni_input_text wdh100" name="title" placeholder="제목 입력" value="${rs.title }" />
		                </td>
		            </tr>
		            <tr>
		                <th class="txt_alcnt" scope="row">내용</th>
		                <td>
					<textarea id="txta" class="uni_txtarea" name="body" placeholder="내용을 작성해주세요" >${rs.body }</textarea>
		                </td>
		            </tr>
		        </tbody>
		    </table>
		</div>
		<div class="btn-wrap type04">
			<button type="submit" class="btn blue">저장</button>   
		    <a href="${pageContext.request.contextPath}/108" class="btn blue">취소</a>
		</div>
		</form>
     <!-- 컨텐츠 end -->
	</div>
</div>
