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
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/temp.css"/>">
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>

</head>
<script>

    $(function () {
        $("select[name=selectEmail]").on("change", function(){
            var $email2 = $('input[name=email2]');
            if ($(this).val() == "1") {
                $email2.val('');
                $email2.prop("readonly",false);

            } else {
                $email2.val($(this).val());
                $email2.prop("readonly",true);
            }
        });

        $('#apply').on('click', function () {

            var email =$("#email1").val() + $("#email2").val();
            $('input[name=email]').attr('value', email);
            $('#mbrApply').submit();
        });
    });

    $(function () {
        $("#frmEdit").validate({
            ignore: "",
            rules: {
                name: {required: true},
                mbphno: {required: true},
                email: {required: true},
                email2: {required: true}
            },
            messages: {
                name: {required: "성명을 입력하세요."},
                mbphno: {required: "전화번호를 입력하세요."},
                email: {required: "이메일을 입력하세요."},
                email2: {required: "이메일을 입력하세요."}
            },
            submitHandler: function (frm) {
                frm.submit();
            }
        });
    });
</script>
<style type="text/css">
    input.error, textarea.error{
        border:1px dashed red;
    }
    label.error{
        display:block;
        color:red;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_myPage"/>
        <form:form name="frmEdit" id="frmEdit" method="POST" action="memEdit.do">
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png"
                         alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>마이페이지</li>
                <li>담당자 정보 수정</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">담당자 정보 수정</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="company-write" class="content">
                <div class="write-container">
                    <div class="line-wrap">
                        <div class="label">성명<span class="required">*</span></div>
                        <div class="input-wrap">
                            <input type="text" name="name" id="name" value="${rs.name}"/>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">전화번호<span class="required">*</span></div>
                        <div class="input-wrap">
                            <input type="text" id="mbphno" name="mbphno"
                                   value="${rs.mbphno}"/></div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">소속부서</div>
                            <div class="input-wrap">
                                <input type="text" id="deptNm" name="deptNm" value="${rs.deptNm}"/></div>
                        </div>
                        <div class="fx2">
                            <div class="label">직위</div>
                            <div class="input-wrap"><input type="text" id="position" name="position"
                                                           value="${rs.position}"/>
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">이메일<span class="required">*</span></div>
                        <div class="input-wrap ">
                            <input type="text" class="multi" name="email1" id="email1" value="${rs.email1}"/>
                            <span>@</span>
                            <input type="text" style="width: 130px" name="email2" id="email2" value="${rs.email2}"/>
                            <select id="selectEmail" name="selectEmail" style="width: 130px">
                                <option value="1">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="gmail.com">gmail.com</option>
                            </select>
                            <input type="hidden" value="" id="email" name="email">
                            <label class="error" for="email2" generated="true" style="display:none;"/>

                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">사무실 전화</div>
                        <div class="input-wrap">
                            <input type="text" id="memTelNo" name="memTelNo" value="${rs.memTelNo}"/>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">팩스</div>
                        <div class="input-wrap">
                            <input type="text" id="memFaxNo" name="memFaxNo" value="${rs.memFaxNo}"/></td>
                        </div>
                    </div>
                </div>
                <div class="write-bottom">
                    <button  class="submit"  onclick="emailChk(this.form)" id="apply">저장</button>
                    <a href="${pageContext.request.contextPath}/main/mem/changePw.do" class="submit">비밀번호 변경</a>
                    <a href="${pageContext.request.contextPath}/main/mem/management.do" class="back">취소</a>
                </div>
            </div>
            </form:form>
        </div>
    </div>
</div>