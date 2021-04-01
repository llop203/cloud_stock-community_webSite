<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
	   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>종목 비교 결과</title>
      

   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript">
   google.charts.load('current', {'packages':['line']});
   google.charts.setOnLoadCallback(drawChart);   

	var arr1 = [];
	var arr2 = [];
	var arr3 = [];

	<c:forEach var="i" begin="1" end="${fn:length(stockDateList1) }">
		arr1.push( [ "${stockDateList1[i-1].stock_date}", ${closePriceList1[i-1].close_price} ] );
	</c:forEach>
	<c:forEach var="i" begin="1" end="${fn:length(stockDateList2) }">
		arr2.push( [ "${stockDateList2[i-1].stock_date}", ${closePriceList2[i-1].close_price} ] );
	</c:forEach>
	<c:forEach var="i" begin="1" end="${fn:length(stockDateList3) }">
		arr3.push( [ "${stockDateList3[i-1].stock_date}", ${closePriceList3[i-1].close_price} ] );
	</c:forEach>

	function drawChart() {	
		var data1 = new google.visualization.DataTable();		
		data1.addColumn('string', 'stock_date'); //data1.addColumn('date', 'Day'); [new Date('2015-08-01'), 5],
		data1.addColumn('number', 'close_price');
       	<c:if test="${closePriceList1 != null}">
			data1.addRows(arr1);
		</c:if>
		
		var data2 = new google.visualization.DataTable();		
		data2.addColumn('string', 'stock_date');
		data2.addColumn('number', 'close_price');	
       	<c:if test="${closePriceList2 != null}">
			data2.addRows(arr2);
		</c:if>
		
		var data3 = new google.visualization.DataTable();		
		data3.addColumn('string', 'stock_date');
		data3.addColumn('number', 'close_price');	
       	<c:if test="${closePriceList3 != null}">
			data3.addRows(arr3);
		</c:if>
		
		var options = {
			width: '100%',
			height: 200,
			legend:{position:'none'},
			vAxis:{
				format: '#,###'
			},
			hAxis:{
				title:""
			},
	        series: {
	            0: { color: 'gray' }
	        }
		};
		
		var chart1 = new google.charts.Line(document.getElementById('linechart_material1'));		
		chart1.draw(data1, google.charts.Line.convertOptions(options));
		var chart2 = new google.charts.Line(document.getElementById('linechart_material2'));		
		chart2.draw(data2, google.charts.Line.convertOptions(options));
		var chart3 = new google.charts.Line(document.getElementById('linechart_material3'));		
		chart3.draw(data3, google.charts.Line.convertOptions(options));
	}

	$(window).resize(function() { 
		if(this.resizeTO) clearTimeout(this.resizeTO); 
		this.resizeTO = setTimeout(function() { 
			$(this).trigger('resizeEnd'); 
		}, 500); 
	}); 

	$(window).on('resizeEnd', function() { 
		drawChart(); 
	});

    $(document).ready(function(){		     
	    $("[name=chooseItem1]").find("div.imf_icon").html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"80\" height=\"80\" fill=\"#00D8FF\" class=\"bi bi-pin\" viewBox=\"0 0 16 16\"><path d=\"M4.146.146A.5.5 0 0 1 4.5 0h7a.5.5 0 0 1 .5.5c0 .68-.342 1.174-.646 1.479-.126.125-.25.224-.354.298v4.431l.078.048c.203.127.476.314.751.555C12.36 7.775 13 8.527 13 9.5a.5.5 0 0 1-.5.5h-4v4.5c0 .276-.224 1.5-.5 1.5s-.5-1.224-.5-1.5V10h-4a.5.5 0 0 1-.5-.5c0-.973.64-1.725 1.17-2.189A5.921 5.921 0 0 1 5 6.708V2.277a2.77 2.77 0 0 1-.354-.298C4.342 1.674 4 1.179 4 .5a.5.5 0 0 1 .146-.354zm1.58 1.408l-.002-.001zm-.002-.001l.002.001A.5.5 0 0 1 6 2v5a.5.5 0 0 1-.276.447h-.002l-.012.007-.054.03a4.922 4.922 0 0 0-.827.58c-.318.278-.585.596-.725.936h7.792c-.14-.34-.407-.658-.725-.936a4.915 4.915 0 0 0-.881-.61l-.012-.006h-.002A.5.5 0 0 1 10 7V2a.5.5 0 0 1 .295-.458 1.775 1.775 0 0 0 .351-.271c.08-.08.155-.17.214-.271H5.14c.06.1.133.191.214.271a1.78 1.78 0 0 0 .37.282z\"/></svg>");
	    $("[name=chooseItem2]").find("div.imf_icon").html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"80\" height=\"80\" fill=\"#00D8FF\" class=\"bi bi-pin\" viewBox=\"0 0 16 16\"><path d=\"M4.146.146A.5.5 0 0 1 4.5 0h7a.5.5 0 0 1 .5.5c0 .68-.342 1.174-.646 1.479-.126.125-.25.224-.354.298v4.431l.078.048c.203.127.476.314.751.555C12.36 7.775 13 8.527 13 9.5a.5.5 0 0 1-.5.5h-4v4.5c0 .276-.224 1.5-.5 1.5s-.5-1.224-.5-1.5V10h-4a.5.5 0 0 1-.5-.5c0-.973.64-1.725 1.17-2.189A5.921 5.921 0 0 1 5 6.708V2.277a2.77 2.77 0 0 1-.354-.298C4.342 1.674 4 1.179 4 .5a.5.5 0 0 1 .146-.354zm1.58 1.408l-.002-.001zm-.002-.001l.002.001A.5.5 0 0 1 6 2v5a.5.5 0 0 1-.276.447h-.002l-.012.007-.054.03a4.922 4.922 0 0 0-.827.58c-.318.278-.585.596-.725.936h7.792c-.14-.34-.407-.658-.725-.936a4.915 4.915 0 0 0-.881-.61l-.012-.006h-.002A.5.5 0 0 1 10 7V2a.5.5 0 0 1 .295-.458 1.775 1.775 0 0 0 .351-.271c.08-.08.155-.17.214-.271H5.14c.06.1.133.191.214.271a1.78 1.78 0 0 0 .37.282z\"/></svg>");
	    $("[name=chooseItem3]").find("div.imf_icon").html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"80\" height=\"80\" fill=\"#00D8FF\" class=\"bi bi-pin\" viewBox=\"0 0 16 16\"><path d=\"M4.146.146A.5.5 0 0 1 4.5 0h7a.5.5 0 0 1 .5.5c0 .68-.342 1.174-.646 1.479-.126.125-.25.224-.354.298v4.431l.078.048c.203.127.476.314.751.555C12.36 7.775 13 8.527 13 9.5a.5.5 0 0 1-.5.5h-4v4.5c0 .276-.224 1.5-.5 1.5s-.5-1.224-.5-1.5V10h-4a.5.5 0 0 1-.5-.5c0-.973.64-1.725 1.17-2.189A5.921 5.921 0 0 1 5 6.708V2.277a2.77 2.77 0 0 1-.354-.298C4.342 1.674 4 1.179 4 .5a.5.5 0 0 1 .146-.354zm1.58 1.408l-.002-.001zm-.002-.001l.002.001A.5.5 0 0 1 6 2v5a.5.5 0 0 1-.276.447h-.002l-.012.007-.054.03a4.922 4.922 0 0 0-.827.58c-.318.278-.585.596-.725.936h7.792c-.14-.34-.407-.658-.725-.936a4.915 4.915 0 0 0-.881-.61l-.012-.006h-.002A.5.5 0 0 1 10 7V2a.5.5 0 0 1 .295-.458 1.775 1.775 0 0 0 .351-.271c.08-.08.155-.17.214-.271H5.14c.06.1.133.191.214.271a1.78 1.78 0 0 0 .37.282z\"/></svg>");
	    $("[name=chooseItem1]").css({"cursor":"default"});
	    $("[name=chooseItem2]").css({"cursor":"default"});
	    $("[name=chooseItem3]").css({"cursor":"default"});
	    
		$("[name=goCompare_btn]").click(function(){
			document.crawlingForm.action="/crawlingForm.do";
			document.crawlingForm.submit();					
	    });
	    
		$("[name=showMoreGraph1], [name=showMoreGraph2], [name=showMoreGraph3]").change(function(){
			document.crawlingForm.action="/crawlingInfoForm.do";
			document.crawlingForm.submit();					
	    });

	    $("[name=showMoreGraph1]").val("${crawlingDTO.showMoreGraph1}").prop("selected",true);
	    $("[name=showMoreGraph2]").val("${crawlingDTO.showMoreGraph2}").prop("selected",true);
	    $("[name=showMoreGraph3]").val("${crawlingDTO.showMoreGraph3}").prop("selected",true);
	});
	
   </script>
   </head>
   
   
   <body id="default_theme" class="home_page1">
   
      <c:if test="${sessionScope.user_no == null}">
   <header class="header header_style1">
         <div class="container">
            <div class="row">
               <div class="col-md-9 col-lg-10">
                  <div class="logo">
                  	<a href="${croot}/mainPageForm.do"><img src="/resources/img/cloudStock_3.png" style="width:150;" ></a>
                  </div>
                  <div class="main_menu float-right">
                    <!-- 메뉴바  -->
                     <div class="menu">
                        <ul class="clearfix">
                           <li><a href="${croot}/keywordListForm.do" style="font-size: 17px;"><strong>주식용어 사전</strong></a></li>
                           <li><a href="${croot}/tipBoardForm.do" style="font-size: 17px;"><strong>꿀팁게시판</strong></a></li>
                           <li><a href="${croot}/freeBoardForm.do" style="font-size: 17px;"><strong>자유게시판</strong></a></li>
                           <li><a href="${croot}/analysisForm.do" style="font-size: 17px;"><strong>성향 분석</strong></a></li>
                           <li class="active"><a href="${croot}/stockForm2.do" style="font-size: 17px;"><strong>KOSPI200 주가현황</strong></a></li>
                        </ul>
                     </div>
                  </div>
               </div>
               	<div class="col-md-3 col-lg-2">   
                    <div class="right_bt">
                           <a class="bt_main" href="${croot}/loginForm.do">로그인</a> 
                     </div>   
                </div>
          	</div>
       	</div>
  	</header>
  </c:if>
    <!------------------------------------------------------------------------------------>
   <c:if test="${sessionScope.user_no != null}">
      <header class="header header_style1">
         <div class="container">
            <div class="row">
               <div class="col-md-7 col-lg-9">
                  <div class="logo">
                  	<a href="${croot}/mainPageForm.do"><img src="/resources/img/cloudStock_3.png" style="width:150;" ></a>
                  </div>
                  <div class="main_menu float-right">
                    <!-- 메뉴바  -->
                     <div class="menu">
                        <ul class="clearfix">
                           <li><a href="${croot}/keywordListForm.do" style="font-size: 17px;"><strong>주식용어 사전</strong></a></li>
                           <li><a href="${croot}/tipBoardForm.do" style="font-size: 17px;"><strong>꿀팁게시판</strong></a></li>
                           <li><a href="${croot}/freeBoardForm.do" style="font-size: 17px;"><strong>자유게시판</strong></a></li>
                           <li><a href="${croot}/analysisForm.do" style="font-size: 17px;"><strong>성향 분석</strong></a></li>
                           <li class="active"><a href="${croot}/stockForm2.do" style="font-size: 17px;"><strong>KOSPI200 주가현황</strong></a></li>
                        </ul>
                     </div>
                  </div>
               </div>
               	<div class="col-md-5 col-lg-3">   
                   <div class="btn-group right_bt">
                  	 <a class="bt_main" href="${croot}/logoutForm.do">로그아웃</a>
                   	 <a class="white_bt bt_main" style="min-width: 85; padding: 0 15px; margin-left:15px;"  href="${croot}/myPageForm.do">myPage</a>
                   </div>     
                </div>
          	</div>
       	</div>
   	</header>
 </c:if>
         
      
      <section id="banner_parallax" class="slide_banner1">
         <div class="container">
            <div class="row">
            
               <div class="col-md-12">
                  <div class="full">
                     <div class="slide_cont">
                        <h2>종목 비교</h2>
                     </div>
                  </div>
               </div>
                              
            </div>
         </div>
         
   
      </section>
      
      
      <form name="crawlingForm" method="post">
      <section class="layout_padding gradiant_bg cross_layout">
         <div class="container">      
         	<h3><font color="white">종목 비교 결과</font></h3><br><br>     
      		<input type="hidden" name="selectedStock"> 
      		<input type="hidden" name="selectedStockCode"> 
            <div class="row">
            	
               <div class="col-md-4" >
                  <span name="chooseItem1" id="1" style="cursor:pointer" data-toggle="modal" data-target="#staticBackdrop" >
                  <input type="hidden" id="is_clicked1" name="is_clicked1" value="no" >
      			  <input type="hidden" name="selectedStockCode1" value="${selectedStockMap1.stock_code}">
                  <div class="information_blogs_crawling">
                     <div class="imf_icon">
	                     <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#00D8FF" class="bi bi-pin-angle" viewBox="0 0 16 16">
	                     	<path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.92 5.92 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146zm.122 2.112v-.002zm0-.002v.002a.5.5 0 0 1-.122.51L6.293 6.878a.5.5 0 0 1-.511.12H5.78l-.014-.004a4.507 4.507 0 0 0-.288-.076 4.922 4.922 0 0 0-.765-.116c-.422-.028-.836.008-1.175.15l5.51 5.509c.141-.34.177-.753.149-1.175a4.924 4.924 0 0 0-.192-1.054l-.004-.013v-.001a.5.5 0 0 1 .12-.512l3.536-3.535a.5.5 0 0 1 .532-.115l.096.022c.087.017.208.034.344.034.114 0 .23-.011.343-.04L9.927 2.028c-.029.113-.04.23-.04.343a1.779 1.779 0 0 0 .062.46z"/>
	                     </svg>
                     </div>
                     	<c:if test="${empty selectedStockMap1}">
                     		<div class="imf_head" style="margin-top: 30px">
                     		<h4>&nbsp;</h4>
                     		<h3>선택한 종목이 없습니다.</h3>
