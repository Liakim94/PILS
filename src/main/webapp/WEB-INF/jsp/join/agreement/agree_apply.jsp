<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title></title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>

<page:applyDecorator name="menu2"/>
<div class="article">
    <div class="content">
        <!-- 컨텐츠 start -->
        <form name="frmWrite" id="frmWrite" method="post" action="${pageContext.request.contextPath}/join/agree.do">
            <div class="article-header">
                <h3>약정서 작성</h3>
                <div class="side-wrap">
                </div>
            </div>
            <table class="tbl-list02">
                <tbody>
                <tr>
                    <th class="txt_alcnt" scope="row">1. 물품등의 명칭</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text wdh100" id="name" name="name"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">2. 주요 원재료</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text wdh100" id="prmy_mat" name="prmy_mat"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">3. 원재료 가격 기준지표</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text wdh100" id="prmy_mat_std" name="prmy_mat_std"/>
                    </td>
                </tr>
                <tr>
                    <th colspan="4" class="txt_alcnt" scope="row">
                        4. 원재료 기준가격의 변동률 산정을 위한 기준시점 및 비교시점
                    </th>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">기준시점</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="std_point" name="std_point"/>
                    </td>
                    <th class="txt_alcnt" scope="row">비교시점</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="change_point" name="change_point"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">5. 조정요건</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text wdh100" id="rqrm_ust" name="rqrm_ust"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">6. 조정 주기</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text wdh100" id="rqrm_cycl" name="rqrm_cycl"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">7. 조정일</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text wdh100" id="rqrm_date" name="rqrm_date"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">8. 조정대금 반영시점</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text wdh100" id="reflect_point" name="reflect_point"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">9. 납품대금 연동 산식</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text wdh100" id="formula" name="formula"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">10. 기타사항</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text wdh100" id="etc" name="etc"/>
                    </td>
                </tr>

                </tbody>
            </table>
            <div class="btn-wrap type04">
                <button type="submit" class="btn blue">등록</button>
                <a href="${pageContext.request.contextPath}/join/agree.do" class="btn blue">취소</a>
            </div>
        </form>
        <!-- 컨텐츠 end -->
    </div>
</div>
