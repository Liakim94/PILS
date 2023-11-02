<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<head>
    <title>중소벤처기업부 | 연동표 작성 예시 보기</title>
</head>
<script>
    function detailOpen(d){
        if(!$(d).hasClass("open")){
            $(d).find(".detail-info").slideDown();
            $(d).addClass("open");
        }
        else{
            $(d).find(".detail-info").slideUp();
            $(d).removeClass("open");
        }
    }
    function fn_submit() {
        var frm = document.getElementById('agreeVO');

        var rqrm_ust= frm.rqrm_ust.value;
        var ratio= frm.ratio.value;
        if(rqrm_ust != ""){
            if(isNaN(rqrm_ust) || rqrm_ust < 1 || rqrm_ust > 10 ){
                alert("조정요건은 0~10까지 숫자만 입력 가능합니다.");
                return false;
            }
        }
        if(ratio != ""){
            if(isNaN(ratio) || ratio < 1 || ratio > 100 ){
                alert("반영비율은 0~100까지 숫자만 입력 가능합니다.");
                return false;
            }
        }
        frm.submit();
    }
</script>
<style>
    .temp .item-wrap {
        width: 100%;
        border: 1px solid #DDDDDD;
        border-radius: 10px;
        padding: 20px;
        box-sizing: border-box;
        cursor: pointer;
        margin-bottom: 20px;
    }
    .temp .item-wrap img {
        float: right;
        position: relative;
        bottom: 5px;
        transform: rotate(180deg);
    }
    .temp .item-wrap:focus{
        border: 1px solid #E60024;
    }
    .temp .item-wrap h3{
        display: inline-block;
    }
    .temp .item-wrap h3 ul{
        padding-left: 20px;
        font-weight: 400;
        text-align: left;
        line-height: 30px;
        letter-spacing: 1px;
        word-break: normal !important;
        font-size: 16px;
    }
    .temp .item-wrap img{
        float: right;
        position: relative;
        bottom: 5px;
        transform: rotate(180deg);
    }
    .temp .open img{
        transform: rotate(0deg);

    }
    .temp .item-wrap .detail-info{
        margin-top: 41px;
        position: relative;
        display: none;
    }
    .temp .item-wrap .detail-info:after{
        position: absolute;
        content: "";
        width: calc(100% + 40px);
        top:-20px;
        left: -20px;
        height: 1px;
        background-color: #dddddd;
    }
    .temp .info-box{
        padding: 0 !important;
        border: none;
    }
    .temp .info-box-box{
        border-radius: unset;
        border-style:solid;
        border-width: thin;
        border-color: #D2D2D2;
        background: #fff;
    }
    .temp .item-wrap h3 .table table{
        border: 1px solid #FFC7C7;
        margin-top: 10px;
    }
    .temp .item-wrap h3 .table table tr{
        border-bottom: 1px solid #D2D2D2;
    }
    .temp .item-wrap h3 .table table td{
        padding: 10px;
        min-height: unset;
        height: auto;
        border-bottom: none;
        font-size: 16px;
        line-height: 26px;
    }
    .temp .item-wrap h3 .table table .title{
        background: #FFEFEF;
        border-right: 1px solid #FFC7C7;
    }
    .temp .tab-container .search{
        background-color: #c0bfbf;
    }
    .temp .tab-container .search .search-tag{
        border-right: #111111;
        width: 31%;
        display: inline-block;
        padding:10px;
    }
    .temp .tab-container .search .search-tag .label{
        padding-right: 6px;
        font-weight: 500;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu2"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    납품대금 연동제 도입하기
                </li>
                <li>
                    연동표 작성 예시 보기
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">연동표 작성 예시 보기</h1>
            </div>
            <div id="about" class="content concept">
                <!-- 컨텐츠 start -->
                <section class="temp">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>표준 연동계약서</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="page">
                            <h1>표준 연동계약서</h1>
                                <h3>
                                ｢하도급거래 공정화에 관한 법률｣ 또는 ｢대·중소기업 상생협력 촉진에 관한 법률｣에 따른 하도급대금 또는 납품대금(이하 “하도급대금등”이라 한다) 연동과 관련하여
                                원사업자 또는 위탁기업(이하 “원사업자등”이라 한다)과 수급사업자 또는 수탁기업(이하 “수급사업자등”이라 한다)은
                                아래 하도급계약 또는 수탁·위탁거래약정(이하 “하도급계약등”이라 한다)에 부수하여 다음과 같이 연동계약을 체결한다.
                                <br>
                                <br>
                                ◇ 하도급계약등 명칭 :<br>
                                ◇ 하도급계약등의 체결 일자 :<br>
                                <br>
                                <br>
                                <b>제1조(목적)</b>
                                이 계약은 위의 하도급계약등과 관련된 하도급대금등 연동에 관하여 필요한 제반 사항을 규정함을 목적으로 한다.
                                <br>
                                <br>
                                <b>제2조(정의)</b> ① 이 계약에서 사용하는 용어의 뜻은 다음과 같다.
                                <ul>
                                    1. “원재료”란 하도급거래에서 목적물등의 제조, 수리, 시공 또는 용역수행에 사용되는 원재료 또는 수탁‧위탁거래에서 물품등의 제조,
                                    공사, 가공, 수리, 용역 또는 기술개발에 사용되는 원재료로서 천연재료, 화합물, 가공물, 중간재 등을 포함하되 이에 한정하지 아니한다.<br>
                                    2. “주요 원재료”란 그 비용이 하도급대금등의 100분의 10 이상인 원재료를 말한다.<br>
                                    3. “원재료 가격의 기준지표”란 주요 원재료 가격의 상승 또는 하락 정도를 측정하는 기준이 되는 지표를 말한다.<br>
                                    4. “조정요건”이란 주요 원재료의 가격이 기준시점 대비 비교시점에 변동한 비율로서 주요 원재료의 가격이 그 변동비율 이상 변동한 경우 하도급대금등을 조정하기로 한 기준이 되는 것을 말한다.<br>
                                    5. “조정 주기”란 조정요건 충족 여부를 따져 하도급대금등 연동 여부를 판단하는 주기를 말한다.<br>
                                    6. “조정일”이란 조정 주기에 따라 하도급대금등의 조정 여부를 판단하는 날을 말한다.<br>
                                    7. “조정대금 반영일”이란 목적물등 또는 물품등(이하 “목적물등”이라 한다)에 대하여 조정된 하도급대금등을 적용하는 기준이 되는 날을 말한다.<br>
                                    8. “하도급대금등 연동 산식”이란 주요 원재료의 가격이 조정요건을 충족하는 경우 주요 원재료 가격 변동을 반영하여 하도급대금등을 조정하기 위한 산식을 말한다.<br>
                                    9. “반영 비율”이란 주요 원재료 가격 변동분이 하도급대금등의 조정에 반영되는 비율을 말한다.<br>
                                </ul>
                                <ul>② 제1항에서 정한 용어 외의 용어의 뜻은 ｢하도급거래 공정화에 관한 법률｣ 또는 ｢대‧중소기업 상생협력 촉진에 관한 법률｣에 따른다.</ul>
                                <br>
                                <b>제3조(하도급대금등 연동 대상 주요 원재료)</b>
                                이 계약에 따라 하도급대금등 연동 대상 주요 원재료는 제2조제1항제2호에 따른 주요 원재료(이하 “연동 대상 주요 원재료”라 한다)로 한다.<br>
                                <br>
                                <b>제4조(하도급대금등 연동 대상 주요 원재료 가격의 기준지표)</b>
                                연동 대상 주요 원재료 가격의 기준지표는 공신력 있는 기관이 주기적으로 고시하는 지표 또는 이에 준하는 지표로 한다. 다만, 이와 같은 지표를 사용하는 것이 적절하지 않거나 이에 해당하는 지표가 없는 경우에는 다음 각 호의 어느 하나에 따라 정할 수 있다.
                                <ul>
                                    1. 원재료의 판매자가 수급사업자등에게 판매한 연동 대상 주요 원재료의 가격으로서 원사업자등이 확인할 수 있는 가격<br>
                                    2. 원사업자등이 연동 대상 주요 원재료의 판매자와 직접 협상한 가격 또는 원사업자등이 수급사업자등에 판매한 가격<br>
                                    3. 그 밖에 관련 자료를 바탕으로 원사업자등과 수급사업자등이 합의하여 정한 가격<br>
                                </ul>
                                <br>
                                <b>제5조(｢하도급대금등 연동표｣의 작성)</b>
                                ① 원사업자등은 수급사업자등과 합의하여 【첨부 1】 ｢하도급대금등 연동표｣(이하 “｢하도급대금등 연동표｣”라 한다)의 각 기재사항을 적는다.<br>
                                ② 원사업자등 또는 수급사업자등은 ｢하도급대금등 연동표｣의 각 기재사항과 관련하여 내용을 증빙할 수 있는 자료를 제공할 것을 상대방에게 요청할 수 있으며, 이때 요청하는 자료는 ｢하도급대금등 연동표｣ 작성을 위해 필요한 최소한의 자료에 한한다.<br>
                                ③ 제2항의 요청을 받은 상대방은 해당 자료를 성실하게 제공하여야 하며, 자료를 제공받은 당사자는 해당 자료를 이 계약의 목적 외로 사용하지 아니한다.<br>
                                <br>
                                <b>제6조(하도급대금등 연동 절차)</b>
                                ① 원사업자등과 수급사업자등은 ｢하도급대금등 연동표｣에 따라 조정일마다 연동 대상 주요 원재료 가격의 기준시점 대비 비교시점의 변동률을 확인하고, 그 변동률이 조정요건을 충족하는 경우 하도급대금등 연동 산식에 따라 조정될 하도급대금등을 산출한다.<br>
                                ② 원사업자등은 제1항에 따라 산출된 금액을 기준으로 하도급대금등을 조정한다.<br>
                                ③ 원사업자등과 수급사업자등은 제2항에 따라 하도급대금등이 조정된 경우, 조정대금 반영일, 비교시점의 연동 대상 주요 원재료 기준가격 및 조정된 하도급대금등을 【첨부 2】 ｢하도급대금등 변동표｣
                                (이하 “｢하도급대금등 변동표｣”라 한다)에 기재하고 서명(｢전자서명법｣ 제2조 제2호에 따른 전자서명을 포함한다) 또는 기명날인한다.<br>
                                ④ 원사업자등은 조정대금 반영일 이후에 납품되는 목적물등에 대하여 제2항에 따라 조정된 금액을 기준으로 하도급대금등을 지급한다.<br>
                                ⑤ 제1항부터 제4항까지는 수급사업자등의 책임 있는 사유로 이행이 지연되어 조정대금 반영일 이후에 이행된 부분에 대해서는 적용하지 아니한다.<br>
                                <br>
                                <b>제7조(해석 등)</b>
                                ① 이 계약은  ｢하도급거래 공정화에 관한 법률｣ 제16조(설계변경 등에 따른 하도급대금의 조정), 제16조의2(공급원가 등의 변동에 따른 하도급대금의 조정),
                                ｢대‧중소기업 상생협력 촉진에 관한 법률｣ 제22조의2(공급원가 변동에 따른 납품대금의 조정), 제25조(준수사항)제1항제4호의 적용을 배제하는 것으로 해석되지 않는다.<br>
                                ② ｢하도급대금등 연동표｣는 이 계약의 부속합의서로서 이 계약과 동일한 효력이 있다.<br>
                                ③ 주요 원재료에 해당하지 않은 원재료 중 당사자가 합의하여 하도급대금등 연동제를 적용하기로 한 원재료에 대해 제4조부터 제6조까지, 제7조 제1항 및 제2항을 준용한다.<br>
                                <br>
                                <b>제8조(금지행위)</b>
                                원사업자등은 하도급대금등 연동과 관련하여 하도급거래에 관한 거래상 지위 또는 수탁·위탁거래에 관한 거래상 지위를 남용하거나 거짓 또는 그 밖의 부정한 방법을 사용하지 아니한다.<br>
                                <br>
                                이 계약의 체결사실 및 계약내용을 증명하기 위하여 이 계약서를 2부 작성하여 양 당사자가 각각 서명 또는 기명날인한 후 각자 1부씩 보관한다. <br>
                                <br>
                                <p class="witeDate">2023년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15일</p>
                                <div class="write-area">
                                    <div class="item">
                                        <h3>
                                            <b>원사업자등</b><br>
                                            상호 또는 명칭 : ㅇㅇㅇ물산(주)<br>
                                            전화번호 :  02-1234-0000<br>
                                            주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 : 서울시 000 000로 00<br>
                                            대표자 성명 :&nbsp;&nbsp;&nbsp; 0 0 0&nbsp;&nbsp;(인)<br>
                                            사업자(법인) 번호 : 000-00-00000
                                        </h3>
                                    </div>
                                    <div class="item">
                                        <h3>
                                            <b>수급사업자등</b><br>
                                            상호 또는 명칭 : ㅇㅇ산업(주)<br>
                                            전화번호 : 031-4321-0000<br>
                                            주 소 : 경기도 00시 000로 00<br>
                                            대표자 성명 :&nbsp;&nbsp;&nbsp; 0 0 0&nbsp;&nbsp;(인)<br>
                                            사업자(법인)번호 : 000-00-00000<br>
                                        </h3>
                                    </div>
                                </div>
                            </h3>
                            </div>
                        </div>
                    </div>
                    <form:form modelAttribute="agreeVO" method="get" action="">
                        <div class="tab-container">
                            <div class="search">
                                <div class="search-tag" style="padding-left: 23px;">
                                    <label class="label" >원재료</label>
                                    <form:input type="text" path="prmy_mat"  style="border-radius: 5px;"/>
                                </div>
                                <div class="search-tag" style="width: 22%;">
                                    <label class="label">조정일</label>
                                    <select id="rqrm_date" name="rqrm_date" value ="">
                                        <option value="">선택</option>
                                        <option value="매월 1일"<c:if test='${vo.rqrm_date == "매월 1일"}'>selected="selected"</c:if> > 매월 1일</option>
                                        <option value="매월 말일"<c:if test='${vo.rqrm_date == "매월 말일"}'>selected="selected"</c:if> > 매월 말일</option>
                                        <option value="짝수달"<c:if test='${vo.rqrm_date == "짝수달"}'>selected="selected"</c:if> > 짝수달</option>
                                        <option value="홀수달"<c:if test='${vo.rqrm_date == "홀수달"}'>selected="selected"</c:if>>홀수달</option>
                                        <option value=""<c:if test='${vo.rqrm_date == "기타"}'>selected="selected"</c:if> >기타</option>
                                    </select>
                                </div>
                                <div class="search-tag" >
                                    <label class="label">기준지표</label>
                                    <select id="prmy_mat_std" name="prmy_mat_std" value =""  style="width: 57%;">
                                        <option value="">선택</option>
                                        <option value="LME" <c:if test='${vo.prmy_mat_std == "LME"}'>selected="selected"</c:if>> LME</option>
                                        <option value="e-나라지표" <c:if test='${vo.prmy_mat_std == "e-나라지표"}'>selected="selected"</c:if>> e-나라지표</option>
                                        <option value="조달청" <c:if test='${vo.prmy_mat_std == "조달청"}'>selected="selected"</c:if>>조달청</option>
                                        <option value="한국은행" <c:if test='${vo.prmy_mat_std == "한국은행"}'>selected="selected"</c:if>>한국은행</option>
                                        <option value="산업통상자원부"  <c:if test='${vo.prmy_mat_std == "산업통상자원부"}'>selected="selected"</c:if>>산업통상자원부</option>
                                        <option value=""  <c:if test='${vo.prmy_mat_std == "기타"}'>selected="selected"</c:if>>기타</option>
                                    </select>
                                </div>
                            </div>
                            <div class="search">
                                <div class="search-tag">
                                    <label class="label">조정요건</label>
                                    <form:input type="text" path="rqrm_ust"  style="border-radius: 5px;    width: 63%;"/>
                                    <p style="font-weight: 500; display: inline-block;padding-left: 5px;">%</p>
                                </div>
                                <div class="search-tag" style="width: 23%;">
                                    <label class="label" >조정주기</label>
                                    <select id="rqrm_cycl" name="rqrm_cycl" value =""  style="width: 106px;">
                                        <option value="">선택</option>
                                        <option value="n개월" <c:if test='${vo.rqrm_cycl == "n개월"}'>selected="selected"</c:if>> n개월</option>
                                        <option value="분기별" <c:if test='${vo.rqrm_cycl == "분기별"}'>selected="selected"</c:if>> 분기별</option>
                                        <option value="반기별" <c:if test='${vo.rqrm_cycl == "반기별"}'>selected="selected"</c:if>> 반기별</option>
                                        <option value="1년" <c:if test='${vo.rqrm_cycl == "1년"}'>selected="selected"</c:if>>1년</option>
                                        <option value="" <c:if test='${vo.rqrm_cycl == "기타"}'>selected="selected"</c:if>>기타</option>
                                    </select>
                                </div>
                                <div class="search-tag" style="width: 30%;">
                                    <label class="label">반영비율</label>
                                    <form:input type="text" path="ratio"  style="border-radius: 5px;    width: 60%;"/>
                                    <p style="font-weight: 500; display: inline-block;padding-left: 5px;">%</p>
                                </div>
                                <button type="button" style=" background: #E60024; border-radius: 5px;
                                     padding: 10px 12px; color: #FFFFFF;  font-weight: 500; font-size: 15px;border: none;" onclick="fn_submit()">검색</button>
                            </div>
                        </div>
                        <div class="write-container">
                            <table class="tbl-list01">
                                <colgroup>
                                    <col width="10%"/>
                                    <col width="30%"/>
                                    <col width="30%"/>
                                    <col width="30%"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">연동표</th>
                                    <th scope="col">원재료</th>
                                    <th scope="col">조정주기</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="rs" items="${rs }" varStatus="status">
                                    <tr>
                                        <td>${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }</td>
                                        <td class="al">
                                            <a href="${pageContext.request.contextPath}/join/ex/view.do?seq=${rs.seq}" style="color: rgb(0, 72, 255);">${rs.ex_nm }</a>
                                        </td>
                                        <td>${rs.prmy_mat}</td>
                                        <td>${rs.rqrm_cycl}</td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty rs }">
                                    <tr>
                                        <td colspan="4" class="text-center">조회된 데이터가 없습니다.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </form:form>
                    </div>
                </section>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>