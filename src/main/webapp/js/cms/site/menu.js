var SITE_ID = "";
var isAllChecked = true;
$(function(){
	$("#site-id").on("change", function(){
		var id = $("#site-id option:selected").val();
		
		//$("form").reset();
		$('form').each(function(){
		    this.reset();
		  });
		
		$("button[type='submit']").addClass("disabled");
		//$("input[type='checkbox'][name^='chk_']").attr("checked", false).addClass("disabled").parent().addClass("disabled");
		//$("input[type='checkbox'][name^='chk_']").parent().removeClass("active");
		$('input[type="checkbox"].minimal').removeAttr("checked").iCheck("update");
		$('input[type="checkbox"].minimal').iCheck("disable");
		
		
		if(id != "") {
			SITE_ID = id;
			$('#menuList').jstree('destroy');
			getMenuList("menuList", id);
		}else{
			$('#menuList').jstree('destroy').empty();
		}
		
	});
	
	$(".pgm-ctgr li a").on("click", function(){
		setProgram($(this).parent().index());
		$("#strPgmCtgr").text($(this).text());
	});
	
	$("#frmAuth").validate({
		ignore: "",
        rules: {
        	//pgmPath:{required:true}
        },
        onkeyup:false,
        onclick:false,
        onfocusout:false,
        messages: {
        	//pgmPath:{required:"프로그램 경로를 입력하세요"},
        },        
        submitHandler: function (frm) {
        	frm.steId.value = SITE_ID;
        	frm.mnuId.value =  $("#intMenuId").val();
        	
        	setAuth();
        	
        },
        showErrors:function(errorMap, errorList){
			if(!$.isEmptyObject(errorList)){
		       	$.each(errorList, function() {
                	alert(this.message); //summary += " * " + this.message + "<br>" ;
                	return false;
            	});
			}
		}
    });
	
	
	$("#frmDefault").validate({
		ignore: "",
        rules: {
        	mnuNm:{required:true}
        },
        onkeyup:false,
        onclick:false,
        onfocusout:false,
        messages: {
        	mnuNm:{required:"메뉴명을 입력하세요"}
        },        
        submitHandler: function (frm) {
        	if($("#strOpenAt").is(':checked')) frm.openAt.value="Y";
			else frm.openAt.value="N";
        	
        	if($("#strTopAt").is(':checked')) frm.topAt.value="Y";
			else frm.topAt.value="N";
        	
        	setMenuDefault();
        },
        showErrors:function(errorMap, errorList){
			if(!$.isEmptyObject(errorList)){
		       	$.each(errorList, function() {
                	alert(this.message); //summary += " * " + this.message + "<br>" ;
                	return false;
            	});
			}
		}
    });

	$("#frmChg").validate({
		ignore: "",
        rules: {
        	//chgNm:{required:true}
        },
        onkeyup:false,
        onclick:false,
        onfocusout:false,
        messages: {
        	//chgNm:{required:"담당자명을 입력하세요"},
        },        
        submitHandler: function (frm) {
        	frm.steId.value = SITE_ID;
        	frm.mnuId.value =  $("#intMenuId").val();
        	
        	if($("#strChgAt").is(':checked')) frm.chgAt.value="Y";
			else frm.chgAt.value="N";
        	
        	if($("#strGradeAt").is(':checked')) frm.grdAt.value="Y";
			else frm.grdAt.value="N";
        	
        	setMenuCharge();
        },
        showErrors:function(errorMap, errorList){
			if(!$.isEmptyObject(errorList)){
		       	$.each(errorList, function() {
                	alert(this.message); //summary += " * " + this.message + "<br>" ;
                	return false;
            	});
			}
		}
    });
	
	$("#frmProgram").validate({
		ignore: "",
        rules: {
        	pgmPath:{required:true}
        },
        onkeyup:false,
        onclick:false,
        onfocusout:false,
        messages: {
        	pgmPath:{required:"프로그램 경로를 입력하세요"},
        },        
        submitHandler: function (frm) {
        	frm.steId.value = SITE_ID;
        	frm.mnuId.value =  $("#intMenuId").val();
        	frm.pgmTgt.value = $("#strPgmTgt").text();
        	setMenuProgram();
        },
        showErrors:function(errorMap, errorList){
			if(!$.isEmptyObject(errorList)){
		       	$.each(errorList, function() {
                	alert(this.message); //summary += " * " + this.message + "<br>" ;
                	return false;
            	});
			}
		}
    });
	
	
	
	
	
	/*모달*/
	$('#boardModal').on('shown.bs.modal', function (e) {
		if(SITE_ID === "" || $("#intMenuId").val() === ""){
			$('#boardModal').modal('hide');
		}else{
			//게시판 목록
			getBbsList();
		}
	});
	
	$('#boardModal').on('hidden.bs.modal', function (e) {
		if($("#strContTyp").val() == ''){
			$('#strPgmAt').val('');
			$('#strPgmCtgr').text("선택");
			$("#strPgmPath").attr("readonly", true);
		}
	});
	
	$('#contModal').on('shown.bs.modal', function (e) {
		
		if(SITE_ID === "" || $("#intMenuId").val() === ""){
			$('#contModal').modal('hide');
		}else{
			getConList();
		}
	});
	
	$('#contModal').on('hidden.bs.modal', function (e) {
		if($("#strContTyp").val() == ''){
			$('#strPgmAt').val('');
			$('#strPgmCtgr').text("선택");
			$("#strPgmPath").attr("readonly", true);
		}
	});
	
	
	
	
	
	$('#auth-list li input[type="checkbox"].minimal').on("ifChecked", function(event){
		console.log($(this).val());
		var name = $(this).attr("name");
		if($(this).val() === 'A'){
			//$(this).siblings().iCheck("check");
			isAllChecked = true;			
			$('input[type="checkbox"][name="'+name+'"]').iCheck("check");
		}else{
			var r, w, x;
			r = $('input[type="checkbox"][name="'+name+'"][value="R"]');
			w = $('input[type="checkbox"][name="'+name+'"][value="W"]');
			x = $('input[type="checkbox"][name="'+name+'"][value="X"]');
			
			
			if($(r).is(":checked") && $(w).is(":checked") && $(x).is(":checked")){
				$('input[type="checkbox"][name="'+name+'"][value="A"]').iCheck("check");
			}
		}
	});
	
	$('#auth-list li input[type="checkbox"].minimal').on("ifUnchecked", function(event){
		console.log(isAllChecked);
		var name = $(this).attr("name");
		if($(this).val() === 'A' && isAllChecked == true){
			$('input[type="checkbox"][name="'+name+'"]').iCheck("uncheck");
		}else{
			//isAllChecked = false;
			$('input[type="checkbox"][name="'+name+'"][value="A"]').iCheck("uncheck");
		}
	});
	
});

