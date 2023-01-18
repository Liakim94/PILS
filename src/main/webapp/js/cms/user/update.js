var chkMainDept;
$(function(){

	
	//첫번째 소속선택변경 되었을때
	$("#auth").change(function(){
		
		$("#belong").empty();        
		
		var gubun = $(this).val();     
		var auth = "";
		
		if(gubun == '협력재단'){
			auth ="0";
		}else if(gubun == '중기청' ){
			auth = "2";
		}else if(gubun == '중진공'){
			auth = "4";
		}else if(gubun == 'PM'){                     
			auth = "5";
		}
		var host = location.href.indexOf(location.host)+location.host.length;
		var root = location.href.substring(host,location.href.indexOf('/',host+1));
		$.ajax({
			type: "post"
				, dataType: "json"
				, data: {"auth": auth}
				, url : root+"/cms/user/getBelongList.do"
				, success: function(datas){
					console.log(datas.result);
					var html = "";
					$.each(datas.result,function(index,item){
						//alert(item.name);
						html = "<option value='"+item.belong_id+"' name='authCls' id='authCls'>"+item.name+"</option>";
						//console.log(html);
						$("#belong").append(html);   
						        
					});
					
					
				}              
		});
		       
	});
	
	
	$("#belong").change(function(){
		var host = location.href.indexOf(location.host)+location.host.length;
		var root = location.href.substring(host,location.href.indexOf('/',host+1));
		var belongId = $(this).val();       
		
		$.ajax({
			type: "post"
				, dataType: "json"
				, data: {"belongId": belongId}
				, url : root+"/cms/user/getBelongById.do"           
				, success: function(datas){
					console.log(datas.result.auth);
					$("#authCls").val(datas.result.auth);
					
					
				}              
		});
		
	});
	
	
	/*$.validator.addMethod("idCk",  function( value, element ) {
		return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z]).*$/.test(value);
	});*/
	$.validator.addMethod("idCk",  function( value, element ) {
		return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z]).*$/.test(value);
	});
	
	$.validator.addMethod("passwordCk",  function( value, element ) {
		return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
	});
	
	
	   
	$("#form").validate({
		ignore: "",
        rules: {
        	name:{required:true, maxlength:16},
        	id:{required:true, maxlength:20},
        	passwd:{ passwordCk:true, minlength:8, maxlength:16},
        	passwd2:{equalTo: "#strPwd"},
        	auth : {required:true},
        	belongId : {required:true},
        	email:{email:true, maxlength:50}
        },
        onkeyup:false,
        onclick:false,
        onfocusout:false,                   
        messages: {
        	name:{required:"성명을 입력하세요." , maxlength:"성명은 {0}자 이하입니다."},
        	id:{required:"아이디를 입력하세요.", idCk:"영문,숫자 조합이어야 합니다.", remote:"이미 아이디가 존재합니다.", maxlength:"아이디는 {0}자 이하입니다."},
        	passwd:{passwordCk:"영문,숫자,특수문자 조합이어야 합니다.", minlength:"비밀번호는 {0}자 이상입니다.", maxlength:"비밀번호는 {0}자 이하입니다."},
        	passwd2:{ equalTo:"비밀번호가 일치하지 않습니다."},
        	auth : {required :"소속을 선택하세요."},
        	belongId : {required:"소속을 선택하세요."},
        	email:{email:"이메일 형식에 맞지 않습니다." ,maxlength:"이메일은 {0}자 이하입니다."}
        },        
        submitHandler: function (frm) {
           	
        	frm.submit();
        	
        	
        },
        showErrors:function(errorMap, errorList){
			if(!$.isEmptyObject(errorList)){
		       	$.each(errorList, function() {
                	//alert(this.message); //summary += " * " + this.message + "<br>" ;
		       		$("#alert").html(this.message);
                	$('#modalAlert').modal('show');
                	return false;
            	});
		       	//this.defaultShowErrors();
			}
		}
    });
	
	$('#modalDeptOnlyList').on('shown.bs.modal', function () {
		getDeptList();
	});
	
	$('#modalDeptOnlyList').on('hidden.bs.modal', function () {
		$('#deptList').jstree("destroy");
	});
	
	getDeptList();
});


