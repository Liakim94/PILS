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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>
</head>
<script>
    function execPostCode() {
        daum.postcode.load(function () {
            new daum.Postcode({
                oncomplete: function (data) {
                    var addr = '';

                    if (data.userSelectedType === 'R') {
                        addr = data.roadAddress;
                    } else {
                        addr = data.jibunAddress;
                    }
                    document.getElementById("address").value = '(' + data.zonecode + ') ' + addr;
                    document.getElementById("address_dtl").focus();
                }
            }).open();
        });
    }

    function selectEmail(ele) {
        var $ele = $(ele);
        var $email2 = $('input[name=email2]');

        // '1'인 경우 직접입력
        if ($ele.val() == "1") {
            $email2.attr('readonly', false);
            $email2.val('');
        } else {
            $email2.attr('readonly', true);
            $email2.val($ele.val());
        }
    }

    $(function () {
        $("#frmEdit").validate({
            ignore: "",
            rules: {
                cmpNm: {required: true},
                bizNo1: {required: true},
                bizNo2: {required: true},
                bizNo3: {required: true},
                ceo: {required: true},
                fdate: {required: true},
                address: {required: true},
                telNo: {required: true},
                faxNo: {required: true},
                bizType: {required: true},
                capital: {required: true},
                product: {required: true},
                name: {required: true},
                mbphno: {required: true},
                deptNm: {required: true},
                position: {required: true},
                email1: {required: true},
                email2: {required: true},
                memTelNo: {required: true},
                memFaxNo: {required: true},
                conQ: {required: true},
                passwd: {required: true},
                passwdChk: {required: true, equalTo: "#passwd"},
            },
            onkeyup: false,
            onclick: false,
            onfocusout: false,
            messages: {
                cmpNm: {required: "기업명을 입력하세요."},
                bizNo1: {required: "사업자번호를 확인하세요."},
                bizNo2: {required: "사업자번호를 확인하세요."},
                bizNo3: {required: "사업자번호를 확인하세요."},
                ceo: {required: "대표자명을 입력하세요."},
                fdate: {required: "설립일자를 입력하세요."},
                address: {required: "본사 주소를 입력하세요."},
                telNo: {required: "기업 전화번호를 입력하세요."},
                faxNo: {required: "기업 팩스를 입력하세요."},
                bizType: {required: "업종을 입력하세요."},
                capital: {required: "자본금을 입력하세요."},
                product: {required: "주요생산품을 입력하세요."},
                name: {required: "담당자 성명을 입력하세요."},
                mbphno: {required: "담당자 전화번호를 입력하세요."},
                deptNm: {required: "담당자 소속부서를 입력하세요."},
                position: {required: "담당자 직위를 입력하세요."},
                email1: {required: "이메일을 입력하세요."},
                email2: {required: "이메일을 입력하세요."},
                memTelNo: {required: "사무실전화를 입력하세요."},
                memFaxNo: {required: "담당자 팩스를 입력하세요."},
                conQ: {required: "컨설팅시 주요 질의사항를 입력하세요."},
                passwd: {required: "비밀번호를 입력하세요."},
                passwdChk: {required: "비밀번호를 재입력하세요.", equalTo: "비밀번호 불일치"},

            },
            submitHandler: function (frm) {
                $("#frmEdit").submit();

            },
            showErrors: function (errorMap, errorList) {
                if (!$.isEmptyObject(errorList)) {
                    $.each(errorList, function () {
                        alert(this.message);
                        return false;
                    });
                }
            }
        });
    });
