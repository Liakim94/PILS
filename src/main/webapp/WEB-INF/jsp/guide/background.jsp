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
                    도입배경
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">도입배경</h1>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <section>
                    <h2 class="title">인사말</h2>
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
                <section>
                    <h2 class="title">추진 경과</h2>
                    <div class="timeline">
                        <div class="timeline-group">
                            <span class="timeline-year">2008</span>
                            <div class="timeline-box">
                                <div class="timeline-date">
                                    <span class="timeline-day">01/06</span>
                                </div>
                                <div class="timeline-post">
                                    <div class="timeline-content">
                                        제17대 대통령직 인수위 업무보고, "납품대금 연동 시스템 도입 추진" 발표
                                    </div>
                                </div>
                            </div>
                            <div class="timeline-box">
                                <div class="timeline-date">
                                    <span class="timeline-day">07/11</span>
                                </div>
                                <div class="timeline-post">
                                    <div class="timeline-content">
                                        중소기업계, "납품대금 연동제 법제화" 촉구 결의
                                    </div>
                                </div>
                            </div>
                            <div class="timeline-box">
                                <div class="timeline-date">
                                    <span class="timeline-day">08/13</span>
                                </div>
                                <div class="timeline-post">
                                    <div class="timeline-content">
                                        납품대금 연동제 도입을 내용으로 하는 하도급법 최초 발의
                                    </div>
                                </div>
                            </div>
                        </div>
                        <img class="timeline-img" src="<c:url value="/images/common/timeline.png"/>" alt="중소기업계의 14년간의 두드림">
                        <div class="timeline-group">
                            <div class="timeline-box">
                                <div class="timeline-date">
                                    <span class="timeline-year" style="line-height:19px; font-weight: 700">2022</span>
                                    <span class="timeline-day">06/17</span>
                                </div>
                                <div class="timeline-post">
                                    <div class="timeline-content">
                                        <div class="img-content">
                                            <div class="img-wrap">
                                                <img src="<c:url value="/images/introduction/220617.png"/>" alt="납품대금 연동제 TF 출범" />
                                            </div>
                                            <div class="text-wrap">
                                                납품대금 연동제 TF 출범
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="timeline-box">
                                <div class="timeline-date">
                                    <span class="timeline-day">08/11</span>
                                </div>
                                <div class="timeline-post">
                                    <div class="timeline-content">
                                        <div class="img-content">
                                            <div class="img-wrap">
                                                <img src="<c:url value="/images/introduction/220811.png"/>" alt="납품대금 연동 특별약정서 제정" />
                                            </div>
                                            <div class="text-wrap">
                                                납품대금 연동 특별약정서 제정<br>
                                                납품대금 연동제 시범운영 방안 발표
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="timeline-box">
                                <div class="timeline-date">
                                    <span class="timeline-day">09/14</span>
                                </div>
                                <div class="timeline-post">
                                    <div class="timeline-content">
                                        <div class="img-content">
                                            <div class="img-wrap">
                                                <img src="<c:url value="/images/introduction/220914.png"/>" alt="납품대금 연동제 자율추진 협약식 개최" />
                                            </div>
                                            <div class="text-wrap">
                                                납품대금 연동제 자율추진 협약식 개최
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="timeline-box">
                                <div class="timeline-date">
                                    <span class="timeline-day">11/09</span>
                                </div>
                                <div class="timeline-post">
                                    <div class="timeline-content">
                                        <div class="img-content">
                                            <div class="img-wrap">
                                                <img src="<c:url value="/images/introduction/221109.png"/>" alt="납품대금 연동제 민당정협의회 개최" />
                                            </div>
                                            <div class="text-wrap">
                                                납품대금 연동제 민당정협의회 개최
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="timeline-box">
                                <div class="timeline-date">
                                    <span class="timeline-day">12/08</span>
                                </div>
                                <div class="timeline-post">
                                    <div class="timeline-content">
                                        <div class="img-content">
                                            <div class="img-wrap">
                                                <img src="<c:url value="/images/introduction/221208.png"/>" alt="납품대금 연동제 도입을 내용으로 하는 [상생협력법] 개정안 국회 통과" />
                                            </div>
                                            <div class="text-wrap">
                                                납품대금 연동제 도입을 내용으로 하는 [상생협력법] 개정안 국회 통과
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

