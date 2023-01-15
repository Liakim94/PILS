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


</head>
<script>
    //주소찾기
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
        $("#frmWrite").validate({
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
                $("#frmWrite").submit();

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

<page:applyDecorator name="menu"/>
<div class="article">
    <div class="content">
        <!-- 컨텐츠 start -->
        <form name="frmWrite" id="frmWrite" method="post" action="${pageContext.request.contextPath}/cmm/conApply.do">

            <table class="tbl-list02">
                <col width="17%"/>
                <col width="*"/>
                <div class="article-header">
                    <h3>컨설팅 신청</h3>
                    <div class="side-wrap">
                    </div>
                </div>
                <tbody>
                <tr>
                    <th class="txt_alcnt" scope="row">기업명<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="cmpNm" name="cmpNm"/>
                    </td>
                    <th class="txt_alcnt" scope="row">사업자번호<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" style="width:60px;" id="bizNo1" name="bizNo1"/>
                        -
                        <input type="number" class="uni_input_text wdh100" style="width:50px;" id="bizNo2" name="bizNo2"/>
                        -
                        <input type="number" class="uni_input_text wdh100" style="width:60px;" id="bizNo3" name="bizNo3"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">대표자명<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="ceo" name="ceo"/>
                    </td>
                    <th class="txt_alcnt" scope="row">설립일자<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="date" class="uni_input_text wdh100" id="fdate" name="fdate"/>
                    </td>
                </tr>

                <tr>
                    <th class="txt_alcnt" scope="row">본사 주소<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text " name="address" id="address" onclick="execPostCode()"
                               readonly/>
                        <button type="button" class="btn"
                                onclick="execPostCode()">주소찾기
                        </button>
                        <input type="text" class="uni_input_text " name="address_dtl" id="address_dtl"
                               placeholder="상세주소"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">전화번호<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="telNo" name="telNo"/>
                    </td>
                    <th class="txt_alcnt" scope="row">팩스<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="faxNo" name="faxNo"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">업종<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="bizType" name="bizType"/>
                    </td>
                    <th class="txt_alcnt" scope="row">자본금<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="text" class="uni_input_text" id="capital" name="capital" style="padding:0"/>백만원
                    </td>
                </tr>

                <th colspan="4" class="txt_alcnt" scope="row">기업현황 (최근 3년)</th>
                <tr>
                    <th class="txt_alcnt" scope="row">지표</th>
                    <th class="txt_alcnt" scope="row">2019년</th>
                    <th class="txt_alcnt" scope="row">2020년</th>
                    <th class="txt_alcnt" scope="row">2021년</th>
                <tr>
                    <th class="txt_alcnt" scope="row">매출액(백만원)<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="number" class="uni_input_text" id=ix_data1" name="ix_data1"/>
                    </td>
                    <td>
                        <input type="number" class="uni_input_text" id="ix_data2" name="ix_data2"/>
                    </td>
                    <td>
                        <input type="number" class="uni_input_text" id="ix_data3" name="ix_data3"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">영업이익(백만원)<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="number" class="uni_input_text" id="ix_data4" name="ix_data4"/>
                    </td>
                    <td>
                        <input type="number" class="uni_input_text" id="ix_data5" name="ix_data5"/>
                    </td>
                    <td>
                        <input type="number" class="uni_input_text" id="ix_data6" name="ix_data6"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">종업원수(명)<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="number" class="uni_input_text" id="ix_data7" name="ix_data7"/>
                    </td>
                    <td>
                        <input type="number" class="uni_input_text" id="ix_data8" name="ix_data8"/>
                    </td>
                    <td>
                        <input type="number" class="uni_input_text" id="ix_data9" name="ix_data9"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">주요생산품<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td colspan="3">
                        <input type="text" id="product" class="uni_input_text wdh100" name="product"/>
                    </td>
                </tr>
                <th colspan="4" class="txt_alcnt" scope="row">담당자</th>
                <tr>
                    <th class="txt_alcnt" scope="row">성명<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="text" class="uni_input_text wdh100 " name="name" id="name"/>
                    </td>
                    <th class="txt_alcnt" scope="row">전화번호<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="mbphno" name="mbphno" value=""/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">소속부서<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="deptNm" name="deptNm" value=""/>
                    </td>
                    <th class="txt_alcnt" scope="row">직위<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="position" name="position" value=""/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">이메일<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text " name="email1" id="email1"/>
                        @
                        <input type="text" class="uni_input_text " name="email2" id="email2" value=""/>
                        <select id="email3" class="uni_input_text " style="border-radius: 5px;"
                                onclick="selectEmail(this)">
                            <option value="1">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="gmail.com">gmail.com</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">사무실 전화<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="memTelNo" name="memTelNo" value=""/>
                    </td>
                    <th class="txt_alcnt" scope="row">팩스<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="memFaxNo" name="memFaxNo" value=""/>
                    </td>
                </tr>
                <tr>
                    <th colspan="4" class="txt_alcnt" scope="row">컨설팅시 주요 질의사항<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                </tr>
                <tr>
                    <td colspan="4">
                        <input type="text" class="uni_input_text wdh100" id="conQ" name="conQ" value=""/>
                    </td>
                </tr>
                <tr>
                    <th colspan="4" class="txt_alcnt" scope="row">연동제 적용 대상이 되는 주요 수위탁거래 정보</th>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">수위탁 거래 유형</th>
                    <td colspan="3">
                        <select id="deal_type" name="deal_type" class="uni_input_text">
                            <option value="">선택</option>
                            <option value="제조">제조</option>
                            <option value="공사">공사</option>
                            <option value="가공">가공</option>
                            <option value="수리">수리</option>
                            <option value="용역">용역</option>
                            <option value="기술개발">기술개발</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">연간 거래 규모</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text wdh100" name="deal_scale" id="deal_scale"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">주요 원재료</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text wdh100" name="material" id="material"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">비밀번호<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" name="passwd" value=""/>
                    </td>
                    <th class="txt_alcnt" scope="row">비밀번호 재입력<span style="color: rgb(244, 54, 54);">&nbsp;&ast;</span></th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="passwdChk" name="passwdChk" value=""/>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="btn-wrap type04">
                <button type="button" class="btn blue" >저장</button>
                <a href="${pageContext.request.contextPath}/cmm/consulting.do" class="btn blue">취소</a>
            </div>
        </form>
        <!-- 컨텐츠 end -->
    </div>
</div>
	