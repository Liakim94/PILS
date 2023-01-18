$(function(){
	/*$('#frmPost').parsley({ errorClass: 'has-error'}).on('form:validate', function (formInstance) {
	  });
	
	Parsley.on('form:submit', function() {
		return true;
	});*/
	
	$(".btn-save").on("click", function(){
		$("#frmPost").submit();
	})
	
	$("#frmPost").validate({
		ignore: "",
        rules: {
        	steNm:{required:true, minlength:2},
        	//steUrl:{required:true},
        	//steIp:{required:true, digit:true}
        },
        onkeyup:false,
        onclick:false,
        onfocusout:false,
        messages: {
        	steNm:{required:"사이트명을 입력하세요", minlength:"최소 {0}자 이상이어야 합니다."},
        	steUrl:{required:"사이트 URL을 입력하세요"},
        	steIp:{required:"사이트 IP를 입력하세요", digit:"숫자만 입력가능합니다."}
        },        
        submitHandler: function (frm) {
        	//??
        	//alert(frm);
        	var aclList = "";
        	$("#acl-list option").each(function (index) {
    			var id = $(this).val();
    			var txt = $(this).text();
    			var acl = $(this).attr("aria-acl");
    			aclList += (id + "¶" + txt + "¶" + acl +",");
    		});
        	
        	$("#arrAcl").val(aclList);
        	
        	
        	//alert("endSubmit");
        	frm.submit();
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
		
});


function tempPost(){
	$("#cmd").val("tmp");
	/*var frm = $("#frmPost");
	//var frm = document.frmPost;
	
	frm.submit();
	*/
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
