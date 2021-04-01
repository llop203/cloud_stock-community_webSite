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
				$("[name=freeBoardForm]").hide();
	
				<c:forEach items="${paramValues.date}" var="date">
					$("[name=freeBoardForm] [name=date]").filter("[value=${date}]").prop("checked",true);
				</c:forEach>
		  });

	      function checkFreeBoardUpDelForm(upDel){
				if(upDel == 'del'){
					if(confirm("정말 삭제하시겠습니까?")==false){return;}
				}
				else if(upDel == 'up'){
					if(confirm("정말 수정하시겠습니까?")==false){return;}
				}			
				$("[name=upDel]").val(upDel);

			$.ajax({
				url : "${croot}/freeBoardUpDelProc.do"
				,type : "post"
				,data : $('[name=freeBoardUpDelForm]').serialize()				
				,success : function(json){
					var upDelCnt = json.boardUpDelCnt;
	
					if(upDel=="up"){
						if(upDelCnt=="1"){
							alert("게시판 수정 성공!");
							document.freeBoardForm.submit();
						}
						else if(upDelCnt=="-1"){
							alert("게시물이 삭제되어 수정할 수 없습니다.");
							document.freeBoardForm.submit();
						}
						else{
							alert("게시판 수정 실패! 관리자에게 문의 바랍니다.");
						}
					}
					else if(upDel=="del"){
						if(upDelCnt=="1"){
							alert("게시판 삭제 성공!");
							document.freeBoardForm.submit();
						}
						else if(upDelCnt=="-1"){
							alert("게시물이 삭제되어 삭제할 수 없습니다.");
							document.freeBoardForm.submit();
						}
						else{
							alert("게시판 삭제 실패! 관리자에게 문의 바랍니다.");
						}
					}
				}
				,error : function(){
					alert("서버 접속 실패");
				}
			});		
	      }
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
              <h3> 자유게시판 수정/삭제 </h3><hr>
            </div>
           </div>
        </form>

         <form class="form-horizontal" name="freeBoardUpDelForm">
           <div class="row">
            <div class="col-md-12">
              <div class="form-group">

                <div class="col-md-12">
                  <input type="text" class="form-control" name="free_title" placeholder="제목" value="${board.free_title}">
                </div>
              </div>

              <!--<label class="col-md-8 control-label" style="text-align: left; font-size:14px;" name=free_title><strong>제목</strong> : ${board.free_title}</label>-->
              <label class="col-md-8 control-label" style="text-align: left; font-size:14px;" name="user_id"><strong>작성자</strong> : ${board.user_id}</label> 
              <label class="col-md-3 control-label" style="text-align: left; font-size:14px;" name="free_date"><strong>작성일</strong> : ${board.free_date}</label>
              <br>
              <label class="col-md-8 control-label" style="text-align: left; font-size:14px;" name="free_heart"><strong>공감수</strong> : ${board.free_heart}</label>
              <label class="col-md-3 control-label" style="text-align: left; font-size:14px;" name="free_readcount"><strong>조회수</strong> : ${board.free_readcount}</label>
              
              	<hr>
              <div class="col-md-12">
                <textarea class="form-control" rows="20" name="free_content">${board.free_content}</textarea>	
			  <div class="col-md-12">

            </div>
           </div>
            <hr>
            <div class="row" style="float:right;">
              <input type="hidden" name="free_b_no" value="${board.free_b_no}">	
			  <input type="hidden" name="upDel" value="up">						
              <button type="button" class="btn-4 btn-info" style="" value="게시글 수정" onClick="checkFreeBoardUpDelForm('up')">게시글 수정</button>&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn-4 btn-info" style="" value="게시글 삭제" onClick="checkFreeBoardUpDelForm('del')">게시글 삭제</button>&nbsp;&nbsp;&nbsp;
              
              
              
              <button type="button" class="btn-4 btn-info" style="" value="목록으로" onClick="document.freeBoardForm.submit();">목록으로</button>
            </div>

           </form>
          

         </div>
         
        <form name="freeBoardForm" method="post" action="${croot}/freeBoardForm.do">		
			<input type="hidden" name=keyword1 value="${param.keyword1}">
			<input type="hidden" name=selectPageNo value="${param.selectPageNo}">
			<input type="hidden" name=rowCntPerPage value="${param.rowCntPerPage}">
			
			<input type="checkbox" name=date value="오늘">
			<input type="checkbox" name=date value="어제">
		</form> 
         
      </section>

      <footer class="footer_style_2">
         
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>Copyright © 2021 from KITE</strong></p>
         </div>
      </footer>
     
   </body>
</html>
