function linkPage(num){
	var form = document.frmSearch;
	form.pageIndex.value = num;
	form.submit();
}