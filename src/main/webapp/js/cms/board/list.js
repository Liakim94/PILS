function linkPage(num){
	var form = document.frmSearch;
	form.pageIndex.value = num;
	form.submit();
}

// page refresh
function fn_refresh(){
	location.reload();
}

// board 선택 업데이트
function fn_updateStat(stat){
	var frm = document.getElementById('frmPost');
	
	if($("input[type=checkbox]").is(":checked"))
	{
		frm.action = 'updateStat.do';
		if(stat == '0')
		{
			if(confirm("삭제 하시겠습니까?"))
			{
				frm.action.value = 'trash';
				frm.stat.value = stat;
				frm.submit();
			}
		}
		else if(stat == '1')
		{
			if(confirm("복원 하시겠습니까?"))
			{
				frm.stat.value = '9';
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
		alert("게시물을 선택해주세요.");
	}
}


$(function(){
	
	$('#selectBbs').on('select2:select', function (e) 
	{
	    var data = e.params.data.id;
	    $.ajax(
	  		{
	    	url : "./getBbsOpt.do",
	    	type : "json",
	    	data : 
	    	{
	    		bbsId : data
	    	},
	    	method : "post",
			success : function(data){
				var rs = data.rs;
				location.href='./list.do?bbsId='+rs.bbsId;
			},
			 error : function(error) {
				 location.href='./list.do';
		    }

	    });
	});
	
});