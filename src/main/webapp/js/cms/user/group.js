$(function(){
	getGroupList();

	
	$("#searchName").on("mousedown", function () {
	    //var value=document.getElementById("searchName").value; 
	    //$("#deptList").jstree("search",value);  
	});
	
	$('#modalUserList').on('shown.bs.modal', function (e) {
		getUserListOfDept();
	});
	
	$('#modalUserList').on('hidden.bs.modal', function (e) {
		$('#deptList').jstree('destroy');
	});
});
function getGroupList(){          
	$.ajax({
		url : "getGroupList.do"
		, dataType : "json"
	}).done(function(data) {
		$('#groupList').jstree({
			"core" : {
				'check_callback': true
				, 'data' : data
			},
			"contextmenu": {items:customMenu},      
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
			"plugins" : ["contextmenu", "types", "sort" ]
		}).on('changed.jstree', function(e, data) {
			//getEmpList();
			
		}).on('loaded.jstree', function() {
			$('#groupList').jstree('open_all');
			var jstree = $('#groupList').jstree(true);
			jstree.select_node(0);                     
			
		}).on('create_node.jstree', function(e, data) {
			var max = 0;
			$('.jstree-node').each(function(){
				if(max < parseInt($(this).attr('id'))) max = parseInt($(this).attr('id'));
			});
			
			$(this).jstree(true).set_id(data.node, max+1);
			$(this).jstree(true).set_type(data.node, "group");
		}).on('rename_node.jstree', function(e, data) {
			setGroup(data.node.id, data.node.text);
		})
	});
}

function customMenu($node){
	var tree = $("#groupList").jstree(true);
	var parent = $("#groupList").jstree(true).get_node($node.parent);
	//var parent = $.jstree._reference("#groupList")._get_parent($node);

	//if($node.type != 'root') return;
	var items = {
			createItem: {
				label: "그룹추가",
	            action: function (obj) {
	            	$node = tree.create_node($node);
                    tree.edit($node);
	            }
			},
			userItem: {
				label: "사원추가",
	            action: function (obj) {
	            	//$node = tree.create_node($node);
                    //tree.edit($node);z
	            	//console.log($node.id);           
	            	showModalUserList($node.id);
	            	
	            }
			},
	        renameItem: { // The "rename" menu item
	            label: "이름변경",
	            action: function () {
	            	tree.edit($node);
	            }
	        },
/*	        knowledgerItem: { 
	            label: "지식담당자",
	            icon : "fa fa-check",
	            action: function () {
	            	//tree.edit($node);
	            	setKnowledger($node.parent, $node.id, $node.original.klg);
	            }
	        },*/
	        deleteItem: { // The "delete" menu item
	            label: "삭제",
	            separator_before: true,
                separator_after: false,
	            action: function () {
	            	//setDeptStatus($node);
	            	if(confirm("해당 그룹을 삭제하시겠습니까? \n삭제된 그룹은 복원 할 수 없습니다")){
	            		tree.delete_node($node);
	            		setGroupDelete($node.id);
	            	}
	            	
	            }
	        },
	        deleteUserItem: { // The "delete" menu item
	            label: "삭제",
	            separator_before: true,
                separator_after: false,
	            action: function () {
	            	//setDeptStatus($node);
	            	if(confirm("해당 사원을 삭제하시겠습니까? \n삭제된 사원은 복원 할 수 없습니다")){
	            	 	tree.delete_node($node);
	            	 	setUserDelete($node.parent, $node.id);
	            	}
	            }
	        }
	    };

	    if ($node.type == "root") {
	        // Delete the "delete" menu item
	    	delete items.userItem;
	    	delete items.renameItem;
	        delete items.deleteItem;
	        delete items.knowledgerItem;
	        delete items.deleteUserItem;
	    }else if($node.type == 'admin'){
	    	delete items.createItem;
	    	delete items.renameItem;
	    	delete items.knowledgerItem;
	        delete items.deleteItem;
	        delete items.deleteUserItem;
	    }else if($node.type == 'group'){
	    	delete items.createItem;
	    	delete items.knowledgerItem;
	    	delete items.deleteUserItem;
	    /*}else if($node.type == 'user' && (parent.type == 'root' || parent.type == 'admin')){
	    	delete items.createItem;
	    	delete items.userItem;
	    	delete items.knowledgerItem;
	    	delete items.renameItem;
	    	delete items.deleteItem;*/
	    }else if($node.type == 'user'){
	    	delete items.createItem;
	    	delete items.userItem;
	    	delete items.renameItem;
	    	delete items.deleteItem;
	    	
	    }
	    
	    return items;
}
function groupCreate(id) {
	var ref = $('#'+id).jstree(true);
	var sel = 0;
	sel =ref.create_node(0, {"type":"menu"});
	if(sel) {//생성 된 노드 text수정
		ref.edit(sel);
	}                  

};
function groupRename(id){
	var ref = $('#'+id).jstree(true);
	var sel = ref.get_selected();
	var node = ref.get_node(sel);
	console.log(sel);
	
	if(!sel.length) {               
		$("#alert").html("그룹을 선택하세요.");
    	$('#modalAlert').modal('show');
		return false; 
	}else if(node.type == 'admin' || node.type == 'root'){
		$("#alert").html("해당 그룹은 수정 할 수 없습니다.");
    	$('#modalAlert').modal('show');
		return false; 
	}

	sel = sel[0];
	if(sel > 0){
		ref.edit(sel);
	}
}
function groupDelete(id){             
	var ref = $('#'+id).jstree(true);
	var sel = ref.get_selected()
	var node = ref.get_node(sel);
	console.log(node.type);
	
	if(!sel.length){
		$("#alert").html("그룹을 선택하세요.");
    	$('#modalAlert').modal('show');
		return false;
	}                                                          
	if(node.type == 'admin' || node.type == 'root'){
		$("#alert").html("해당 그룹은 삭제 할 수 없습니다.");
    	$('#modalAlert').modal('show');
	}else if(node.type == 'user'){
		$("#alert").html("삭제 할 그룹을 선택하세요.");          
    	$('#modalAlert').modal('show');
	}else{
		if(sel > 0){
			//alert(node.id);                                   
			if(confirm("해당 그룹을 삭제하시겠습니까? \n 삭제된 그룹은 복원 할 수 없습니다")){
				ref.delete_node(node);
				setGroupDelete(node.id);	                  
			}
		}
	}                                           
}
function userAdd(id){
	
	var ref = $('#'+id).jstree(true);
	var sel = ref.get_selected()
	var node = ref.get_node(sel);
	//console.log(sel);
	//alert(sel);
	 
	if(!sel.length  || sel == 0){
		$("#alert").html("그룹을 선택하세요.");
    	$('#modalAlert').modal('show');
		return false;
	}  
	
	showModalUserList(node.id);                
	
}
function userDelete(id){
	
	var ref = $('#'+id).jstree(true);
	var sel = ref.get_selected();
	var node = ref.get_node(sel);
	//alert(sel);                 
	if(node.type !='user'){
		$("#alert").html("사원을 선택하세요.");
    	$('#modalAlert').modal('show');
		return false;
	}                      
	if(confirm("해당 사원을 삭제하시겠습니까?삭제된 사원은 복원 할 수 없습니다")){
		setUserDelete(node.parent,node.id);        
	}       
}

