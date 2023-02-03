<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<div id="content">
    <div id="board">
        <page:applyDecorator name="guide_menu"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    납품대금 연동제란?
                </li>
                <li>
                    인사말
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">인사말</h1>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <section>
<%--                    <h2 class="title">인사말</h2>--%>
                    <div class="welcome">
                        <div class="text-wrap">
                            <h4 class="mb40">
                                최근 원재료 가격이 폭등하였음에도 가격 상승분을 납품대금에 제대로 반영받지 못해 경영상 어려움을 겪는 중소기업이 속출하고 있습니다. 영업이익률 감소는 물론이고 생산 할수록 오히려 손해를 봐서 조업중단이나 폐업까지 고려하는 사례도 발생하고 있습니다. 이는 과거부터 계속해서 발생하던 문제로 중소기업계는 생존을 위해 지난 2008년부터 납품대금 연동제의 도입을 요청해왔습니다.<br>
                                <br>
                                원재료 가격이 상승할때마다 중소기업이 고통받는 악순환의 고리를 끊기 위해 납품대금 연동제를 도입하게 되었습니다. 그동안은 원재료 가격 상승의 부담을 중소기업이 오롯이 혼자 감당해왔으나 이번 연동제 법제화를 통해 대기업과 중소기업이 어려움을 함께 분담하는 상생의 거래 문화가 정착될 것으로 기대됩니다.
                                우리 경제에 납품대금 연동제가 안착될 수 있도록 많은 관심과 성원을 부탁드립니다.
                            </h4>
                            <h3 class="tr pc">중소벤처기업부 장관 <strong>이영</strong></h3>
                        </div>
                        <div class="img-wrap">
                            <img src="<c:url value="/images/common/welcome.png"/>" alt="중소벤처기업부 장관 이영">
                            <h3 class="mobile mt15">중소벤처기업부 장관 <strong>이영</strong></h3>
                        </div>
                    </div>
                </section>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