function menuCreate(id) {
	var ref = $('#'+id).jstree(true),
		sel = ref.get_selected();
	if(!sel.length) { 
		alert("상위메뉴를 선택하세요");
		return false; 
	}
	sel = sel[0];
	sel = ref.create_node(sel, {"type":"menu"});
	if(sel) {
		ref.edit(sel);
	}
};

function menuRename(id) {
	var ref = $('#'+id).jstree(true),
		sel = ref.get_selected();
	if(!sel.length) { 
		alert("메뉴를 선택하세요");
		return false; 
	}
	sel = sel[0];
	if(sel > 1){
		ref.edit(sel);
	}
};

function menuDelete(id) {
	var ref = $('#'+id).jstree(true),
		sel = ref.get_selected(),
		node = ref.get_node(sel);
	
	if(!sel.length) { return false; }
	//console.log(ref.get_node(sel));
	//ref.delete_node(sel);
	if(sel > 1){
		setMenuUpdateStatus(node);		
	}
};




function getMenuList(id, site_id){
	$.ajax({
		url : pageContext+"/cms/site/getMenuList.do"
		, method:'POST'
		, dataType : "json"
		, data : {steId : site_id}
	}).done(function(data) {
		$('#'+id).jstree({
			"core" : {
				'check_callback': true
				, "multiple" : false
				, 'data' : data
			},
			"contextmenu": {items:customMenu},
			"types":{
				"root":{
					"icon" : "fa fa-home"
				},				
				"menu":{
					"icon" : "fa fa-folder-o"
				},
				"delete":{
					"icon" : "fa fa-folder"
				},
				"default":{
					"icon" : "fa fa-folder-o"
				}
			},
			/*"sort": function (a, b) {
	            var nodeA = this.get_node(a);
	            var nodeB = this.get_node(b);
	            
	            console.log(nodeA.original.sort+","+nodeB.original.sort);
	            
            	return (nodeA.original.sort > nodeB.original.sort) ? 1:-1;
	          
	        },*/
			"plugins" : ["types","search", "contextmenu", "dnd" ]
		}).on('changed.jstree', function(e, data) {
			
			//console.log(data);
		}).on('loaded.jstree', function(e, data) {
			//console.log(data);
			$('#'+id).jstree('open_all');			
		}).on('open_node.jstree', function(e, data) {
			//console.log("open");
			/*if(data.node.id > 1){
				if(data.node.type === 'delete'){
					$('#' + data.node.id).find('i.jstree-icon.jstree-themeicon').first()
			        .removeClass('fa fa-folder').addClass('fa fa-folder-open');
				}else{
					$('#' + data.node.id).find('i.jstree-icon.jstree-themeicon').first()
			        .removeClass('fa fa-folder-o').addClass('fa fa-folder-open-o');
				}
			}*/
		}).on('close_node.jstree', function(e, data) {
			/*if(data.node.id > 1){
				if(data.node.type === 'delete'){
					$('#' + data.node.id).find('i.jstree-icon.jstree-themeicon').first()
			        .removeClass('fa fa-folder-open').addClass('fa fa-folder');
				}else{
					$('#' + data.node.id).find('i.jstree-icon.jstree-themeicon').first()
			        .removeClass('fa fa-folder-open-o').addClass('fa fa-folder-o');
				}
			}*/
		}).on('select_node.jstree', function(e, data) {
			var evt =  window.event || e;
			var button = evt.which || evt.button;
			if(button == 1){
				//location.href="?deptNo="+data.node.id;
				var status = data.node.type;
				setButtonMenu(status);
				
				//$("input[type='checkbox'][name^='chk_']").attr("checked", false).removeClass("disabled").parent().removeClass("disabled");
				//$("input[type='checkbox'][name^='chk_']").parent().removeClass("active");
				$('input[type="checkbox"].minimal').iCheck("enable");
				getMenuView(data.node.id);
				getMenuAuthList(data.node.id);
				$("button[type='submit']").removeClass("disabled");
				
			}
						
		}).on('create_node.jstree', function(e, data) {
			var max = 0;
			$('.jstree-node').each(function(){
				if(max < parseInt($(this).attr('id'))) max = parseInt($(this).attr('id'));
			});
			
			$(this).jstree(true).set_id(data.node, max+1);
		}).on('rename_node.jstree', function(e, data) {
			setMenu(data.node.id, data.node.parent, data.node.text);
		}).on('move_node.jstree', function(e, data) {
			console.log(data.node.parent+","+data.old_parent+","+data.position+","+data.old_position+","+data.node.id);
			setMenuSort(data.node.parent, data.old_parent, data.position, data.old_position, data.node.id);
		})
	});
}

