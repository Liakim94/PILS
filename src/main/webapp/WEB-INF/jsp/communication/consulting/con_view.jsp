<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%pageContext.setAttribute("crcf", "\r\n"); %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<head>
    <title></title>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>

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
                <li>소통마당</li>
                <li>컨설팅 신청 확인</li>
            </ul>
            <div class="article-header">
                <div class="article-header">
                    <h1 class="fw700">컨설팅 신청 확인</h1>
                    <div class="side-wrap">
                    </div>
                </div>
                <div id="company-write" class="content">
                    <!-- 컨텐츠 start -->
                    <h2 class="title">기업 정보</h2>
                    <div class="write-container">
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    기업명
                                </div>
                                <div class="input-wrap">
                                    <input value="${rs.cmpNm}" readonly>
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    사업자 번호
                                </div>
                                <div class="input-wrap">
                                    <input readonly value="${rs.bizNo1}-${rs.bizNo2}-${rs.bizNo3}">
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    대표자명
                                </div>
                                <div class="input-wrap">
                                    <input readonly value="${rs.ceo}">
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">설립일자</div>
                                <div class="input-wrap">
                                    <input readonly value="${rs.fdate}">
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">본사 주소</div>
                            <div class="input-wrap">
                                <input readonly value="${rs.address} &nbsp; ${rs.address_dtl}">
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">전화번호</div>
                                <div class="input-wrap">
                                    <input readonly value="${rs.telNo}">
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">팩스</div>
                                <div class="input-wrap">
                                    <input readonly value="${rs.faxNo}">
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">업종</div>
                                <div class="input-wrap">
                                    <input readonly value="${rs.bizType}">
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">자본금</div>
                                <div class="input-wrap">
                                    <input readonly value="${rs.capital}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="write-container bt-none">
                        <div class="line-wrap">
                            <div class="label-full">
                                기업현황 (최근 3년)
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label label-long">
                                지표
                            </div>
                            <div class="tri">
                                <div class="colored">2019년</div>
                                <div class="colored">2020년</div>
                                <div class="colored">2021년</div>
                            </div>
                        </div>

                        <c:forEach var="st" items="${st}" varStatus="status">
                            <c:if test="${status.index mod 3 eq 0}">
                                <div class="line-wrap">
                                <div class="label label-long">
                                        ${st.index_dv_nm}
                                </div>
                                <div class="tri">
                            </c:if>
                            <div class="border">
                            <input readonly value="${st.index_data}">
                            <c:if test="${status.index mod 3 eq 2}">
                                </div>
                                </div>
                            </c:if>
                            </div>
                        </c:forEach>
                        <div class="line-wrap">
                            <div class="label label-long">주요생산품</div>
                            <div class="input-wrap">
                                <input readonly value="${rs.product}">
                            </div>
                        </div>
                    </div>

                    <h2 class="title mt40">담당자</h2>
                    <div class="write-container">
                        <div class="line-wrap">
                            <div class="label">성명</div>
                            <div class="input-wrap">
                                <input readonly value="${rs.name}">
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">소속 부서</div>
                                <div class="input-wrap">
                                    <input readonly value="${rs.deptNm}">
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    직위
                                </div>
                                <div class="input-wrap">
                                    <input readonly value="${rs.position}">
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">전화번호</div>
                            <div class="input-wrap">
                                <input readonly value="${rs.mbphno}">
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">이메일</div>
                            <div class="input-wrap ">
                                <input readonly value="${rs.email}">
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">사무실 전화</div>
                            <div class="input-wrap">
                                <input readonly value="${rs.memTelNo}">
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">팩스</div>
                            <div class="input-wrap">
                                <input readonly value="${rs.memFaxNo}">
                            </div>
                        </div>
                    </div>
                    <div class="write-container bt-none">
                        <div class="line-wrap">
                            <div class="label-full">
                                컨설팅 시 주요 질의사항
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="input-wrap input-full">
                                <textarea readonly value="${rs.conQ}"></textarea>
                            </div>
                        </div>
                    </div>
                    <h2 class="title mt40">연동제 적용 대상이 되는 주요 수위탁거래 정보</h2>
                    <div class="write-container">
                        <div class="line-wrap">
                            <div class="label label-long">
                                수위탁 거래 유형
                            </div>
                            <div class="input-wrap">
                                <input readonly value="  ${rs.deal_type}"/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label label-long">
                                연간 거래 규모
                            </div>
                            <div class="input-wrap">
                                <input readonly value="${rs.deal_scale}"/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label label-long">
                                주요 원재료
                            </div>
                            <div class="input-wrap">
                                <input readonly value="${rs.material}"/>
                            </div>
                        </div>
                    </div>
                    <div class="write-bottom">
                        <%--	    	<c:if test="${sessionScope.ID eq rs.id and empty rs.reply}">      --%>
                        <a href="<c:url value="/front/consulting/edit.do?bizNo=${rs.bizNo}"/>" class="submit">수정하기</a>
                        <%--	        </c:if>	        --%>
                        <a href="<c:url value="/front/consulting/apply.do"/>">목록</a>
                    </div>
                    <!-- 컨텐츠 end -->
                </div>
            </div>
		</div>
	</div>
</div>