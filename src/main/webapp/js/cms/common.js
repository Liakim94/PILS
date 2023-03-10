$(function(){
	
	$("#mediaModal").on('shown.bs.modal', function (e) {
		getMediaList();
	});
	
	$("#mediaModal").on('hidden.bs.modal', function (e) {
		$("#media-searchKeyword").val('');
		$("#modal-media-list").empty();
	});
	
	
	$('#modalUser').on('shown.bs.modal', function (e) {
		gf_getUserListOfDept('commonDeptWithUserList');
		//$('#commonDeptWithUserList').jstree('open_all');	
	});
	
	$('#modalUser').on('hidden.bs.modal', function (e) {
		$('#commonDeptWithUserList').jstree('destroy');
	});
	
	$('#modalDept').on('shown.bs.modal', function (e) {
		$("#common_nav_tab1 ul li").removeClass("active");
		$("#common_nav_tab1 ul li").eq(0).addClass("active");
		
		$("#common_nav_tab1 .tab-content .tab-pane").removeClass("active");
		$("#common_nav_tab1 .tab-content .tab-pane").eq(0).addClass("active");
		
		gf_getDeptList('commonDeptList', "");
		gf_getGroupList('commonGroupList');
	});
	
	$('#modalDept').on('hidden.bs.modal', function (e) {
		$('#commonDeptList').jstree('destroy');
		$('#commonGroupList').jstree('destroy');
	});
	
	$('#modalType').on('shown.bs.modal', function (e) {
		gf_getTypeList('commonTypeList');
	});
	
	$('#modalType').on('hidden.bs.modal', function (e) {
		$('#commonTypeList').jstree('destroy');
	});
	
	$('#modalUsers').on('shown.bs.modal', function (e) {
		gf_getDeptList('commonUsersDeptList', "");
		gf_getGroupList('commonUsersGroupList');
		gf_getUserListOfDept('commonUsersList');
		//$('#commonUsersList').jstree(true);
		
		gf_getAclInfo();
		
		$("#common_users_tab1 ul li").removeClass("active");
		$("#common_users_tab1 ul li").eq(0).addClass("active");
		
		$("#common_users_tab1 .tab-content .tab-pane").removeClass("active");
		$("#common_users_tab1 .tab-content .tab-pane").eq(0).addClass("active");
	});
	
	$('#modalUsers').on('hidden.bs.modal', function (e) {
		$('#commonUsersDeptList').jstree('destroy');
		$('#commonUsersGroupList').jstree('destroy');
		$('#commonUsersList').jstree('destroy');
		
		$("#select-users").empty();
		
	});
	
	$(".pgm-tgt li a").on("click", function(){
		$("#strTgt").text($(this).text());
	});
	
	
	var to = false;
	$('#q').keyup(function () {
		if(to) { clearTimeout(to); }
		to = setTimeout(function () {
			var v = $('#q').val();
			$('#commonUsersList').jstree(true).search(v);
		}, 250);
	});
	
	
	/*????????????*/
	$("#acl_all").iCheck("disable");
	$(".chk_acl").iCheck("disable");
	
	/*$("#acl-list").selectable({
	      selecting: function(event, ui){
	            if( $(".ui-selected, .ui-selecting").length > 1){
	                  $(ui.selecting).removeClass("ui-selecting");
	            }
	      }
	});*/
	
	$("#acl-list").on("change", function(){
		if($("#acl-list option:selected").length > 1){
			$("#acl-list option:selected").each(function(){
				$(this).attr("selected", false);
			});
			selected_acl = "";
		}else{
			var acl = "";
			var r = "", w = "", x = "";
			
			selected_acl = $("#acl-list option:selected").val();
			
			acl = $("#acl-list option:selected").attr("aria-acl");
			r = acl.substring(0, 1);
			w = acl.substring(1, 2);
			x = acl.substring(2, 3);
			
			//console.log(r+","+w+","+x);
			
			if(r == "R" && w == "W" && x == "X"){
				$("#acl_all").iCheck("check");
			}else{
				$("#acl_all").iCheck("uncheck");
			}
				
			if(r == "R"){
				$("#acl_r").iCheck('check');
			}else{
				$("#acl_r").iCheck("uncheck");
			}
			if(w == "W"){
				$("#acl_w").iCheck("check");
			}else{
				$("#acl_w").iCheck("uncheck");
			}
			if(x == "X"){
				$("#acl_x").iCheck("check");
			}else{
				$("#acl_x").iCheck("uncheck");
			}
			
			//console.log("===========");
			//$(".chk_acl").prop("disabled", false);
			$("#acl_all").iCheck("enable");
			$(".chk_acl").iCheck("enable");
			$("#acl-user").text($("#acl-list option:selected").text());
			
		}
	});
	
	/*????????????*/
	/*$('#acl_all').on('ifUnchecked', function (event) {
		$('.chk_acl').iCheck('uncheck');
	    //$("#acl-list option[value='"+selected_acl+"']").attr("aria-acl", "---");
	});

	$('#acl_all').on('ifChecked', function (event) {
	    if ($('.check').filter(':checked').length == $('.check').length) {
	        $('.chk_acl').iCheck('check');
	        
	        //console.log(selected_acl);
	        //$("#acl-list option[value='"+selected_acl+"']").attr("aria-acl", "rwx");
	    }
	});*/
	
	$('#acl_all').on('ifClicked', function (event) {
        //console.log(event);
        var checked = event.target.checked;
        console.log(checked);
		if(!checked){
			$('.chk_acl').iCheck('check');
		}else{
			$('.chk_acl').iCheck('uncheck');
		}
	});
	
	$('.chk_acl').on('ifChanged', function (event) {
		var cnt = $(".chk_acl").filter(':checked').length;
		if(cnt >= 3){
			$("#acl_all").iCheck('check');
		}else{
			$("#acl_all").iCheck('uncheck');
		}
	});
	
	
	$('.chk_acl').on('ifChecked', function (event) {
	    /*if ($('.check').filter(':checked').length == $('.check').length) {
	        $('.chk_acl').iCheck('check');
	        console.log(selected_acl);
	        $("#acl-list option[value='"+selected_acl+"']").attr("aria-acl", "rwx");
	    }*/
		var acl = "";
		$(".chk_acl").each(function(){
			var id = $(this).context.id;
			if($('#'+id).filter(':checked').length == $('#'+id).length){
				if(id == "acl_r"){
					acl += "R";
				}else if(id == "acl_w"){
					acl += "W";
				}else{
					acl += "X";
				}
			}else{
				if(id == "acl_r"){
					acl += "-";
				}else if(id == "acl_w"){
					acl += "-";
				}else{
					acl += "-";
				}
			}
		});
		
		$("#acl-list option[value='"+selected_acl+"']").attr("aria-acl", acl);
	});
	
	$('.chk_acl').on('ifUnchecked', function (event) {
		flag = false;
		var acl = "";
		$(".chk_acl").each(function(){
			var id = $(this).context.id;
			if($('#'+id).filter(':checked').length == $('#'+id).length){
				if(id == "acl_r"){
					acl += "R";
				}else if(id == "acl_w"){
					acl += "W";
				}else{
					acl += "X";
				}
			}else{
				if(id == "acl_r"){
					acl += "-";
				}else if(id == "acl_w"){
					acl += "-";
				}else{
					acl += "-";
				}
			}
		});
		
		$("#acl-list option[value='"+selected_acl+"']").attr("aria-acl", acl);
	});

});

