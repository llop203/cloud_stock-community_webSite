<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.cloudStock.erp.*"%>
<%@ page import="java.util.*"%>
<%@include file="common.jsp" %>


<html>
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>Stock Dictionary</title>
      
      <style>
      	a.btn:hover, button.btn:hover, a.btn:focus, button.btn:focus {
		    background: lightgray;
		    color: #fff;
		}
      
      
      </style>
      <script>
      
      	$(document).ready(function(){
    		//--------------------------------------
    		
    		 inputData(".keyword1", "${keywordSearchDTO.keyword1}");
       		 inputData(".selectPageNo", "${keywordSearchDTO.selectPageNo}");
             inputData(".rowCntPerPage", "${keywordSearchDTO.rowCntPerPage}");

      		 $(".pagingNumber").html(
                     getPagingNumber(
                        "${keywordListAllCnt}"      
                        ,"${keywordSearchDTO.selectPageNo}"        
                        ,"${keywordSearchDTO.rowCntPerPage}"      
                        ,"10"                       
                        ,"search_when_pageNoClick()"              
                     )
               );
             
      		  $('[name=rowCntPerPage]').change(function(){
      		         search_when_pageNoClick();
      		      });

      		

      	});
        
        function search_when_pageNoClick(){
        	document.keywordListForm.submit();
        }

		function search(){
			//-----------------------------------
			// 만약 키워드가 비어있거나 공백으로 구성되어 있으면 경고하고 비우기
			//-----------------------------------
			var keyword1 = $("[name=keyword1]").val();
			if( keyword1.split(" ").join("")=="" ) {
				alert("키워드가 없어 검색할수 없습니다.");
				$("[name=keyword1]").val("");
				return;
			}
			//-----------------------------------
			// 키워드의 앞뒤 공백을 제거하기
			//-----------------------------------
			keyword1 = $.trim(keyword1);
			$("[name=keyword1]").val(keyword1);
			//-----------------------------------
			// name=keywordListForm  을 가진  form 태그의 action 값의 URL로 웹서버에 접속하기
			// 이동 시 form 태그안의 모든 입력 양식이 파라미터값으로 전송된다.
			//-----------------------------------
			document.keywordListForm.submit( );	// 동기방식
		}

		function search_when_pageNoClick( ){
			// 입력한 키워드 얻기
			var keyword1 = $("[name=keyword1]").val();
			// 입력한 키워드가 비어 있지 않으면
			if( keyword1!=null && keyword1.split(" ").join("")!="" ){
				// 입력한 키워드의 앞뒤 공백 제거하기
				keyword1 = $.trim(keyword1);
				// name=keyword1 가진 입력 양식에 앞뒤 공백 제거한 키워드 넣어주기
				$("[name=keyword1]").val(keyword1);
			}
			// name=keywordListForm  를 가진 form 태그 안의 action 값의 URL 주소로 웹서버로 접속하기
			document.keywordListForm.submit( );
		}
		
		//**********************************************
		// [게시판 목록 화면]으로 이동하는 함수 선언
		//**********************************************
		function search( ){
			//-----------------------------------
			// 만약 키워드가 비어있거나 공백으로 구성되어 있으면 경고하고 비우기
			//-----------------------------------
			var keyword1 = $("[name=keyword1]").val();
			if( keyword1.split(" ").join("")=="" ) {
				alert("키워드가 없어 검색할수 없습니다.");
				$("[name=keyword1]").val("");
				
				return;
			}
			//-----------------------------------
			// 키워드의 앞뒤 공백을 제거하기
			//-----------------------------------
			keyword1 = $.trim(keyword1);
			$("[name=keyword1]").val(keyword1);
			$(".selectPageNo").val("1");
			//-----------------------------------
			// name=keywordListForm  을 가진  form 태그의 action 값의 URL로 웹서버에 접속하기
			// 이동 시 form 태그안의 모든 입력 양식이 파라미터값으로 전송된다.
			//-----------------------------------
			document.keywordListForm.submit( );	// 동기방식
		}


		//**********************************************
		// 키워드 없이 [게시판 목록 화면]으로 이동하는 함수 선언
		//**********************************************
		
        
        
        function goRegForm(){
			document.goReg.submit();
         }

        function goUpdelForm(key_no){
			$("[name=goUpdel] [name=key_no]").val(key_no);
     
			document.goUpdel.submit();
         }

        function searchAll(){
			$(".selectPageNo").val("1");

			$("[name=keyword1]").val("");

			document.keywordListForm.submit();

         }

        
        
      </script>
      
   </head>
   <body id="default_theme" class="home_page1">
 <%--  <c:if test="${sessionScope.user_no == null}">
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
                           <li><a href="${croot}/stockForm2.do" style="font-size: 17px;"><strong>KOSPI200 주가현황</strong></a></li>
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
  </c:if> --%>
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
                           <li  class="active"><a href="${croot}/keywordListForm.do" style="font-size: 17px;"><strong>주식용어 사전</strong></a></li>
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
                        <h2>Stock Dictionary</h2>
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

          <form class="form-horizontal">
           <div class="row">
            <div class="col-md-12">
              <h3> 주식 사전 <small>Stock Dictionary</small></h3><br>
            </div>
           </div>
           </form>
       

		<form name="keywordListForm" method="post" action="${requestScope.croot}/keywordListForm.do">   
			
			
		    <div style="text-align: right">
		         <input type="hidden" name="selectPageNo" class="selectPageNo">     
		         <select name="rowCntPerPage" class="rowCntPerPage form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;">
		               <option value="10">10 행
		               <option value="15">15 행
		               <option value="20">20 행
		               <option value="25">25 행
		               <option value="30">30 행
		            </select>
		    </div><br>     
		    
		    
			<table class="boardTable table table-striped" style="text-align:center;">
				<tr>	
					<td style="vertical-align:middle; padding-top:25px;">
					<div class="row" style="float:right;">
					<div class="form-group">
						<input type="text" name="keyword1" class="form-control keyword1" maxlength="20" style="display:inline; width:auto;" placeholder="검색">
						&nbsp;&nbsp;&nbsp;
						<button type="button"  class="btn-4 btn-info keywordSearch" onClick="search();">검색</button>&nbsp;&nbsp;&nbsp;
						<button type="button"  class="btn-4 btn-info keywordSearchAll" onClick="searchAll();">모두검색</button>&nbsp;&nbsp;&nbsp;
						
					</div>
					</div>
			</table>	
			
			<table class="boardTable table table-striped">

					
