<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<%@ page import="com.cloudStock.erp.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>주식</title>
	
	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);	

	//--------------------------------------------------------------
	var arr = [];
	var arr2 = [];

	<c:forEach var="i" begin="0" end="${size}">
		arr.push( [ "${stockDateList[i]}", parseInt(${lowestPriceList[i]},10), parseInt(${openPriceList[i]},10), parseInt(${closePriceList[i]},10), parseInt(${highestPriceList[i]},10) ] );
		arr2.push( [ "${stockDateList2[i]}", parseInt(${lowestPriceList2[i]},10), parseInt(${openPriceList2[i]},10), parseInt(${closePriceList2[i]},10), parseInt(${highestPriceList2[i]},10) ] );
	</c:forEach>
	//--------------------------------------------------------------
	
	
	//--------------------------------------------------------------
	function drawChart() {
		var data = google.visualization.arrayToDataTable(arr, true);
		var data2 = google.visualization.arrayToDataTable(arr2, true);
		
		var options = {
			legend:'none'
			, colors:['black','red'],
		      candlestick: {
		           fallingColor:{ fill: "blue", strokeWidth:0.5,stroke:'black'},
		           risingColor:{fill:"red",strokeWidth:0.5,stroke:'black'}}
		};
		
		var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));
		var chart2 = new google.visualization.CandlestickChart(document.getElementById('chart_div2'));
		
		chart.draw(data, options);
		chart2.draw(data2, options);
	}
	//--------------------------------------------------------------
</script>
</head>
<body><center>
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
    <hr>
    <div id="chart_div2" style="width: 900px; height: 500px;"></div>
</body>

</html>