function gf_setUserInfo(){
	
	var selected_idx = $("#commonDeptWithUserList").jstree('get_selected', true);
	//console.log(selected_idx);
	var id = selected_idx[0].id;
	var text = selected_idx[0].text;
	id = id.substring(1, id.indexOf("D"));
	//console.log(id+","+text);
	$("#intRegSeq").val(id);
	$("#strRegNm").val(text);
	
	$('#modalUser').modal("hide");
	
}

function gf_addDeptGroup(){
	if($("#common_nav_tab1 ul li").eq(0).hasClass("active")){
		var selected_ids = [];
		var selected_text = [];
		var selected_idx = $("#commonDeptList").jstree('get_selected', true);
		$.each(selected_idx, function(index, values){
			var id = selected_idx[index].id;
			var text = selected_idx[index].text;
			selected_ids.push("D"+id);
			selected_text.push(text);
		});
		
		if(selected_ids.length > 0){
			for(var i = 0; i < selected_ids.length-1; i++){
				//???????????????  ????????????
				for(var j = (i+1); j < selected_ids.length; j++){
					if(selected_ids[i] == selected_ids[j]){
						selected_ids.splice(j, 1);
						selected_text.splice(j, 1);
					}
				}
			}
		}
		
		
		for(var i = 0; i < selected_ids.length; i++){
			var isAdd = false;
			$("#select-dept-group option").each(function () {
				if(selected_ids[i] == $(this).val()){
					isAdd = true;
				}
			});
			if(!isAdd) {
				console.log(selected_ids[i]);
				if(selected_ids[i] === '1') $("#select-dept-group").append('<option value="'+selected_ids[i]+'">[??????]'+selected_text[i]+'</option>');
				else $("#select-dept-group").append('<option value="'+selected_ids[i]+'">[??????]'+selected_text[i]+'</option>');
			}
		}
		
	}else{
		var selected_ids = [];
		var selected_text = [];
		var selected_idx = $("#commonGroupList").jstree('get_selected', true);
		$.each(selected_idx, function(index, values){
			var id = selected_idx[index].id;
			var text = selected_idx[index].text;
			selected_ids.push("G"+id);
			selected_text.push(text);
		});
		
		if(selected_ids.length > 0){
			for(var i = 0; i < selected_ids.length-1; i++){
				//???????????????  ????????????
				for(var j = (i+1); j < selected_ids.length; j++){
					if(selected_ids[i] == selected_ids[j]){
						selected_ids.splice(j, 1);
						selected_text.splice(j, 1);
					}
				}
			}
		}
		
		
		for(var i = 0; i < selected_ids.length; i++){
			var isAdd = false;
			$("#select-dept-group option").each(function () {
				if(selected_ids[i] == $(this).val()){
					isAdd = true;
				}
			});
			if(!isAdd) $("#select-dept-group").append('<option value="'+selected_ids[i]+'">[??????]'+selected_text[i]+'</option>');
		}
	}
}

