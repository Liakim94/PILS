function linkPage(num){
	var form = document.frmSearch;
	form.pageIndex.value = num;
	form.submit();
}

$(document).ready(function() {
	
	//휴지통 & 복원
	$(".moveTo").on("click", function() {
		
		if($("input[type=checkbox]").is(":checked")==true){
			
			var msg = "";
			var stat = $(this).attr("value");
			
			if(stat == "trash") {
				msg = "휴지통으로 보내시겠습니까?";
			}else if(stat == "trashR"){
				msg = "영구삭제 하시겠습니까?";
			}else {
				msg = "복원 하시겠습니까?";
			}
			
			if (confirm(msg)) {
				changeStatus($(this).attr("value"));
			}
		}
	});
	
	$("#selectSite").on("change", function(){
		//console.log($(this).val());
		$("input:hidden[name='steId']").val($(this).val());
		linkPage(1);
	});
});

	//페이징
	function linkPage(num){
		var form = document.frmSearch;
		form.pageIndex.value = num;
		form.submit();
	}
	
	function changeStatus(val) {
		var form = document.statChange;
		form.action.value = val;
		form.submit();
	}
	
	function hotStatus(stat, val) {
		var transStat = "";
		
		if(stat == "1" || stat == "9") {
			transStat = "trash";
		}else if(stat == "0"){
			transStat = "trashR";
		}else if(stat == "99") {
			transStat = "restore";
		}
		
		if(transStat == "trash") {
			msg = "휴지통으로 보내시겠습니까?";
		}else if(transStat == "trashR") {
			msg = "영구삭제 하시겠습니까?";
		}else if(transStat == "restore") {
			msg = "복원 하시겠습니까?";
		}
		
		if (confirm(msg)) {
			location.href="statChange.do?action=" + transStat + "&chkNo=" + val;
		}
	}