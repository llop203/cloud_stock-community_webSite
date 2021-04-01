<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<%@ page import="com.cloudStock.erp.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>주식</title>
<script>
	var num = 5;
	
	function timer(){	
	document.getElementById('second').innerHTML = num;

	window.setInterval(
			function(){
				document.getElementById('second').innerHTML = --num;
				if(num==1){
					location.replace("/crawlingForm.do");
				}
			}
			, 1*1000
		);
	}
	
	$(document).ready(function(){
		timer();
		$.ajax({
			url : "${croot}/stockProc.do"
			,type : "post"
			,data : "stock=" + 1
			,success : function(insertStockCnt){
				if(insertStockCnt == 1){	
				}
				else{
					alert("실패");							
				}
			}
			,error : function(){
				alert("서버 접속 실패");
			}
		})
	});
</script>
</head>

<body id="default_theme" class="home_page1">
   
      <!-- header -->
      <header class="header header_style1">
         
      </header>
    
    <center>
		<img src='/resources/img/loading.gif'/><br>
		<span id='second'></span>초 후 주식 종목 비교 페이지로 이동...
	</center>
</body>
</html>