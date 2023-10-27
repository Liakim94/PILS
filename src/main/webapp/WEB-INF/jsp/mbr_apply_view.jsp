<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%pageContext.setAttribute("crcf", "\r\n"); %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<head>
    <title>중소벤처기업부 | 담당자 신청</title>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>

</head>
<style>
    label.error {
        display: block;
        color: red;
    }
    .line-wrap {
        display: flex;
        border-bottom: 1px solid #505050;
        width: 100%;
        min-width: 600px;
    }
    .line-wrap .label{
        background: rgba(145, 145, 145, 0.1);
        padding: 16px 8px;
        box-sizing: border-box;
        font-size: 16px;
        line-height: 24px;
        color: #191919;
        text-align: center;
        width: 150px;
        font-weight: 500;
    }
    .line-wrap .label .required {
        color: #E60024;
        margin-left: 2px;
    }
    .fx2{
        width: 50% !important;
        display: flex;
    }
    .line-wrap .input-wrap{
        width: calc(100% - 150px);
        padding:10px; !important;
        box-sizing: border-box;
        display: flex;
        align-items: center;
        margin: 0 !important;
    }
    .line-wrap .multi {
        width: 87px !important;
    }
    .line-wrap .non-flex{
        display: unset;
    }
    .line-wrap input{
        border: none;
        outline: none;
        font-size: 16px;
        padding: 18px 16px;
        box-sizing: border-box;
        width: 100%;
        color: #505050;
    }
    .line-wrap select{
        border: 1px solid #DDDDDD;
        border-radius: 5px;
        width: 200px;
        font-size: 16px;
        padding: 14px 16px;
        margin-top: 14px;
    }
</style>
<div id="content" class="bg-top">
    <div id="login" style="max-width: 950px;">
        <div class="breadcromb mb40">
            <h4>
                <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                <a href="${pageContext.request.contextPath}">홈</a>
                <img class="right-icon" src="${pageContext.request.contextPath}/images/common/right-icon.png" alt="목차 아이콘"/>
                담당자 신청
            </h4>
        </div>
        <p class="title mb40"> 담당자 신청</p>
        <h3 class="fw400 mb40 point4-text tc">
            담당자 신청이 완료되었습니다.
        </h3>
         <div id="company-write" style="border-top: 2px solid #505050;border-bottom: 2px solid #505050;">
                <div class="line-wrap">
                    <div class="fx2">
                        <div class="label">
                            소속 기업명
                        </div>
                        <div class="input-wrap">
                            ${rs.cmpNm}
                        </div>
                    </div>
                    <div class="fx2">
                        <div class="label">
                             사업자 번호
                        </div>
                        <div class="input-wrap">
                            ${rs.bizNo1}-${rs.bizNo2}-${rs.bizNo3}
                        </div>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="fx2">
                        <div class="label">
                            소속 부서
                        </div>
                        <div class="input-wrap">
                            ${rs.deptNm}
                        </div>
                    </div>
                    <div class="fx2">
                        <div class="label">직위</div>
                        <div class="input-wrap">
                          ${rs.position}
                        </div>
                    </div>
                </div>
                <div class="line-wrap">
                     <div class="fx2">
                         <div class="label">
                            성명
                         </div>
                         <div class="input-wrap">
                             ${rs.name}
                         </div>
                     </div>
                     <div class="fx2">
                         <div class="label">전화번호</div>
                         <div class="input-wrap">
                             ${rs.mbphno}
                         </div>
                     </div>
                </div>
                <div class="line-wrap">
                    <div class="label">이메일(회사계정)</div>
                    <div class="input-wrap">
                       ${rs.email}
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">사무실 전화</div>
                    <div class="input-wrap">
                        ${rs.memTelNo}
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">팩스</div>
                    <div class="input-wrap">
                        ${rs.memFaxNo}
                    </div>
                </div>
            </div>
            <div class="btn-wrap type04">
                <%--            <a href="${pageContext.request.contextPath}/join/joinList.do" class="btn blue">목록</a>--%>
            </div>
    </div>
</div>