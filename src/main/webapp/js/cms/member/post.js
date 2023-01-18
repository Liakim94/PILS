
var regPWD = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

$(function(){
	
	$("#form").validate({
		ignore: "",
        rules: {
        	steId:{required:true},
        	memNm:{required:true},
			grpSeq:{required:true},
			memId:{required:true, idChk:true},
			idCkAt:{required:true, equalTo:"#id"},
			memPwd:{required:true, pwChk:true},
			pwdChk:{required:true, equalTo:"#pw"},
			tel:{required:true},
			email:{required:true, email:true},
			gend:{required:true},
			zip:{required:true},
			addr2:{required:true}
        },
        onkeyup:false,
        onclick:false,
        onfocusout:false,                   
        messages: {
        	steId:{required:"사이트를 선택하세요."},
        	memNm:{required:"회원명을 입력하세요."},
			grpSeq:{required:"회원 등급을 선택하세요."},
			memId:{required:"아이디를 입력하세요.", idChk:"아이디는 영문,숫자 6~16자리 조합이어야합니다."},
			idCkAt:{required:"중복확인을 해주세요.", equalTo:"중복확인을 해주세요."},
			memPwd:{required:"비밀번호를 입력하세요.", pwChk:"비밀번호는 영문,숫자,특수문자 8~16자리 조합이어야 합니다."},
			pwdChk:{required:"비밀번호 확인을 하세요.", equalTo:"비밀번호가 일치하지 않습니다."},
			tel:{required:"전화번호를 입력하세요."},
			email:{required:"이메일을 입력하세요.", email:"이메일 형식이 올바르지 않습니다."},
			gend:{required:"성별을 선택하세요."},
			zip:{required:"우편번호를 검색하세요."},
			addr2:{required:"상세주소를 입력하세요."}
        },        
        submitHandler: function (frm) {
        	frm.submit();
        },
        showErrors:function(errorMap, errorList){
        	if(!$.isEmptyObject(errorList)){
		       	$.each(errorList, function() {
                	alert(this.message); 
                	//$('#modalAlert').modal('show');
                	return false;
            	});
		       	//this.defaultShowErrors();
			}
		}
    });
	
	
	$.validator.addMethod("idChk",  function( value, element ) {
		return this.optional(element) ||  /^[a-zA-z0-9][a-zA-z0-9]{5,15}$/gi.test(value);
	});
	
	$.validator.addMethod("pwChk",  function( value, element ) {
		return this.optional(element) ||  /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/.test(value);
	});
	
	/*
	$("#pw").keyup(function(){
		if(!regPWD.test($.trim($(this).val()))){
			$("#pwText").text("패스워드는 영문,숫자,특수문자 조합으로 8-16 자리로 설정해주세요.");
			$("#pwText").css("color", "red");
		}else{
			$("#pwText").text("사용가능한 패스워드 입니다.");
			$("#pwText").css("color", "blue");
		} 
	});
	
	$("#pwdCh").keyup(function(){
		if($.trim($("#pw").val()) != $.trim($(this).val()) ){
			$("#pwdChText").text("패스워드가 일치 하지 않습니다.");
			$("#pwdChText").css("color", "red");
		}else if($.trim($("#pw").val()) == $.trim($(this).val()) ){
			$("#pwdChText").text("일치하는 패스워드입니다.");
			$("#pwdChText").css("color", "blue");
		}
	});*/
	
	$("#statChange").on("click", function(){
		var arrChk = new Array();
		if(!$("input[type=checkbox]").is(":checked")){
			alert("등급을 변경할 회원을 선택해주세요.");
		}else{
			$("input[type=checkbox]:checked").each(function(){
				arrChk.push($(this).val());
			});
			$("#chkstat").val(arrChk);
			if($(".mini-grp").is(":checked")){
				if(confirm("정말 변경하시겠습니까?")){
					document.statchage.submit();
				}
			}else{
				alert("변경할 등급을 선택해주세요.")
			}
		}
		
		
	});
	
	$("#form2").validate({
		ignore: "",
        rules: {
        	memNm:{required:true},
			grpSeq:{required:true},
			memPwd:{pwChk:true},
			pwdChk:{equalTo:"#pw"},
			tel:{required:true},
			email:{required:true, email:true},
			gend:{required:true},
			zip:{required:true},
			addr2:{required:true}
        },
        onkeyup:false,
        onclick:false,
        onfocusout:false,                   
        messages: {
        	memNm:{required:"회원명을 입력하세요."},
			grpSeq:{required:"회원 등급을 선택하세요."},
			memPwd:{pwChk:"비밀번호는 영문,숫자,특수문자 8~16자리 조합이어야 합니다."},
			pwdChk:{equalTo:"비밀번호가 일치하지 않습니다."},
			tel:{required:"전화번호를 입력하세요."},
			email:{required:"이메일을 입력하세요.", email:"이메일 형식이 올바르지 않습니다."},
			gend:{required:"성별을 선택하세요."},
			zip:{required:"우편번호를 검색하세요."},
			addr2:{required:"상세주소를 입력하세요."}
        },        
        submitHandler: function (frm) {
        	frm.submit();
        },
        showErrors:function(errorMap, errorList){
        	if(!$.isEmptyObject(errorList)){
		       	$.each(errorList, function() {
                	alert(this.message); 
                	//$('#modalAlert').modal('show');
                	return false;
            	});
		       	//this.defaultShowErrors();
			}
		}
    });
});


function idCheck(){// 정규식 에러~~
	var regID = /^[a-zA-z0-9][a-zA-z0-9]{5,15}$/gi;
	var id;
	var host = location.href.indexOf(location.host)+location.host.length;
	var root = location.href.substring(host,location.href.indexOf('/',host+1));
	
	if($.trim($("#id").val()) == ""){
		alert("아이디를 입력해주세요.");
		$("#id").focus();
	}else if(!regID.test($("#id").val())){
		$("#id").focus();
		alert("아이디는 영문, 숫자 조합으로 6~16 글자로 설정하세요.");
	}else{
		id = $("#id").val();
		$.ajax({
			type: "post"
				, dataType: "json"
				, data: {"memId":id}
				, url : root+"/cms/member/idCheck.do"
				, success: function(datas){
					if(datas.result == '0'){
						alert("사용가능한 아이디 입니다.");
						$("#idAt").val(id); 
					}else{
						alert("이미 사용중인 아이디입니다.");
						$("#idAt").val("");
					}
				} 
		});
	}
	
}

function memSubmit(){
	
}