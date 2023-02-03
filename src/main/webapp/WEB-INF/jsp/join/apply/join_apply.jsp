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
    <title>중소벤처기업부 | 동행기업 신청</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
    <script src="${pageContext.request.contextPath }/x2/plugins/dropzone/dropzone.js"></script>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>

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

        var fileUploader = new smes.FileUploader('.file-uploader').init({
            maxFileSize: 1024 * 1024 * 100,    // 100 MB 제한
            maxFileCount: 20,
            targetFolderPath: 'test2',
            //accept : '.png, .jpg',
            targetUrl: '<c:url value="/files/upload.do"/>',
            fileList: $('#jsonFileList').val(),
            deletedFileList: $('#jsonDeletedFileList').val()
        });

        $('#apply').on('click', function () {
            var bizNo = $("#bizNo1").val() + $("#bizNo2").val() + $("#bizNo3").val();
            $('input[name=bizNo]').attr('value', bizNo);

            var email =$("#email1").val() + $("#email2").val();
            $('input[name=email]').attr('value', email);

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

    $.validator.addMethod("regex", function(value, element,regexpr){
        return regexpr.test(value);
    });

    $(function () {

        $("#frmApply").validate({
            ignore: "",
            rules: {
                cmpNm: {required: true},
                bizNo: {required: true,
                    remote: {
                        type: "post"
                        , url: "${pageContext.request.contextPath}/join/checkBizno.do"
                        , data: {
                            username: function () {
                                return $("#bizNo").val();
                            }
                        }
                    },
                    digits : true, minlength :10
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
                material: {required: true},
                id: {
                    required: true, remote: {
                        type: "post"
                        , url: "${pageContext.request.contextPath}/join/checkId.do"
                        , data: {
                            username: function () {
                                return $("#id").val();
                            }
                        }
                    }
                },
                passwd: {required: true, regex: /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{4,10}$/ },
                passwdChk: {required: true, equalTo: "#passwd"},
                email: {required: true}
            },
            messages: {
                cmpNm: {required: "기업명을 입력하세요."},
                bizNo: {required: "사업자번호를 확인하세요.", remote: "이미 존재하는 사업자번호입니다.",  digits : "숫자만 입력하세요", minlength: "사업자번호를 확인하세요."},
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
                material: {required: "주요원재료를 입력하세요."},
                id: {
                    required: "아이디를 입력하세요",
                    remote: "이미 존재하는 아이디입니다."
                },
                name: {required: "담당자 성명을 입력하세요."},
                mbphno: {required: "담당자 전화번호를 입력하세요."},
                conQ: {required: "컨설팅시 주요 질의사항를 입력하세요."},
                passwd: {required: "비밀번호를 입력하세요.",
                    regex:"비밀번호는 4~10자의 영문소문자, 숫자, 특수문자를 조합하여 사용해야 합니다."},
                passwdChk: {required: "비밀번호를 재입력하세요.", equalTo: "비밀번호 불일치"},
                email: {required: "이메일을 입력하세요."}
            },
        });
    });

</script>
<style type="text/css">
    input.error, textarea.error{
        border:1px dashed red;
    }
    label.error{
        display:block;
        color:red;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu2"/>
        <div class="article">
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    납품대금 연동제 동참하기
                </li>
                <li>
                    동행기업 신청하기
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 신청하기</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="company-write" class="content">
                <form:form modelAttribute="frmApply" action="joinApply.do">
                <form:hidden path="jsonFileList"/>
                <form:hidden path="jsonDeletedFileList"/>
                <h2 class="title">기업 정보</h2>
                <div class="write-container">
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                기업명<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="cmpNm" name="cmpNm" placeholder="기업명을 입력해주세요." required/>
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                                사업자 번호
                            </div>
                            <div class="input-wrap">
                                <td>
                                    <input class="multi" type="text" id="bizNo1" name="bizNo1" maxlength="3"/>
                                    <span>-</span>
                                    <input class="multi" type="text" id="bizNo2" name="bizNo2" maxlength="2"/>
                                    <span>-</span>
                                    <input class="multi" type="text" id="bizNo3" name="bizNo3" maxlength="5"/>
                                    <input type="hidden" id="bizNo" name=bizNo value="">

                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                대표자명<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="ceo" name="ceo" laceholder="대표자명을 입력해주세요." required/>
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                                설립일자<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="fdate" name="fdate" required/>
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            본사 주소<span class="required">*</span>
                        </div>
                        <div class="input-wrap address-input-wrap">
                            <input type="text" name="address" id="address" onclick="execPostCode()"
                                   readonly/>
                            <button type="button" class="btn" onclick="execPostCode()">주소찾기</button>
                            <input type="text" name="address_dtl" id="address_dtl" placeholder="상세주소"/>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                전화번호<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="telNo" name="telNo" required/>
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                                팩스<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="faxNo" name="faxNo" required/>
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                업종<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="bizType" name="bizType" required/>
                                </td>
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                                자본금<span class="required">*</span>
                            </div>
                            <div class="input-wrap labeled-input-wrap ">
                            <input type="text" id="capital" name="capital"
                                   placeholder="자본금을 입력해주세요." required/>백만원
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
                <div class="line-wrap">
                    <div class="label label-long">
                        매출액(백만원)
                    </div>
                    <div class="tri">
                        <div class="border">
                            <input type="text" id=ix_data1" name="ix_data1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                        </div>
                        <div class="border">
                            <input type="text" id=ix_data2" name="ix_data2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                        </div>
                        <div class="border">
                            <input type="text" id=ix_data3" name="ix_data3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                        </div>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label label-long">
                        영업이익(백만원)
                    </div>
                    <div class="tri">
                        <div class="border">
                            <input type="text" id="ix_data4" name="ix_data4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                        </div>
                        <div class="border">
                            <input type="text" id="ix_data5" name="ix_data5" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                        </div>
                        <div class="border">
                            <input type="text" id="ix_data6" name="ix_data6" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                        </div>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label label-long">
                        종업원수(명)
                    </div>
                    <div class="tri">
                        <div class="border">
                            <input type="text" id="ix_data7" name="ix_data7" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                        </div>
                        <div class="border">
                            <input type="text" id="ix_data8" name="ix_data8" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                        </div>
                        <div class="border">
                            <input type="text" id="ix_data9" name="ix_data9" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                        </div>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label" style="width: 155px">
                        주요 제품<span class="required">*</span>
                    </div>
                    <div class="input-wrap">
                        <input type="text" id="product" name="product" required/>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="fx2">
                        <div class="label" style="width: 164px">주요 적용 제품
                            <span class="required">*</span>
                        </div>
                        <div class="input-wrap">
                            <input type="text" id="mainProduct" name="mainProduct" required/>
                        </div>
                    </div>
                    <div class="fx2">
                        <div class="label">참여기업 수<span class="required">*</span>
                        </div>
                        <div class="input-wrap">
                            <input type="text" id="joinCmp" name="joinCmp" required/>
                        </div>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label" style="width: 155px">주요 원재료<span class="required">*</span>
                    </div>
                    <div class="input-wrap">
                        <input type="text" name="material" id="material" required/>
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
                        <input type="text" name="name" id="name" placeholder="성명을 입력해주세요." required/>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="fx2">
                        <div class="label">
                            소속 부서
                        </div>
                        <div class="input-wrap">
                            <input type="text" id="deptNm" name="deptNm" placeholder="소속부서를 입력해주세요." />
                        </div>
                    </div>
                    <div class="fx2">
                        <div class="label">
                            직위
                        </div>
                        <div class="input-wrap">
                            <input type="text" id="position" name="position" placeholder="직위를 입력해주세요."/>
                        </div>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">
                        전화번호<span class="required">*</span>
                    </div>
                    <div class="input-wrap">
                        <input type="text" id="mbphno" name="mbphno" required/>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">
                        이메일<span class="required">*</span>
                    </div>
                    <div class="input-wrap ">
                        <input type="text" class="multi" name="email1" id="email1"/>
                        <span>@</span>
                        <input type="text" style="width: 130px" name="email2" id="email2"/>
                        <select id="email3" style="width: 130px"
                                onclick="selectEmail(this)">
                            <option value="1">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="gmail.com">gmail.com</option>
                        </select>
                        <input type="hidden" value="" id="email" name="email">

                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">
                        사무실 전화
                    </div>
                    <div class="input-wrap">
                        <input type="text" id="memTelNo" name="memTelNo"/>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">팩스</div>
                    <div class="input-wrap">
                        <input type="text" id="memFaxNo" name="memFaxNo"/>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">
                        첨부서류
                    </div>

                    <div class="file-uploader-wrapper">
                        <div class="file-uploader"></div>
                    </div>

                </div>
            </div>
            <h2 class="title mt40">회원가입 정보</h2>
            <div class="write-container">
                <div class="line-wrap">
                    <div class="label label-long">
                        사용자 ID<span class="required">*</span>
                    </div>
                    <div class="input-wrap long-input">
                        <input type="text" name="id" id="id" placeholder="ID를 입력해주세요." required/>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="fx2">
                        <div class="label label-long">
                            비밀번호<span class="required">*</span>
                        </div>
                        <div class="input-wrap long-input">
                            <input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요." required>
                            <h5 class="sub">※ 비밀번호는 4~10자의 영문소문자, 숫자, 특수문자를 조합하여 사용해야 합니다.</h5>
                        </div>
                    </div>
                    <div class="fx2">
                        <div class="label label-long">
                            비밀번호 재입력<span class="required">*</span>
                        </div>
                        <div class="input-wrap long-input">
                            <input type="password" id="passwdChk" name="passwdChk" placeholder="비밀번호를 재입력해주세요."
                                   required/>
                        </div>
                    </div>
                </div>
            </div>
            </form:form>
            <div class="write-bottom">
                <button id="apply" class="submit" style="width:130px">등록</button>
                <a href="${pageContext.request.contextPath}/join/joinMain.do">취소</a>
            </div>
        </div>
    </div>
</div>
</div>