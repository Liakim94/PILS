$(document).ready(function() {
	$("#steSelector").on("change", function() {
		$("#steId").val($(this).val());
		document.frmSearch.submit();
	});
	//엑박처리

	
   $(".noImg > img").each(function(n){
       $(this).error(function(){
         $(this).attr("src", "/images/front/no-img.jpg");
       });
    });
	
	
	$("#detailViewCtl").on("click", function() {
		$("input[name=position]").val("D");
		$("#photoView").hide();
		$("#detailView").show();
		$("#photoViewCtl").removeClass("active");
		$("#detailViewCtl").addClass("active");
		$("input[name=chkNo]:checkbox").prop("checked", false);
	});
	
	$("#photoViewCtl").on("click", function() {
		$("input[name=position]").val("P");
		$("#photoView").show();
		$("#detailView").hide();
		$("#detailViewCtl").removeClass("active");
		$("#photoViewCtl").addClass("active");
		$("input[name=chkNo]:checkbox").prop("checked", false);
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
	
});

//페이징
function linkPage(num){
	var form = document.frmSearch;
	form.pageIndex.value = num;
	form.submit();
}

//리로드
function mediaReload() {
	location.href="list.do?action="+$("#action").val() + "&position=" + $("#position").val();
}

//수정페이지이동
function goEdit(url) {
	 location.href="edit.do?mdaSeq="+url + "&action=" + $("#action").val() + "&position="+$("#position").val();
}

//사용중 휴지통 이동
function goStat(stat) {
	location.href="list.do?action="+stat+"&position="+$("#position").val();
}

function hotStatus(stat, val) {
	var transStat = "";
	
	if(stat == "Y") {
		transStat = "trash";
	}else if(stat == "N"){
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
		location.href="statChange.do?action=" + transStat + "&chkNo=" + val + "&position=P";
	}
	
}

function setLogo(a, b, c, d, e){
	$("#strLogoName").val(b);
	$("#siteLogo").val(a);
	
	
	$("#logo-img").attr("src", "/"+uploadPath+c+'/'+d);
	$("#logo-img-name").text(b);
	$("#logo-img-size").text(getBytes(e));
	$("#logo-img-box").removeClass("hidden");
	
	$("#mediaModal").modal('hide');
	
}


