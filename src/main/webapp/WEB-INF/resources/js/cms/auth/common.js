function getDeptListForAuth(bbsId){
	var host = location.href.indexOf(location.host)+location.host.length;
	var root = location.href.substring(host,location.href.indexOf('/',host+1));	
	$.ajax({
		url : root+"/cms/dept/getDeptList.do"
		, dataType : "json"
		, data : {
			stat : 'Y'
		},
	}).done(function(data) {

		authListConfig()
		$.each(data, function(index, item){
			var html = '';
			html +=	'<input type="hidden" name="arrSeqDept" value="'+item.id+'"/>'
   			html += '<input type="hidden" name="arrRwxDept" value="---"/>'
			html += '<div class="btn-group pull-right" id="dept_auth">'
			html +=	'<label class="deptLabel"><input type="checkbox" name="dept_'+item.id+'" class="minimal" id="dept_'+item.id+'" value="A"/>모든권한</label>'
			html +=	'<label class="deptLabel"><input type="checkbox" name="dept_'+item.id+'" class="minimal" id="dept_'+item.id+'" value="R"/>읽기</label>'
			html +=	'<label class="deptLabel"><input type="checkbox" name="dept_'+item.id+'" class="minimal" id="dept_'+item.id+'" value="W"/>쓰기</label>'
			html +=	'<label class="deptLabel"><input type="checkbox" name="dept_'+item.id+'" class="minimal" id="dept_'+item.id+'" value="X"/>실행</label>'
			html += '</div>' 
			
			item.text = item.text+html
		});
		
		
		$('#deptAuthList').jstree({
			"core" : {
				'check_callback': true
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
			"plugins" : ["contextmenu","dnd", "types" ]
		}).on('loaded.jstree', function() {
			$('#deptAuthList').jstree('open_all');
			authListConfig()
			if(bbsId != "") getAuthList(bbsId)
		}).on('close_node.jstree', function() {
			//console.log(data);
			authListConfig()
		}).on('open_node.jstree', function() {
			//console.log(data);
			authListConfig()		
		})
	});
}

function authListConfig(){
	$('#deptAuthList ul > li.jstree-node > a ').removeClass('jstree-anchor');	
	
	$('#deptAuthList ul > li.jstree-node > a input[type=checkbox]').iCheck({
	    checkboxClass: 'icheckbox_square-red',
	    radioClass   : 'iradio_square-red',
	    increaseArea:'20%'
	});
	
	$('#deptAuthList ul > li.jstree-node > a input[type=checkbox]').on("ifChecked", function(event){
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
	
	$('#deptAuthList ul > li.jstree-node > a input[type=checkbox]').on("ifUnchecked", function(event){
		var name = $(this).attr("name");
		if($(this).val() === 'A' && isAllChecked == true){
			$('input[type="checkbox"][name="'+name+'"]').iCheck("uncheck");
		}else{
			//isAllChecked = false;
			$('input[type="checkbox"][name="'+name+'"][value="A"]').iCheck("uncheck");
		}
	});
	
}

function setBbsEmpAuth(){
	var obj = "";
	var seq = "";
	var length = "";
	
	length = $("#auth-list-emp li").length;
	//alert($("#auth-list li").length);
	for(var i = 1; i <= length; i++){
		var typ = 'E';
		var rwx = $('input[type="hidden"][name="arrRwxEmp"]').eq(i);
		var val = $('input[type="hidden"][name="arrSeqEmp"]').eq(i).val();
		
		//console.log(usr+","+rwx+","+val);
		
		var a = $('input[type="checkbox"][name="emp_'+val+'"][value="A"]');
		var r = $('input[type="checkbox"][name="emp_'+val+'"][value="R"]');
		var w = $('input[type="checkbox"][name="emp_'+val+'"][value="W"]');
		var x = $('input[type="checkbox"][name="emp_'+val+'"][value="X"]');
		
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
		
		if(i==length){
			seq += val;
			obj += $(rwx).val();
		} else {
			seq += val+',';
			obj += $(rwx).val()+',';
		}
	}
	$("#arrSeqEmp").val(seq)
	$("#arrRwxEmp").val(obj)
	return alert("게시물을 저장하지 않으면 적용되지 않습니다.");
}

function setBbsGrpAuth(){
	var obj = "";
	var seq = "";
	var length = "";
	
	length = $("#auth-list-grp li").length;
	//alert($("#auth-list-grp li").length);
	for(var i = 1; i <= length; i++){
		var typ = 'G';
		var rwx = $('input[type="hidden"][name="arrRwxGrp"]').eq(i);
		var val = $('input[type="hidden"][name="arrSeqGrp"]').eq(i).val();
		
		//console.log(usr+","+rwx+","+val);
		
		
		var a = $('input[type="checkbox"][name="grp_'+val+'"][value="A"]');
		var r = $('input[type="checkbox"][name="grp_'+val+'"][value="R"]');
		var w = $('input[type="checkbox"][name="grp_'+val+'"][value="W"]');
		var x = $('input[type="checkbox"][name="grp_'+val+'"][value="X"]');
		
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
		if(i==length){
			seq += val;
			obj += $(rwx).val();
		} else {
			seq += val+',';
			obj += $(rwx).val()+',';
		}
	}
	$("#arrSeqGrp").val(seq)
	$("#arrRwxGrp").val(obj)
	return alert("게시물을 저장하지 않으면 적용되지 않습니다.");
}

function setBbsDeptAuth(){
	
	var obj = "";
	var seq = "";
	var length = "";
	
	length = $("#deptAuthList ul > li.jstree-node").length;
	//alert($("#deptAuthList ul > li.jstree-node").length);
	for(var i = 1; i <= length; i++){
		
		var typ = 'G';
		var rwx = $('input[type="hidden"][name="arrRwxDept"]').eq(i);
		var val = $('input[type="hidden"][name="arrSeqDept"]').eq(i).val();
		
		//console.log(typ+","+rwx+","+val);
		
		
		var a = $('input[type="checkbox"][name="dept_'+val+'"][value="A"]');
		var r = $('input[type="checkbox"][name="dept_'+val+'"][value="R"]');
		var w = $('input[type="checkbox"][name="dept_'+val+'"][value="W"]');
		var x = $('input[type="checkbox"][name="dept_'+val+'"][value="X"]');
		
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
		if(i==length){
			seq += val;
			obj += $(rwx).val();
		} else {
			seq += val+',';
			obj += $(rwx).val()+',';
		}
	}
	$("#arrSeqDept").val(seq)
	$("#arrRwxDept").val(obj)
	return alert("게시물을 저장하지 않으면 적용되지 않습니다.");
}
