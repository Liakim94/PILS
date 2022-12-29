<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>

<html lang="ko" class="ko">
<head>
	
    <style>
        /* 		body {overflow:hidden} */
        .smes_wrapper {
            display: table;
            width: 100%;
            height: 100%;
            background-color: #e3ecf3;
            position: absolute;
            z-index: 10000
        }

        .smes_wrapper .v-box {
            display: table-cell;
            width: 100%;
            height: 100%;
            vertical-align: middle;
            text-align: center
        }

        .logo-element {
            display: inline-block;
            width: 500px;
        }

        .inner {
            border-bottom: 1px solid #acc0d0;
            padding-bottom: 35px
        }

        .error-txt {
            margin-top: 50px;
            font-size: 20px;
            color: #003964;
            line-height: 35px
        }
    </style>           
</head>	             
<body class="homepage" id="body">        
                                  
	<div class="wrapper sub">                                                                            
		<div class="normal-wrap">	
			<decorator:body /> 
		</div>
	</div>	
</body>
</html>