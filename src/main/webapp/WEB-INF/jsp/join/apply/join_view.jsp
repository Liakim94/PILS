<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="fx" prefix="fx" %>
<%pageContext.setAttribute("crcf", "\r\n"); %>
<head>
<title></title>
	<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>

</head>

<page:applyDecorator name="menu2" />
<div class="article">	
	<div class="content">
		<div class="article-header">
			<h3>컨설팅 신청</h3>
			<div class="side-wrap">
			</div>
		</div>
	<!-- 컨텐츠 start -->
	    <div class="tbl-wrap separate2 mb50">
	        <table class="tbl-list02">
	            <caption>컨설팅 신청</caption>
	            <colgroup>
	                <col width="17%" />
	                <col width="*" />
	            </colgroup>
	<input type="hidden" id="bizNo" name="bizNo" value="${rs.bizNo}"/>

				<tbody>
				<tr>
					<th class="txt_alcnt" scope="row">기업명</th>
					<td>${rs.cmpNm}</td>
					<th class="txt_alcnt" scope="row">사업자번호</th>
					<td>${rs.bizNo1}-${rs.bizNo2}-${rs.bizNo3}	</td>
				</tr>
				<tr>
					<th class="txt_alcnt" scope="row">대표자명</th>
					<td>${rs.ceo}</td>
					<th class="txt_alcnt" scope="row">설립일자</th>
					<td>${rs.fdate}</td>
				</tr>

				<tr>
					<th class="txt_alcnt" scope="row">본사 주소</th>
					<td  colspan="3"> ${rs.address} &nbsp; ${rs.address_dtl}</td>
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
				<%--					<th colspan="4" class="txt_alcnt" scope="row">기업현황 (최근 3년)</th>--%>
				<%--					<tr>--%>
				<%--						<th class="txt_alcnt" scope="row">지표</th>--%>
				<%--						<th class="txt_alcnt" scope="row">2019년</th>--%>
				<%--						<th class="txt_alcnt" scope="row">2020년</th>--%>
				<%--						<th class="txt_alcnt" scope="row">2021년</th>--%>
				<%--					<tr>--%>
				<%--						<th class="txt_alcnt" scope="row">매출액(백만원)</th>--%>
				<%--						<td>--%>
				<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
				<%--						</td>--%>
				<%--						<td>--%>
				<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
				<%--						</td>--%>
				<%--						<td>--%>
				<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
				<%--						</td>--%>
				<%--					</tr>--%>
				<%--					<tr>--%>
				<%--						<th class="txt_alcnt" scope="row">영업이익(백만원)</th>--%>
				<%--						<td>--%>
				<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
				<%--						</td>--%>
				<%--						<td>--%>
				<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
				<%--						</td>--%>
				<%--						<td>--%>
				<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
				<%--						</td>--%>
				<%--					</tr>--%>
				<%--					<tr>--%>
				<%--						<th class="txt_alcnt" scope="row">종업원수(명)</th>--%>
				<%--						<td>--%>
				<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
				<%--						</td>--%>
				<%--						<td>--%>
				<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
				<%--						</td>--%>
				<%--						<td>--%>
				<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
				<%--						</td>--%>
				<%--					</tr>--%>
				<%--		            <tr>--%>
				<%--		                <th class="txt_alcnt" scope="row">주요생산품</th>--%>
				<%--		                <td colspan="3">--%>
				<%--							<input  type="text" id="product"  class="form-control"  name="product"/>--%>
				<%--		                </td>--%>
				<%--		            </tr>--%>
				<th colspan="4" class="txt_alcnt" scope="row">담당자</th>
				<tr>
					<th class="txt_alcnt" scope="row">성명</th>
					<td>${rs.name}</td>
					<th class="txt_alcnt" scope="row">전화번호</th>
					<td>${rs.mbphno}</td>
				</tr>
				<tr>
					<th class="txt_alcnt" scope="row">소속부서</th>
					<td>${rs.deptNm}</td>
					<th class="txt_alcnt" scope="row">직위</th>
					<td>${rs.position}</td>
				</tr>
				<tr>
					<th class="txt_alcnt" scope="row">이메일</th>
					<td  colspan="3">${rs.email}</td>
				</tr>
				<tr>
					<th class="txt_alcnt" scope="row">사무실 전화</th>
					<td>${rs.memTelNo}</td>
					<th class="txt_alcnt" scope="row">팩스</th>
					<td>${rs.memFaxNo}</td>
				</tr>
				<tr>
					<th class="txt_alcnt" scope="row">첨부서류</th>
					<td colspan="3">
						파일찾기
					</td>
				</tr>
				</tbody>
	        </table>
	    </div>
	    <div class="btn-wrap type04"> 
<%--	    	<c:if test="${sessionScope.ID eq rs.id and empty rs.reply}">      --%>
	        <a href='${pageContext.request.contextPath}/join/joinEdit.do?bizNo=${rs.bizNo}' class="btn blue">수정하기</a>
<%--	        </c:if>	        --%>
	        <a href="${pageContext.request.contextPath}/join/joinList.do" class="btn blue">목록</a>
	    </div>
	    <!-- 컨텐츠 end -->
	</div>
</div>