function customMenu($node){
	//console.log($node);
	var tree = $("#menuList").jstree(true);
	//if($node.type == 'root') return;
	var items = {
			createItem: {
				label: "메뉴추가",
	            action: function (obj) {
	            	$node = tree.create_node($node);
                    tree.edit($node);
	            }
			},
	        renameItem: { // The "rename" menu item
	            label: "이름변경",
	            action: function () {
	            	tree.edit($node);
	            }
	        },
	        deleteItem: { // The "delete" menu item
	            label: "메뉴삭제",
	            separator_before: true,
                separator_after: false,
	            action: function () {
	            	//tree.delete_node($node);
	            	setMenuUpdateStatus($node);
	            }
	        }
	    };

	    if ($node.type == "root") {
	        // Delete the "delete" menu item
	    	delete items.renameItem;
	        delete items.deleteItem;
	    }
	    else if($node.type == 'menu' || $node.type == 'default'){
			items.deleteItem.label = "메뉴삭제";
		}else{
			items.deleteItem.label = "메뉴복원";
		}

	    return items;
}

function setButtonMenu(arg){
	
	if(arg === 'delete'){
		$("#btn-delete").text("메뉴복원");
	}else{
		$("#btn-delete").text("메뉴삭제");
	}
}

function setMenu(a, b, c){
	
	$.ajax({
		url : "./addMenu.do",		
		type : "json",		
		method : "post",
		data : {id : a, parent : b, text : c, steId : SITE_ID},
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response > 0){
			}else{
			}
		},
		error : function(request,status,error){			
		}
	});
}

