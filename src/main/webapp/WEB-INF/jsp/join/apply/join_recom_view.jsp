<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title>중소벤처기업부 | 동행기업 참여 추천</title>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>

</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_join"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    동행기업
                </li>
                <li>
                    동행기업 참여 추천
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 참여 추천</h1>
                <div class="side-wrap">
                </div>
            </div>
            <!-- 컨텐츠 start -->
            <div id="company-write" class="content">
                <h2 class="title">납품대금 연동제 동행기업 참여 추천서</h2>
                <div class="write-container">
                    <div class="line-wrap">
                        <div class="label">공개여부</div>
                        <div class="input-wrap" style="text-align:left" >
                            <input type="radio" <c:if test="${rs.status eq 'Y'}">checked</c:if>/>공개
                            <input type="radio" <c:if test="${rs.status eq 'N'}">checked</c:if>/>비공개
                            </h3>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label-full">
                            추천 신청 기업 정보(수탁기업)
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                기업명
                            </div>
                            <div class="input-wrap">
                                ${rs.apply_cmpNm}
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                                사업자 번호
                            </div>
                            <div class="input-wrap">
                                ${rs.app_bizNo1}-${rs.app_bizNo2}-${rs.app_bizNo3}
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">이메일</div>
                        <div class="input-wrap">
                            ${rs.apply_email}
                        </div>
                    </div>

                    <div class="line-wrap">
                        <div class="label">전화번호</div>
                        <div class="input-wrap">
                            ${rs.apply_telNo}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label-full">
                            추천 기업 정보(위탁기업)
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">기업명
                            </div>
                            <div class="input-wrap">
                                ${rs.rcmd_cmpNm}
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                                사업자 번호
                            </div>
                            <div class="input-wrap">
                                ${rs.rcmd_bizNo1}-${rs.rcmd_bizNo2}-${rs.rcmd_bizNo3}
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">이메일</div>
                        <div class="input-wrap ">
                            ${rs.rcmd_email}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">전화번호</div>
                        <div class="input-wrap">
                            ${rs.rcmd_telNo}
                        </div>
                    </div>
                </div>
                <br>
<%--                <h4 style="text-align: center;font-weight: 400; font-size: 18px">위와 같이 위탁기업의 납품대금 연동제 동행기업 참여를 추천합니다.</h4><br>--%>
<%--                <p style="text-align: right">--%>
<%--                <h4 style="text-align: right;font-weight: 400;font-size: 18px;">--%>
<%--                ${fn:substring(rs.appdt,0,4)}년 ${fn:substring(rs.appdt,5,7)}월 ${fn:substring(rs.appdt,8,10)}일</h4>--%>
<%--                <div class="write-area" style="text-align: right;font-weight: 400; font-size: 18px">--%>
<%--                        기업명 : ${rs.apply_cmpNm}<br>--%>
<%--                        대표자명 : ${rs.apply_ceo}<br>--%>
<%--                    <br>--%>
<%--                    <h2 style="text-align: center"> 대·중소기업·농어업협력재단 사무총장 귀하</h2>--%>
<%--                </div>--%>
            </div>
            <div class="write-bottom">
                <a href="${pageContext.request.contextPath}/join/joinMain.do" class="back">돌아가기</a>
            </div>
            <!-- 컨텐츠 end -->
        </div>
    </div>
</div>