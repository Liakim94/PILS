<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="fx" prefix="fx" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<head>
    <title>${menuName }</title>
    <script>
        function deleteBbs(){
            if(confirm("정말 삭제하시겠습니까?")){
                $("#frmDelete").submit();
            }
            else {
                return false;
            }
        }
    </script>
</head>

<page:applyDecorator name="menu" />

<form name="frmDelete" id="frmDelete" method="POST" action="boardDelete.do">
    <input type="hidden" id="stat" name="stat" value="0"/>
    <input type="hidden" id="bbsId" name="bbsId" value="${bbsId}"/>
    <input type="hidden" value ="${rs.boardSeq}" name="boardSeq" id="boardSeq" >
    <div class="article">
        <div class="content">
            <!-- 컨텐츠 start -->
            <div class="board-view-wrap01">
                <p class="subj">${rs.title }</p>
                <div class="info">
                     <ul>
                         <li>작성자 : ${rs.regNm }</li>
                         <li>작성일 : ${rs.regDe }</li>
                     </ul>
                 </div>
                 <div class="file-wrap">
                     <p class="label">첨부파일</p>
                     <ul>
                         <c:forEach var="attach" items="${attachList}">
                            <li>
                                <a href="<c:url value="${FileUploadController.makeDownloadLink(attach.savedFilePath, attach.fileNm)}"/>">
                                    <c:out value="${attach.fileNm}"/>
                                </a>
                            </li>
                         </c:forEach>
                     </ul>
                 </div>
                 <div class="cont">
                    ${fx:resetXSSMinimum(rs.cont)}
                 </div>
            </div>
            <div class="btn-wrap type02 low_margin">
                <c:if test="${sessionId eq 'admin' }">
                    <a href="<c:url value="/cmm/boardEdit.do?boardSeq=${rs.boardSeq}&bbsId=${rs.bbsId}"/>" class="btn blue" title="수정">
                        게시물 수정
                    </a>
                    <button onclick="javascript:deleteBbs()" class="btn blue" title="등록">게시물 삭제</button>
                </c:if>
                <a href="<c:url value="/cmm/boardList.do?bbsId=${bbsId}"/>" class="btn blue" title="목록">목록</a>
            </div>
            <!-- 컨텐츠 end -->
        </div>
    </div>
</form>