function getUserListOfDept(){
	$.ajax({
		url : "getUserListOfDept.do"
		, method:'POST'
		, dataType : "json"
		, data : {grpNo : selId}
	}).done(function(data) {
		$('#deptList').jstree({
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
			/*"search" : {  
                "case_insensitive" : true,  
                "ajax" : {  
                    "url" : "getUserListOfDept.do" 
                }  
            }, */ 
			"plugins" : ["types", "sort" ]
		}).on('changed.jstree', function(e, data) {
			
		}).on('loaded.jstree', function(e, data) {
			console.log(data.parent);
			$('#deptList').jstree('open_all');			
		}).on('select_node.jstree', function(e, data) {
			//console.log(data.node.type);
			if(data.node.type!="user"){
				data.instance.deselect_node(data.node);
			}
						
		})
	});
}

var selId;
function showModalUserList(id){
	selId = id;
	$("#modalUserList").modal('show');
}

function setGroupUser(){
	var selected_ids = [];   
	var selected_idx = $("#deptList").jstree('get_selected', true);
	//var node = selected_idx.get_node();
	console.log(selected_idx);
	
	$.each(selected_idx, function(index, values){
		var id = selected_idx[index].id;
		var dId = id.substring(id.indexOf("D")+1);
		id = id.substring(1, id.indexOf("D"));          
		                           
		selected_ids.push(parseInt(id));
	});
	            
	if(selected_ids.length > 0){
		for(var i = 0; i < selected_ids.length-1; i++){
			//기존사용자  존재여부
			for(var j = (i+1); j < selected_ids.length; j++){
				console.log("===="+i+":" + selected_ids[i] + "," + selected_ids[j]);
				if(selected_ids[i] == selected_ids[j]){
					selected_ids.splice(j, 1);
					
				}                              
			}             
		}
		
		$.ajax({
			url : "./addGroupUser.do",		
			type : "json",		
			method : "post",
			data : {grpSeq: selId, listEmp : selected_ids},
			beforeSend:function(){
			},
			success : function(data){
				var response = data.response;
				if(response > 0){
					//$('#modalUserList').modal("hide");
					$('#groupList').jstree('destroy');
					getGroupList();
				}else{
					
				}
				
			},
			error : function(request,status,error){			
				$("#alert").html("오류가 발생하였습니다.");
		    	$('#modalAlert').modal('show');
			}
		});
		
		$('#modalUserList').modal("hide");
		
	}else{
		$("#alert").html("최소 1개 이상의 부서를 선택하세요.");
    	$('#modalAlert').modal('show');
	}
}

function setGroup(a, b){
	$.ajax({
		url : "./addGroup.do",		
		type : "json",		
		method : "post",
		data : {id : a, text : b},
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

function setGroupDelete(a){
	$.ajax({
		url : "./deleteGroup.do",		
		type : "json",		
		method : "post",
		data : {id : a},
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

function setUserDelete(a, b){
	b = b.substring(1, b.indexOf("G"));
	$.ajax({
		url : "./deleteGroupUser.do",		
		type : "json",		
		method : "post",
		data : {no : a, id : b},
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response > 0){
				$('#groupList').jstree('destroy');
				getGroupList();
			}else{
				
			}
			
		},
		error : function(request,status,error){			
			$("#alert").html("오류가 발생하였습니다.");
	    	$('#modalAlert').modal('show');
	    	
	    	$('#groupList').jstree('destroy');
			getGroupList();
		}
	});
}


