<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
	<script>
	var pageContext = "${pageContext.request.contextPath }";
	var sUserId = "";
	var sUserName = "";
	var sUserNo = "";
	var sUserNum = "${sessionScope.USERSEQ}";
	var sUserLevel = "${sessionScope.USERLEVEL}";
	</script>
    <!--[if lt IE 9]>
        <script src="${pageContext.request.contextPath }/x2/plugins/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="${pageContext.request.contextPath }/x2/plugins/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- jQuery 2.1.4 -->
    <script src="${pageContext.request.contextPath }/x2/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <%-- <script src="${pageContext.request.contextPath }/x2/plugins/jQueryUI/jquery-ui.min.js"></script> --%>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <%-- <script src="${pageContext.request.contextPath }/x2/plugins/validate/parsley-2.6.2.js"></script> --%>
    <script src="${pageContext.request.contextPath }/x2/plugins/validate/jquery.validate.js"></script>
    <!-- <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script> -->
    <!-- Bootstrap 3.3.5 -->
    <script src="${pageContext.request.contextPath }/x2/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/x2/bootstrap/js/bootstrap-tagsinput.min.js"></script>
    <!-- ionslider -->
	<script src="${pageContext.request.contextPath }/x2/plugins/ionslider/ion.rangeSlider.js"></script>
    
    <!-- Morris.js charts -->
    <script src="${pageContext.request.contextPath }/x2/plugins/raphael/2.1.0/raphael-min.js"></script>
    <%-- <script src="${pageContext.request.contextPath }/x2/plugins/morris/morris.min.js"></script> --%>
    <!-- Sparkline -->
    <script src="${pageContext.request.contextPath }/x2/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!-- jvectormap -->
    <script src="${pageContext.request.contextPath }/x2/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/x2/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="${pageContext.request.contextPath }/x2/plugins/knob/jquery.knob.js"></script>
    <!-- daterangepicker -->
    <script src="${pageContext.request.contextPath }/x2/plugins/moment/2.10.2/moment.min.js"></script>
    <script src="${pageContext.request.contextPath }/x2/plugins/moment/2.10.2/ko.js"></script>
    <script src="${pageContext.request.contextPath }/x2/plugins/daterangepicker/daterangepicker.js"></script>
    <!-- datepicker -->
    <script src="${pageContext.request.contextPath }/x2/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script src="${pageContext.request.contextPath }/x2/plugins/datepicker/locales/bootstrap-datepicker.kr.js"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="${pageContext.request.contextPath }/x2/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <!-- Slimscroll -->
    <script src="${pageContext.request.contextPath }/x2/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <%-- <script src="${pageContext.request.contextPath }/x2/plugins/fastclick/fastclick.min.js"></script> --%>
    
    <!-- InputMask -->
	<script src="${pageContext.request.contextPath }/x2/plugins/input-mask/jquery.inputmask.js"></script>
	<script src="${pageContext.request.contextPath }/x2/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="${pageContext.request.contextPath }/x2/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	
	<!-- Select2 -->
	<script src="${pageContext.request.contextPath }/x2/plugins/select2/select2.full.js"></script>
    
    <!-- switchery -->
	<script src="${pageContext.request.contextPath }/x2/plugins/switchery/switchery.min.js"></script>
	
	
	<script src="${pageContext.request.contextPath }/x2/plugins/pace/pace.js"></script>
	
	<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
    <%-- <script src="${pageContext.request.contextPath }/js/common/common.js"></script> --%>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath }/x2/dist/js/app.min.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <%-- <script src="${pageContext.request.contextPath }/x2/dist/js/pages/dashboard.js"></script> --%>
    <!-- AdminLTE for demo purposes -->
    <%-- <script src="${pageContext.request.contextPath }/x2/dist/js/demo.js"></script> --%>
    
   
    
    
    <script>
    //jQuery.noConflict();
    $(function(){
    	$(".select2").select2();
    	$("[data-mask]").inputmask();
    	 $('[data-toggle="popover"]').popover({container: 'body'}); 
    	 $('[data-toggle="tooltip"]').tooltip({container: 'body'});
    	 //$('.picker-dt').datepicker();
    	 $('.range-dt').daterangepicker();
    	 
    	  
    	 
    	
    	 var elems = Array.prototype.slice.call(document.querySelectorAll('.switch'));

   		elems.forEach(function(html) {
   		  var switchery = new Switchery(html,{ size: 'small' });
   		});
   		
	   	 /* $(".clickable-row").click(function() {
	         window.location = $(this).data("href");
	     }); */
	   	 
	   	$(".todo-list .clickable-row").on("mouseover", function() {
	         $(this).find(".tools").css("display", "block");
	     });
	   	
	   	$(".todo-list .clickable-row").on("mouseout", function() {
	         $(this).find(".tools").css("display", "none");
	     });
    });
    </script>