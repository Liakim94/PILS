<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>

<head>
    <title>컨설팅 신청 확인</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/temp.css"/>">
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
                    컨설팅 신청 확인
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">컨설팅 신청 확인</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="company-write" class="content">
                <form:form modelAttribute="consultingVO" method="POST" action="confirm.do">
                    <div class="write-container">
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    이메일
                                </div>
                                <div class="input-wrap">
                                    <input type="text" id="email" name="email"/>
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label label-long">비밀번호
                                </div>
                                <div class="input-wrap long-input">
                                    <input type="password" name="pswd" id="pswd"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="write-bottom">
                        <input type="submit" class="submit" value="확인"/>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