function setAuth(){
	//alert(SITE_ID);
	if(SITE_ID === ""){
		alert("사이트를 선택하세요");
		return;
	}
	
	
	//alert($("#auth-list li").length);
	for(var i = 0; i < $("#auth-list li").length; i++){
		var usr = $('input[type="hidden"][name="arrUsrSeq"]').eq(i);
		var rwx = $('input[type="hidden"][name="arrRwx"]').eq(i);
		var val = $('input[type="hidden"][name="arrUsrSeq"]').eq(i).val();
		
		//console.log(usr+","+rwx+","+val);
		
		
		var a = $('input[type="checkbox"][name="chk_'+val+'"][value="A"]');
		var r = $('input[type="checkbox"][name="chk_'+val+'"][value="R"]');
		var w = $('input[type="checkbox"][name="chk_'+val+'"][value="W"]');
		var x = $('input[type="checkbox"][name="chk_'+val+'"][value="X"]');
		
		var sel = "---";
		if($(a).is(":checked")){
			$(rwx).val("RWX");
		}else{
		
			if($(r).is(":checked")) sel = "R";
			else sel = "-";
			
			if($(w).is(":checked")) sel += "W";
			else sel += "-";
			
			if($(x).is(":checked")) sel += "X";
			else sel += "-";
			
			$(rwx).val(sel);
			
		}
	}
	
	$.ajax({
		url : "updateMenuAuth.do",		
		type : "json",		
		method : "post",
		data : $("#frmAuth").serialize(),
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response > 0){
				alert("저장되었습니다.");
			}else{
				alert("저장 중 오류가 발생하였습니다.");
			}
		},
		error : function(request,status,error){
			alert("저장 중 오류가 발생하였습니다.");
		}
	});
	
	return;
	
	
}

function setMenuDefault(){
	if(SITE_ID === ""){
		alert("사이트를 선택하세요");
		return;
	}
	
	$.ajax({
		url : "updateMenuDefault.do",		
		type : "json",		
		method : "post",
		data : {steId : SITE_ID, mnuId: $("#intMenuId").val(),  mnuDesc : $("#strMenuDesc").val(), openAt : $("#strOpenAt").val()},
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response > 0){
				alert("저장되었습니다.");
			}else{
				alert("저장 중 오류가 발생하였습니다.");
				$("#strMenuDesc").val('');
			}
		},
		error : function(request,status,error){
			alert("저장 중 오류가 발생하였습니다.");
			$("#strMenuDesc").val('');
		}
	});
}

function setMenuCharge(){
	if(SITE_ID === ""){
		alert("사이트를 선택하세요");
		return;
	}
	
	$.ajax({
		url : "updateMenuCharge.do",		
		type : "json",		
		method : "post",
		data : $("#frmChg").serialize(),
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response > 0){
				alert("저장되었습니다.");
			}else{
				alert("저장 중 오류가 발생하였습니다.");
			}
		},
		error : function(request,status,error){
			alert("저장 중 오류가 발생하였습니다.");
		}
	});
}

function setMenuProgram(){
	if(SITE_ID === ""){
		alert("사이트를 선택하세요");
		return;
	}
	
	$.ajax({
		url : "updateMenuProgram.do",		
		type : "json",		
		method : "post",
		data : $("#frmProgram").serialize(),
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response > 0){
				alert("저장되었습니다.");
			}else{
				alert("저장 중 오류가 발생하였습니다.");
			}
		},
		error : function(request,status,error){
			alert("저장 중 오류가 발생하였습니다.");
		}
	});
}