function gf_delDeptGroup(){
	$("#select-dept-group option:selected").each(function () {
		$(this).remove();
	});
}

function gf_addUsers(){
	if($("#common_users_tab1 ul li").eq(0).hasClass("active")){
		var selected_ids = [];
		var selected_text = [];
		var selected_idx = $("#commonUsersDeptList").jstree('get_selected', true);
		$.each(selected_idx, function(index, values){
			var id = selected_idx[index].id;
			var text = selected_idx[index].text;
			selected_ids.push("D"+id);
			selected_text.push(text);
		});
		
		if(selected_ids.length > 0){
			for(var i = 0; i < selected_ids.length-1; i++){
				//???????????????  ????????????
				for(var j = (i+1); j < selected_ids.length; j++){
					if(selected_ids[i] == selected_ids[j]){
						selected_ids.splice(j, 1);
						selected_text.splice(j, 1);
					}
				}
			}
		}
		
		
		for(var i = 0; i < selected_ids.length; i++){
			var isAdd = false;
			$("#select-users option").each(function () {
				if(selected_ids[i] == $(this).val()){
					isAdd = true;
				}
			});
			if(!isAdd){
				if(selected_ids[i] === '1') $("#select-users").append('<option value="'+selected_ids[i]+'">[??????]'+selected_text[i]+'</option>');
				else $("#select-users").append('<option value="'+selected_ids[i]+'">[??????]'+selected_text[i]+'</option>');
			}
		}
	}else if($("#common_users_tab1 ul li").eq(1).hasClass("active")){
		var selected_ids = [];
		var selected_text = [];
		var selected_idx = $("#commonUsersGroupList").jstree('get_selected', true);
		$.each(selected_idx, function(index, values){
			var id = selected_idx[index].id;
			var text = selected_idx[index].text;
			selected_ids.push("G"+id);
			selected_text.push(text);
		});
		
		if(selected_ids.length > 0){
			for(var i = 0; i < selected_ids.length-1; i++){
				//???????????????  ????????????
				for(var j = (i+1); j < selected_ids.length; j++){
					if(selected_ids[i] == selected_ids[j]){
						selected_ids.splice(j, 1);
						selected_text.splice(j, 1);
					}
				}
			}
		}
		
		
		for(var i = 0; i < selected_ids.length; i++){
			var isAdd = false;
			$("#select-users option").each(function () {
				if(selected_ids[i] == $(this).val()){
					isAdd = true;
				}
			});
			if(!isAdd) $("#select-users").append('<option value="'+selected_ids[i]+'">[??????]'+selected_text[i]+'</option>');
		}
	}else{
		var selected_ids = [];
		var selected_text = [];
		var selected_idx = $("#commonUsersList").jstree('get_selected', true);
		$.each(selected_idx, function(index, values){
			var id = selected_idx[index].id;
			var text = selected_idx[index].text;
			selected_ids.push(id.substring(0, id.indexOf("D")));
			selected_text.push(text);
		});
		
		if(selected_ids.length > 0){
			for(var i = 0; i < selected_ids.length-1; i++){
				//???????????????  ????????????
				for(var j = (i+1); j < selected_ids.length; j++){
					if(selected_ids[i] == selected_ids[j]){
						selected_ids.splice(j, 1);
						selected_text.splice(j, 1);
					}
				}
			}
		}
		
		
		for(var i = 0; i < selected_ids.length; i++){
			var isAdd = false;
			$("#select-users option").each(function () {
				if(selected_ids[i] == $(this).val()){
					isAdd = true;
				}
			});
			if(!isAdd) $("#select-users").append('<option value="'+selected_ids[i]+'">[?????????]'+selected_text[i]+'</option>');
		}
	}
}