<!--                      		<h4>&nbsp;</h4> -->
                     		</div>
                     	</c:if>
                     	<c:if test="${selectedStockMap1 != null}">
                     		<div class="imf_head" style="margin-top: 30px">
                     		<h4>${selectedStockMap1.stock_code}</h4>
                     		<h3>${selectedStockMap1.stock_name}</h3>
                     		<h4>${selectedStockMap1.industrial_name}</h4>
                     		</div>
                     	</c:if>
                  </div>
                  </span>
               </div>

               <div class="col-md-4">
                  <span name="chooseItem2" id="2" style="cursor:pointer">
                  <input type="hidden" id="is_clicked2" name="is_clicked2" value="no" >
      			  <input type="hidden" name="selectedStockCode2" value="${selectedStockMap2.stock_code}">
                  <div class="information_blogs_crawling">
                     <div class="imf_icon">
	                     <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#00D8FF" class="bi bi-pin-angle" viewBox="0 0 16 16">
	                     	<path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.92 5.92 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146zm.122 2.112v-.002zm0-.002v.002a.5.5 0 0 1-.122.51L6.293 6.878a.5.5 0 0 1-.511.12H5.78l-.014-.004a4.507 4.507 0 0 0-.288-.076 4.922 4.922 0 0 0-.765-.116c-.422-.028-.836.008-1.175.15l5.51 5.509c.141-.34.177-.753.149-1.175a4.924 4.924 0 0 0-.192-1.054l-.004-.013v-.001a.5.5 0 0 1 .12-.512l3.536-3.535a.5.5 0 0 1 .532-.115l.096.022c.087.017.208.034.344.034.114 0 .23-.011.343-.04L9.927 2.028c-.029.113-.04.23-.04.343a1.779 1.779 0 0 0 .062.46z"/>
	                     </svg>
                     </div>
                     	<c:if test="${empty selectedStockMap2}">
                     		<div class="imf_head" style="margin-top: 30px">
                     		<h4>&nbsp;</h4>
                     		<h3>선택한 종목이 없습니다.</h3>
                     		<h4>&nbsp;</h4>
                     		</div>
                     	</c:if>
                     	<c:if test="${selectedStockMap2 != null}">
                     		<div class="imf_head" style="margin-top: 30px">
                     		<h4>${selectedStockMap2.stock_code}</h4>
                     		<h3>${selectedStockMap2.stock_name}</h3>
                     		<h4>${selectedStockMap2.industrial_name}</h4>
                     		</div>
                     	</c:if>
                  </div>
                  </span>
               </div>

               <div class="col-md-4">
                  <span name="chooseItem3" id="3" style="cursor:pointer">
                  <input type="hidden" id="is_clicked3" name="is_clicked3" value="no">
      			  <input type="hidden" name="selectedStockCode3" value="${selectedStockMap3.stock_code}">
                  <div class="information_blogs_crawling">
                     <div class="imf_icon">
	                     <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#00D8FF" class="bi bi-pin-angle" viewBox="0 0 16 16">
	                     	<path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.92 5.92 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146zm.122 2.112v-.002zm0-.002v.002a.5.5 0 0 1-.122.51L6.293 6.878a.5.5 0 0 1-.511.12H5.78l-.014-.004a4.507 4.507 0 0 0-.288-.076 4.922 4.922 0 0 0-.765-.116c-.422-.028-.836.008-1.175.15l5.51 5.509c.141-.34.177-.753.149-1.175a4.924 4.924 0 0 0-.192-1.054l-.004-.013v-.001a.5.5 0 0 1 .12-.512l3.536-3.535a.5.5 0 0 1 .532-.115l.096.022c.087.017.208.034.344.034.114 0 .23-.011.343-.04L9.927 2.028c-.029.113-.04.23-.04.343a1.779 1.779 0 0 0 .062.46z"/>
	                     </svg>
                     </div>
                     	<c:if test="${empty selectedStockMap3}">
                     		<div class="imf_head" style="margin-top: 30px">
                     		<h4>&nbsp;</h4>
                     		<h3>선택한 종목이 없습니다.</h3>
                     		<h4>&nbsp;</h4>
                     		</div>
                     	</c:if>
                     	<c:if test="${selectedStockMap3 != null}">
                     		<div class="imf_head" style="margin-top: 30px">
                     		<h4>${selectedStockMap3.stock_code}</h4>
                     		<h3>${selectedStockMap3.stock_name}</h3>
                     		<h4>${selectedStockMap3.industrial_name}</h4>
                     		</div>
                     	</c:if>
                  </div>
                  </span>
               </div>           
               
            </div>
         </div>
      </section>    
      
      
      
      <div class="container">      
         	<h3><font color="gray">기간별 수익률 추이</font></h3>  
            <div class="row">
            	
               <div class="col-md-4">
                  <div class="information_blogs_crawling" style="border-top: 1px solid gray; border-bottom: 1px solid gray; border-right: 1px solid gray; border-left: 1px solid gray;">
                   	<c:if test="${selectedStockMap1 != null}">
                   		<div class="imf_head" >
							<div id="linechart_material1"></div><br>
                   			<!-- <button name="showMoreGraph1" id="${selectedStockMap1.stock_code}">자세히 보기</button> -->
                   			<select name="showMoreGraph1" id="${selectedStockMap1.stock_code}" class="form-control" style="display:inline; width:auto; height:auto; padding: 2px 10px;">
                   				<option value="30">1개월</option>
                   				<option value="91">3개월</option>
                   				<option value="182">6개월</option>
                   				<option value="365">1년</option>
                   				<option value="1095">3년</option>
                   			</select>
                   		</div>
                   	</c:if>
                  </div>
               </div>	

               <div class="col-md-4">
                  <div class="information_blogs_crawling" style="border-top: 1px solid gray; border-bottom: 1px solid gray; border-right: 1px solid gray; border-left: 1px solid gray;">
                   	<c:if test="${selectedStockMap2 != null}">
                   		<div class="imf_head" >
							<div id="linechart_material2"></div><br>
                   			<!-- <button name="showMoreGraph2" id="${selectedStockMap2.stock_code}">자세히 보기</button> -->
                   			<select name="showMoreGraph2" id="${selectedStockMap2.stock_code}" class="form-control" style="display:inline; width:auto; height:auto; padding: 2px 10px;">
                   				<option value="30">1개월</option>
                   				<option value="91">3개월</option>
                   				<option value="182">6개월</option>
                   				<option value="365">1년</option>
                   				<option value="1095">3년</option>
                   			</select>
                   		</div>
                   	</c:if>
                  </div>
               </div>

               <div class="col-md-4">
               
                  <c:if test="${selectedStockMap3 != null}">
                  	<div class="information_blogs_crawling" style="border-top: 1px solid gray; border-bottom: 1px solid gray; border-right: 1px solid gray; border-left: 1px solid gray;">
                   		<div class="imf_head" >
							<div id="linechart_material3"></div><br>
                   			<!-- <button name="showMoreGraph3" id="${selectedStockMap3.stock_code}">자세히 보기</button> -->
                   			<select name="showMoreGraph3" id="${selectedStockMap3.stock_code}" class="form-control" style="display:inline; width:auto; height:auto; padding: 2px 10px;">
                   				<option value="30">1개월</option>
                   				<option value="91" selected>3개월</option>
                   				<option value="182">6개월</option>
                   				<option value="365">1년</option>
                   				<option value="1095">3년</option>
                   			</select>
                  		</div>
                 	 </div>
                  </c:if>
                  
                  <c:if test="${selectedStockMap3 == null}">
                  	<div class="information_blogs_crawling" style="border-top: 1px solid gray; border-bottom: 1px solid gray; border-right: 1px solid gray; border-left: 1px solid gray; height:335px;">
               			<h3 style="margin-top: 90px;">선택한 종목이 없습니다.</h3>		
                 	 </div>
                  </c:if>
                  
                  
                  
               </div>           
               
            </div>
            
            
            
            
            <div class="row">
            	
               <div class="col-md-4">
                  <div class="information_blogs_crawling" style="border-top: 1px solid gray; border-bottom: 1px solid gray; border-right: 1px solid gray; border-left: 1px solid gray;">
                   	<c:if test="${selectedStockROR1 != null}">
                   		<div class="imf_head">
                   			<c:if test="${selectedStockROR1.month1>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1개월</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR1.month1}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR1.month1<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1개월</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR1.month1}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR1.month1==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1개월</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR1.month1}%</span></div></div></c:if>
                   			
                   			<c:if test="${selectedStockROR1.month3>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3개월</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR1.month3}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR1.month3<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3개월</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR1.month3}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR1.month3==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3개월</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR1.month3}%</span></div></div></c:if>
                   			
                   			<c:if test="${selectedStockROR1.month6>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>6개월</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR1.month6}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR1.month6<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>6개월</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR1.month6}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR1.month6==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>6개월</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR1.month6}%</span></div></div></c:if>
                   			
                   			<c:if test="${selectedStockROR1.month12>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1년</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR1.month12}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR1.month12<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1년</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR1.month12}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR1.month12==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1년</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR1.month12}%</span></div></div></c:if>
                   			
                   			<c:if test="${selectedStockROR1.month36>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3년</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR1.month36}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR1.month36<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3년</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR1.month36}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR1.month36==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3년</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR1.month36}%</span></div></div></c:if>
                   			           		
                   		</div>
                   	</c:if>
                  </div>
               </div>	

               <div class="col-md-4">
                  <div class="information_blogs_crawling" style="border-top: 1px solid gray; border-bottom: 1px solid gray; border-right: 1px solid gray; border-left: 1px solid gray;">
                   	<c:if test="${selectedStockROR2 != null}">
                   		<div class="imf_head">
                   			<c:if test="${selectedStockROR2.month1>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1개월</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR2.month1}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR2.month1<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1개월</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR2.month1}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR2.month1==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1개월</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR2.month1}%</span></div></div></c:if>
                   			
                   			<c:if test="${selectedStockROR2.month3>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3개월</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR2.month3}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR2.month3<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3개월</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR2.month3}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR2.month3==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3개월</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR2.month3}%</span></div></div></c:if>
                   			
                   			<c:if test="${selectedStockROR2.month6>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>6개월</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR2.month6}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR2.month6<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>6개월</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR2.month6}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR2.month6==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>6개월</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR2.month6}%</span></div></div></c:if>
                   			
                   			<c:if test="${selectedStockROR2.month12>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1년</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR2.month12}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR2.month12<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1년</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR2.month12}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR2.month12==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1년</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR2.month12}%</span></div></div></c:if>
                   			
                   			<c:if test="${selectedStockROR2.month36>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3년</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR2.month36}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR2.month36<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3년</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR2.month36}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR2.month36==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3년</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR2.month36}%</span></div></div></c:if>
                   			           		
                   		</div>
                   	</c:if>
                  </div>
               </div>

               <div class="col-md-4">
               
                  <c:if test="${selectedStockROR3 != null}">
                  	<div class="information_blogs_crawling" style="border-top: 1px solid gray; border-bottom: 1px solid gray; border-right: 1px solid gray; border-left: 1px solid gray;">
                   		<div class="imf_head">
                   			<c:if test="${selectedStockROR3.month1>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1개월</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR3.month1}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR3.month1<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1개월</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR3.month1}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR3.month1==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1개월</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR3.month1}%</span></div></div></c:if>
                   			
                   			<c:if test="${selectedStockROR3.month3>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3개월</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR3.month3}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR3.month3<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3개월</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR3.month3}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR3.month3==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3개월</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR3.month3}%</span></div></div></c:if>
                   			
                   			<c:if test="${selectedStockROR3.month6>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>6개월</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR3.month6}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR3.month6<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>6개월</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR3.month6}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR3.month6==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>6개월</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR3.month6}%</span></div></div></c:if>
                   			
                   			<c:if test="${selectedStockROR3.month12>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1년</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR3.month12}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR3.month12<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1년</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR3.month12}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR3.month12==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>1년</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR3.month12}%</span></div></div></c:if>
                   			
                   			<c:if test="${selectedStockROR3.month36>0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3년</span></div><div class="col-md-2"><span style="color:red;">+${selectedStockROR3.month36}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR3.month36<0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3년</span></div><div class="col-md-2"><span style="color:blue;">${selectedStockROR3.month36}%</span></div></div></c:if>
                   			<c:if test="${selectedStockROR3.month36==0}"><div class="row" style="font-size:20px; margin-bottom: 15px;"><div class="col-md-5"><span>3년</span></div><div class="col-md-2"><span style="color:black;">${selectedStockROR3.month36}%</span></div></div></c:if>
                   			           		
                   		</div>
                   	</div>
          		</c:if>
                   	
               	<c:if test="${selectedStockROR3 == null}">
               		<div class="information_blogs_crawling" style="border-top: 1px solid gray; border-bottom: 1px solid gray; border-right: 1px solid gray; border-left: 1px solid gray; height:307px;">
               			<h3 style="margin-top: 90px;">선택한 종목이 없습니다.</h3>
               		</div>
               	</c:if>
                  
               </div>           
               
            </div>
         </div>
         
      </form>
      
      
      <center>
         <div>
          <button type="button" name="goCompare_btn" class="btn-4 btn-info" style="min-width:150px; height: 50px; font-size:18px;">다시 하기</button>
         </div>
      </center><br><br>
      
      
      
	<div class="container">    
        <div class="row">
        	<span style="font-size:40px">인기 검색 종목 TOP3</span>
        </div>
        
        <div class="row">
        	<span style="font-size:20px">&nbsp;</span>
        </div>
        
        <div class="row">
        
        <div class="card" style="float: left; width: 30%; height:200px;">
		  <div class="card-body" style="margin-top: 25px;">
		    <p class="card-text" style="font-size:20px; font-weight:bold;" align="center">
		    ${topRankStockMap1.stock_code }<br><br>
		    <span style="font-size:30px; font-weight:bolder;">${topRankStockMap1.stock_name }</span><br><br>
		    ${topRankStockMap1.industrial_name }
		    <!-- ${topRankStockMap1.selected_cnt } -->
		    </p>
		  </div>
		</div>
		
        <div class="card" style="float: left; width: 5%; visibility:hidden;">
		</div>
		
		<div class="card" style="float: left; width: 30%; height:200px;">
		  <div class="card-body" style="margin-top: 25px;">
		    <p class="card-text" style="font-size:20px; font-weight:bold;" align="center">
		    ${topRankStockMap2.stock_code }<br><br>
		    <span style="font-size:30px; font-weight:bolder;">${topRankStockMap2.stock_name }</span><br><br>
		    ${topRankStockMap2.industrial_name }
		    <!-- ${topRankStockMap2.selected_cnt } -->
		    </p>
		  </div>
		</div>
		
        <div class="card" style="float: left; width: 5%; visibility:hidden;">
		</div>
		
		<div class="card" style="float: left; width: 30%; height:200px;">
		  <div class="card-body" style="margin-top: 25px;">
		    <p class="card-text" style="font-size:20px; font-weight:bold;" align="center">
		    ${topRankStockMap3.stock_code }<br><br>
		    <span style="font-size:30px; font-weight:bolder;">${topRankStockMap3.stock_name }</span><br><br>
		    ${topRankStockMap3.industrial_name }
		    <!-- ${topRankStockMap3.selected_cnt } -->
		    </p>
		  </div>
		</div>
		
		
     </div>
      
  </div>
      <br><br>


       
      <!-- footer -->
      <footer class="footer_style_2">
         
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>fCopyright © 2021 from KITE</strong></p>
         </div>
      </footer>
      
   </body>
</html>
