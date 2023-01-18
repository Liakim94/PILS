<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%pageContext.setAttribute("crcf", "\r\n"); %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<head>
    <title></title>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>

</head>

<page:applyDecorator name="menu_myPage"/>
<div class="article">
    <div class="content">
        <div class="article-header">
            <h3>마이페이지</h3>
            <div class="side-wrap">
            </div>
        </div>
        <!-- 컨텐츠 start -->
        <div class="tbl-wrap separate2 mb50">
            <table class="tbl-list02">
                <caption>마이페이지</caption>
                <colgroup>
                    <col width="17%"/>
                    <col width="*"/>
                </colgroup>

                <tbody>
                <tr>
                    <th class="txt_alcnt" scope="row">기업명</th>
                    <td>${rs.cmpNm}</td>
                    <th class="txt_alcnt" scope="row">사업자번호</th>
                    <td>${rs.bizNo1}-${rs.bizNo2}-${rs.bizNo3}    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">대표자명</th>
                    <td>${rs.ceo}</td>
                    <th class="txt_alcnt" scope="row">설립일자</th>
                    <td>${rs.fdate}</td>
                </tr>

                <tr>
                    <th class="txt_alcnt" scope="row">본사 주소</th>
                    <td colspan="3"> ${rs.address} &nbsp; ${rs.address_dtl}</td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">전화번호</th>
                    <td>${rs.telNo}</td>
                    <th class="txt_alcnt" scope="row">팩스</th>
                    <td>${rs.faxNo}</td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">업종</th>
                    <td>${rs.bizType}</td>
                    <th class="txt_alcnt" scope="row">자본금</th>
                    <td>${rs.capital}</td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">기업 로고</th>
                    <td colspan="3">
                        파일찾기
                    </td>
                </tr>
                <th colspan="4" class="txt_alcnt" scope="row">기업현황 (최근 3년)</th>
				<tr>
                    <th class="txt_alcnt" scope="row">지표</th>
                    <th class="txt_alcnt" scope="row">2019년</th>
                    <th class="txt_alcnt" scope="row">2020년</th>
                    <th class="txt_alcnt" scope="row">2021년</th>
                </tr>
                <c:forEach var="st" items="${st}" varStatus="status">
                    <c:if test="${status.index mod 3 eq 0}" >
                        <tr>
                        <th class="txt_alcnt" scope="row">${st.index_dv_nm} </th>
                    </c:if>
                        <td align="center">${st.index_data}</td>
                    <c:if test="${status.index mod 3 eq 2}" >
                        </tr>
                    </c:if>
				</c:forEach>
                <tr>
                    <th class="txt_alcnt" scope="row">주요생산품</th>
                    <td colspan="3">${rs.product}</td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">첨부서류</th>
                    <td colspan="3">
                        <c:forEach var="attach" items="${attachList}">
                               <li> <c:out value="${attach.fileNm}"/></li><br/>
                            </a>
                        </c:forEach>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="btn-wrap type04">
            <a id ="edit" href='${pageContext.request.contextPath}/main/joinEdit.do' class="btn blue">수정하기</a>
            <a href="${pageContext.request.contextPath}/main/myPage.do" class="btn blue">목록</a>
        </div>
        <!-- 컨텐츠 end -->
    </div>
</div>
