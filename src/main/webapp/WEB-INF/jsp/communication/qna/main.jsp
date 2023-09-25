<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title>중소벤처기업부 | 상담하기</title>
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
                    소통·상담
                </li>
                <li>
                    상담하기
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700"> 상담하기</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
                <div class="info-link">
                    <div class="item">
                        <a href="${pageContext.request.contextPath}/front/qna/list.do">
                            <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" >
                            <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>">
                            온라인 상담 신청</a>
                    </div>
                    <div class="item">
                        <a href="">
                            <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" >
                            <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>">
                            원가분석 컨설팅 신청</a>
                    </div>
                </div>
                <section>
                    <h2 class="title">납품대금 연동제 문의 및 상담 안내</h2>
                    <h4 class="mb40">
                        ① 관련 법·제도 문의 및 상담 : 중소벤처기업부 불공정거래개선과<br>
                        ② 납품대금 연동제 일반 문의 및 상담 : 지방중소벤처기업청 소상공인과/지역혁신과<br>
                        ③ 동행기업 참여 관련 문의 및 상담 : 협력재단 납품대금연동·확산지원TF<br>
                    </h4>
                    <div class="s-table-wrap">
                        <table class="s-table c-table" id="table2">
                            <thead>
                            <th class="c-th" width="15%">연번</th>
                            <th class="c-th">담당기관</th>
                            <th class="c-th">전화번호</th>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="tbody">1</td>
                                <td class="">중소벤처기업부</td>
                                <td class="">044-204-7905, 7908, 7942</td>
                            </tr>
                            <tr>
                                <td class="tbody">2</td>
                                <td class="">서울지방중소벤처기업청</td>
                                <td class="">02-798-9831, 02-2110-6351</td>
                            </tr>
                            <tr>
                                <td class="tbody">3</td>
                                <td class="">경기지방중소벤처기업청</td>
                                <td class="">031-201-6868</td>
                            </tr>
                            <tr>
                                <td class="tbody">4</td>
                                <td class="">인천지방중소벤처기업청</td>
                                <td class="">032-450-1148~1150</td>
                            </tr>
                            <tr>
                                <td class="tbody">5</td>
                                <td class="">대전·세종지방중소벤처기업청</td>
                                <td class="">042-865-6183</td>
                            </tr>
                            <tr>
                                <td class="tbody">6</td>
                                <td class="">충북지방중소벤처기업청</td>
                                <td class="">043-230-5307~8</td>
                            </tr>
                            <tr>
                                <td class="tbody">7</td>
                                <td class="">충남지방중소벤처기업청</td>
                                <td class="">041-415-0623, 041-564-3862</td>
                            </tr>
                            <tr>
                                <td class="tbody">8</td>
                                <td class="">대구·경북지방중소벤처기업청</td>
                                <td class="">053-659-2270~3</td>
                            </tr>
                            <tr>
                                <td class="tbody">9</td>
                                <td class="">울산지방중소벤처기업청</td>
                                <td class="">052-210-0031,0032</td>
                            </tr>
                            <tr>
                                <td class="tbody">10</td>
                                <td class="">부산지방중소벤처기업청</td>
                                <td class="">051-831-1357</td>
                            </tr>
                            <tr>
                                <td class="tbody">11</td>
                                <td class="">경남지방중소벤처기업청</td>
                                <td class="">055-268-2546~8</td>
                            </tr>
                            <tr>
                                <td class="tbody">12</td>
                                <td class="">광주·전남지방중소벤처기업청</td>
                                <td class="">062-360-9139</td>
                            </tr>
                            <tr>
                                <td class="tbody">13</td>
                                <td class="">전북지방중소벤처기업청</td>
                                <td class="">063-210-6436~8</td>
                            </tr>
                            <tr>
                                <td class="tbody">14</td>
                                <td class="">강원지방중소벤처기업청</td>
                                <td class="">033-260-1625~6</td>
                            </tr>
                            <tr>
                                <td class="tbody">15</td>
                                <td class="">대‧중소기업‧농어업협력재단(납품대금 연동 확산지원본부)</td>
                                <td class="">02-368-8470, 8969, 8962, 8963</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </section>

            </div>
        </div>
    </div>
</div>