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
    <title>중소벤처기업부 | 동행기업 신청</title>

    <script src="${pageContext.request.contextPath }/x2/plugins/dropzone/dropzone.js"></script>
    <script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
</head>
<script>

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
        // 파일업로더 처리
        var fileUploader = new smes.FileUploader('.file-uploader').init({
            maxFileSize: 1024 * 1024 * 100,    // 100 MB 제한
            maxFileCount: 20,
            targetFolderPath: 'test2',
            //accept : '.png, .jpg',
            targetUrl: '<c:url value="/files/upload.do"/>',
            fileList: $('#jsonFileList').val(),
            deletedFileList: $('#jsonDeletedFileList').val()
        });

        // 저장 버튼 처리
        $('#submit').on('click', function () {
            var bizNo = $("#bizNo1").val() + $("#bizNo2").val() + $("#bizNo3").val();
            $('input[name=bizNo]').attr('value', bizNo);

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
                    $('#frmEdit').submit();
                },
                fail: function (error) {
                    console.dir(error);
                    alert(error.message);
                }
            });
            // return false;
        });
    });

    $(function () {
        $("#frmEdit").validate({
            ignore: "",
            rules: {
                cmpNm: {required: true},
                bizNo1: {required: true, digits : true},
                bizNo2: {required: true, digits : true},
                bizNo3: {required: true, digits : true},
                bizNo: {
                    remote: {
                        type: "post"
                        , url: "${pageContext.request.contextPath}/join/checkBizno.do"
                        , data: {
                            username: function () {
                                return $("#bizNo").val();
                            }
                        }
                    },
                    digits : true
                },
                ceo: {required: true},
                fdate: {required: true},
                address: {required: true},
                telNo: {required: true},
                faxNo: {required: true},
                bizType: {required: true},
                capital: {required: true, digits : true},
                product: {required: true},
                mainProduct: {required: true},
                joinCmp: {required: true, digits : true},
                material: {required: true}
            },
            // onkeyup: false,
            // onclick: false,
            // onfocusout: false,
            messages: {
                cmpNm: {required: "기업명을 입력하세요."},
                bizNo1: {required: "사업자번호를 확인하세요.",  digits : "숫자만 입력하세요"},
                bizNo2: {required: "사업자번호를 확인하세요.",  digits : "숫자만 입력하세요"},
                bizNo3: {required: "사업자번호를 확인하세요.",  digits : "숫자만 입력하세요"},
                bizNo: {remote: "이미 존재하는 사업자번호입니다.",  digits : "숫자만 입력하세요"},
                ceo: {required: "대표자명을 입력하세요."},
                fdate: {required: "설립일자를 입력하세요."},
                address: {required: "본사 주소를 입력하세요."},
                telNo: {required: "기업 전화번호를 입력하세요."},
                faxNo: {required: "기업 팩스를 입력하세요."},
                bizType: {required: "업종을 입력하세요."},
                capital: {required: "자본금을 입력하세요.",  digits : "숫자만 입력하세요"},
                product: {required: "주요 제품을 입력하세요."},
                mainProduct: {required: "주요 적용 제품을 입력하세요."},
                joinCmp: {required: "참여기업 수를 입력하세요.",  digits : "숫자만 입력하세요"},
                material: {required: "주요원재료를 입력하세요."}
               },
            submitHandler: function (frm) {
                $("#frmEdit").submit();
            }
        });
    });
