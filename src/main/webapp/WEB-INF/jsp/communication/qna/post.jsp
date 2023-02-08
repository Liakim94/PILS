<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title>중소벤처기업부 | 질의응답 게시판</title>
    <script src="${pageContext.request.contextPath }/editor/naver/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>

</head>
<script>

    var oEditors = [];
    $(function () {
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "cont",
            sSkinURI: "${pageContext.request.contextPath }/editor/naver/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });
    });


    $(function () {

        $("#frmWrite").validate({
            ignore: "",
            rules: {
                name: {required: true,  maxlength:10 },
                passwd: {required: true, minlength: 4, maxlength:10 },
                title: {required: true},
                cont: {required: true}
            },
            messages: {
                name: {required: "작성자 입력하세요.", maxlength:"10자 이상 입력 불가합니다."},
                passwd: {required: "비밀번호를 확인하세요.", minlength: "최소 4자 이상 입력해주세요.", maxlength:"10자 이상 입력 불가합니다." },
                title: {required: "제목을 입력하세요."},
                cont: {required: "내용을 입력하세요."}
            },
            submitHandler: function (frm) {
                oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);
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
        <page:applyDecorator name="menu"/>
        <div class="article">
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    소통마당
                </li>
                <li>
                    질의응답 게시판
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700"> 질의응답 게시판</h1>
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
                                    작성자
                                </div>
                                <div class="input-wrap">
                                    <input type="text" id="name" name="name" placeholder="작성자 입력"/>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    비밀번호
                                </div>
                                <div class="input-wrap">
                                    <input type="text" class="uni_input_text wdh100" name="passwd" id="passwd"
                                           placeholder="비밀번호 입력"/>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    제목
                                </div>
                                <div class="input-wrap">
                                    <input type="text" class="uni_input_text wdh100" name="title" id="title"
                                           placeholder="제목 입력"/>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    내용
                                </div>
                                <div class="input-wrap">
                                    <textarea id="cont" class="form-control" name="body"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="write-bottom">
                            <button style="width:130px" class="submit">저장</button>
                            <a href="<c:url value="/front/qna/list.do"/>" class="back">취소</a>
                        </div>
                    </form>
                    <!-- 컨텐츠 end -->
                </div>
            </div>
        </div>
    </div>
</div>

