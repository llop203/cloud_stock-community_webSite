<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>


<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>memberList</title>
      
      <script>

      $(document).ready(function(){

		//alert("${memberSearchDTO.selectPageNo}");
			
    	  $(".pagingNumber").html(
					getPagingNumber(
						"${listAllCnt}"      
						,"${memberSearchDTO.selectPageNo}"        
						,"${memberSearchDTO.rowCntPerPage}"      
						,"10"                       
						,"search_when_pageNoClick();"              
					)
			);

    	  $("[name=rowCntPerPage]").change(function(){
    			search_when_pageNoClick();
    		});

  		var begin_year = $(".begin_year");
  	    insertYear(begin_year, 1930);

  	    var begin_month = $(".begin_month");
  	    insertMonth(begin_month); 
  	
  	    var end_year = $(".end_year");
  	    insertYear(end_year, 1930);
  	    
  	    var end_month = $(".end_month");
  	    insertMonth(end_month); 


  	    var join_year = $(".join_year");
	    insertYear(join_year, 2020);

	    var join_month = $(".join_month");
	    insertMonth(join_month); 

	    var join_day = $(".join_day");
	    insertDate(join_day); 


	    $('[name=rowCntPerPage]').change(function( ){
			search_when_pageNoClick();
		});


	    inputData("[name=text_search]", "${memberSearchDTO.text_search}");
	    inputData("[name=text]", "${memberSearchDTO.text}");
	    inputData("[name=begin_year]", "${memberSearchDTO.begin_year}");
	    inputData("[name=begin_month]", "${memberSearchDTO.begin_month}");
	    inputData("[name=end_year]", "${memberSearchDTO.end_year}");
	    inputData("[name=end_month]", "${memberSearchDTO.end_month}");
	    inputData("[name=user_gender]", "${memberSearchDTO.user_gender}");
	    inputData("[name=join_year]", "${memberSearchDTO.join_year}");
	    inputData("[name=join_month]", "${memberSearchDTO.join_month}");
	    inputData("[name=join_day]", "${memberSearchDTO.join_day}");
	    inputData("[name=min_purp]", "${memberSearchDTO.min_purp}");
	    inputData("[name=max_purp]", "${memberSearchDTO.max_purp}");
	    inputData("[name=min_asset]", "${memberSearchDTO.min_asset}");
	    inputData("[name=max_asset]", "${memberSearchDTO.max_asset}");
	    inputData("[name=min_salary]", "${memberSearchDTO.min_salary}");
	    inputData("[name=max_salary]", "${memberSearchDTO.max_salary}");

	    inputData(".selectPageNo", "${memberSearchDTO.selectPageNo}");
	    inputData(".rowCntPerPage", "${memberSearchDTO.rowCntPerPage}");

	    inputData("[name=order]", "${memberSearchDTO.order}");


	    <c:if test = "${empty memberSearchDTO.order}">
			$(".th_user_id").text("ID");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_id desc'}">
			$(".th_user_id").text("ID▼");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_id asc'}">
			$(".th_user_id").text("ID▲");
		</c:if>
	
		$(".th_user_id").click(function(){
	
			var txt = $(this).text();
			if( txt == "ID"){
				$(".order").val("user_id desc");
			}
	
			else if( txt == "ID▼"){
				$(".order").val("user_id asc")
			}
	
			else if( txt == "ID▲"){
				$(".order").val("");
			}
			
			document.memberListForm.submit();
		}) 
	//-----------------------------------------------------

		<c:if test = "${empty memberSearchDTO.order}">
			$(".th_user_name").text("이름");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_name desc'}">
			$(".th_user_name").text("이름▼");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_name asc'}">
			$(".th_user_name").text("이름▲");
		</c:if>
	
		$(".th_user_name").click(function(){
	
			var txt = $(this).text();
			if( txt == "이름"){
				$(".order").val("user_name desc");
			}
	
			else if( txt == "이름▼"){
				$(".order").val("user_name asc")
			}
	
			else if( txt == "이름▲"){
				$(".order").val("");
			}
			
			document.memberListForm.submit();
		}) 
	//-----------------------------------------------------

		<c:if test = "${empty memberSearchDTO.order}">
			$(".th_user_email").text("이메일");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_email desc'}">
			$(".th_user_email").text("이메일▼");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_email asc'}">
			$(".th_user_email").text("이메일▲");
		</c:if>
	
		$(".th_user_email").click(function(){
	
			var txt = $(this).text();
			if( txt == "이메일"){
				$(".order").val("user_email desc");
			}
	
			else if( txt == "이메일▼"){
				$(".order").val("user_email asc")
			}
	
			else if( txt == "이메일▲"){
				$(".order").val("");
			}
			
			document.memberListForm.submit();
		}) 
	//-----------------------------------------------------

		<c:if test = "${empty memberSearchDTO.order}">
			$(".th_user_birth").text("생일");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_birth desc'}">
			$(".th_user_birth").text("생일▼");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_birth asc'}">
			$(".th_user_birth").text("생일▲");
		</c:if>
	
		$(".th_user_birth").click(function(){
	
			var txt = $(this).text();
			if( txt == "생일"){
				$(".order").val("user_birth desc");
			}
	
			else if( txt == "생일▼"){
				$(".order").val("user_birth asc")
			}
	
			else if( txt == "생일▲"){
				$(".order").val("");
			}
			
			document.memberListForm.submit();
		}) 
	//-----------------------------------------------------

		<c:if test = "${empty memberSearchDTO.order}">
			$(".th_user_gender").text("성별");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_gender desc'}">
			$(".th_user_gender").text("성별▼");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_gender asc'}">
			$(".th_user_gender").text("성별▲");
		</c:if>
	
		$(".th_user_gender").click(function(){
	
			var txt = $(this).text();
			if( txt == "성별"){
				$(".order").val("user_gender desc");
			}
	
			else if( txt == "성별▼"){
				$(".order").val("user_gender asc")
			}
	
			else if( txt == "성별▲"){
				$(".order").val("");
			}
			
			document.memberListForm.submit();
		}) 
	//-----------------------------------------------------

		<c:if test = "${empty memberSearchDTO.order}">
			$(".th_user_joindate").text("가입일");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_joindate desc'}">
			$(".th_user_joindate").text("가입일▼");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_joindate asc'}">
			$(".th_user_joindate").text("가입일▲");
		</c:if>
	
		$(".th_user_joindate").click(function(){
	
			var txt = $(this).text();
			if( txt == "가입일"){
				$(".order").val("user_joindate desc");
			}
	
			else if( txt == "가입일▼"){
				$(".order").val("user_joindate asc")
			}
	
			else if( txt == "가입일▲"){
				$(".order").val("");
			}
			
			document.memberListForm.submit();
		}) 
	//-----------------------------------------------------

		<c:if test = "${empty memberSearchDTO.order}">
			$(".th_user_purp").text("목표금액");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_purp desc'}">
			$(".th_user_purp").text("목표금액▼");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_purp asc'}">
			$(".th_user_purp").text("목표금액▲");
		</c:if>
	
		$(".th_user_purp").click(function(){
	
			var txt = $(this).text();
			if( txt == "목표금액"){
				$(".order").val("user_purp desc");
			}
	
			else if( txt == "목표금액▼"){
				$(".order").val("user_purp asc")
			}
	
			else if( txt == "목표금액▲"){
				$(".order").val("");
			}
			
			document.memberListForm.submit();
		}) 
	//-----------------------------------------------------

		<c:if test = "${empty memberSearchDTO.order}">
			$(".th_user_asset").text("총 자산");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_asset desc'}">
			$(".th_user_asset").text("총 자산▼");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_asset asc'}">
			$(".th_user_asset").text("총 자산▲");
		</c:if>
	
		$(".th_user_asset").click(function(){
	
			var txt = $(this).text();
			if( txt == "총 자산"){
				$(".order").val("user_asset desc");
			}
	
			else if( txt == "총 자산▼"){
				$(".order").val("user_asset asc")
			}
	
			else if( txt == "총 자산▲"){
				$(".order").val("");
			}
			
			document.memberListForm.submit();
		}) 
	//-----------------------------------------------------

		<c:if test = "${empty memberSearchDTO.order}">
			$(".th_user_salary").text("월 급여");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_salary desc'}">
			$(".th_user_salary").text("월 급여▼");
		</c:if>
	
		<c:if test = "${memberSearchDTO.order == 'user_salary asc'}">
			$(".th_user_salary").text("월 급여▲");
		</c:if>
	
		$(".th_user_salary").click(function(){
	
			var txt = $(this).text();
			if( txt == "월 급여"){
				$(".order").val("user_salary desc");
			}
	
			else if( txt == "월 급여▼"){
				$(".order").val("user_salary asc")
			}
	
			else if( txt == "월 급여▲"){
				$(".order").val("");
			}
			
			document.memberListForm.submit();
		}) 
	//-----------------------------------------------------

	    




	    
      });

      function search(){

  		var cnt = 0;
  		if(isEmpty($("[name=text]")) == false){cnt++}
  		if(isEmpty($("[name=begin_year]")) == false){cnt++}
  		if(isEmpty($("[name=begin_month]")) == false){cnt++}
  		if(isEmpty($("[name=end_year]")) == false){cnt++}
  		if(isEmpty($("[name=end_month]")) == false){cnt++}
  		if(isEmpty($("[name=user_gender]")) == false){cnt++}
  		if(isEmpty($("[name=join_year]")) == false){cnt++}
  		if(isEmpty($("[name=join_month]")) == false){cnt++}
  		if(isEmpty($("[name=join_day]")) == false){cnt++}
  		if(isEmpty($("[name=min_purp]")) == false){cnt++}
  		if(isEmpty($("[name=max_purp]")) == false){cnt++}
  		if(isEmpty($("[name=min_asset]")) == false){cnt++}
  		if(isEmpty($("[name=max_asset]")) == false){cnt++}
  		if(isEmpty($("[name=min_salary]")) == false){cnt++}
  		if(isEmpty($("[name=max_salary]")) == false){cnt++}



  		if(cnt == 0){
  			alert("1개 이상 항목을 검색하셔야 합니다.")
  			return;
  		}

  		var beginCnt = 0;
  		if(isEmpty($("[name=begin_year]")) == false){beginCnt++}
  		if(isEmpty($("[name=begin_month]")) == false){beginCnt++}
  		if(beginCnt == 1){
  			alert("생일의 최소날짜의 년과 월을 전부 입력해주세요")
  			return;
  		}

  		var endCnt = 0;
  		if(isEmpty($("[name=end_year]")) == false){beginCnt++}
  		if(isEmpty($("[name=end_month]")) == false){beginCnt++}
  		if(endCnt == 1){
  			alert("생일의 최대날짜의 년과 월을 전부 입력해주세요")
  			return;
  		}

		var cnt = 0;
		if(isEmpty($("[name=join_year]")) == false){cnt++}
  		if(isEmpty($("[name=join_month]")) == false){cnt++}
  		if(isEmpty($("[name=join_day]")) == false){cnt++}
  		if(cnt == 1 || cnt == 2){
  			alert("생일의 최대날짜의 년과 월을 전부 입력해주세요")
  			$(".join_year").val("");
	        $(".join_month").val("");
	        $(".join_day").val("");
  			return;
  		}
    
  		 
  		var min_purp = $("[name=min_purp]").val();
  		var max_purp = $("[name=max_purp]").val();

		if(parseInt(min_purp, 10) > parseInt(max_purp, 10)){
			alert("최대비용이 최소비용보다 적습니다.")
			$("[name=min_purp]").val("");
			$("[name=max_purp]").val("");
			return;
		}

		var min_asset = $("[name=min_asset]").val();
  		var max_asset = $("[name=max_asset]").val();

		if(parseInt(min_asset, 10) > parseInt(max_asset, 10)){
			alert("최대비용이 최소비용보다 적습니다.")
			$("[name=min_asset]").val("");
			$("[name=max_asset]").val("");
			return;
		}

		var min_salary = $("[name=min_salary]").val();
  		var max_salary = $("[name=max_salary]").val();

		if(parseInt(min_salary, 10) > parseInt(max_salary, 10)){
			alert("최대비용이 최소비용보다 적습니다.")
			$("[name=min_salary]").val("");
			$("[name=max_salary]").val("");
			return;
		}

		document.memberListForm.submit();

  	}
  	
  	function checkDate(){
 	      var begin_year = $(".begin_year").val();
          var begin_month = $(".begin_month").val();
          var end_year = $(".end_year").val();
          var end_month = $(".end_month").val();

          var begin_date = new Date(
             parseInt(begin_year, 10),
             parseInt(begin_month, 10)-1
          );

          var end_date = new Date(
             parseInt(end_year, 10),
             parseInt(end_month, 10)-1
          );

          var today = new Date();

          if(today.getTime() < begin_date.getTime()){
         	alert("현재날짜보다 미래를 선택하셨습니다.")
            $(".begin_year").val("");
        	$(".begin_month").val("");
            return;
          }

         else if(today.getTime() < end_date.getTime()  ){
        	alert("현재날짜보다 미래를 선택하셨습니다.")
            $(".end_year").val("");
        	$(".end_month").val("");
            return;
          }
 
         if(end_date.getTime() < begin_date.getTime()){
        	alert("최소날짜가 최대날짜보다 큽니다.")
            $(".begin_year").val("");
        	$(".begin_month").val("");
        	$(".end_year").val("");
        	$(".end_month").val("");
         }


  		  var join_year = $(".join_year").val();
          var join_month = $(".join_month").val();
          var join_day = $(".join_day").val();


          var begin_date = new Date(
              parseInt(join_year, 10),
              parseInt(join_month, 10)-1,
              parseInt(join_day, 10)
          );

        

          var today = new Date();

          if(today.getTime() < begin_date.getTime()){
          	alert("현재날짜보다 미래를 선택하셨습니다.")
            $(".join_year").val("");
          	$(".join_month").val("");
          	$(".join_day").val("");
              return;
          }

        
          if((join_month==04 || join_month==06 || join_month==09 || join_month==11) && join_day==31){
          	alert("없는 날짜를 선택하셨습니다.")
          	$(".join_year").val("");
          	$(".join_month").val("");
          	$(".join_day").val("");
          	return;
          }

          else if(join_month == 02){
      		var yoondal = (join_year % 4 == 0 && (join_year % 100 != 0 || join_year % 400 == 0));
      		if(join_day > 29 || (join_day==29 && !yoondal)){
      			alert("없는 날짜를 선택하셨습니다.")
      	    	$(".join_year").val("");
      	    	$(".join_month").val("");
      	    	$(".join_day").val("");
      	    	return;
      		}
          }
  	} 
          

      function search_when_pageNoClick(){
 		  document.memberListForm.submit();
      }



      function searchAll(){

  		$("[name=selectPageNo]").val("1");
  		
  		$("[name=text_search]").val("");
  		$("[name=text]").val("");
  		$("[name=begin_year]").val("");
  		$("[name=begin_month]").val("");
  		$("[name=end_year]").val("");
  		$("[name=end_month]").val("");
  		$("[name=user_gender]").val("");
  		$("[name=join_year]").val("");
  		$("[name=join_month]").val("");
  		$("[name=join_day]").val("");
  		$("[name=min_purp]").val("");
  		$("[name=max_purp]").val("");
  		$("[name=min_asset]").val("");
  		$("[name=max_asset]").val("");
  		$("[name=min_salary]").val("");
  		$("[name=max_salary]").val("");

  		document.memberListForm.submit();
  	  }

  	  function gomain(){
  		location.replace("${requestScope.croot}/mainPageForm.do")
  	  }

		
      </script>
      
   </head>
   <body id="default_theme" class="home_page1">
      <!-- header -->
      <script>
      <c:if test="${sessionScope.user_no != 1}">
		alert("관리자만 접근 가능합니다.")
		gomain();
	  </c:if>
      </script>
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
                           <li><a href="${croot}/stockForm2.do" style="font-size: 17px;"><strong>KOSPI200 주가현황</strong></a></li>
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
                        <h2>memberList</h2>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end header -->
      <!-- section -->
      <section class="layout_padding_board layer_style">
         <div class="container">

         
	<form name="memberListForm" method="post" action="${requestScope.croot}/memberListForm.do">
	<input type="hidden" name="order" class="order">
		<table class="table table1-bordered">
			<tr>
				<th bgcolor="#E3F4F4"style="text-align: center; vertical-align:middle;"><b>검색</b>
				<td>
					 <select name="text_search" class="text_search form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;"> 
		                   <option value="1">ID</option>
		                   <option value="2">이름</option>
		                   <option value="3">E-MAIL</option>
		               </select>&nbsp;&nbsp;
					<input type="text" name="text" style="width: 300px;" maxlength="20">
				</td>
			</tr>
		

			<tr>
				<th bgcolor="#E3F4F4"style="text-align: center; vertical-align:middle;"><b>생일</b>
	            <td colspan="5">
		            <div>
		               <select name="begin_year" class="begin_year form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;"> 
		                   <option value=""> - 선택 - </option>
		               </select>  년&nbsp;&nbsp;
						
		               <select name="begin_month" class="begin_month form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onchange="checkDate()">
		                    <option value=""> - 선택 - </option>
		               </select>  월&nbsp;&nbsp;
		                
		                ~ &nbsp;&nbsp;
		                
		                 <select name="end_year" class="end_year form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;"> 
		                   <option value=""> - 선택 - </option>
		               </select>  년&nbsp;&nbsp;
		
		               <select name="end_month" class="end_month form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onchange="checkDate()">
		                    <option value=""> - 선택 - </option>
		               </select>  월
					</div>
	            </td> 
			</tr>
			
			<tr>
				<th bgcolor="#E3F4F4"style="text-align: center; vertical-align:middle;"><b>성별</b>
				<td>
					<div class="form-group" style="margin-bottom:0px;">
						<label>
							<input type="radio" name="user_gender" value="남성">남성
						</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label>
							<input type="radio" name="user_gender"  value="여성">여성
						</label>
					</div>
				</td>
			</tr>
			
			<tr>
				<th bgcolor="#E3F4F4"style="text-align: center; vertical-align:middle;"><b>가입일</b>
	            <td colspan="5">
		            <div>
		               <select name="join_year" class="join_year form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;"> 
		                   <option value=""> - 선택 - </option>
		               </select>  년&nbsp;&nbsp;
						
		               <select name="join_month" class="join_month form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onchange="checkDate()">
		                    <option value=""> - 선택 - </option>
		               </select>  월&nbsp;&nbsp;
		               
		               <select name="join_day" class="join_day form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;" onchange="checkDate()">
		                    <option value=""> - 선택 - </option>
		               </select>  일
		                
		             
					</div>
	            </td> 
			</tr>
		
		
			<tr>
				<th bgcolor="#E3F4F4"style="text-align: center; vertical-align:middle;"><b>목표금액</b>
				<td>
					<input type="text" name="min_purp" size="20" style="width: 150px; height: 30px; text-align: right;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="10"> 만원&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type="text" name="max_purp" size="20" style="width: 150px; height: 30px; text-align: right;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="10"> 만원 
				</td>
			</tr>
			
			<tr>
				<th bgcolor="#E3F4F4"style="text-align: center; vertical-align:middle;"><b>총 자산</b>
				<td>
					<input type="text" name="min_asset" size="20" style="width: 150px; height: 30px; text-align: right;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="10"> 만원&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type="text" name="max_asset" size="20" style="width: 150px; height: 30px; text-align: right;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="10"> 만원 
				</td>
			</tr>
			
			<tr>
				<th bgcolor="#E3F4F4"style="text-align: center; vertical-align:middle;"><b>월 급여</b>
				<td>
					<input type="text" name="min_salary" size="20" style="width: 150px; height: 30px; text-align: right;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="10"> 만원&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type="text" name="max_salary" size="20" style="width: 150px; height: 30px; text-align: right;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="10"> 만원 
				</td>
			</tr>
			
		</table>
		
		<input type="hidden" name="selectPageNo" class="selectPageNo"/>  
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage"/>
		</form>
		
		<div class="center" style="padding-top:20;">
			<div class="row"> 
				<button type="button" class="btn-2 btn-info" onclick="search()">검색</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn-2 btn-info" onClick="searchAll()">초기화</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
			
			
		
			<br><br>
           <table class="table table-striped">
             <thead>
               <tr>
                 <th style="text-align: center; cursor:pointer">일련번호</th>
                 <th class="th_user_id" name="th_user_id" style="text-align: center; cursor:pointer">ID</th>
                 <th class="th_user_name" name="th_user_name" style="text-align: center; cursor:pointer">이름</th>
                 <th class="th_user_email" name="th_user_email" style="text-align: center; cursor:pointer">이메일</th>
                 <th class="th_user_birth" name="th_user_birth" style="text-align: center; cursor:pointer">생일</th>
                 <th class="th_user_gender" name="th_user_gender" style="text-align: center; cursor:pointer">성별</th>
                 <th class="th_user_joindate" name="th_user_joindate" style="text-align: center; cursor:pointer">가입일</th>
                 <th class="th_user_purp" name="th_user_purp" style="text-align: center; cursor:pointer">목표금액</th>
                 <th class="th_user_asset" name="th_user_asset" style="text-align: center; cursor:pointer">총 자산</th>
                 <th class="th_user_salary" name="th_user_salary" style="text-align: center; cursor:pointer">월 급여</th>
               </tr>
             </thead>
             <tbody>
             
             	<c:forEach items="${memberList }" var="memberList" varStatus="loopTagStatus">
             		<tr>
		                 <td style="text-align: center;">${memberList.RNUM }</td>
		                 <td style="text-align: center;">${memberList.USER_ID }</td>
		                 <td style="text-align: center;">${memberList.USER_NAME }</td>
		                 <td style="text-align: center;">${memberList.USER_EMAIL }</td>
		                 <td style="text-align: center;">${memberList.USER_BIRTH }</td>
		                 <td style="text-align: center;">${memberList.USER_GENDER }</td>
		                 <td style="text-align: center;">${memberList.USER_JOINDATE }</td>
		                 <td style="text-align: center;"><script>document.write(numberToKorean(${memberList.USER_PURP}) + "원")</script></td>
		                 <td style="text-align: center;"><script>document.write(numberToKorean(${memberList.USER_ASSET})+ "원")</script></td>
		                 <td style="text-align: center;"><script>document.write(numberToKorean(${memberList.USER_SALARY})+ "원")</script></td>

             	</c:forEach>
               
             </tbody>
            </table>
            <div class="center">&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
            <br>

         </div>
         
       


      </section>
      
      <!-- end section -->
      <!-- footer -->
      <footer class="footer_style_2">
        
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>footer에 들어갈 말</strong></p>
         </div>
      </footer>
      

      <form name="mainPageForm" method="post" action="${requestScope.croot}/mainPageForm.do"></form>
   </body>
</html>
