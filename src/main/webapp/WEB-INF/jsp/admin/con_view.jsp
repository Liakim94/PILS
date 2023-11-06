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
<%@ page import="kr.co.xicom.common.FileUploadController" %>

<head>
    <title></title>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>

</head>
<style>
    .line-wrap .file {
        font-size: 14px;
        color: #333;
        display: table-cell;
        min-height: 30px;
        line-height: 1.2;
        vertical-align: middle;
        padding: 5px 20px;
        border: 1px solid #ccc;
    }
    .ul {
        margin-left: 9px;
        margin-top: 13px;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_admin"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>관리자페이지</li>
                <li>컨설팅 신청 현황</li>
            </ul>
            <div class="article-header">
                <div class="article-header">
                    <h1 class="fw700">컨설팅 신청 현황</h1>
                    <div class="side-wrap">
                    </div>
                </div>
                <div id="company-write" class="content">
                    <form:form modelAttribute="consultingVO" method="POST" action="delete.do">
                        <form:hidden path="seq"/>
                        <!-- 컨텐츠 start -->
                    <h2 class="title">기업 정보</h2>
                    <div class="write-container">
                        <div class="line-wrap ">
                            <div class="label" style="width: 29%;">
                                신청분야
                                <p style="color: blue;">※ 둘 다 혹은 택1 지원 가능</p>
                            </div>
                            <div class="input-wrap" style="border-right: 1px solid #505050; padding-top: 18px;text-align: center;">
                                <input disabled type="checkbox" name="const_ty1" id="const_ty1" value="원재료 비중 확인서 발급" style="width: 25%"
                                       <c:if test='${rs.const_ty1 == "원재료 비중 확인서 발급"}'>checked </c:if>>
                                <div style="vertical-align: middle;">원재료 비중 확인서 발급 &nbsp;<p style="color: blue;">*수탁기업(수급사업자)만 지원가능</p></div>

                            </div>
                            <div class="input-wrap" style="text-align: center;">
                                <input disabled type="checkbox" name="const_ty2" id="const_ty2" value="연동 약정 컨설팅" style="width: 25%;"
                                       <c:if test='${rs.const_ty2 == "연동 약정 컨설팅"}'>checked </c:if>>
                                연동 약정 컨설팅
                            </div>
                            <input type="hidden" name="const_ty" id="const_ty" value="">
                            <label class="error" for="const_ty" generated="true" style="display:none;padding-top: 28px;"/>
                        </div>

                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    기업명
                                </div>
                                <div class="input-wrap">
                                    ${rs.cmp_nm}
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    사업자 번호
                                </div>
                                <div class="input-wrap ">
                                    ${fn:substring(rs.bizNo,0,3)}-${fn:substring(rs.bizNo,3,5)}-${fn:substring(rs.bizNo,5,10)}
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    대표자명
                                </div>
                                <div class="input-wrap">
                                    ${rs.ceo}
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    법인등록번호
                                </div>
                                <div class="input-wrap">
                                    ${rs.regist_num}
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                본사 주소
                            </div>
                            <div class="input-wrap address-input-wrap">
                                ${rs.addr} ${rs.addr_dtl}
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label" style="width: 29%">
                                수탁위탁거래 시 대상여부
                            </div>
                            <div class="input-wrap" style="border-right: 1px solid #505050;">
                                <input type="radio" id="biz_ty1" name="biz_ty" value="위탁기업" style="width: 40%;"
                                       <c:if test='${rs.biz_ty == "위탁기업"}'>checked</c:if> disabled>
                                위탁기업(원사업자)
                            </div>
                            <div class="input-wrap" >
                                <input type="radio" id="biz_ty2" name="biz_ty" value="수탁기업" style="width: 40%;"
                                       <c:if test='${rs.biz_ty == "수탁기업"}'>checked</c:if> disabled>
                                수탁기업(수급사업자)
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                수위탁거래 대상물품명
                            </div>
                            <div class="input-wrap ">
                                ${rs.product}
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                주요 원재료 후보
                            </div>
                            <div class="input-wrap">
                                ${rs.prmy_mat}
                            </div>
                        </div>
                    </div>
                    <h2 class="title mt40">담당자</h2>
                    <div class="write-container">
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    성명
                                </div>
                                <div class="input-wrap">
                                    ${rs.mem_nm}
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    직위
                                </div>
                                <div class="input-wrap">
                                    ${rs.pstn}
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                연락처
                            </div>
                            <div class="input-wrap">
                                ${rs.mbphno}
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                이메일
                            </div>
                            <div class="input-wrap">
                                ${rs.email}
                            </div>
                        </div>
                    </div>

                    <h2 class="title mt40">필수 제출 서류 첨부</h2>
                    <div class="write-container">
                        <div class="line-wrap">
                            <div class="label" style="width:30%">1. 사업신청서&활용계획서</div>
                            <ul class="ul">
                                <c:if test="${rs.filenm1 ne null && rs.filenm1 ne ''}">
                                    <a href="<c:url value="${FileUploadController.makeDownloadLink(rs.filenm1_path, rs.filenm1)}"/>"
                                       class="file"  download>
                                        <c:out value="${rs.filenm1}"/>
                                    </a>
                                </c:if>
                            </ul>
                        </div>
                        <div class="line-wrap">
                            <div class="label" style="width:30%">2. 사업자등록증&중소기업확인서</div>
                            <ul class="ul">
                                <c:if test="${rs.filenm2 ne null && rs.filenm2 ne ''}">
                                    <a href="<c:url value="${FileUploadController.makeDownloadLink(rs.filenm2_path, rs.filenm2)}"/>"
                                       class="file"  download>
                                        <c:out value="${rs.filenm2}"/>
                                    </a>
                                </c:if>
                            </ul>
                        </div>
                        <div class="line-wrap">
                            <div class="label" style="width:30%">3. 개인 또는 법인(신용)정보 수집·이용·제공 조회 동의서</div>
                            <ul class="ul">
                                <c:if test="${rs.filenm3 ne null && rs.filenm3 ne ''}">
                                    <a href="<c:url value="${FileUploadController.makeDownloadLink(rs.filenm3_path, rs.filenm3)}"/>"
                                       class="file"  download>
                                        <c:out value="${rs.filenm3}"/>
                                    </a>
                                </c:if>
                            </ul>
                        </div>
                        <div class="line-wrap">
                            <div class="label" style="width:30%">4. 국세&지방세 완납증명서</div>
                            <ul class="ul">
                                <c:if test="${rs.filenm4 ne null && rs.filenm4 ne ''}">
                                    <a href="<c:url value="${FileUploadController.makeDownloadLink(rs.filenm4_path, rs.filenm4)}"/>"
                                       class="file"  download>
                                        <c:out value="${rs.filenm4}"/>
                                    </a>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                    </form:form>
                    <div class="write-bottom">
                        <a href="<c:url value="/admin/consulting/edit.do?seq=${rs.seq}"/>" class="submit">수정</a>
                        <a onclick="javascript:deleteCon();return false;" class="submit">삭제</a>
                        <a class="back" href="<c:url value="/admin/consulting/list.do"/>">목록</a>
                    </div>
                    <!-- 컨텐츠 end -->
                </div>
            </div>
		</div>
	</div>
</div>
<script>
    function deleteCon() {
        if (confirm("정말 삭제하시겠습니까?")) {
            $("#consultingVO").submit();
        } else {
            return false;
        }
    }
</script>