var ckFalg = false;

function ch(){
	if(ckFalg == false) {
		$("input[type=checkbox]").prop("checked",true);
		ckFalg = true;
	} else {
		$("input[type=checkbox]").prop("checked",false);
		ckFalg = false;
	}
}

function userStat(str){
	if($("input[type=checkbox]").is(":checked")){
		if(confirm("회원 상태를 변경하시겠습니까?")){
			$("#gubun").val(str);
			document.frmStat.submit();
		}
	}else{
		alert("상태를 변경할 회원을 체크해주세요.");
	}
	
}


$(function(){

	$("#steSelector").on("change", function() {
		$("#steId").val($(this).val());
		document.frmSearch.submit();
	});
	
	$("#btnGrpD").on("click", function(){
		
	});
	
	$("#statSelector").on("change", function() {
		$("#setStat").val($(this).val());
		document.frmSearch.submit();
	});
});

function linkPage(num){
	var form = document.frmSearch;
	form.pageIndex.value = num;
	form.submit();
}