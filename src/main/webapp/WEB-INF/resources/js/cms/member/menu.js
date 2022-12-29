function nodeCreate() {
	
	var per = $('#userRank').jstree(true),sel = per.get_selected(); // 트리에서 선택된 노드 아이디 가져옴
	if(!sel.length) {  // 선택된 노드가 없으면 "" 이 리턴됨
		alert("상위메뉴를 선택하세요");
		return false; 
	}
	
	node = per.get_node(sel);
	if(node.type == "root"){
		sel = sel[0];
		sel = per.create_node(sel, {"type":"menu"}); //노드 생성
		if(sel) {//생성 된 노드 text수정
			per.edit(sel);
		}
	}else{
		alert("하위 회원등급을 생성할수 없습니다.");
	}
	
	
};

function nodeRename() {
	var per = $('#userRank').jstree(true),sel = per.get_selected();
	
	if(!sel.length) { 
		alert("등급를 선택하세요");
		return false; 
	}
	
	sel = sel[0];
	
	
	if(sel > 1 && sel != 99999999){
		per.edit(sel);
	} else{
		alert("수정 할 수 없는 등급 입니다.");
	}
};

function nodeDelete() {
	var per = $('#userRank').jstree(true),sel = per.get_selected(),
		node = per.get_node(sel);
	
	if(!sel.length) { return false; }
	if(node.type != "root"){
		if(sel > 1 && sel != 99999999){
			setNodeDel(node);		
		}else{
			alert("삭제 할 수 없는 등급 입니다.");
		}
	}else{
		alert("삭제 할 수 없는 등급 입니다.");
	}
	
};



function getUserRank(seq){
	var host = location.href.indexOf(location.host)+location.host.length;
	var root = location.href.substring(host,location.href.indexOf('/',host+1));
	$.ajax({ 
		url : root+"/cms/member/getMemGrpList.do"
			, dataType : "json"
	}).done(function(data){ 
		$("#userRank").jstree({
			"core" : {
				'check_callback' : true,
				'data' : data
			},
			"contextmenu": {items:customMenu},
			"types":{ 
				"root":{
					"icon" : "fa fa-home" 
				},
				"folder":{
					"icon" : "fa  fa-users"
				},
				"delete":{
					"icon" : "fa fa-user-times"
				},
				"default":{
					"icon" : "fa  fa-user"
				}
			},
			"plugins" : ["contextmenu","types","search" ] 
			
		}).on('changed.jstree', function(e, data) { // 노드가 변경됬을떄
			
		}).on("loaded.jstree", function(){ // 노드를 불러올때 
			$("#userRank").jstree('open_all'); // <--- 펼쳐주는아이
			var jstree = $('#userRank').jstree(true);
			if(seq != '99999999'){
				jstree.select_node(seq);
			}
			
			
		}).on('create_node.jstree', function(e, data) { // 노드생성
			var max = 0;
			$('.jstree-node').each(function(){
				if(max < parseInt($(this).attr('id'))) max = parseInt($(this).attr('id'));
			});
			
			$(this).jstree(true).set_id(data.node, max+1);
		}).on('select_node.jstree', function(e, data) { // 노드 선택
			var evt =  window.event || e;
			var button = evt.which || evt.button;
			if(data.node.type == "delete") $("#btn-d").text("등급복원");
			
			if(button == 1){
				if(data.node.id != '99999999'){
					location.href="?pMemSeq="+data.node.id;
				}
				//setButtonText(data.node.type);
			}
		}).on('rename_node.jstree', function(e, data) { // 노드 이름변경
			setMemGrp(data.node.id, data.node.parent, data.node.text);
		}).on('move_node.jstree', function(e, data) { // 노드 움직임
			setNodeSort(data.node.parent, data.old_parent, data.position, data.old_position, data.node.id);
		}).on("dblclick.jstree", function (e, data) {
			
			
		})
	});
}

function customMenu($node){
	var tree = $("#userRank").jstree(true);
	var items = { 
			createItem: {
				label: "등급추가",
	            action: function (obj) {
	            	$node = tree.create_node($node);
                    tree.edit($node);
	            }
			},
	        renameItem: { // The "rename" menu item
	            label: "등급명변경",
	            action: function () {
	            	tree.edit($node);
	            }
	        },
	        deleteItem: { // The "delete" menu item
	            label: "사용안함",
	            separator_before: true,
                separator_after: false,
	            action: function () {
	            	tree.delete_node($node);
	            	setNodeDel($node);
	            }
	        }
	    };

	    if ($node.type == "root") {
	    	delete items.renameItem;
	        delete items.deleteItem;
	    }else{
	    	delete tiems.createItem;
	    }

	    return items;
}


function setMemGrp(id, pnt, cont){
	var host = location.href.indexOf(location.host)+location.host.length;
	var root = location.href.substring(host,location.href.indexOf('/',host+1));
	$.ajax({
		url : root+ "/cms/member/group.do",		
		type : "json",		
		method : "post",
		data : {grpSeq : id, pMemSeq : pnt, grpNm : cont, gubun: "update"},
		beforeSend:function(){
		},
		success : function(data){
			
		},
		error : function(request,status,error){			
			$("#alert").html("오류가 발생하였습니다.");
	    	$('#modalAlert').modal('show');
		}
	}); 
}


function setNodeSort(pnt, opnt, pos, opos, id){
	
	/*$.ajax({
		url : "/cms/member/sorting.do",		
		type : "json",		
		method : "post",
		data : {pMemSeq : pnt, old_parent : opnt, position : pos, old_position : opos, grpSeq : id},
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
	});*/
}

function setNodeDel($node){
	var host = location.href.indexOf(location.host)+location.host.length;
	var root = location.href.substring(host,location.href.indexOf('/',host+1));
	var tree = $("#userRank").jstree(true);
	var status = "N";
	if($node.type == 'delete') status = 'Y';
	$.ajax({
		url :root+ "/cms/member/grpDel.do",		
		type : "json",		
		method : "post",
		data : {grpSeq: $node.id, useAt: status},
		beforeSend:function(){
		},
		success : function(data){
			var result = data.result;
			if(result > 0){
				if($node.type == 'delete'){
					tree.set_type($node, "folder");
					setButtonText("folder");
				}else{
					tree.set_type($node, "delete");
					setButtonText("delete");
				}
				//setMenuUpdateStatus($node.type);
			}else{
				
			}
			
		},
		error : function(request,status,error){			
		}
	});
	
	
}

function setButtonText(str){
	if(str === 'delete'){
		$("#btn-d").text("등급복원");
	}else{
		$("#btn-d").text("등급삭제");
	}
}