function getMenuView(a){
	$.ajax({
		url : "getMenuView.do",		
		type : "json",		
		method : "post",
		data : {mnuId : a, steId : SITE_ID},
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			//console.log(response);
			
			
			$("#strPMenuName").val(response.pMnuNm);
			$("#intMenuId").val(response.mnuId);
			$("#strMenuName").val(response.mnuNm);
			$("#strMenuDesc").val(response.mnuDesc);
			$("#strChgAt").val(response.chgAt);
			
			console.log(response.openAt);
			
			$("#strOpenAt").val(response.openAt);
			if(response.openAt === 'Y') setSwitchery($("#strOpenAt"), true);
			else setSwitchery($("#strOpenAt"), false);
			
			if(response.chgAt === 'Y') setSwitchery($("#strChgAt"), true);//$("#strChgAt").attr("checked", "checked").prop("checked", true);
			else setSwitchery($("#strChgAt"), false);//$("#strChgAt").attr("checked", false).prop("checked", false);
			
			$("#strChgName").val(response.chgNm);
			$("#strChgTel").val(response.chgTel);
			$("#strChgMail").val(response.chgMail);
			
			$("#strGradeAt").val(response.grdAt);
			if(response.grdAt === 'Y') setSwitchery($("#strGradeAt"), true);
			else setSwitchery($("#strGradeAt"), false);
			
			
			
			$("#strPgmAt").val(response.pgmAt);
			$("#strPgmPath").val(response.pgmPath);
			$("#strPgmTgt").text(response.pgmTgt);
			
			if(response.pgmAt === 'Y'){
				$("#strPgmCtgr").text("직접등록");
				$("#strPgmPath").attr("readonly", false);
				
			}else{
				if(response.contTyp === 'B'){
					$("#intBbsId").val(response.bbsId);
					$("#strContId").val("0");
					$("#strPgmCtgr").text("게시판");
					$("#strPgmPath").attr("readonly", "readonly");
				}else if(response.contTyp === 'C'){
					$("#intBbsId").val("0");
					$("#strContId").val(response.contId);
					$("#strPgmCtgr").text("콘텐츠");
					$("#strPgmPath").attr("readonly", "readonly");
				}else{
					$("#strPgmCtgr").text("선택");
					$("#strPgmPath").attr("readonly", "readonly");
				}
			}
			
		},
		error : function(request,status,error){			
		}
	});
}


function getMenuAuthList(a){
	$.ajax({
		url : "getMenuAuthList.do",		
		type : "json",		
		method : "post",
		data : {mnuId : a, steId : SITE_ID},
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			//console.log("=======================================");
			//console.log(response);
			
			if(response.length > 0){
			
				$('input[type="hidden"][name="arrUsrSeq"]').siblings('input[type="hidden"][name="arrRwx"]').val("----");
				$('input[type="checkbox"].minimal').removeAttr("checked").iCheck("update");
				
				$.each(response, function(index, item){
					var usrSeq = item.usrSeq;
					var rwx = item.rwx;
					var r = rwx.substring(0, 1);
					var w = rwx.substring(1, 2);
					var x = rwx.substring(2, 3);
					
					
					
					$('input[type="hidden"][name="arrUsrSeq"][value="'+usrSeq+'"]').siblings('input[type="hidden"][name="arrRwx"]').val(item.rwx);
					
					if(rwx === 'RWX'){
						$('input[type="checkbox"][name="chk_'+usrSeq+'"][value="A"]').iCheck("check");
					}else{
						$('input[type="checkbox"][name="chk_'+usrSeq+'"][value="A"]').removeAttr("checked").iCheck("update");
						if(r === 'R') $('input[type="checkbox"][name="chk_'+usrSeq+'"][value="R"]').iCheck("check");
						else $('input[type="checkbox"][name="chk_'+usrSeq+'"][value="R"]').removeAttr("checked").iCheck("update");
						
						if(w === 'W') $('input[type="checkbox"][name="chk_'+usrSeq+'"][value="W"]').iCheck("check");
						else $('input[type="checkbox"][name="chk_'+usrSeq+'"][value="W"]').removeAttr("checked").iCheck("update");
						
						if(x === 'X') $('input[type="checkbox"][name="chk_'+usrSeq+'"][value="X"]').iCheck("check");
						else $('input[type="checkbox"][name="chk_'+usrSeq+'"][value="X"]').removeAttr("checked").iCheck("update");
					}
				});
			}else{
				$('input[type="hidden"][name="arrUsrSeq"]').siblings('input[type="hidden"][name="arrRwx"]').val("----");
				$('input[type="checkbox"].minimal').removeAttr("checked").iCheck("update");
			}
			
			
		},
		error : function(request,status,error){			
		}
	});
}

