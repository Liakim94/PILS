<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title></title>
</head>
<script>

    $(function() {
        $("#frmLogin").validate({
            ignore: "",
            rules: {
                memId:{required:true},
                memPwd:{required:true}
            },
            onkeyup:false,
            onclick:false,
            onfocusout:false,
            messages: {
                memId:{required:"아이디를 입력하세요."},
                memPwd:{required:"패스워드를 입력하세요"}
            },
            submitHandler: function (frm) {
                frm.submit();
            },
            showErrors:function(errorMap, errorList){
                if(!$.isEmptyObject(errorList)){
                    $.each(errorList, function() {
                        alert(this.message);
                        //$('#modalAlert').modal('show');
                        return false;
                    });
                    //this.defaultShowErrors();
                }
            }
        });

    });
    //
    // function submit(){
    //     document.frmLogin.submit();
    // }

</script>

<!-- container -->
<div class="container" id="contents">
    <h2 class="sub-title">로그인</h2>
    <form name="frmLogin" id="frmLogin" method="post" action="${pageContext.request.contextPath}/login.do">
        <div class="login-wrap">
            <div class="login-form">
                <ul class="n_login_list ctgr2">
                    <li class="id_bx">
                        <input name="memId" id="memId" class="idCheck" type="text" placeholder="아이디를 입력하세요." />
                    </li>
                    <li class="pw_bx">
                        <input name="memPwd" id="memPwd" class="pwCheck" type="password" placeholder="비밀번호를 입력하세요." />
                    </li>
                </ul>
                <div class="login-func">
                    <button type="submit">로그인</button>
                </div>
            </div>
        </div>
    </form>

</div>
<!-- // container -->

