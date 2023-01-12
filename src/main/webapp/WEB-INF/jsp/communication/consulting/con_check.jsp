<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>

<head>컨설팅 신청 확인
</head>
<page:applyDecorator name="menu"/>
<form:form name="frmChange" id="frmChange" method="POST" action="conCheck.do">

    <div class="article">
        <div class="content">

            <col width="17%"/>
            <col width="*"/>
            <div class="article-header">
                <h3>컨설팅 신청 확인</h3>
                <div class="side-wrap">
                </div>
            </div>
            <table class="tbl-list02">
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

            <div class="btn-wrap type04">
                <button type="submit" class="btn blue" >확인</button>
            </div>
        </div>
    </div>
</form:form>