</script>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu2"/>
        <form:form name="frmEdit" id="frmEdit" method="POST" action="joinEdit.do">
            <form:hidden path="jsonFileList"/>
            <form:hidden path="jsonDeletedFileList"/>
        <div class="article">
            <br>
            <div class="content">

                <col width="17%"/>
                <col width="*"/>
                <div class="article-header">
                    <h3>동행기업 신청</h3>
                    <div class="side-wrap">
                    </div>
                </div>
                <table class="tbl-list02">
                    <tbody>
                    <tr>
                        <th class="txt_alcnt" scope="row">기업명</th>
                        <td>
                            <input type="text" class="uni_input_text wdh100" id="cmpNm" name="cmpNm"
                                   value="${rs.cmpNm}"/>
                        </td>
                        <th class="txt_alcnt" scope="row">사업자번호</th>
                        <input type="hidden" name=bizNo value="">

                        <td>
                            <input type="text" class="uni_input_text wdh100" id="bizNo1" name="bizNo1"
                                   style="width:60px;" value="${rs.bizNo1}"/>
                            -
                            <input type="text" class="uni_input_text wdh100" id="bizNo2" name="bizNo2"
                                   style="width:50px;" value="${rs.bizNo2}"/>
                            -
                            <input type="text" class="uni_input_text wdh100" id="bizNo3" name="bizNo3"
                                   style="width:60px;" value="${rs.bizNo3}"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt_alcnt" scope="row">대표자명</th>
                        <td>
                            <input type="text" class="uni_input_text wdh100" id="ceo" name="ceo" value="${rs.ceo}"/>
                        </td>
                        <th class="txt_alcnt" scope="row">설립일자</th>
                        <td>
                            <input type="date" class="uni_input_text wdh100" id="fdate" name="fdate"
                                   value="${rs.fdate}"/>
                        </td>
                    </tr>

                    <tr>
                        <th class="txt_alcnt" scope="row">본사 주소</th>
                        <td colspan="3">
                            <input type="text" class="uni_input_text " name="address" id="address"
                                   value="${rs.address}" onclick="execPostCode()" readonly/>
                            <button type="button" class="btn"
                                    onclick="execPostCode()">주소찾기
                            </button>
                            <input type="text" class="uni_input_text " name="address_dtl" id="address_dtl"
                                   value="${rs.address_dtl}"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt_alcnt" scope="row">전화번호</th>
                        <td>
                            <input type="text" class="uni_input_text wdh100" id="telNo" name="telNo"
                                   value="${rs.telNo}"/>
                        </td>
                        <th class="txt_alcnt" scope="row">팩스</th>
                        <td>
                            <input type="text" class="uni_input_text wdh100" id="faxNo" name="faxNo"
                                   value="${rs.faxNo}"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt_alcnt" scope="row">업종</th>
                        <td>
                            <input type="text" class="uni_input_text wdh100" id="bizType" name="bizType"
                                   value="${rs.bizType}"/>
                        </td>
                        <th class="txt_alcnt" scope="row">자본금</th>
                        <td>
                            <input type="text" class="uni_input_text" id="capital" name="capital" style="padding:0"
                                   value="${rs.capital}"/>백만원
                        </td>
                    </tr>
                    <tr>
                        <th class="txt_alcnt" scope="row">기업 로고</th>
                        <td colspan="3">
                            파일찾기
                        </td>
                    </tr>
                    <th colspan="4" class="txt_alcnt" scope="row">기업현황 (최근 3년)</th>
                    <tr>
                        <th class="txt_alcnt" scope="row">지표</th>
                        <th class="txt_alcnt" scope="row">2019년</th>
                        <th class="txt_alcnt" scope="row">2020년</th>
                        <th class="txt_alcnt" scope="row">2021년</th>
                    </tr>
                    <c:forEach var="st" items="${st}" varStatus="status">
                        <c:if test="${status.index mod 3 eq 0}">
                            <tr>
                            <th class="txt_alcnt" scope="row">${st.index_dv_nm} </th>
                        </c:if>
                        <td align="center">
                            <input type="text" class="uni_input_text wdh100" id="ix_data${status.index+1}"
                                   name="ix_data${status.index+1}" value="${st.index_data}"/>
                        </td>
                        <c:if test="${status.index mod 3 eq 2}">
                            </tr>
                        </c:if>
                    </c:forEach>

                    <tr>
                        <th class="txt_alcnt" scope="row">주요 제품</th>
                        <td colspan="3">
                            <input type="text" id="product" class="uni_input_text" name="product"
                                   value="${rs.product}"/>
                        </td>
                    </tr>
                    <th colspan="4" class="txt_alcnt" scope="row">담당자</th>
                    <tr>
                        <th class="txt_alcnt" scope="row">성명</th>
                        <td>
                            <input type="text" class="uni_input_text wdh100" name="name" id="name" value="${rs.name}"/>
                        </td>
                        <th class="txt_alcnt" scope="row">전화번호</th>
                        <td>
                            <input type="text" class="uni_input_text wdh100" id="mbphno" name="mbphno"
                                   value="${rs.mbphno}"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt_alcnt" scope="row">소속부서</th>
                        <td>
                            <input type="text" class="uni_input_text wdh100" id="deptNm" name="deptNm"
                                   value="${rs.deptNm}"/>
                        </td>
                        <th class="txt_alcnt" scope="row">직위</th>
                        <td>
                            <input type="text" class="uni_input_text wdh100" id="position" name="position"
                                   value="${rs.position}"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt_alcnt" scope="row">이메일</th>
                        <td colspan="3">
                            <input type="text" class="uni_input_text " name="email1" id="email1" value="${rs.email1}"/>
                            @
                            <input type="text" class="uni_input_text " name="email2" id="email2" value="${rs.email2}"/>
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
                        <th class="txt_alcnt" scope="row">사무실 전화</th>
                        <td>
                            <input type="text" class="uni_input_text wdh100" id="memTelNo" name="memTelNo"
                                   value="${rs.memTelNo}"/>
                        </td>
                        <th class="txt_alcnt" scope="row">팩스</th>
                        <td>
                            <input type="text" class="uni_input_text wdh100" id="memFaxNo" name="memFaxNo"
                                   value="${rs.memFaxNo}"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt_alcnt" scope="row">첨부서류</th>
                        <td colspan="3">
                            <div class="file-uploader-wrapper">
                                <div class="file-uploader"></div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn-wrap type04">
                    <button id="submit" class="btn blue">저장</button>
                    <a href="${pageContext.request.contextPath}/join/joinList.do" class="back">취소</a>
                </div>
            </div>
        </div>
        </form:form>
