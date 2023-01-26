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
    <script src="${pageContext.request.contextPath }/editor/naver/js/HuskyEZCreator.js" charset="utf-8"></script>

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

        function fn_submit() {

            var frm = document.getElementById('post');

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

            $("#post").submit();
        }

    </script>
</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_admin"/>
        <div class="article">
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    관리자
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
                <!-- 컨텐츠 start -->
                <div class="write-container">
                    <form:form modelAttribute="post" action="post.do" method="post" id="post">
                        <input type="hidden" name="action"/>
                        <form:hidden path="bbsId"/>
                        <form:hidden path="boardSeq"/>
                        <form:hidden path="stat"/>
                        <div class="write-wrap">
                            <div class="line-wrap">
                                <div class="label">
                                    제목
                                </div>
                                <div class="input-wrap">
                                    <form:input path="title" maxlength="85"/>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    내용
                                </div>
                                <div class="input-wrap">
                                    <form:textarea path="cont" cssClass="form-control"/>

                                </div>
                            </div>

                        </div>
                        <!-- /.box-body -->
                    </form:form>
                    <div class="write-bottom">
                        <button  onclick="fn_submit()"  class="submit" style="width:130px">저장</button>
                        <a href="<c:url value="/admin/ready/${rs.bbsId}/view.do?boardSeq=${rs.boardSeq}"/>">
                            취소
                        </a>
                    </div>
                </div>
            </div><!-- /. box -->
        </div>
        <!-- row end -->
    </div>
    </div>
</div>


