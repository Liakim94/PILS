<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>

<head>
<title></title>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<script>
	// submit
	function fn_submit(){

		var frm = document.getElementById('frmWrite');

		if( frm.name.value == "" )  {
			alert("작성자를 입력하세요.");
			return false;
		}
		if( frm.id.value == "" )  {
			alert("공개여부를 선택하세요.");
			return false;
		}
		if( frm.passwd.value == "" && document.getElementById('ChkBox2').checked )  {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if( frm.title.value == "" )  {
			alert("제목을 입력하세요.");
			return false;
		}

		oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);

		var ir1 = $("#cont");
		var ir2 = $("#cont").val();
		if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
			alert("내용을 입력하세요.");
			return false;
		}

		$("#frmWrite").submit();
	}
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

	function selectEmail(ele){
		var $ele = $(ele);
		var $email2 = $('input[name=email2]');

		// '1'인 경우 직접입력
		if($ele.val() == "1"){
			$email2.attr('readonly', false);
			$email2.val('');
		} else {
			$email2.attr('readonly', true);
			$email2.val($ele.val());
		}
	}
</script>

<page:applyDecorator name="menu2" />
<div class="article">	
	<div class="content">
	<!-- 컨텐츠 start -->
		<form name="frmWrite" id="frmWrite" method="post" action="${pageContext.request.contextPath}/join/joinApply.do">
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
							<input type="number" class="uni_input_text wdh100" id="bizNo1" name="bizNo1" />
							-
							<input type="number" class="uni_input_text wdh100" id="bizNo2" name="bizNo2" />
							-
							<input type="number" class="uni_input_text wdh100" id="bizNo3" name="bizNo3"/>
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
						<td  colspan="3">
							<input type="text" class="uni_input_text " name="address" id="address" onclick="execPostCode()" readonly />
							<button type="button" class="btn"
									onclick="execPostCode()">주소찾기
							</button>
							<input type="text" class="uni_input_text " name="address_dtl" id="address_dtl" placeholder="상세주소" />
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
<%--					<th colspan="4" class="txt_alcnt" scope="row">기업현황 (최근 3년)</th>--%>
<%--					<tr>--%>
<%--						<th class="txt_alcnt" scope="row">지표</th>--%>
<%--						<th class="txt_alcnt" scope="row">2019년</th>--%>
<%--						<th class="txt_alcnt" scope="row">2020년</th>--%>
<%--						<th class="txt_alcnt" scope="row">2021년</th>--%>
<%--					<tr>--%>
<%--						<th class="txt_alcnt" scope="row">매출액(백만원)</th>--%>
<%--						<td>--%>
<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
<%--						</td>--%>
<%--						<td>--%>
<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
<%--						</td>--%>
<%--						<td>--%>
<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
<%--						</td>--%>
<%--					</tr>--%>
<%--					<tr>--%>
<%--						<th class="txt_alcnt" scope="row">영업이익(백만원)</th>--%>
<%--						<td>--%>
<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
<%--						</td>--%>
<%--						<td>--%>
<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
<%--						</td>--%>
<%--						<td>--%>
<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
<%--						</td>--%>
<%--					</tr>--%>
<%--					<tr>--%>
<%--						<th class="txt_alcnt" scope="row">종업원수(명)</th>--%>
<%--						<td>--%>
<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
<%--						</td>--%>
<%--						<td>--%>
<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
<%--						</td>--%>
<%--						<td>--%>
<%--							<input type="text" class="uni_input_text" id="induty" name="induty" value="" />--%>
<%--						</td>--%>
<%--					</tr>--%>
<%--		            <tr>--%>
<%--		                <th class="txt_alcnt" scope="row">주요생산품</th>--%>
<%--		                <td colspan="3">--%>
<%--							<input  type="text" id="product"  class="form-control"  name="product"/>--%>
<%--		                </td>--%>
<%--		            </tr>--%>
					<th colspan="4" class="txt_alcnt" scope="row">담당자</th>
					<tr>
						<th class="txt_alcnt" scope="row">성명</th>
						<td>
							<input type="text" class="uni_input_text " name="name" id="name" />
						</td>
						<th class="txt_alcnt" scope="row">전화번호</th>
						<td>
							<input type="number" class="uni_input_text wdh100" id="mbphno" name="mbphno" value="" />
						</td>
					</tr>
					<tr>
						<th class="txt_alcnt" scope="row">소속부서</th>
						<td>
							<input type="text" class="uni_input_text wdh100" id="deptNm" name="deptNm" value="" />
						</td>
						<th class="txt_alcnt" scope="row">직위</th>
						<td>
							<input type="text" class="uni_input_text wdh100" id="position" name="position" value="" />
						</td>
					</tr>
					<tr>
						<th class="txt_alcnt" scope="row">이메일</th>
						<td  colspan="3">
							<input type="text" class="uni_input_text " name="email1" id="email1"  />
							@
							<input type="text" class="uni_input_text " name="email2" id="email2" value=""/>
							<select id="email3" class="uni_input_text "style="border-radius: 5px;" onclick="selectEmail(this)">
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
							<input type="number" class="uni_input_text wdh100" id="memTelNo" name="memTelNo" value="" />
						</td>
						<th class="txt_alcnt" scope="row">팩스</th>
						<td>
							<input type="number" class="uni_input_text wdh100" id="memFaxNo" name="memFaxNo" value="" />
						</td>
					</tr>
					<tr>
						<th class="txt_alcnt" scope="row">첨부서류</th>
						<td>
							파일찾기
						</td>
					</tr>
					<tr>
					<th colspan="4" class="txt_alcnt" scope="row">회원가입 정보</th>
					</tr>
					<tr>
					<th class="txt_alcnt" scope="row">사용자 ID</th>
					<td  colspan="3">
						<input type="text" class="uni_input_text " name="id" id="id"  />
					</td>
					</tr>
					<tr>
						<th class="txt_alcnt" scope="row">비밀번호</th>
						<td>
							<input type="text" class="uni_input_text wdh100" name="passwd" value="" />
						</td>
						<th class="txt_alcnt" scope="row">비밀번호 재입력</th>
						<td>
							<input type="text" class="uni_input_text wdh100" id="passwdChk" name="passwdChk" value="" />
						</td>
					</tr>
				</tbody>
		    </table>
		<div class="btn-wrap type04">
			<button type="submit" class="btn blue" >등록</button>
		    <a href="${pageContext.request.contextPath}/join/joinList.do" class="btn blue">취소</a>
		</div>
		</form>
     <!-- 컨텐츠 end -->
	</div>
</div>
	