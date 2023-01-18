$(function(){
	$("#selectSite").on("change", function(){
		//console.log($(this).val());
		$("input:hidden[name='steId']").val($(this).val());
		linkPage(1);
	});
});

function linkPage(num){
	var form = document.frmSearch;
	form.pageIndex.value = num;
	form.submit();
}

// page refresh
function fn_refresh(){
	location.reload();
}

// bbs 개별 업데이트
function fn_updateOne(seq, stat){
	
	var frm = document.getElementById('frmPost');
	frm.action = 'updateStat.do';
	if(stat == '0')
	{
		if(confirm("삭제 하시겠습니까?"))
		{
			frm.action.value= 'list';
			frm.bbsId.value = seq; 
			frm.stat.value = '0';
			frm.submit();	 
		}
	}
	else if(stat == '1')
	{
		if(confirm("복원 하시겠습니까?"))
		{
			frm.action.value= 'list';
			frm.bbsId.value = seq; 
			frm.stat.value = '1';
			frm.submit();	 
		}
	}
	else if(stat == '4')
	{
		if(confirm("완전 삭제 하시겠습니까? 완전 삭제 시 복구는 불가 합니다."))
		{
			frm.action.value= 'trash';
			frm.bbsId.value = seq; 
			frm.stat.value = '4';
			frm.submit();	 
		}
	}
	else if(stat == '9' || stat == '8')
	{
		var msg = '';
		if(stat == '8') msg = '복원 하시겠습니까?';
		if(stat == '9') msg = '임시저장 하시겠습니까?';
		
		if(confirm(msg)){
			frm.action.value= 'list';
			frm.bbsId.value = seq; 
			frm.stat.value = '9';
			frm.submit();	 
		}
	} 

}

// bbs 선택 업데이트
function fn_updateStat(stat){
	var frm = document.getElementById('frmPost');
	
	if($("input[type=checkbox]").is(":checked"))
	{
		frm.action = 'updateStat.do';
		if(stat == '0')
		{
			if(confirm("삭제 하시겠습니까?"))
			{
				frm.stat.value = stat;
				frm.submit();
			}
		}
		else if(stat == '1')
		{
			if(confirm("복원 하시겠습니까?"))
			{
				frm.stat.value = stat;
				frm.submit();
			}
		}
		else if(stat == '4')
		{
			if(confirm("완전 삭제 하시겠습니까? 완전 삭제 시 복구는 불가 합니다."))
			{
				frm.stat.value = stat;
				frm.submit();
			}
		}
	}
	else
	{
		alert("게시판을 선택해주세요.");
	}
}