function gf_delUsers(){
	$("#select-users option:selected").each(function () {
		$(this).remove();
	});
}

function gf_getAclInfo(){
	if($("#acl-list option").length > 0){
		$("#acl-list option").each(function (index) {
			$("#select-users").append('<option value="'+$(this).val()+'">'+$(this).text()+'</option>');
		});
	}
}

/*????????????*/
function gf_setAclInfo(){
	var id = "";
	var text = "";
	if($("#select-users option").length > 0){
		//$("#acl-list").empty();
		$("#select-users option").each(function (index) {
			if($("#acl-list option[value='"+$(this).val()+"']").length < 1){
			//console.log($("#acl-list option[value='"+$(this).val()+"']"));
				$("#acl-list").append('<option value="'+$(this).val()+'" aria-acl="R--">'+$(this).text()+'</option>');
				
			}else{
				console.log($(this).val());
			}
		});
		$("#acl-list option").each(function (index) {
			if($("#select-users option[value='"+$(this).val()+"']").length < 1){
				$(this).remove();
			}
		});
		
		//$(".chk_acl").prop("disabled", true);
		$("#acl_all").iCheck("disable");
		$(".chk_acl").iCheck("disable");
		
		$('#modalUsers').modal("hide");
		
	}else{
		$("#alert").html("??????/?????? ?????? ???????????? ???????????????");
    	$('#modalAlert').modal('show');
	}
}
/*????????????*/
function gf_aclDelete(){
	if($("#acl-list option").length > 0){
		var id = $("#acl-list option:selected").val();
		$("#acl-list option[value='"+id+"']").remove();
	}else{
		$("#alert").html("??????/?????? ?????? ???????????? ???????????????");
    	$('#modalAlert').modal('show');
	}
}

