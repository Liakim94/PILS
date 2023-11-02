<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title>관리자 | 연동표 작성예시 관리</title>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>

</head>
<script>
    function fn_submit() {
        var frm = document.getElementById('agreeVO');

        if (frm.ex_nm.value == "") {
            alert("작성예시명을 입력하세요.");
            return false;
        }

        frm.submit();
    }
    $(function () {
        $("select[name=select_prmy_mat_std]").on("change", function(){
            var input = $('input[name=prmy_mat_std]');
            if ($(this).val() == "1") {
                input.val('');
                input.prop("readonly",false);

            } else {
                input.val($(this).val());
                input.prop("readonly",true);
            }
        });
        $("select[name=select_rqrm_date]").on("change", function(){
            var input = $('input[name=rqrm_date]');
            if ($(this).val() == "1") {
                input.val('');
                input.prop("readonly",false);

            } else {
                input.val($(this).val());
                input.prop("readonly",true);
            }
        });
        $("select[name=select_rqrm_cycl]").on("change", function(){
            var input = $('input[name=rqrm_cycl]');
            if ($(this).val() == "1") {
                input.val('');
                input.prop("readonly",false);

            } else {
                input.val($(this).val());
                input.prop("readonly",true);
            }
        });
    });
</script>
<style>
    .line-wrap .label .required {
        color: #E60024;
        margin-left: 2px;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_admin"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    관리자페이지
                </li>
                <li>
                    연동표 작성예시 관리
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">연동표 작성예시 관리</h1>
                <div class="side-wrap"></div>
            </div>
            <div class="content" id="agreement">
                <!-- 컨텐츠 start -->
                <div class="write-container">
                    <form:form modelAttribute="agreeVO" action="edit.do" method="post">
                        <form:hidden path="seq"/>
                        <div class="write-wrap">
                            <div class="line-wrap">
                                <div class="label">
                                    작성예시명<span class="required">*</span>
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="ex_nm" />
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    1. 하도급대금등 연동 대상 목적물등의 명칭
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="name"/>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    2. 하도급대금등 연동 대상 주요 원재료
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="prmy_mat" />
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    3. 원재료 가격의 기준 지표
                                </div>
                                <div class="input-wrap">
                                    <div class="input-wrap">
                                        <form:input type="text" path="prmy_mat_std" style="width: 130px"/>
                                        <select id="select_prmy_mat_std" name="select_prmy_mat_std" value ="">
                                            <option value="">선택</option>
                                            <option value="LME"> LME</option>
                                            <option value="e-나라지표"> e-나라지표</option>
                                            <option value="한국은행"> 한국은행 </option>
                                            <option value="조달청">조달청</option>
                                            <option value="산업통상자원부">산업통상자원부</option>
                                            <option value="1">기타</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label-full" style="font-weight:500">
                                    4. 원재료 가격의 변동률 산정을 위한 기준시점 및 비교시점
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label bg-none">
                                    기준시점
                                </div>
                                <div class="input-wrap br">
                                    <form:input type="text" path="std_point" />
                                </div>
                                <div class="label bg-none">
                                    비교시점
                                </div>
                                <div class="input-wrap" >
                                    <form:input type="text" path="change_point" />
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    5. 조정요건
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="rqrm_ust" />
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    6. 조정주기
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="rqrm_cycl" />
                                    <select id="select_rqrm_cycl" name="select_rqrm_cycl" value ="">
                                        <option value="">선택</option>
                                        <option value="n개월"> n개월</option>
                                        <option value="분기별"> 분기별</option>
                                        <option value="반기별"> 반기별</option>
                                        <option value="1년">1년</option>
                                        <option value="1">기타</option>
                                    </select>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    7. 조정일
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="rqrm_date" style="width:130px" />
                                    <select id="select_rqrm_date" name="select_rqrm_date" value ="">
                                        <option value="">선택</option>
                                        <option value="매월 1일"> 매월 1일</option>
                                        <option value="매월 말일"> 매월 말일</option>
                                        <option value="짝수달"> 짝수달</option>
                                        <option value="홀수달">홀수달</option>
                                        <option value="1">기타</option>
                                    </select>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    8. 조정대금 반영시점
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="reflect_point" />
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    9. 하도급대금등 연동 산식
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="formula" />
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    9.1. 반영비율
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="ratio" />
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    10. 기타 사항
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="etc" />
                                </div>
                            </div>

                        </div>
                    </form:form>
                </div>
                <div class="write-bottom">
                    <input id="submit" class="submit" value="등록" onclick="fn_submit()" style="width: 135px"/>
                    <a href="<c:url value="/admin/agree/list.do"/>" class="back">취소</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- row end -->


