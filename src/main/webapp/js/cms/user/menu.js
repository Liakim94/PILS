
function getDeptList(arg){
	var host = location.href.indexOf(location.host)+location.host.length;
	var root = location.href.substring(host,location.href.indexOf('/',host+1));	
	$.ajax({
		url :root+"/cms/dept/getDeptList.do"
		, dataType : "json"
	}).done(function(data) {
	
		$('#deptList').jstree({
			"core" : {
				'check_callback': true
				, 'data' : data
			},
			"contextmenu": {items:customMenu},
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
		}).on('changed.jstree', function(e, data) {
			//console.log(data);
			//getEmpList();
			
		}).on('loaded.jstree', function() {
			$('#deptList').jstree('open_all');
			var jstree = $('#deptList').jstree(true);
			jstree.select_node(arg);
		}).on('create_node.jstree', function(e, data) {
			var max = 0;
			$('.jstree-node').each(function(){
				if(max < parseInt($(this).attr('id'))) max = parseInt($(this).attr('id'));
			});
			
			$(this).jstree(true).set_id(data.node, max+1);
		}).on('select_node.jstree', function(e, data) {
			//console.log(e.event.type);
			var evt =  window.event || e;
			var button = evt.which || evt.button;
			
			if(data.node.type == "delete") $("#btn-d").text("등급복원");
			//console.log(button);
			if(button == 1){
				location.href="?deptNo="+data.node.id;
			}
		}).on('rename_node.jstree', function(e, data) {
			setDept(data.node.id, data.node.parent, data.node.text);
		}).on('move_node.jstree', function(e, data) {
			//console.log(data.node.parent+","+data.old_parent+","+data.position+","+data.old_position+","+data.node.id);
			setDeptSort(data.node.parent, data.old_parent, data.position, data.old_position, data.node.id);
		});
	});
}

function customMenu($node){
	var tree = $("#deptList").jstree(true);
	var items = {
			createItem: {
				label: "부서추가",
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
	            label: "Delete",
	            separator_before: true,
                separator_after: false,
	            action: function () {
	            	console.log($node);
	            	setDeptStatus($node);
	            }
	        }
	    };

	    if ($node.type == "root") {
	    	delete items.renameItem;
	        delete items.deleteItem;
	    }
	    else if($node.type == 'folder' || $node.type == 'default'){
			items.deleteItem.label = "사용안함";
		}else{
			items.deleteItem.label = "사용";
		}

	    return items;
}

function setDept(a, b, c){
	var host = location.href.indexOf(location.host)+location.host.length;
	var root = location.href.substring(host,location.href.indexOf('/',host+1));	
	$.ajax({
		url : root+"/cms/dept/addDept.do",		
		type : "json",		
		method : "post",
		data : {id : a, parent : b, text : c},
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response > 0){
				
			}else{
				
			}
			
		},
		error : function(request,status,error){			
			$("#alert").html("오류가 발생하였습니다.");
	    	$('#modalAlert').modal('show');
		}
	});
}

function setDeptSort(a, b, c, d, e){
	var host = location.href.indexOf(location.host)+location.host.length;
	var root = location.href.substring(host,location.href.indexOf('/',host+1));
	$.ajax({
		url : root+"/cms/dept/updateDeptSort.do",		
		type : "json",		
		method : "post",
		data : {parent : a, old_parent : b, position : c, old_position : d, deptSeq : e},
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response > 0){
				
			}else{
				
			}
			
		},
		error : function(request,status,error){			
			$("#alert").html("오류가 발생하였습니다.");
	    	$('#modalAlert').modal('show');
		}
	});
}

function setDeptStatus($node){
	var host = location.href.indexOf(location.host)+location.host.length;
	var root = location.href.substring(host,location.href.indexOf('/',host+1));
	//console.log($node.id+","+$node.type);
	var tree = $("#deptList").jstree(true);
	var status = "N";
	if($node.type == 'delete') status = 'Y';
	$.ajax({
		url : root+"/cms/dept/updateDeptStatus.do",		
		type : "json",		
		method : "post",
		data : {id: $node.id, status: status},
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response > 0){
				if($node.type == 'delete'){
					tree.set_type($node, "folder");
				}else{
					tree.set_type($node, "delete");
				}
			}else{
				
			}
			location.reload();      
		},
		error : function(request,status,error){			
			$("#alert").html("오류가 발생하였습니다.");
	    	$('#modalAlert').modal('show');
		}
	});
}

function deptCreate(id) {
	var ref = $('#'+id).jstree(true),
		sel = ref.get_selected();
	if(!sel.length) { 
		$("#alert").html("상위부서를 선택하세요.");
    	$('#modalAlert').modal('show');
		return false; 
	}
	sel = sel[0];
	sel = ref.create_node(sel, {"type":"menu"});
	if(sel) {
		ref.edit(sel);
	}
};
function deptRename(id){
	var ref = $('#'+id).jstree(true);
	var sel = ref.get_selected();
	
	if(!sel.length) {
		$("#alert").html("부서를 선택하세요.");
    	$('#modalAlert').modal('show');
		return false; 
	}

	sel = sel[0];
	if(sel > 0){
		ref.edit(sel);
	} 
}
function deptDelete(id){
	var ref = $('#'+id).jstree(true);
	var sel = ref.get_selected();
	var node = ref.get_node(sel);
	
	if(!sel.length) { 
		$("#alert").html("부서를 선택하세요.");
    	$('#modalAlert').modal('show');
		return false; 
	}
	setDeptStatus(node);
	
}