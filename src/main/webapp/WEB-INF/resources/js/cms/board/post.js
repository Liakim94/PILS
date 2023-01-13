
// board submit
function fn_submit(stat){

	var frm = document.getElementById('frmPost');

	if( frm.title.value == "" )  {
		alert("제목 입력하세요.");
		$(this).getById["title"].exec("FOCUS"); //포커싱
		return false;
	}

	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);

	var ir1 = $("#cont").val();
	if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
		alert("내용을 입력하세요.");
		oEditors.getById["cont"].exec("FOCUS"); //포커싱
		return false;
	}

	if(stat == '1'){
		// if(confirm("등록하시겠습니까?")){
			frm.stat.value = stat;
			$("#frmPost").submit();
		// }
	} else{
		if(confirm("임시저장 하시겠습니까?")){
			frm.stat.value = stat;
			$("#frmPost").submit();
		}
	}
}