function setMenuUpdateStatus($node){
	//console.log($node.id+","+$node.type);
	var tree = $("#menuList").jstree(true);
	var status = "N";
	if($node.type == 'delete') status = 'Y';
	$.ajax({
		url : "./updateMenuStatus.do",		
		type : "json",		
		method : "post",
		data : {steId : SITE_ID, mnuId: $node.id, status: status},
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response > 0){
				if($node.type == 'delete'){
					tree.set_type($node, "menu");
					setButtonMenu("menu");
				}else{
					tree.set_type($node, "delete");
					setButtonMenu("delete");
				}
				//setMenuUpdateStatus($node.type);
			}else{
				
			}
			
		},
		error : function(request,status,error){			
		}
	});
}

function setMenuSort(a, b, c, d, e){
	//alert(e);
	$.ajax({
		url : "./updateMenuSort.do",		
		type : "json",		
		method : "post",
		data : {parent : a, old_parent : b, position : c, old_position : d, mnuId : e, steId : SITE_ID},
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response > 0){
			}else{
			}
		},
		error : function(request,status,error){			
		}
	});
}

function setProgram(arg){
	$("#strPgmPath").val('');
	if(arg == 0){
		$("#strPgmPath").attr("readonly", false);
		$("#strPgmAt").val("Y");
	}else{
		$("#strPgmPath").attr("readonly", true);
		$("#strPgmAt").val("N");
	}
}

function setProgramBC(arg, arg1, arg2){
	console.log(arg +","+arg1+","+arg2);
	$("#strPgmPath").val(arg1);
	$("#strContTyp").val(arg2);
	
	if(arg2 === 'B'){
		$("#intBbsId").val(arg);
		$("#boardModal").modal('hide');
	}else if(arg2 === 'C'){
		$("#strContId").val(arg);
		$("#contModal").modal('hide');
	}
	
	
}
function getConList(){
	
	$.ajax({
		url : "./getContList.do",		
		type : "json",		
		method : "post",
		data : {steId : SITE_ID, searchKeyword:$("#searchCon").val()},
		beforeSend:function(){
		},
		success : function(data){
			console.log(data.result); 
			var html = "";                            
			$.each(data.result,function(index,item){                                    
				html +="<li class='p-10'>"+item.title;                                 
				html +="<button type='button' class='btn btn-xs btn-danger pull-right' onclick=\"setProgramBC('"+item.conId+"', '"+item.title+"','C')\">선택</button>";
				html +="</li>";	
			});
			$("#conList").html(html);          
			
		},
		error : function(request,status,error){			
		}
	});    
}
function getBbsList(){
	
	$.ajax({
		url : "./getBbsList.do",		
		type : "json",		
		method : "post",
		data : {steId : SITE_ID, searchKeyword:$("#searchBbs").val()},
		beforeSend:function(){
		},
		success : function(data){                   
			console.log(data.result); 
			var html = "";                            
			$.each(data.result,function(index,item){                                    
				html +="<li class='p-10'>"+item.bbsNm;                                 
				html +="<button type='button' class='btn btn-xs btn-danger pull-right' onclick=\"setProgramBC('"+item.bbsId+"', '"+item.bbsNm+"','B')\">선택</button>";
				html +="</li>";	
			});
			$("#bbsList").html(html);          
			
		},
		error : function(request,status,error){			
		}
	});    
}