<c:forEach items="${getKeywordList}" var="getKeywordList" varStatus="status">			

 
 <div class="accordion" id="accordionExample">
 	<div class="card">
 		<div class="card-header" id="${status.count}">
 			<h2 class="mb-0">
 				<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse${status.count}" aria-expanded="false" aria-controls="collapse${status.count}">
              		<label class="col-md-3 control-label" style="text-align: left; font-size:14px; color: black;"><strong>${getKeywordList.RNUM}</strong></label>
              		<label class="col-md-8 control-label" style="text-align: left; font-size:14px; color: black;"><strong>${getKeywordList.KEY_NAME}</strong></label>
        		</button>
 			</h2>
 			
 		</div>
 		<div id="collapse${status.count}" class="collapse" aria-labelledby="${status.count}" data-parent="#accordionExample">
 			<div class="card-body">  
     		 	${getKeywordList.KEY_CONTENT}
     		 	<c:if test="${keywordSearchDTO.user_no == 1}">
     		 	<span style="text-align: right">
     		 		<p style="cursor: pointer; color: black;" onclick="goUpdelForm(${getKeywordList.KEY_NO})"><b>[수정 / 삭제]</b></p> 
     		 	</span>
     		 	</c:if>
     		 	
      		</div>

 		</div>
 	</div>
 </div>
</c:forEach>
<center>	
		<c:if test="${keywordListAllCnt == 0}">
			<h4>검색 조건에 맞는 데이터가 없습니다.</h4>
		</c:if>
</center>
</table>

			
			<table class="boardTable table table-striped">
			<tr>
				<td align=center style="padding-top:25px;">	
				<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
			
			</table>
			
		</form>

             <hr>
             <c:if test="${keywordSearchDTO.user_no == 1}">
	            <div class="row" style="float:right;">
	              <button type="button" class="btn-4 btn-info" onClick="goRegForm()" style="">키워드 추가</button>&nbsp;&nbsp;&nbsp;
	            </div>
            </c:if>
         </div>
      </section>
   </body>
   
   <form name="goReg" method="post" action="${requestScope.croot}/keywordRegForm.do"></form>
   <form name="goUpdel" method="post" action="${requestScope.croot}/keywordUpDelForm.do">
   		<input type="hidden" name="key_no">
   </form>
   
    <!-- footer -->
      <footer class="footer_style_2">
         
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>Copyright © 2021 from KITE</strong></p>
         </div>
      </footer>
