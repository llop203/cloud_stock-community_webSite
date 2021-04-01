<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Free Talking</title>
      <script>
	      $(document).ready(function(){			
				$("[name=freeCommentForm]").hide();
	
				<c:forEach items="${paramValues.date}" var="date">
					$("[name=freeCommentForm] [name=date]").filter("[value=${date}]").prop("checked",true);
				</c:forEach>

		//=============================================================================

				$("[name=free_heart_btn]").click(function(){
					var free_heart_no = $("[name=free_heart_no]").val();

					if(free_heart_no==""){
						$("[name=free_heart_no]").val("-1");
						free_heart_no = 1;
					}else if(free_heart_no==-1){
						$("[name=free_heart_no]").val("1");
					}else if(free_heart_no==1){
						$("[name=free_heart_no]").val("-1");
					}		
					
					change_free_heart(free_heart_no);
		        });

				  //inputData(".free_heart_no","${requestScope.FreeBoardDTO.free_heart_no}");
		//=============================================================================
				inputData(".orderby","${requestScope.freeBoardSearchDTO.orderby}");

				//--------------------------
		          // 만약에 boardSearchDTO 객체 안의 orderby 속성변수에 "" 저장되어 있으면 class=readCnt 를 가진 태그 내부에 "조회수" 덮어씌우기
		    	  // <참고> test 오른쪽엔 EL을 사용한 true 아니면 false가 도출되는 연산식을 사용해야 한다.
		    	  //--------------------------
		    	  <c:if test="${empty requestScope.freeBoardSearchDTO.orderby}">
		    	      $(".free_heart").text("공감수");
		    	  </c:if>
		    	  //--------------------------
		    	  // 만약에 boardSearchDTO 객체 안의 orderby 속성변수에 "readcount desc" 저장되어 있으면 
		    	  // class=readCnt 를 가진 태그 내부에 "조회수▼" 덮어씌우기
				  //--------------------------
				  <c:if test="${requestScope.freeBoardSearchDTO.orderby=='free_heart desc'}">
				      $(".free_heart").text("공감수▼");
		    	  </c:if>
		    	  //--------------------------
		    	  // 만약에 boardSearchDTO 객체 안의 orderby 속성변수에 "readcount asc" 저장되어 있으면 
		    	  // class=readCnt 를 가진 태그 내부에 "조회수▲" 덮어씌우기
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
				document.freeCommentForm.action="${croot}/freeBoardRegForm.do";
				document.freeCommentForm.submit();
			}

			function goFreeBoardUpDelForm(){
				document.freeCommentForm.action="${croot}/freeBoardUpDelForm.do";
				document.freeCommentForm.submit();
			}

			function goFreeBoardForm(){
				document.freeCommentForm.action="${croot}/freeBoardForm.do";
				document.freeCommentForm.submit();
			}

			/*
			function goFreeBoardContentForm(){
				document.freeCommentForm.action="${croot}/freeBoardContentForm.do";
				document.freeCommentForm.submit();
			}
			*/

			//---------------------------------------------------------------------------------------------
			function checkFreeBoardContentForm(){
				
				var reply_content = $("[name=reply_content]").val();
				if(reply_content.split(" ").join("")==""){
					alert("댓글내용을 입력해주세요.");
					$("[name=reply_content]").focus();
					return;
				}

				if(confirm("이대로 등록할까요?")==false){return;}
					/*
					alert($("[name=freeReplyForm]").serialize());
					return;
					*/
				$.ajax({
					url : "${croot}/freeBoardContentProc.do"
					, type : "post"
					, data : $("[name=freeReplyForm]").serialize()
					,success : function(boardReplyCnt){
						if(boardReplyCnt == 1){
							alert("댓글 등록 성공");
							//document.goFreeBoardContentForm.submit();
							
							
							document.freeReplyForm.submit();
						}
						else if(boardReplyCnt == 0){
							alert("댓글 등록 실패");
						}
					}
					,error : function(){
						alert("서버 접속 실패");
					}
				});
			}
			//---------------------------------------------------------------------------------------------

			//========================================================================
			
		    function change_free_heart(free_heart_no){
			    //alert(free_heart_no);
			    
			    $.ajax({
		    		url : "/freeHeartProc.do"
		    		, type : "post"
		    		, data: {"free_b_no":${board.free_b_no}, "free_heart_no":free_heart_no }
		    		, success : function(upDateCnt){
			    		if(upDateCnt==1){
		    				// alert("change_free_heart 성공");
		    				// 공감 버튼 클릭 시 효과
		    				document.freeBoardContentForm.submit();
			    		}
			    		else if(upDateCnt==0){
			    		    alert("change_free_heart 실패");
				    	}
		    		}
		    		, error : function(){
		    			alert("freeHeartProc.do" + "접속 시 서버 응답 실패! 관리자에게 문의 바람!");
		    		}
		    		
		    	});

			}
			//========================================================================
			
      </script>
   	</head>
   <body id="default_theme" class="home_page1">
<%-- <c:if test="${sessionScope.user_no == null}">
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
                           <li class="active"><a href="${croot}/freeBoardForm.do" style="font-size: 17px;"><strong>자유게시판</strong></a></li>
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

            <form class="form-horizontal" name="freeBoardContentForm" method="post" action="${croot}/freeBoardContentForm.do">
           <div class="row">
            <div class="col-md-12">
              <h3>${board.free_title}</h3><br><br>
              <label class="col-md-8 control-label" style="text-align: left; font-size:14px;" name="user_id"><strong>작성자</strong> : ${board.user_id}</label>
              <label class="col-md-3 control-label" style="text-align: left; font-size:14px;" name="free_date"><strong>작성일</strong> : ${board.free_date}</label>
              <br>
              <label class="col-md-8 control-label" style="text-align: left; font-size:14px;" name="free_heart" action="/freeHeartCnt.do"><strong>공감수</strong> : ${board.free_heart}</label>
              <label class="col-md-3 control-label" style="text-align: left; font-size:14px;" name="free_readcount"><strong>조회수</strong> : ${board.free_readcount}</label>
              <hr>
           <br>
            <textarea class="form-control" rows="20" readonly>${board.free_content}</textarea>			


            </div>
           </div>


         
           <br>
             <div class="center">
             
             		<!-- =========================================================================================== -->
             		<c:if test="${board.heart_count==1}">
             			<a><img src="/resources/img/free_heart.png" style="width:80; cursor:pointer;" name="free_heart_btn"></a>
             			<!-- <button type="button" class="btn-4 btn-info" name="free_heart_btn" style="">공감취소</button> -->
             		</c:if>
             		<c:if test="${board.heart_count==0}">
             		<a><img src="/resources/img/no_free_heart.png" style="width:80; cursor:pointer;" name="free_heart_btn"></a>
             			<!-- <button type="button" class="btn-4 btn-info" name="free_heart_btn" style="">공감하기</button> -->
             		</c:if>
             		
					 <input type="hidden" name="free_heart_no" class="free_heart_no" value="${board.free_heart_no}">
					<input type="hidden" name="free_b_no" value="${board.free_b_no}">
             		<!-- =========================================================================================== -->
				
           </div>
					<input type="hidden" name=keyword1 value="${param.keyword1}">
					<input type="hidden" name=selectPageNo value="${param.selectPageNo}">
					<input type="hidden" name=rowCntPerPage value="${param.rowCntPerPage}">
		</form>
		

           <hr>
           <form name="freeReplyForm">
           		<div class="row">
          		<div class="col-md-12">
            	 <label class="col-md-1 control-label" style="text-align: left; font-size:14px;"><strong>${login_user_id}</strong></label>	 
           				<!-- <textarea class="form-control" rows="5" name="reply_content" placeholder="댓글을 입력하세요"></textarea> -->
           				<input type="text" name="reply_content" class="col-md-9 form-control keyword1" maxlength="100" style="display: inline;" placeholder="댓글을 입력하세요">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           				<button type="button" class="btn-4 btn-info"  onClick="checkFreeBoardContentForm();">댓글 등록</button>
           				
           				
						<input type="hidden" name="free_b_no" value="${board.free_b_no}">
						<input type="hidden" name=selectPageNo value="${param.selectPageNo}">
						<input type="hidden" name=rowCntPerPage value="${param.rowCntPerPage}">           			
           		</div>
           		</div>
            
            	<br>
				총 ${requestScope.replyListAllCnt} 개의 댓글이 있습니다.
				<hr>
				
          	
           	  	
	         	   <c:forEach items="${requestScope.replyList}" var="board" varStatus="loopTagStatus">
	         	   	<div class="row">
            		<div class="col-md-12">
	             	  <label class="col-md-1 control-label" style="text-align: left; font-size:14px;"><strong>${board.user_id}</strong></label>
	            	   <label class="col-md-8 control-label" style="text-align: left; font-size:14px;" > ${board.reply_content}</label> 
	            	   <label class="col-md-2 control-label" style="text-align: right; font-size:14px;" >${board.reply_date}</label> 
	            	   </div>
	            	   </div>	            	   
	               </c:forEach>
				
				</form>
			<%--	<table class='boardTable tbcss2' cellpadding=5 width=100% cellspacing=10>
				 <tr><th>댓글작성자<th width=150>날짜<th>내용<th>좋아요<th>싫어요 
				
				<c:forEach items="${requestScope.replyList}" var="board" varStatus="loopTagStatus">
					
						<tr>
							<td align="left">(아이디)${board.user_id}
						<tr>
							<td align="left">${board.reply_date}
						<tr>
							<td>
								<c:if test="${board.print_level>0}">
									<c:forEach begin="0" end="${board.print_level}">
										&nbsp;&nbsp;
									</c:forEach>
									ㄴ
								</c:if> 
								${board.reply_content}
							 <td align="left">${board.reply_like}
							<td align="left">${board.reply_dislike} 
							 <button type="button" class="btn-4 btn-info" align="left" style="" onClick="">답글쓰기</button> 
					<hr>
	            	</c:forEach>  
            	</table>--%>
           
               
              	<form name="freeCommentForm" method="post">
					<input type="hidden" name="free_b_no" value="${board.free_b_no}">
						
					
					<input type="hidden" name=keyword1 value="${param.keyword1}">
					<input type="hidden" name=selectPageNo value="${param.selectPageNo}">
					<input type="hidden" name=rowCntPerPage value="${param.rowCntPerPage}">
					
					<input type="checkbox" name=date value="오늘">
					<input type="checkbox" name=date value="어제">
				</form>
               
             <hr>
            <div class="row" style="float:right;">
              
              <c:if test ="${sessionScope.user_id==board.user_id}">
              <button type="button" class="btn-4 btn-info" style="" onClick="goFreeBoardUpDelForm();">수정/삭제</button>&nbsp;&nbsp;&nbsp;
              </c:if> 
              <button type="button" class="btn-4 btn-info" style="" onClick="goFreeBoardForm();">목록으로</button>
            </div>
         </div>
      </section>
      
      <footer class="footer_style_2">
         
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>Copyright © 2021 from KITE</strong></p>
         </div>
      </footer>
      
   </body>
</html>
