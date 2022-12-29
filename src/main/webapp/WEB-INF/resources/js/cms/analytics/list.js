$(function(){
	 $('.range-dt').daterangepicker({
		 format: 'YYYYMMDD'
	 });
});

function linkPage(num){
	var form = document.frmSearch;
	form.pageIndex.value = num;
	form.submit();
}

function searchReset(){
	$(".range-dt").val("");
}

function siteChange(){
	document.siteFrom.submit();
}

function menuChange(){
	document.menuForm.submit();
}

function ckEd(vals) {
	if(vals != 0) {
		$("#condition").val(vals);
	}else {
		$("#condition").val("");
	}
	
	document.frmSearch.submit();
}

function fnCon(vals) {
	$("#ctgr").val(vals);
	document.frmSearch.submit();
}



