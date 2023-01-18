$(function(){
	getTypeList();
});

function getTypeList(){
	$.ajax({
		url : "getTypeList.do"
		, dataType : "json"
	}).done(function(data) {
		$('#typeList').jstree({
			"core" : {
				'check_callback': true
				, 'data' : data
			},
			"contextmenu": {items:customMenu},/*{         
			    "items": function($node) {
			        var tree = $("#typeList").jstree(true);
			        return {
			            "Create": {
			                "separator_before": false,
			                "separator_after": false,
			                "label": "유형추가",
			                "action": function (obj) { 
			                    $node = tree.create_node($node);
			                    tree.edit($node);
			                }
			            },
			            "Rename": {
			                "separator_before": false,
			                "separator_after": false,
			                "label": "이름바꾸기",
			                "action": function (obj) { 
			                    tree.edit($node);
			                }
			            },                         
			            "Remove": {
			                "separator_before": true,
			                "separator_after": false,
			                "label": "삭제",
			                "action": function (obj) { 
			                    tree.delete_node($node);
			                }
			            }
			        };
			    }
			},*/
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
			//console.log(data);
			/*var ref = $('#typeList').jstree(true),
			sel = ref.get_selected(true);
			if(!sel.length) {
				return;
			}
			
			sel = sel[0];
			var id =  $(sel).attr("id");
			var status = $(sel).attr("useAt")
			
			console.log(id);*/
			
			/*if(id != null && id != '') {
		    	if(parentId == "#") {
		    		 $("#menuForm").each(function() {  
						this.reset();  
					});
		    		
		    	}
		    }*/
			
			
			
		}).on('loaded.jstree', function() {
			$('#typeList').jstree('open_all');
		})/*.on('open_node.jstree', function(e, data) {
			var icon = $('#' + data.node.id).find('i.jstree-icon.jstree-themeicon').first();
		    icon.removeClass('fa-folder-o').addClass('fa-folder-open-o');
		}).on('close_node.jstree', function(e, data) {
			var icon = $('#' + data.node.id).find('i.jstree-icon.jstree-themeicon').first();
		    icon.removeClass('fa-folder-open-o').addClass('fa-folder-o');
		})*/.on('create_node.jstree', function(e, data) {
			var max = 0;
			$('.jstree-node').each(function(){
				if(max < parseInt($(this).attr('id'))) max = parseInt($(this).attr('id'));
			});
			
			$(this).jstree(true).set_id(data.node, max+1);
		}).on('rename_node.jstree', function(e, data) {
			setType(data.node.id, data.node.parent, data.node.text);
		}).on('move_node.jstree', function(e, data) {
			setTypeSort(data.node.parent, data.old_parent, data.position, data.old_position, data.node.id);
		})
	});
}

function customMenu($node){
	var tree = $("#typeList").jstree(true);
	var items = {
			createItem: {
				label: "유형추가",
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
	            	//tree.delete_node($node);
	            	setTypeStatus($node);
	            }
	        }
	    };

	    /*if ($(node).hasClass("folder")) {
	        // Delete the "delete" menu item
	        delete items.deleteItem;
	    }*/
		if($node.type == 'folder' || $node.type == 'default'){
			items.deleteItem.label = "사용안함";
		}else{
			items.deleteItem.label = "사용";
		}

	    return items;
}


function setType(a, b, c){
	
	//alert(a + ","+ b + ","+c);
	if(b === "#") b = "0";
	
	$.ajax({
		url : "./addType.do",		
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

function setTypeSort(a, b, c, d, e){
	
	//alert(a +","+b+","+c+","+d+","+e);
	if(a === "#") a = "0";
	if(b === "#") b = "0";
	
	$.ajax({
		url : "./updateTypeSort.do",		
		type : "json",		
		method : "post",
		data : {parent : a, old_parent : b, position : c, old_position : d, typSeq : e},
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

function setTypeStatus($node){
	//console.log($node.id+","+$node.type);
	var tree = $("#typeList").jstree(true);
	var status = "N";
	if($node.type == 'delete') status = 'Y';
	$.ajax({
		url : "./updateTypeStatus.do",		
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
			
		},
		error : function(request,status,error){			
			$("#alert").html("오류가 발생하였습니다.");
	    	$('#modalAlert').modal('show');
		}
	});
}
