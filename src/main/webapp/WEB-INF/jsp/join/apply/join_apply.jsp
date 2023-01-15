<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" 		prefix="form"%>

<head>
    <title></title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">

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

    $(function(){

        var fileUploader = new smes.FileUploader('.file-uploader').init({
            maxFileSize : 1024 * 1024 * 100,    // 100 MB 제한
            maxFileCount : 20,
            targetFolderPath : 'test2',
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

        $('#apply').on('click', function() {

            fileUploader.upload({
                done: function (result, deleted, uploaded) {
                    // 업로드 완료 후 전송된 파일 리스트 정보를
                    // 특정 hidden 파라미터로 설정하고 form을 전송한다.
                    if (result) {
                        console.dir(result);
                        $('#jsonFileList').val(JSON.stringify(result));
                    }
                    else {
                        $('#jsonFileList').val('');
                    }
                    if (deleted) {
                        console.dir(deleted);
                        $('#jsonDeletedFiles').val(JSON.stringify(deleted));
                    }
                    else {
                        $('#jsonDeletedFiles').val('');
                    }
                    $('#frmApply').submit();
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

<page:applyDecorator name="menu2"/>
<div class="article">
    <div class="content">
        <!-- 컨텐츠 start -->
<%--        <form name="frmWrite" id="frmWrite" method="post" action="${pageContext.request.contextPath}/join/joinApply.do">--%>
<form:form modelAttribute="frmApply" action="joinApply.do">
    <form:hidden path="jsonFileList"/>
    <form:hidden path="jsonDeletedFileList"/>

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
                        <input type="text" class="uni_input_text wdh100" id="cmpNm" name="cmpNm"/>
                    </td>
                    <th class="txt_alcnt" scope="row">사업자번호</th>
                    <td>
                        <input type="number" class="uni_input_text" style="width:60px;" id="bizNo1" name="bizNo1"/>
                        -
                        <input type="number" class="uni_input_text" style="width:50px;" id="bizNo2" name="bizNo2"/>
                        -
                        <input type="number" class="uni_input_text" style="width:60px;" id="bizNo3" name="bizNo3"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">대표자명</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="ceo" name="ceo"/>
                    </td>
                    <th class="txt_alcnt" scope="row">설립일자</th>
                    <td>
                        <input type="date" class="uni_input_text wdh100" id="fdate" name="fdate"/>
                    </td>
                </tr>

                <tr>
                    <th class="txt_alcnt" scope="row">본사 주소</th>
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
                    <th class="txt_alcnt" scope="row">전화번호</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="telNo" name="telNo"/>
                    </td>
                    <th class="txt_alcnt" scope="row">팩스</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="faxNo" name="faxNo"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">업종</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="bizType" name="bizType"/>
                    </td>
                    <th class="txt_alcnt" scope="row">자본금</th>
                    <td>
                        <input type="text" class="uni_input_text" id="capital" name="capital" style="padding:0"/>백만원
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
                <tr>
                    <th class="txt_alcnt" scope="row">매출액(백만원)</th>
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
                    <th class="txt_alcnt" scope="row">영업이익(백만원)</th>
                    <td>
                        <input type="number" class="uni_input_text" id="ix_data4" name="ix_data4" />
                    </td>
                    <td>
                        <input type="number" class="uni_input_text" id="ix_data5" name="ix_data5"/>
                    </td>
                    <td>
                        <input type="number" class="uni_input_text" id="ix_data6" name="ix_data6"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">종업원수(명)</th>
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
                    <th class="txt_alcnt" scope="row">주요생산품</th>
                    <td colspan="3">
                        <input type="text" id="product" class="uni_input_text wdh100" name="product"/>
                    </td>
                </tr>
                <th colspan="4" class="txt_alcnt" scope="row">담당자</th>
                <tr>
                    <th class="txt_alcnt" scope="row">성명</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" name="name" id="name"/>
                    </td>
                    <th class="txt_alcnt" scope="row">전화번호</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="mbphno" name="mbphno" value=""/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">소속부서</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="deptNm" name="deptNm" value=""/>
                    </td>
                    <th class="txt_alcnt" scope="row">직위</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="position" name="position" value=""/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">이메일</th>
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
                    <th class="txt_alcnt" scope="row">사무실 전화</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="memTelNo" name="memTelNo" value=""/>
                    </td>
                    <th class="txt_alcnt" scope="row">팩스</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="memFaxNo" name="memFaxNo" value=""/>
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
                <tr>
                    <th colspan="4" class="txt_alcnt" scope="row">회원가입 정보</th>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">사용자 ID</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text wdh100" name="id" id="id"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">비밀번호</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" name="passwd" value=""/>
                    </td>
                    <th class="txt_alcnt" scope="row">비밀번호 재입력</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="passwdChk" name="passwdChk" value=""/>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="btn-wrap type04">
                <button id="apply" class="btn blue">등록</button>
                <a href="${pageContext.request.contextPath}/join/joinList.do" class="btn blue">취소</a>
            </div>
<%--        </form>--%>
    </form:form>

        <!-- 컨텐츠 end -->
    </div>
</div>
	