/*function setBbsEmpAuth(){
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
	return;
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
	return;
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
	return
}*/
