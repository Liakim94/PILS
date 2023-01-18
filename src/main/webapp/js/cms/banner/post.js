$(function(){
	
	//링크 선택
	/*$(".toLink").on("click", function() {
		
		var tgt = $(this).attr("value");
		$("#tgt").text(tgt);
		$("#getTgt").val(tgt);
		
		$(".dropdown-menu > li").removeClass("active");
		$(this).addClass("active");
		
	});*/
	
	$('.range-dt').daterangepicker({
		 format: 'YYYY-MM-DD',
		 separator : ' ~ '
	 });
	
	//휴지통 & 복원
	$(".moveTo").on("click", function() {
		
		if($("input[type=checkbox]").is(":checked")==true){
			
			var msg = "";
			var stat = $(this).attr("value");
			
			if(stat == "trash") {
				msg = "휴지통으로 보내시겠습니까?";
			}else if(stat == "trashR") {
				msg = "영구삭제 하시겠습니까?";
			}else {
				msg = "복원 하시겠습니까?";
			}
			
			if (confirm(msg)) {
				var form = document.statChange;
				form.action.value = $(this).attr("value");
				form.submit();
			}
		}
	});
	
	$("#selectSite").on("change", function(){
		//console.log($(this).val());
		$("input:hidden[name='steId']").val($(this).val());
		linkPage(1);
	});
	
});

function setLogo(a, b, c, d, e){
	$("#strLogoName").val(b);
	$("#bannerImg").val(a);
	
	$("#logo-img").attr("src", "/"+uploadPath+c+'/'+d);
	$("#logo-img-name").text(b);
	$("#logo-img-size").text(getBytes(e));
	$("#logo-img-box").removeClass("hidden");
	
	$("#mediaModal").modal('hide');
	
}

function editsubmit(stat) {
	
	if($("#site-id option:selected").val() == "") {
		alert("사이트를 선택해주세요.");			
		return;
	}

	if($("#bnrNm").val().length < 1) {
		alert("배너명을 입력해주세요.");
		$("#bnrNm").focus();
		return;
	}
	
	if($("#datePublish").val().length < 1) {
		alert("게시기간을 선택해주세요.");
		$("#datePublish").focus();
		return;
	}
	
	if($("#toUrl").val().length < 1) {
		alert("링크URL을 입력해주세요.");
		$("#toUrl").focus();
		return;
	}
	
	if($("#getTgt").val() == "" ) {
		alert("타겟을 선택해주세요.");
		return;
	}
	
	//게시기간
	var datePublish = $("#datePublish").val();
	var datePublishArr = datePublish.replace(/ /g, '').split("~");
	postForm.strDT.value = datePublishArr[0];
	postForm.endDT.value = datePublishArr[1];
	
	$("input:hidden[name='tgt']").val($("#strTgt").text());
	
	postForm.stat.value = stat;
	
	document.postForm.submit();
	
}

function popsubmit(stat) {
	
	if($("#site-id option:selected").val() == "") {
		alert("사이트를 선택해주세요.");			
		return;
	}
	
	if($("#bnrNm").val().length < 1) {
		alert("배너명을 입력해주세요.");
		$("#bnrNm").focus();
		return;
	}
	
	if($("#datePublish").val().length < 1) {
		alert("게시기간을 선택해주세요.");
		$("#datePublish").focus();
		return;
	}
	
	if($("#toUrl").val().length < 1) {
		alert("링크URL을 입력해주세요.");
		$("#toUrl").focus();
		return;
	}
	
	if($("#getTgt").val() == "" ) {
		alert("타겟을 선택해주세요.");
		return;
	}
	
	//게시기간
	var datePublish = $("#datePublish").val();
	var datePublishArr = datePublish.replace(/ /g, '').split("~");
	postForm.strDT.value = datePublishArr[0];
	postForm.endDT.value = datePublishArr[1];

	
	$("input:hidden[name='tgt']").val($("#strTgt").text());
	
	postForm.stat.value = stat;
	
	document.postForm.submit();
	
}



//페이징
function linkPage(num){
	var form = document.frmSearch;
	form.pageIndex.value = num;
	form.submit();
}

//사용중 휴지통 이동
function goStat(stat) {
	location.href="list.do?action="+stat;
}


function popEdit(stat, btn) {
	
	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);
	
	//게시기간
	var datePublish = $("#datePublish").val();
	var datePublishArr = datePublish.replace(/ /g, '').split("~");
	postForm.strDT.value = datePublishArr[0];
	postForm.endDT.value = datePublishArr[1];
	
	//팝업크기
	var popSize = $("#popSize").val();
	var popSizeArr = popSize.replace("_", "").replace(/ /g, '').split("X");
	postForm.popW.value = popSizeArr[0];
	postForm.popH.value = popSizeArr[1];
	
	//팝업위치
	var popPosition = $("#popPosition").val();
	var popPositionArr = popPosition.replace("_", "").replace(/ /g, '').split("X");
	postForm.popX.value = popPositionArr[0];
	postForm.popY.value = popPositionArr[1];
	
	$("input:hidden[name='tgt']").val($("#strTgt").text());
	
	if(btn == "1") {
		postForm.stat.value = "1";
	}else {
		postForm.stat.value = stat;
	}
	
	document.postForm.submit();
	
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