<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<head>
</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_join_en"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    Partner company
                </li>
                <li>
                    Partner company application
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">Partner company application</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <h2 class="title">Partner company application</h2>
                <h4>
                    <ul class="disc">
                        <li class="mb20">
                            Commissioning enterprise may be selected for partner company through evaluation when application
                            is submitted through discussion with commissioned enterprise to be entered for delivery price indexation agreement. <br>
                            · Commissioning enterprise : The company which consigns production, construction, processing, repair,
                              service or technology development to other small & medium companies while doing business on production, construction, processing, repair, selling and service. <br>
                            · commissioned enterprise : The company which professionally performs consigned production, construction, processing, repair, service or technology development from contracting company.
                            <p class="tip">
                                ※ Notice of results on selection of involving company: Individual notice within 1 month from application date
                            </p>
                        </li>
                        <li class="mb20">
                            Application procedure for partner company<br>
                             &nbsp;‧ Method 1) Apply at homepage: Input the information by clicking the button for 'Partner company application' at the top<br>
                             &nbsp;* Be sure to make the following credentials and upload them as attachments for registration.<br>
                             &nbsp;‧ Method 2) E-mail application: Transmit to pis@win-win.or.kr by attaching following credentials
                        </li>
                        <li class="">
                            Required credentials<br>
                            1. Application form for partner company to delivery price indexation system
                            <br>
                            2. Delivery price indexation system operation plan
                            <br>
                            3. Agrement on using personal and corporation information
                            <br>
                            4. Business registration certificate
                        </li>
                    </ul>
                </h4>
            </div>
        </div>
    </div>
</div>