function chkId(){
	var regID = /^[a-zA-z0-9][a-zA-z0-9]{7,20}$/gi;
	if($("#strEmpId").val() == ''){         
		$("#alert").html("아이디를 입력하세요.");
    	$('#modalAlert').modal('show');
		return false;
	}else if(!regID.test($("#strEmpId").val())){
		$("#alert").html("아이디는 8자이상 20자 미만 입니다.");
    	$('#modalAlert').modal('show');
		return false;
	}
	var host = location.href.indexOf(location.host)+location.host.length;
	var root = location.href.substring(host,location.href.indexOf('/',host+1));
	$.ajax({
		type: "post"
			, dataType: "json"
			, data: {"id": $("#id").val()}
			, url : root+"/cms/user/checkId.do"
			, success: function(datas){
				if(datas.result == '0'){
					alert("사용가능한 아이디 입니다");
					$("#checkUsrId").val("Y");
				}else{
					alert("이미 존재하는 아이디 입니다");
				}
			}              
	});
}
function chgId(arg){
	$("#checkUsrId").val(arg);
}
function getDeptList(){
	var host = location.href.indexOf(location.host)+location.host.length;
	var root = location.href.substring(host,location.href.indexOf('/',host+1));
	$.ajax({
		url : root+"/cms/dept/getDeptList.do"
		, dataType : "json"
	}).done(function(data) {
		$('#deptList').jstree({
			"core" : {
				'check_callback': true
				, 'data' : data
			},
			"conditionalselect" : function (node, event) {
			      return false;
			},
			"types":{
				"root":{
					"icon" : "fa fa-building"
				},
				"folder":{
					"icon" : "fa fa-folder-o"
				},
				"delete":{
					"icon" : "fa fa-folder"
				},
				"default":{
					"icon" : "fa fa-folder-o"
				}
			},
			"plugins" : ["types" ]
		}).on('changed.jstree', function(e, data) {
			//console.log(data);
			
		}).on('loaded.jstree', function(e, data) {
			$('#deptList').jstree('open_all');
		})
	});
}

function getSelectedDeptId(){
	var selected_ids = [];
	var selected_txts = [];
	var selected_idx = $("#deptList").jstree('get_selected', true);
	$.each(selected_idx, function(index, values){
		selected_ids.push(selected_idx[index].id);
		selected_txts.push(selected_idx[index].text);
	});
	
	if(selected_ids.length > 0){
		
		for(var i = 0; i < selected_ids.length; i++){
			//기존부서 존재여부
			var isDept = false;
			if($("#strDept option").size() > 0){
				for(var j = 0; j < $("#strDept option").size(); j++){
					if(selected_ids[i] == $("#strDept option").eq(j).val()){
						isDept = true;
					}
				}
			}
			if(!isDept)
			$("#strDept").append('<option value="'+selected_ids[i]+'" aria-name="'+selected_txts[i]+'" aria-main-dept="N">'+selected_txts[i]+'</option>');
		}
		
		$('#modalDeptOnlyList').modal("hide");
		
	}else{
		$("#alert").html("최소 1개 이상의 부서를 선택하세요.");
    	$('#modalAlert').modal('show');
	}
}

function setDeptDelete(){
	var selected_ids = [];
	$("#strDept option:selected").each(function()
	{
	    selected_ids.push($(this).val());
	});
	
	for(var i = 0; i < selected_ids.length; i++){
		$("#strDept option[value='"+selected_ids[i]+"']").remove();
	}
}

function setMainDept(){
	if($("#strDept option:selected").length == 0){
		$("#alert").html("대표부서를 선택하세요.");
    	$('#modalAlert').modal('show');
	}else if($("#strDept option:selected").length > 1){
		$("#alert").html("대표부서는 하나만 지정가능합니다.");
    	$('#modalAlert').modal('show');    
	}else{
		$("#strDept option").each(function()
		{
		    $(this).text($(this).attr("aria-name"));
		    $(this).attr("aria-main-dept", "N");
		});
		$("#strDept option:selected").text($("#strDept option:selected").attr("aria-name")+"[대표부서]").attr("aria-main-dept","Y");
	}
}