/*????????????*/
function gf_setDeptGroupInfo(){
	var dept = "";
	var group = "";
	var id = "";
	var text = "";
	
	if($("#common_nav_tab1 ul li").eq(0).hasClass("active")){
		//var selected_ids = [];
		//var selected_text = [];
		var selected_idx = $("#commonDeptList").jstree('get_selected', true);
		$.each(selected_idx, function(index, values){
			//var id = selected_idx[index].id;
			//var text = selected_idx[index].text;
			//selected_ids.push("D"+id);
			//selected_text.push(text);
			dept = selected_idx[index].id;
			group = 0;
			text = selected_idx[index].text;
		});
	}else{
		var selected_idx = $("#commonGroupList").jstree('get_selected', true);
		$.each(selected_idx, function(index, values){
			//var id = selected_idx[index].id;
			//var text = selected_idx[index].text;
			//selected_ids.push("G"+id);
			//selected_text.push(text);
			dept = 0;
			group = selected_idx[0].id;
			text = selected_idx[0].text;
		});
	}
	
	if(dept == '' && group == ''){
		$("#alert").html("?????? ?????? ????????? ???????????????.");
    	$('#modalAlert').modal('show');
	}else{
	
		$("#dept").val(dept);
		$("#grp").val(group);
		$("#strGroupNm").val(text);
		$('#modalDept').modal("hide");
	}
	/*if($("#select-dept-group option").length > 0){
		$("#select-dept-group option").each(function (index) {
			if(index > 0){
				id +=",";
				text += ",";
			}
			id += $(this).val();
			text += $(this).text();
		});
		
		var dg = id.split(",");
		for(var i = 0; i < dg.length; i++){
			if(dg[i].substring(0, 1) == 'D'){
				dept += dg[i].substring(1);
				dept += ",";
			}else{
				group += dg[i].substring(1);
				group += ",";
			}
		}
		
		$("#arrDept").val(dept);
		$("#arrGrp").val(group);
		$("#strGroupNm").val(text);
		
		$('#modalDept').modal("hide");
	}else{
		$("#alert").html("????????? ??????/????????? ????????????.");
    	$('#modalAlert').modal('show');
	}*/
	
}

/*????????????*/
function gf_setTypeInfo(){
	var selected_ids = [];
	var selected_text = [];
	var selected_idx = $("#commonTypeList").jstree('get_selected', true);
	$.each(selected_idx, function(index, values){
		var id = selected_idx[index].id;
		var text = selected_idx[index].text;
		selected_ids.push(id);
		selected_text.push(text);
	});
	
	if(selected_ids.length > 0){
		var typeId = "";
		var typeText = "";
		for(var i = 0; i < selected_ids.length; i++){
			if(i > 0){
				typeId += ",";
				typeText += ",";
			}
			typeId += selected_ids[i];
			typeText += selected_text[i];
		}
		$("#arrType").val(typeId);
		$("#strTyp").val(typeText);
		$('#modalType').modal("hide");
	}else{
		$("#alert").html("????????? ????????? ????????????.");
    	$('#modalAlert').modal('show');
	}
	
}

/*????????? ????????????*/
function gf_getUserListOfDept(id){
	$.ajax({
		url : pageContext+"/cms/user/getUserListOfDept.do"
		, method:'POST'
		, dataType : "json"
		, data : {grpNo : 0, stat : 'Y'}
	}).done(function(data) {
		$('#'+id).jstree({
			"core" : {
				'check_callback': true
				, "multiple" : false
				, 'data' : data
			},
			"types":{
				"root":{
					"icon" : "fa fa-building"
				},				
				"folder":{
					"icon" : "fa fa-folder-o"
				},
				"user":{
					"icon" : "fa fa-user"
				},
				"default":{
					"icon" : "fa fa-user"
				}
			},
			"sort": function (a, b) {
	            var nodeA = this.get_node(a);
	            var nodeB = this.get_node(b);
	            
	            console.log(nodeA);
	            
	            if(nodeA.icon == nodeB.icon){
	            	if(nodeA.type == 'user' && nodeB.type == 'user'){
	            		if(nodeA.original.sort2 == nodeB.original.sort2){
	            			if(nodeA.original.sort == nodeB.original.sort){
	            				return (nodeA.text > nodeB.text) ? 1:-1
	            			}else{
	            				return (nodeA.original.sort > nodeB.original.sort) ? 1:-1
	            			}
	            		}else{
	            			if(nodeA.original.sort == nodeB.original.sort){
	            				return (nodeA.text > nodeB.text) ? 1:-1
	            			}else{
	            				return (nodeA.original.sort2 > nodeB.original.sort2) ? 1:-1
	            			}
	            		}
	            	}else{
	            		return (nodeA.original.sort > nodeB.original.sort) ? 1:-1;
	            	}
	            }else{
	            	return (nodeA.icon < nodeB.icon) ? 1:-1;
	            }
	          
	        },
			"plugins" : ["types", "sort", "search" ]
		}).on('changed.jstree', function(e, data) {
			
		}).on('loaded.jstree', function(e, data) {
			$('#'+id).jstree('open_all');			
		}).on('select_node.jstree', function(e, data) {
			if(data.node.type!="user"){
				data.instance.deselect_node(data.node);
			}
						
		})
	});
}

