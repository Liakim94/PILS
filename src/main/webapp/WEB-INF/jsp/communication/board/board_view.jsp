<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<head>
    <title>${menuName }</title>
    <script>
        function deleteBbs() {
            if (confirm("정말 삭제하시겠습니까?")) {
                $("#frmDelete").submit();
            } else {
                return false;
            }
        }
    </script>
</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    소통마당
                </li>
                <li>
                    ${bbsNm}
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">${bbsNm}</h1>
                <div class="side-wrap">
                </div>
            </div>

            <form name="frmDelete" id="frmDelete" method="POST"
                  action="<c:url value="/front/board/${bbsId}/delete.do"/>">
                <input type="hidden" id="stat" name="stat" value="0"/>
                <input type="hidden" id="bbsId" name="bbsId" value="${bbsId}"/>
                <input type="hidden" value="${rs.boardSeq}" name="boardSeq" id="boardSeq">

                <div class="content">
                    <div id="company-write" class="content">
                        <!-- 컨텐츠 start -->
                        <div class="board-view-wrap01">
                            <p class="subj">${rs.title }</p>
                            <div class="info">
                                <ul>
                                    <li>작성자 : 관리자</li>
                                    <li>작성일 : ${fn:substring(rs.regDe,0,10)}</li>
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
                        <div class="write-bottom">
                            <c:if test="${sessionId eq 'admin' }">
                                <a href="<c:url value="/front/board/${rs.bbsId}/edit.do?boardSeq=${rs.boardSeq}"/>"
                                   class="submit" title="수정">
                                    수정
                                </a>
                                <a onclick="javascript:deleteBbs();return false;" class="submit">삭제</a>
                            </c:if>
                            <a href="<c:url value="/front/board/${rs.bbsId}/list.do"/>" class="back">목록</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>