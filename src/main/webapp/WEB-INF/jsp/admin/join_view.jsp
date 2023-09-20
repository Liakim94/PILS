<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%pageContext.setAttribute("crcf", "\r\n"); %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<head>
    <title> 관리자페이지 | 동행기업 신청 현황</title>

</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_admin"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    관리자페이지
                </li>
                <li>
                    동행기업 신청 현황
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 신청 현황</h1>
                <div class="side-wrap">
                </div>
            </div>
            <!-- 컨텐츠 start -->
            <div id="company-write" class="content">
                <form:form name="frmDelete" id="frmDelete" method="POST" action="view.do">
                <input type="hidden" id="bizNo" name="bizNo" value="${rs.bizNo}"/>
                <h2 class="title">기업 정보</h2>
                <div class="write-container">
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                기업명
                            </div>
                            <div class="input-wrap" style="margin:5px">
                                ${rs.cmpNm}
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                                사업자 번호
                            </div>
                            <div class="input-wrap" style="margin:5px">
                                ${rs.bizNo1}-${rs.bizNo2}-${rs.bizNo3}
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                대표자명
                            </div>
                            <div class="input-wrap" style="margin:5px">
                                ${rs.ceo}
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">설립일자</div>
                            <div class="input-wrap" style="margin:5px">
                                ${rs.fdate}
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">본사 주소</div>
                        <div class="input-wrap" style="margin:5px">
                            ${rs.address} &nbsp; ${rs.address_dtl}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">전화번호</div>
                            <div class="input-wrap" style="margin:5px">
                                ${rs.telNo}
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">팩스</div>
                            <div class="input-wrap" style="margin:5px">
                                ${rs.faxNo}
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">업종</div>
                            <div class="input-wrap" style="margin:5px">
                                ${rs.bizType}
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">자본금</div>
                            <div class="input-wrap" style="margin:5px">
                                ${rs.capital}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="write-container bt-none">
<%--                    <div class="line-wrap">--%>
<%--                        <div class="label-full">--%>
<%--                            기업현황 (최근 3년)--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="line-wrap">--%>
<%--                        <div class="label label-long">--%>
<%--                            지표--%>
<%--                        </div>--%>
<%--                        <div class="tri">--%>
<%--                            <div class="colored">2019년</div>--%>
<%--                            <div class="colored">2020년</div>--%>
<%--                            <div class="colored">2021년</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <c:forEach var="st" items="${st}" varStatus="status">--%>
<%--                        <c:if test="${status.index mod 3 eq 0}">--%>
<%--                            <div class="line-wrap">--%>
<%--                            <div class="label label-long">${st.index_dv_nm} </div>--%>
<%--                            <div class="tri" style="text-align:right">--%>
<%--                        </c:if>--%>
<%--                        <div class="border" style="margin:5px">--%>
<%--                        ${st.index_data}--%>
<%--                        <c:if test="${status.index mod 3 eq 2}">--%>
<%--                            </div>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
                    <div class="line-wrap">
                        <div class="label label-long">주요 제품</div>
                        <div class="input-wrap" style="margin:5px">
                            ${rs.product}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label label-long">주요 적용 제품
                            </div>
                            <div class="input-wrap" style="margin:5px">
                                ${rs.mainProduct}
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">참여기업 수</div>
                            <div class="input-wrap" style="margin:5px">
                                ${rs.joinCmp}
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label label-long">주요 원재료</div>
                        <div class="input-wrap" style="margin:5px">
                            ${rs.material}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">첨부서류</div>
                        <div class="input-wrap" style="margin:5px">
                            <div class="upload-list">
                                <c:forEach var="attach" items="${attachList}">
                                    <a href="<c:url value="${FileUploadController.makeDownloadLink(attach.savedFilePath, attach.fileNm)}"/>">
                                        <c:out value="${attach.fileNm}"/>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                    <div class="write-bottom">
                        <a id="edit" href='${pageContext.request.contextPath}/admin/join/edit.do?bizNo=${rs.bizNo}' class="submit">수정하기</a>
                        <a id="delete" onclick="deleteMem()" class="submit">삭제하기</a>
                        <a class="back" href="${pageContext.request.contextPath}/admin/join/list.do">목록</a>
                    </div>
                </form:form>
            </div>
        </div>
        <!-- 컨텐츠 end -->
    </div>
</div>
<script>
    function deleteMem() {
        if (confirm("정말 동행기업 삭제하시겠습니까?")) {
            $("#frmDelete").submit();
        } else {
            return false;
        }
    }
</script>