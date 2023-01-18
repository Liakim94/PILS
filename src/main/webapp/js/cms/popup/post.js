$(function(){
	
	//삭제
	$(".delPoint").on("click", function() {
		
		var toStat = $("#stat").val();
		var transStat = "";
		var txt = "";
		
		if(toStat == "1" || toStat == "9") {
			transStat = "trash";
			txt = "휴지통으로 보내시겠습니까?";
		}else if(toStat == "0"){
			transStat = "trashR";
			txt = "영구삭제 하시겠습니까?";
		}
		
		if (confirm(txt)) {
			location.href = "statChange.do?chkNo=" + $("#seq").val() + "&action=" + transStat;
		}
	});
	
	
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
	$("#siteLogo").val(a);	
	var hostIndex = location.href.indexOf(location.host)+location.host.length;
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
	//html += '<span class="pull-left thumbnail-box-80"><img src="'+contextPath+'/common/getPopupImg.do?imgFileNm='+item.svFileNm+'&imgUrlAddr=/'+uploadPath+item.filePath+'" class="image-responsive img-thumbnail thumbnail-box-80"/></span>';	
	var imgUrl = contextPath+"/common/getPopupImg.do?imgFileNm="+d+"&imgUrlAddr=/"+uploadPath+c;
	//alert(imgUrl);
	
	//$("#logo-img").attr("src", "/"+uploadPath+c+'/'+d);
	$("#logo-img").attr("src", imgUrl);
	$("#logo-img-name").text(b);
	$("#logo-img-size").text(getBytes(e));
	$("#logo-img-box").removeClass("hidden");
	
	$("#mediaModal").modal('hide');
	
}


function popsubmit(stat) {
	
	if($("#site-id option:selected").val() == "") {
		alert("사이트를 선택해주세요.");			
		return;
	}
	
	if($("#popNm").val().length < 1) {
		alert("팝업명을 입력해주세요.");
		$("#popNm").focus();
		return;
	}
	
	if($("#datePublish").val().length < 1) {
		alert("게시기간을 선택해주세요.");
		$("#datePublish").focus();
		return;
	}
	
	if($("#popSize").val().length < 1) {
		alert("팝업크기를 입력해주세요.");
		$("#popSize").focus();
		return;
	}
	
	if($("#popPosition").val().length < 1) {
		alert("팝업위치를 입력해주세요.");
		$("#popPosition").focus();
		return;
	}
	
	
	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);
	
	//게시기간
	var datePublish = $("#datePublish").val();
	var datePublishArr = datePublish.replace(/ /g, '').split("~");
	postForm.strDT.value = datePublishArr[0].replace(/-/g, '');
	postForm.endDT.value = datePublishArr[1].replace(/-/g, '');
	
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
	
	if($("#site-id option:selected").val() == "") {
		alert("사이트를 선택해주세요.");			
		return;
	}
	
	if($("#popNm").val().length < 1) {
		alert("팝업명을 입력해주세요.");
		$("#popNm").focus();
		return;
	}
	
	if($("#datePublish").val().length < 1) {
		alert("게시기간을 선택해주세요.");
		$("#datePublish").focus();
		return;
	}
	
	if($("#popSize").val().length < 1) {
		alert("팝업크기를 입력해주세요.");
		$("#popSize").focus();
		return;
	}
	
	if($("#popPosition").val().length < 1) {
		alert("팝업위치를 입력해주세요.");
		$("#popPosition").focus();
		return;
	}
	
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
	
	if(btn == "1") {
		postForm.stat.value = "1";
	}else {
		postForm.stat.value = stat;
	}
	
	$("input:hidden[name='tgt']").val($("#strTgt").text());
	
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