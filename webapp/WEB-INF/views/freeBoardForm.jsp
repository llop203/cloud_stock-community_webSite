
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>Free Talking</title>
      <script>
	  	$(document).ready(function(){		
	  		
			$("[name=freeBoardRegForm],[name=freeBoardContentForm]").hide();
			
			$("[name=rowCntPerPage]").change(function(){
				search_when_pageNoClick();
			});
			
			$("[name=rowCntPerPage]").hide;

			inputData(".keyword1","${requestScope.freeBoardSearchDTO.keyword1}");
			inputData(".selectPageNo","${requestScope.freeBoardSearchDTO.selectPageNo}");
			inputData(".rowCntPerPage","${requestScope.freeBoardSearchDTO.rowCntPerPage}");
			inputData(".search","${requestScope.freeBoardSearchDTO.search}");

			<c:forEach items="${freeBoardSearchDTO.date}" var="date">
				inputData("[name=freeBoardForm] [name=date]","${date}");
			</c:forEach>

			
			
		
			//****************** 페이징 처리 *******************
			$(".pagingNumber").html(
				getPagingNumber(
					"${requestScope.boardListAllCnt}"						
					,"${requestScope.freeBoardSearchDTO.selectPageNo}"			
					,"${requestScope.freeBoardSearchDTO.rowCntPerPage}"		
					,"3"													
					,"search_when_pageNoClick();"												
				)
			);
			//**********************************************

			
			setTableTrBgColor(
					"boardTable"		// 테이블 class 값
					,"gray"				// 헤더 tr 배경색
					,"white"			// 홀수행 배경색
					,"lightgray"		// 짝수행 배경색
					,"lightblue"		// 마우스 온 시 배경색
			);	
			
			inputBlank_to_tdth(".boardTable",3);

			inputData(".orderby","${requestScope.freeBoardSearchDTO.orderby}");

			  //--------------------------
	          // 만약에 boardSearchDTO 객체 안의 orderby 속성변수에 "" 저장되어 있으면 class=free_heart 를 가진 태그 내부에 "조회수" 덮어씌우기
	    	  // <참고> test 오른쪽엔 EL을 사용한 true 아니면 false가 도출되는 연산식을 사용해야 한다.
	    	  //--------------------------
	    	  <c:if test="${empty requestScope.freeBoardSearchDTO.orderby}">
	    	      $(".free_heart").text("공감수");
	    	  </c:if>
	    	  //--------------------------
	    	  // 만약에 boardSearchDTO 객체 안의 orderby 속성변수에 "free_heart desc" 저장되어 있으면 
	    	  // class=free_heart 를 가진 태그 내부에 "조회수▼" 덮어씌우기
			  //--------------------------
			  <c:if test="${requestScope.freeBoardSearchDTO.orderby=='free_heart desc'}">
			      $(".free_heart").text("공감수▼");
	    	  </c:if>
	    	  //--------------------------
	    	  // 만약에 boardSearchDTO 객체 안의 orderby 속성변수에 "free_heart asc" 저장되어 있으면 
	    	  // class=free_heart 를 가진 태그 내부에 "조회수▲" 덮어씌우기
			  //--------------------------
			  <c:if test="${requestScope.freeBoardSearchDTO.orderby=='free_heart asc'}">
			      $(".free_heart").text("공감수▲");
	    	  </c:if>

              $(".free_heart").click(function(){
	              
	              var txt = $(this).text();
	              //--------------------------
	              // 만약 현재 보이는 글씨가 "공감수"라면
	              //--------------------------
	              if(txt=="공감수"){
	                  // class=orderby를 가진 태그의 value 값에 "free_heart desc"삽입하기
	            	  $(".orderby").val("free_heart desc");
	              }
	              //--------------------------
	              // 만약 현재 보이는 글씨가 "공감수▼"라면
	              //--------------------------
	              else if(txt=="공감수▼"){
	            	  // class=orderby를 가진 태그의 value 값에 "free_heart asc"삽입하기
	                  $(".orderby").val("free_heart asc");
	              }
	              //--------------------------
	              // 만약 현재 보이는 글씨가 "공감수▲"라면
	              //--------------------------
	              else if(txt=="공감수▲"){
	            	  // class=orderby를 가진 태그의 value 값에 ""삽입하기
	                  $(".orderby").val("");
	              }
	              //--------------------------
	              // name=freeBoardForm 를 가진 form 태그의 action 값의 URL 주소로 서버 접속하라. 
	              // 즉 페이지를 이동하라.
	              //--------------------------
	              document.freeBoardForm.submit();
	          });
			
			
			
		});

	  	function goFreeBoardRegForm(){
			$("[name=freeBoardRegForm] [name=keyword1]").val(
				$("[name=freeBoardForm] [name=keyword1]").val()
			);
			$("[name=freeBoardRegForm] [name=selectPageNo]").val(
				$("[name=freeBoardForm] [name=selectPageNo]").val()
			);
			$("[name=freeBoardRegForm] [name=rowCntPerPage]").val(
				$("[name=freeBoardForm] [name=rowCntPerPage]").val()
			);
			$("[name=freeBoardForm] [name=date]").filter(":checked").each(function(){
				var value = $(this).val();

				$("[name=freeBoardRegForm] [name=date]").filter("[value=" + value + "]").prop("checked", true);

				
			});
			
			document.freeBoardRegForm.submit();
		}
		
	  	function goFreeBoardContentForm(free_b_no){
			$("[name=freeBoardContentForm] [name=free_b_no]").val(free_b_no);

			$("[name=freeBoardContentForm] [name=keyword1]").val(
				$("[name=freeBoardForm] [name=keyword1]").val()
			);
			$("[name=freeBoardContentForm] [name=selectPageNo]").val(
				$("[name=freeBoardForm] [name=selectPageNo]").val()
			);
			$("[name=freeBoardContentForm] [name=rowCntPerPage]").val(
				$("[name=freeBoardForm] [name=rowCntPerPage]").val()
			);

			$("[name=freeBoardForm] [name=date]").filter(":checked").each(function(){
				var value = $(this).val();

				$("[name=freeBoardContentForm] [name=date]").filter("[value=" + value + "]").prop("checked", true);
			});
			
			document.freeBoardContentForm.submit();
		}
		



	  	
		function search_when_pageNoClick(){
			var keyword1 = $("[name=keyword1]").val();
			if(keyword1!=null && keyword1.split(" ").join("")!=""){
				keyword1 = $.trim(keyword1);
				$("[name=keyword1]").val(keyword1);
			}
			document.freeBoardForm.submit();
		};

		function search1(){
			if(isEmpty($("[name=keyword1]")) && isEmpty($("[name=date]"))){
				alert("검색조건이 없어 검색할 수 없습니다.");
				$("[name=keyword1]").val("");
				return;
			}
			
			var keyword1 = $("[name=keyword1]").val();
			keyword1 = $.trim(keyword1);
			$("[name=keyword1]").val(keyword1);

			var search = $("[name=search]").val();
			$("[name=search]").val(search);
			
			document.freeBoardForm.submit();
		}

		

		function searchAll(){
			
			$("[name=selectPageNo]").val("1");
			
			$("[name=keyword1]").val("");
			
			$("[name=date]").prop("checked",false);		
			
			document.freeBoardForm.submit();
		};

		inputBlank_to_tdth(".boardTable",3);

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
                           <li><a href="${croot}/keywordListForm.do" style="font-size: 17px;"><strong>주식용어 사전</strong></a></li>
                           <li><a href="${croot}/tipBoardForm.do" style="font-size: 17px;"><strong>꿀팁게시판</strong></a></li>
                           <li class="active"><a href="${croot}/freeBoardForm.do" style="font-size: 17px;"><strong>자유게시판</strong></a></li>
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
                        <h2>Free Talking</h2>
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
              <h3> 자유게시판 <small>Free Talking</small></h3><br>
            </div>
           </div>
        </form>

			
			<div>			
				<!-- 한 화면에 보여줄 행의 개수가 저장되는 입력양식 표현 -->
			<!--	<input type="hidden" name="rowCntPerPage" class="rowCntPerPage"> -->
			</div>
			
					
			
				<div class="row" style="float:right;">
				<div class="form-group">
	              <button type="button" class="btn-2 btn-info" style="" onClick="goFreeBoardRegForm();">게시글 작성</button>
	             </div>
	            </div>	
			
           <table class="table table-striped">
             <thead>
               <tr>
                 <th style="text-align: center;">번호</th>
                 <th style="text-align: center;">작성자</th>
                 <th style="text-align: center;">제목</th>
                 <th style="text-align: center;">날짜</th>
                 <th class="freeReadCnt" style="text-align: center;">조회수</th>
                 <th class="free_heart" style="cursor:pointer; text-align: center;">공감수</th>
               </tr>
             </thead>
           
             <tbody>
           	  <c:forEach items="${requestScope.boardList}" var="board" varStatus="loopTagStatus">
   	 	       <tr style="cursor:pointer" onClick="goFreeBoardContentForm(${board.free_b_no});">
				<td style="text-align: center;">
					${boardListAllCnt - ((freeBoardSearchDTO.selectPageNo-1)*freeBoardSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1 }	
				<td style="text-align: center;">${board.user_id}
				<td style="text-align: center;">${board.free_title}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${board.reply_cnt != 0}">
				<input type="hidden" name="${board.reply_cnt}" value="${board.reply_cnt}">
		
				<span style="color:orange">(${board.reply_cnt})</span>
				</c:if>
				<td style="text-align: center;">${board.free_date}
				<td style="text-align: center;">${board.free_readcount}</td>
				<td style="text-align: center;">${board.free_heart}</td>
               </c:forEach>
             </tbody>
             
            </table>
            
         
	          		<!-- ******** 페이징 처리 ******** -->
					<!-- 페이징 번호를 삽입할 span 태그  선언 -->
					<div class="center">
						<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
					<!-- ************************* -->
					</div>
	
	<!-- <select name="text_search" class="text_search form-control" style="display:inline-block; width:auto; height:auto; padding: 2px 10px;"> 
		                   <option value="1">ID</option>
		                   <option value="2">이름</option>
		                   <option value="3">E-MAIL</option>
		               </select>&nbsp;&nbsp;
					<input type="text" name="text" style="width: 300px;" maxlength="20"> -->
					
            		
		<br>
		<form name="freeBoardForm" method="post" action="${croot}/freeBoardForm.do">
		<div class="row">
			<div class="center">	
				<select name="search" class="form-control search" style="display:inline-block; width:auto;">
					<option value="1">작성자
					<option value="2">제목
				</select>        
              &nbsp;&nbsp;&nbsp;
                 <input type="text" name="keyword1" class="form-control keyword1" maxlength="20" style="width:20%" placeholder="검색">
                 &nbsp;&nbsp;&nbsp;
                  <button type="button" class="btn-2 btn-info"  onClick="search1();">검색</button>&nbsp;&nbsp;&nbsp;
             <button type="button" class="btn-2 btn-info"  onClick="searchAll();">모두 검색</button>
                 
              
             
            </div>
             
            
              
       		 <input type="hidden" name="orderby" class="orderby">
         	<input  type="hidden" name="selectPageNo" class="selectPageNo">	
             <input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
          
         
       </div>
      </form>
      </section>
      
		
      <c:if test="${boardListAllCnt==0}">		<!-- requestScope.boardListAllCnt 도 가능 -->
			<h3>검색 조건에 맞는 글이 없습니다.</h3>
		</c:if>
		
      
      <form name='freeBoardContentForm' method="post" action="${croot}/freeBoardContentForm.do">
		<input type="hidden" name="free_b_no">
		
		<input type="hidden" name="keyword1">
		<input type="hidden" name="selectPageNo">
		<input type="hidden" name="rowCntPerPage">
		
		<input type="checkbox" name="date" value="오늘">
		<input type="checkbox" name="date" value="어제">
	</form>
	
	<form name='freeBoardRegForm' method="post" action="${croot}/freeBoardRegForm.do">
		<input type="hidden" name="keyword1">
		<input type="hidden" name="selectPageNo">
		<input type="hidden" name="rowCntPerPage">
		
		<input type="checkbox" name="date" value="오늘">
		<input type="checkbox" name="date" value="어제">
	</form>
      
      
      
      <footer class="footer_style_2">
        
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>Copyright © 2021 from KITE</strong></p>
         </div>
      </footer>
      
   </body>
</html>
