<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title>중소벤처기업부 | 온라인 상담</title>
    <script src="${pageContext.request.contextPath }/editor/naver-se/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>

</head>
<script>

    var oEditors = [];
    $(function () {
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "cont",
            sSkinURI: "${pageContext.request.contextPath }/editor/naver-se/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });
    });


    $(function () {

        $("#frmWrite").validate({
            ignore: "",
            rules: {
                name: {required: true, maxlength: 10},
                passwd: {required: true, minlength: 4, maxlength: 10},
                title: {required: true},
                cont: {required: true},
                answer: {required: true},
                email: {required: true}
            },
            messages: {
                name: {required: "작성자 입력하세요.", maxlength: "10자 이상 입력 불가합니다."},
                passwd: {required: "비밀번호를 확인하세요.", minlength: "최소 4자 이상 입력해주세요.", maxlength: "10자 이상 입력 불가합니다."},
                title: {required: "제목을 입력하세요."},
                cont: {required: "내용을 입력하세요."},
                answer: {required: "이미지에 보이는 정확한 숫자를 입력하세요."},
                email: {required: "이메일을 입력하세요."}
            },
            submitHandler: function (frm) {
                oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);
                //frm.submit();
                return true;
            }
        });
    });

    window.onload = function () {

        <%--document.querySelector('#check').addEventListener('click', function(){--%>
        <%--    // var params = {answer : document.querySelector('#answer').getAttribute('value')};--%>
        <%--    try {--%>
        <%--            $.ajax({--%>
        <%--                type: "post",--%>
        <%--                url: "${pageContext.request.contextPath}/front/qna/chkAnswer.do",--%>
        <%--                data: "answer="+ $("#answer").val(),--%>
        <%--                success: function (data) {--%>
        <%--                    if (data == "200") {--%>
        <%--                        //location.href = "${pageContext.request.contextPath}/front/qna/view.do?no="--%>
        <%--                        $("#frmWrite").submit();--%>
        <%--                    } else {--%>
        <%--                        alert("이미지에 보이는 숫자를 정확히 입력하세요.");--%>
        <%--                        getImage();--%>
        <%--                        $('#answer').focus();--%>
        <%--                        document.querySelector('#answer').setAttribute('value', '');--%>
        <%--                    }--%>
        <%--                },--%>
        <%--                error: function (test) {--%>
        <%--                    alert("error");--%>
        <%--                }--%>
        <%--            })--%>
        <%--        } catch (e) {--%>
        <%--            alert(e);--%>
        <%--    }--%>
        <%--});--%>
    }

    function getImage() {
        var rand = Math.random();
        var url = '${pageContext.request.contextPath}/front/qna/getCaptchaImg.do?rand=' + rand;
        document.querySelector('#capimg').setAttribute('src', url);
    }

</script>
<style type="text/css">
    input.error, textarea.error {
        border: 1px dashed red;
    }

    label.error {
        display: block;
        color: red;
    }
    .write-container .line-wrap .label .required{
        color: #E60024;
        margin-left: 2px;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu"/>
        <div class="article">
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    소통·상담
                </li>
                <li>
                    온라인 상담
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700"> 온라인 상담</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                    <div class="write-container">
                        <form name="frmWrite" id="frmWrite" method="post"
                              action="<c:url value="/front/qna/post.do"/>">

                            <div class="write-wrap">
                                <div class="line-wrap">
                                    <div class="label">
                                        작성자<span class="required">*</span>
                                    </div>
                                    <div class="input-wrap">
                                        <input type="text" id="name" name="name" placeholder="작성자 입력"/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">
                                        이메일<span class="required">*</span>
                                    </div>
                                    <div class="input-wrap">
                                        <input type="text" id="email" name="email" placeholder="작성자 입력"/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">
                                        비밀번호<span class="required">*</span>
                                    </div>
                                    <div class="input-wrap">
                                        <input type="text" class="uni_input_text wdh100" name="passwd" id="passwd"
                                               placeholder="비밀번호 입력"/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">
                                        제목<span class="required">*</span>
                                    </div>
                                    <div class="input-wrap">
                                        <input type="text" class="uni_input_text wdh100" name="title" id="title"
                                               placeholder="제목 입력"/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">
                                        내용<span class="required">*</span>
                                    </div>
                                    <div class="input-wrap">
                                        <textarea id="cont" class="form-control" name="body"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    자동화 방지 코드<span class="required">*</span>
                                </div>
                                <div class="input-wrap">
                                    <div style="overflow:hidden">
                                        <div style="float:left">
                                            <img title="캡차이미지"
                                                 src="${pageContext.request.contextPath}/front/qna/getCaptchaImg.do"
                                                 alt="캡차이미지" id="capimg"/>
                                            <img id="reload" src="<c:url value="/images/common/refresh.png"/>"
                                                 onclick="javaScript:getImage()" alt="새로고침" style="width: 30px;"/>

                                        </div>
                                    </div>
                                    <%--                                    <input id="reload" type="button" onclick="javaScript:getImage()" value="새로고침"/>--%>
                                    <div style="padding:3px">
                                        <input id="answer" name="answer" type="text" value="">
                                    </div>
                                </div>
                            </div>
                            <div class="write-bottom">
                                <input style="width:130px" class="submit" id="check" type="submit" value="저장"/>
                                <a href="<c:url value="/front/qna/list.do"/>" class="back">취소</a>
                            </div>
                        </form>
                        <!-- 컨텐츠 end -->

                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