</script>
</script>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu"/>
        <div class="article">
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>소통마당</li>
                <li>컨설팅 신청</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">컨설팅 신청</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="company-write" class="content">
                <!-- 컨텐츠 start -->

                <form:form name="frmEdit" id="frmEdit" method="POST" action="edit.do">
                <h2 class="title">기업 정보</h2>
                <div class="write-container">
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                기업명<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="cmpNm" name="cmpNm" value="${rs.cmpNm}" required/>
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                                사업자 번호
                            </div>
                            <div class="input-wrap">
                                <input class="multi" type="text" name="bizNo1" id="bizNo1" value="${rs.bizNo1}">
                                <span>-</span>
                                <input class="multi" type="text" name="bizNo2" id="bizNo2" value="${rs.bizNo2}">
                                <span>-</span>
                                <input class="multi" type="text" name="bizNo3" id="bizNo3" value="${rs.bizNo3}">
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                대표자명<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="ceo" name="ceo"
                                       value="${rs.ceo}" required/>
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                                설립일자<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="date" id="fdate" name="fdate"
                                       value="${rs.fdate}" required/>
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            본사 주소<span class="required">*</span>
                        </div>
                        <div class="input-wrap">
                            <input type="text" name="address" id="address"
                                   value="${rs.address}" onclick="execPostCode()" readonly/>
                            <button type="button" class="btn" onclick="execPostCode()">주소찾기</button>
                            <input type="text" name="address_dtl" id="address_dtl"
                                   value="${rs.address_dtl}"/>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                전화번호<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="telNo" name="telNo" value="${rs.telNo}" required/>
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                                팩스<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="faxNo" name="faxNo"
                                       value="${rs.faxNo}" required/>
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                업종<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="bizType" name="bizType"
                                       value="${rs.bizType}" required/>
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                                자본금<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="capital" name="capital" style="width:100px;"
                                       value="${rs.capital}" required/>백만원
                            </div>
                        </div>
                    </div>
                </div>
                <div class="write-container bt-none">
                    <div class="line-wrap">
                        <div class="label-full">
                            기업현황 (최근 3년)
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label label-long">
                            지표
                        </div>
                        <div class="tri">
                            <div class="colored">2019년</div>
                            <div class="colored">2020년</div>
                            <div class="colored">2021년</div>
                        </div>
                    </div>

                    <c:forEach var="st" items="${st}" varStatus="status">
                        <c:if test="${status.index mod 3 eq 0}">
                            <div class="line-wrap">
                            <div class="label label-long">
                                    ${st.index_dv_nm}
                            </div>
                            <div class="tri">
                        </c:if>
                        <div class="border">
                        <input type="text"
                               id="ix_data${status.index+1}"
                               name="ix_data${status.index+1}" value="${st.index_data}"/>
                        <c:if test="${status.index mod 3 eq 2}">
                            </div>
                            </div>
                        </c:if>
                        </div>
                    </c:forEach>
                    <div class="line-wrap">
                        <div class="label" style="width: 155px">
                            주요생산품<span class="required">*</span>
                        </div>
                        <div class="input-wrap">
                            <input type="text" id="product" name="product"
                                   value="${rs.product}" required/>
                        </div>
                    </div>
                </div>

                <h2 class="title mt40">담당자</h2>
                <div class="write-container">
                    <div class="line-wrap">
                        <div class="label">
                            성명<span class="required">*</span>
                        </div>
                        <div class="input-wrap">
                            <input type="text" name="name" id="name"
                                   value="${rs.name}" required/>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                소속 부서<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="deptNm" name="deptNm"
                                       value="${rs.deptNm}" required/>
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                                직위<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="position" name="position"
                                       value="${rs.position}" required/>
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            전화번호<span class="required">*</span>
                        </div>
                        <div class="input-wrap">
                            <input type="text" id="mbphno" name="mbphno"
                                   value="${rs.mbphno}" required/>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            이메일<span class="required">*</span>
                        </div>
                        <div class="input-wrap ">
                            <input type="text" class="multi" name="email1" id="email1"
                                   value="${rs.email1}" required/>
                            <span>@</span>
                            <input type="text" style="width: 130px" name="email2" id="email2"
                                   value="${rs.email2}" required/>
                            <select id="email3" style="width: 130px"
                                    onclick="selectEmail(this)">
                                <option value="1">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="gmail.com">gmail.com</option>
                            </select>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            사무실 전화
                        </div>
                        <div class="input-wrap">
                            <input type="text" id="memTelNo" name="memTelNo"
                                   value="${rs.memTelNo}"/>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">팩스</div>
                        <div class="input-wrap">
                            <input type="text" id="memFaxNo" name="memFaxNo"
                                   value="${rs.memFaxNo}"/>
                        </div>
                    </div>
                </div>
                    <div class="write-container bt-none">
                        <div class="line-wrap">
                            <div class="label-full">
                                컨설팅 시 주요 질의사항
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="input-wrap input-full">
                                <textarea id="conQ" name="conQ" value="${rs.conQ}"></textarea>
                            </div>
                        </div>
                    </div>
                    <h2 class="title mt40">연동제 적용 대상이 되는 주요 수위탁거래 정보</h2>
                    <div class="write-container">
                        <div class="line-wrap">
                            <div class="label label-long">
                                수위탁 거래 유형
                            </div>
                            <div class="input-wrap">
                                <select id="deal_type" name="deal_type">
                                    <option value="${rs.deal_type}">${rs.deal_type} (현재정보)</option>
                                    <option value="제조">제조</option>
                                    <option value="공사">공사</option>
                                    <option value="가공">가공</option>
                                    <option value="수리">수리</option>
                                    <option value="용역">용역</option>
                                    <option value="기술개발">기술개발</option>
                                </select>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label label-long">
                                연간 거래 규모
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="deal_scale" id="deal_scale"
                                       value="${rs.deal_scale}"/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label label-long">
                                주요 원재료
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="material" id="material" value="${rs.material}"/>
                            </div>
                        </div>
                    </div>
                    <div class="write-bottom">
                        <input type="submit" class="submit" value="등록">
                        <a href="<c:url value="/front/consulting/view.do?bizNo=${rs.bizNo}"/>">취소</a>
                    </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

