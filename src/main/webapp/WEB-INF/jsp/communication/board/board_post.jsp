<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<head>
    <title>중소벤처기업부 | 자주 묻는 질문</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/cms/board/post.js"></script>
    <script src="${pageContext.request.contextPath }/editor/naver-se/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
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

        var fileUploader = new smes.FileUploader('.file-uploader').init({
            maxFileSize: 1024 * 1024 * 100,    // 100 MB 제한
            maxFileCount: 20,
            targetFolderPath: 'test2',
            //accept : '.png, .jpg',
            targetUrl: '<c:url value="/files/upload.do"/>',
            <%--
                파일업로드 Ajax 처리시 csrf token 지정.
                참조 : https://blog.naver.com/PostView.nhn?isHttpsRedirect=true&blogId=jskimmail&logNo=221616372513&redirect=Dlog&widgetTypeCall=true&directAccess=false
                참조 : https://higugu.tistory.com/entry/Spring-Security-Ajax-%ED%98%B8%EC%B6%9C-%EC%8B%9C-403-Forbidden-%EC%97%90%EB%9F%AC
            --%>
            //csrfHeader: $('meta[name="_csrf_header"]').attr('content'),
            //csrfToken: $('meta[name="_csrf"]').attr('content'),
            fileList: $('#jsonFileList').val(),
            deletedFileList: $('#jsonDeletedFileList').val()
        });

        $('#submit').on('click', function () {

            fileUploader.upload({
                done: function (result, deleted, uploaded) {
                    // 업로드 완료 후 전송된 파일 리스트 정보를
                    // 특정 hidden 파라미터로 설정하고 form을 전송한다.
                    if (result) {
                        console.dir(result);
                        $('#jsonFileList').val(JSON.stringify(result));
                    } else {
                        $('#jsonFileList').val('');
                    }
                    if (deleted) {
                        console.dir(deleted);
                        $('#jsonDeletedFiles').val(JSON.stringify(deleted));
                    } else {
                        $('#jsonDeletedFiles').val('');
                    }
                    //$('#frmPost').submit();
                    fn_submit('1');
                },
                fail: function (error) {
                    console.dir(error);
                    alert(error.message);
                }
            });
            // return false;
        });
    });

</script>

<div id="content">
    <div id="board">
        <page:applyDecorator name="menu"/>
        <div class="article">
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a>
                </li>
                <li>소통·상담</li>
                <li>${bbsNm}</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">${bbsNm}</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <div class="write-container">
                    <form:form modelAttribute="frmPost">
                        <form:hidden path="bbsId"/>
                        <form:hidden path="stat" value=""/>
                        <form:hidden path="jsonFileList"/>
                        <form:hidden path="jsonDeletedFileList"/>
                        <div class="write-wrap">
                            <div class="line-wrap">
                                <div class="label">
                                    제목
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="title" placeholder="제목을 입력하세요" maxlength="85"/>
                                </div>
                            </div>
                            <c:if test="${bbsId eq 11}">
                            <div class="line-wrap">
                                <div class="label">
                                    상단 고정 여부
                                </div>
                                <div class="input-wrap labeled-input-wrap label-right">
                                    고정 <input type="checkbox" name="notiAt" id="notiAt" value="Y" style="width:50px"/>
                                </div>
                            </div>
                            </c:if>
                            <c:if test="${bbsId eq 7}">
                                <div class="line-wrap">
                                    <div class="label">
                                        구분
                                    </div>
                                    <div class="input-wrap labeled-input-wrap label-right">
                                        <select id="tag" name="tag">
                                            <option value="M701">적용 대상</option>
                                            <option value="M702">연동 약정</option>
                                            <option value="M703">현행법과의 관계</option>
                                            <option value="M704">위반 시 제재</option>
                                            <option value="M705">동행기업</option>
                                            <option value="M706">지원</option>
                                            <option value="M707">기타</option>
                                        </select>
                                    </div>
                                </div>
                            </c:if>
                            <div class="line-wrap">
                                <div class="label">
                                    내용
                                </div>
                                <div class="editor-input-wrap">
                                    <form:textarea path="cont" cssClass="form-control" cssStyle="display:none;min-height: 400px;height: 400px;"/>
                                </div>
                            </div>
                        </div>
                    </form:form>
                    <%-- WildRain 추가 2023-01-12 --%>
                    <div class="line-wrap">
                        <div class="label">
                            첨부파일
                        </div>
                        <div class="file-uploader-wrapper">
                            <div class="file-uploader"></div>
                        </div>
                    </div>

                </div>
                <div class="write-bottom">
                    <input id="submit" class="submit" value="게시" style="width: 135px"/>
                    <a href="<c:url value="/front/board/${bbsId}/list.do"/>" class="back">취소</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- row end -->


