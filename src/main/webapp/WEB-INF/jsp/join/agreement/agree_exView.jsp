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
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu2"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="/">홈</a></li>
                <li>
                    납품대금 연동제 도입하기
                </li>
                <li>
                    연동표 작성예시
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">연동표 작성예시</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="agreement" class="content">
                <!-- 컨텐츠 start -->
                <div class="write-container">
                    <div class="line-wrap">
                        <div class="label">
                            1. 하도급대금등 연동 대상 목적물등의 명칭
                        </div>
                        <div class="value-wrap">
                            ${rs.name}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            2. 하도급대금등 연동 대상 주요 원재료
                        </div>
                        <div class="value-wrap">
                            ${rs.prmy_mat}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            3. 원재료 가격의 기준 지표
                        </div>
                        <div class="value-wrap">
                            ${rs.prmy_mat_std}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label-full"  style="font-weight:500">
                            4. 원재료 가격의 변동률 산정을 위한 기준시점 및 비교시점
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="line-wrap">
                            <div class="label bg-none">기준시점</div>
                            <div class="value-wrap br">
                                ${rs.std_point}
                            </div>
                            <div class="label bg-none">
                                비교시점
                            </div>
                            <div class="value-wrap">
                                ${rs.change_point}
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            5. 조정요건
                        </div>
                        <div class="value-wrap">
                            ${rs.rqrm_ust}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            6. 조정주기
                        </div>
                        <div class="value-wrap">
                            ${rs.rqrm_cycl}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            7. 조정일
                        </div>
                        <div class="value-wrap">
                            ${rs.rqrm_date}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            8. 조정대금 반영시점
                        </div>
                        <div class="value-wrap">
                            ${rs.reflect_point}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            9. 하도급대금등 연동 산식
                        </div>
                        <div class="value-wrap">
                            ${rs.formula}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            9.1. 반영비율
                        </div>
                        <div class="value-wrap">
                            ${rs.ratio}
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            10. 기타사항
                        </div>
                        <div class="value-wrap">
                            ${rs.etc}
                        </div>
                    </div>
                </div>
                <div class="write-bottom">
                    <a href="<c:url value="/join/ex/list.do"/>" class="back">목록</a>
                </div>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>
<script>

    function previewOpen(){
        var options = 'top=10, left=10, width=1000, height=750, status=no, menubar=no, toolbar=no, resizable=no';
        window.open('<c:url value="/join/agree/preview.do"/>', '연동표 미리보기', options);
    }

    function infoOpen(i){
        if(!$(i).hasClass("open")){
            $(i).addClass("open");
            $(i).parents(".line-wrap").find(".info-box").slideDown();
        }
        else{
            $(i).removeClass("open");
            $(i).parents(".line-wrap").find(".info-box").slideUp();
        }
    }
</script>