/*????????????*/
function gf_getDeptList(id, arg){
	$.ajax({
		url : pageContext+"/cms/dept/getDeptList.do"
		, dataType : "json"
		, data : {stat : 'Y'}
	}).done(function(data) {
		$('#'+id).jstree({
			"core" : {
				'check_callback': true
				, "multiple" : false
				, 'data' : data
			},
			"types":{
				"root":{
					"icon" : "fa fa-building"
				},
				"folder":{
					"icon" : "fa fa-folder-o"
				},
				"delete":{
					"icon" : "fa fa-folder"
				},
				"default":{
					"icon" : "fa fa-folder-o"
				}
			},
			"plugins" : ["types" ]
		}).on('changed.jstree', function(e, data) {
			
		}).on('loaded.jstree', function() {
			$('#'+id).jstree('open_all');
		}).on('select_node.jstree', function(e, data) {
		})
	});
}

/*????????????*/
function gf_getGroupList(id){
	$.ajax({
		url : pageContext+"/cms/user/getGroupList.do"
		, dataType : "json"
		, data : {stat : 'Y', "grpAt" : "Y"}
	}).done(function(data) {
		$('#'+id).jstree({
			"core" : {
				'check_callback': true
				, 'data' : data
			},
			
			"sort": function (a, b) {
	            var nodeA = this.get_node(a);
	            var nodeB = this.get_node(b);
	            
	            if(nodeA.sort == nodeB.sort){
	            	return (nodeA.icon < nodeB.icon) ? 1:-1;
	            }else{
	            	return (nodeA.sort > nodeB.sort) ? 1:-1;
	            }
	          
	        },
			"types":{
				"root":{
					"icon" : "fa fa-building"
				},
				"admin":{
					"icon" : "fa fa-user-secret"
				},
				"group":{
					"icon" : "fa fa-folder-o"
				},
				"user":{
					"icon" : "fa fa-user"
				},
				"default":{
					"icon" : "fa fa-folder-o"
				}
			},
			"plugins" : ["types", "sort" ]
		}).on('changed.jstree', function(e, data) {
			
		}).on('loaded.jstree', function() {
			$('#'+id).jstree('open_all');
		})
	});
}

/*????????????*/
function gf_getTypeList(id){
	$.ajax({
		url : pageContext+"/cms/setup/getTypeList.do"
		, dataType : "json"
	}).done(function(data) {
		$('#'+id).jstree({
			"core" : {
				'check_callback': true
				, 'data' : data
			},
			"types":{
				"folder":{
					"icon" : "fa fa-folder-o"
				},
				"delete":{
					"icon" : "fa fa-folder"
				},
				"default":{
					"icon" : "fa fa-folder-o"
				}
			},
			"plugins" : ["contextmenu","dnd", "types" ]
		}).on('changed.jstree', function(e, data) {
		}).on('loaded.jstree', function() {
			$('#'+id).jstree('open_all');
		})
	});
}


