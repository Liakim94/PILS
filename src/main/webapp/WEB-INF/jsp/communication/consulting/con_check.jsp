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
            <div class="content">
                <div class="write-container">
                    <form:form name="frmChange" id="frmChange" method="POST" action="conCheck.do">
                        <table class="table-form">
                            <tbody>
                            <tr>
                                <th class="txt_alcnt" scope="row">사업자번호</th>
                                <td>
                                    <input type="number" class="uni_input_text wdh100" style="width:60px;" id="bizNo1" name="bizNo1"/>
                                    -
                                    <input type="number" class="uni_input_text wdh100" style="width:50px;" id="bizNo2" name="bizNo2"/>
                                    -
                                    <input type="number" class="uni_input_text wdh100" style="width:60px;" id="bizNo3" name="bizNo3"/>
                                </td>
                                <th class="txt_alcnt" scope="row">비밀번호</th>
                                <td>
                                    <input type="text" class="uni_input_text wdh100" name="passwd" id="passwd"/>
                                </td>

                            </tr>
                            </tbody>
                        </table>
                    </form:form>
                    <div class="write-bottom">
                        <button type="submit" class="btn blue" >확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

