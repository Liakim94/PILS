<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags/form" 		prefix="form"		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="fx" 											prefix="fx" 		%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>

<head>

<script src="${pageContext.request.contextPath }/js/cms/board/edit.js"></script>
<script src="${pageContext.request.contextPath }/x2/plugins/dropzone/dropzone.js"></script>
<script src="${pageContext.request.contextPath }/editor/naver/js/HuskyEZCreator.js" charset="utf-8"></script>
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
</script>

</head>

<page:applyDecorator name="menu" />
<form:form commandName="rs" name="frmPost" id="frmPost" method="POST" action="boardEdit.do">
<input type="hidden" name="action" />
	<input type="hidden" value ="${bbsId}" name="bbsId" id="bbsId" >
	<input type="hidden" value ="${rs.boardSeq}" name="boardSeq" id="boardSeq" >

	<form:hidden path="stat" value=""/>
<%--<form:hidden path="boardSeq" value="${rs.boardSeq }"/>--%>
<%--<form:hidden path="fileStd" value="${option.thumStd }"/>--%>
<section class="content">
    <div class="article"> <!-- row start -->

    	<div class="col-md-8">


    		<div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">게시물 수정</h3>
                </div><!-- /.box-header -->
                <div class="box-body">


                	<div class="form-group">
                	<label class="control-label">제목</label>
	                  	<form:input class="form-control" path="title" value="${rs.title}" id="title" maxlength="85"/>
	                </div>

	                <div class="form-group">
	                <label class="control-label">내용</label>
	                  	<textarea class="form-control" id="cont" name="cont" >${fx:resetXSSMinimum(rs.cont) }</textarea>
	                </div>

                </div><!-- /.box-body -->
				<div class="box-footer">
					<div class="btn-wrap type02 low_margin">
						<button type="button"  onclick="fn_submit('1')" class="btn btn-flat btn-primary">저장</button>
						<a href="${pageContext.request.contextPath}/cmm/boardList.do?bbsId=${bbsId}" class="btn blue" title="취소">취소</a>
					</div>
              </div>
              </div><!-- /. box -->
    	</div>



    		</div>

    	</div>

    </div> <!-- row end -->
	</div>
</section>
</form:form>
