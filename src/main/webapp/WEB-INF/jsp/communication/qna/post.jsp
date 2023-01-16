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
    <script src="${pageContext.request.contextPath }/editor/naver/js/HuskyEZCreator.js" charset="utf-8"></script>
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
        $(document).on('change', 'input[name="id"]', function () {

            if ($("input[name=id]:checked").val() == "0") {
                $("input:text[name=passwd]").attr("disabled", false);

            } else if ($("input[name=id]:checked").val() == "1") {
                $("input:text[name=passwd]").attr("disabled", true);

            }
        });
    });

    // submit
    function fn_submit() {

        var frm = document.getElementById('frmWrite');

        if (frm.name.value == "") {
            alert("작성자를 입력하세요.");
            return false;
        }
        if (frm.id.value == "") {
            alert("공개여부를 선택하세요.");
            return false;
        }
        if (frm.passwd.value == "" && document.getElementById('ChkBox2').checked) {
            alert("비밀번호를 입력하세요.");
            return false;
        }
        if (frm.title.value == "") {
            alert("제목을 입력하세요.");
            return false;
        }

        oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);

        var ir1 = $("#cont").val();
        if (ir1 == "" || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>') {
            alert("내용을 입력하세요.");
            return false;
        }

        $("#frmWrite").submit();
    }

</script>

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
                          action="${pageContext.request.contextPath}/cmm/qnaPost.do">

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
                                    공개여부
                                </div>
                                <div class="input-wrap">
                                    공개<input type="radio" name="id" id="ChkBox1" value="1">
                                    비공개<input type="radio" name="id" id="ChkBox2" value="0">
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
                            <input type="button" class="submit" onclick="fn_submit()" value="저장"/>
                            <a href="${pageContext.request.contextPath}/cmm/qnaList.do">취소</a>
                        </div>
                    </form>
                    <!-- 컨텐츠 end -->
                </div>
            </div>
        </div>
    </div>
</div>

	