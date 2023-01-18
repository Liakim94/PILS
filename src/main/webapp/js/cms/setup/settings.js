$(function(){
	$("#form").validate({
		ignore: "",
        rules: {
        	//loginFailCnt:{digit:true}
        	//groupNm:{required:true},
        	//typ:{required:true}
        },
        onkeyup:false,
        onclick:false,
        onfocusout:false,
        messages: {
        	//loginFailCnt:{digit:"로그인 실패 횟수는 숫자만 가능합니다."}
        	//groupNm:{required:"부서 또는 그룹은 필수 입력요소입니다."},
        	//typ:{required:"유형은 필수 입력요소입니다."}
        },        
        submitHandler: function (frm) {

        	
        	//submitForm(); 
        	frm.submit();
        	
        	
        },
        showErrors:function(errorMap, errorList){
			if(!$.isEmptyObject(errorList)){
		       	/*$.each(errorList, function() {
                	//alert(this.message); //summary += " * " + this.message + "<br>" ;
		       		$("#alert").html(this.message);
                	$('#modalAlert').modal('show');
                	return false;
            	});*/
		       	this.defaultShowErrors();
			}
		}
    });
	
	$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass   : 'iradio_minimal-red'
    });
});

