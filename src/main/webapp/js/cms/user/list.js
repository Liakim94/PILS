var ckFalg = false;

function chkAll(){
	if(ckFalg == false) {
		$("input[type=checkbox]").prop("checked",true);
		ckFalg = true;
	} else {
		$("input[type=checkbox]").prop("checked",false);
		ckFalg = false;
	}
}

function updateStat(arg){   
	if($("input[type=checkbox]").is(":checked")==true){
		
		if(arg == '0'){
			
			if(confirm("해당 사원을 삭제 하시겠습니까?")){
				$("#stat").val("N");
				$("#updateForm").submit();
			}
		}else if(arg == '2'){
			if(confirm("해당 사원을 사용정지 하시겠습니까?")){
				$("#stat").val(arg);
				$("#updateForm").submit();                                                   
			}
		}else if(arg == '1'){
			if(confirm("해당 사원을 복구 하시겠습니까?")){
				$("#stat").val("Y");
				$("#updateForm").submit();
			}
		}
	}else{
		alert("사원을 선택하세요.");       
	} 

}