$(function(){
	$(".checkbox-toggle").on("click",function () {
	  var clicks = $(this).data('clicks');
	  if (clicks) {
	    //Uncheck all checkboxes
	    $("input[name='chkNo']").prop("checked", "");
	    $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
	  } else {
	    //Check all checkboxes
	    $("input[name='chkNo']").prop("checked", "checked");
	    $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
	  }
	  $(this).data("clicks", !clicks);
	});
});

function getBytes(bytes){
	
	bytes = parseInt(bytes);
	
	var s = ['byte(s)','KB','MB','GB','TB','PB'];
	
	var e = Math.floor(Math.log(bytes)/Math.log(1024));
	if(e == "-Infinity") return "0 "+s[0];
	else return (bytes/Math.pow(1024, Math.floor(e))).toFixed(2)+ " "+s[e];
	
	
}

function searchPost() {
	
    new daum.Postcode({
        oncomplete: function(data) {
            // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

            // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
            // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
            var fullAddr = ''; // ?????? ?????? ??????
            var extraAddr = ''; // ????????? ?????? ??????

            // ???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
            if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                fullAddr = data.roadAddress;

            } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                fullAddr = data.jibunAddress;
            }

            // ???????????? ????????? ????????? ????????? ???????????? ????????????.
            if(data.userSelectedType === 'R'){
                //??????????????? ?????? ?????? ????????????.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // ???????????? ?????? ?????? ????????????.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ?????????????????? ????????? ?????? ????????? ????????? ???????????? ?????? ????????? ?????????.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            document.getElementById('zip').value = data.zonecode; //5?????? ??????????????? ??????
            document.getElementById('addr1').value = fullAddr;
            document.getElementById('addr2').focus();
        }
    }).open();
}


function bytesToSize(bytes) {
	var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
    if (bytes == 0) return 'n/a';
    var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
    if (i == 0) return bytes + ' ' + sizes[i];
    return (bytes / Math.pow(1024, i)).toFixed(1) + '' + sizes[i];
}

function setSwitchery(element, checked) {
   /* if((checkedBool && !switchElement.isChecked()) || (!checkedBool && switchElement.isChecked())) {
        switchElement.setPosition(true);
        switchElement.handleOnchange(true);
    }*/
	
	if ( ( element.is(':checked') && checked == false ) || ( !element.is(':checked') && checked == true ) ) {
	    element.parent().find('.switchery').trigger('click');
	  }
}

function goMediaUpload(){
	myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
	myDropzone.processQueue();
}


function getMediaList(){
	$.ajax({
		url : pageContext+"/cms/media/getMediaList.do",		
		type : "json",		
		method : "post",
		data : {searchKeyword : $("#media-searchKeyword").val()},
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			console.log(response);
			
			if(response.length > 0){
				var root = "";
				//alert(root+'${pageContext.request.contextPath()}');
				var hostIndex = location.href.indexOf(location.host)+location.host.length;
				var contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
				
				
				$.each(response, function(index, item){
					html = "";
					html += '<li class="m-b-5">';
					html += '<div class="info-box">';
					html += '<span class="pull-left thumbnail-box-80"><img src="'+contextPath+'/common/getPopupImg.do?imgFileNm='+item.svFileNm+'&imgUrlAddr=/'+uploadPath+item.filePath+'" class="image-responsive img-thumbnail thumbnail-box-80"/></span>';
					html += '<div class="info-box-content"';
					html += '<span class="info-box-text media-name">'+item.mdaNm+'</span>';
					html += '<span class="info-box-text media-file-name">'+item.fileNm+'</span>';
					html += '</div>';
					html += '<button class="btn btn-flat btn-danger btn-xs pull-right" onclick="setLogo('+item.mdaSeq+', \''+item.fileNm+'\', \''+item.filePath+'\', \''+item.svFileNm+'\', '+item.fileSz+' )">??????</button>';
					html += '</div>';
					html += '</li>';
					
					$("#modal-media-list").append(html);
				});
				
			}
		},
		error : function(request,status,error){			
		}
	});
	
}

function goMediaSearch(){
	$("#modal-media-list").empty();
	getMediaList();
}