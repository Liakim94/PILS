<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%pageContext.setAttribute("crcf", "\r\n"); %>
<head>
    <title>중소벤처기업부 | 온라인 상담</title>
    <script src="${pageContext.request.contextPath }/editor/naver-se/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<script>
    var oEditors = [];
    $(function () {
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "txta",
            sSkinURI: "${pageContext.request.contextPath }/editor/naver-se/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });
    });
</script>
<script>
    // submit
    function fn_submit() {

        oEditors.getById["txta"].exec("UPDATE_CONTENTS_FIELD", []);

        var ir1 = $("#txta").val();

        if (ir1 == "" || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>') {
            alert("답변을 작성하세요.");
            return false;
        }

        $("#frmWrite").submit();
    }


</script>

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
                <form name="frmWrite" id="frmWrite" method="post" action="<c:url value="/front/qna/repost.do"/>">
                    <input type="hidden" name="passwd" value="${rs.passwd}"/>
                    <input type="hidden" name="headnum" value="${rs.headnum}"/>
                    <input type="hidden" name="id" value="${rs.id}"/>
                    <div class="write-container">
                        <div class="write-wrap">
                            <div class="line-wrap">
                                <div class="label">
                                    작성자
                                </div>
                                <div class="input-wrap">
                                    <p style="margin:10px"> 관리자</p>
                                    <input type="hidden" value="관리자" name="name">
                                </div>
                            </div>
                            <input type="hidden" value="${rs.email}" name="email">
                            <div class="line-wrap">
                                <div class="label">
                                    제목
                                </div>
                                <div class="input-wrap">
                                    <img src="<c:url value="/images/common/reply.png"/>"
                                         style="width: 24px;float: left;margin-right: 9px;margin-top: 10px;"/>
                                    <p style="margin:10px"> ${rs.title }</p>
                                    <input type="hidden" value="${rs.title }" name="title" style="width: 94%;">
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    내용
                                </div>
                                <div style="margin:18px">
                                    ${fx:resetXSSMinimum(rs.body)}
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                답변
                            </div>
                            <div class="input-wrap">
                                <textarea id="txta" class="form-control" name="body"></textarea>
                            </div>
                        </div>

                    </div>
                    <div class="write-bottom">
                        <button type="button" class="submit" onclick="fn_submit()" style="width:135px">저장</button>
                        <a href="<c:url value="/front/qna/list.do"/>" class="back">취소</a>
                    </div>
                </form>
                <!-- 컨텐츠 end -->
            </div>
		</div>
	</div>
</div>
