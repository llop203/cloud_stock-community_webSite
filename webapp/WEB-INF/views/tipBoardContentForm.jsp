<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>How To Invest</title>
      
      <script>
		
			

		function goTipBoardUpDelForm(){

			
			document.tipBoardUpDelForm.submit();
			
		}
			

      
		function goTipBoardForm(){
			document.tipBoardForm.submit();
			
		}
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
                           <li class="active"><a href="${croot}/tipBoardForm.do" style="font-size: 17px;"><strong>꿀팁게시판</strong></a></li>
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
                           <li class="active"><a href="${croot}/tipBoardForm.do" style="font-size: 17px;"><strong>꿀팁게시판</strong></a></li>
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
                        <h2>How To Invest</h2>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <section class="layout_padding_board layer_style">
         <div class="container">

        <form name="tipBoardContentForm">
           <div class="row">
            <div class="col-md-12">
              <h3>${tipBoard.tip_title}</h3><br>
              <label class="col-md-8 control-label" style="text-align: left; font-size:14px;"><strong>작성자</strong> : ${tipBoard.admin_name }</label>
              <label class="col-md-3 control-label" style="text-align: left; font-size:14px;"><strong>작성일</strong> : ${tipBoard.tip_date }</label>
              <br>
              <label class="col-md-8 control-label" style="text-align: left; font-size:14px;"></label>
              <label class="col-md-3 control-label" style="text-align: left; font-size:14px;"><strong>조회수</strong> : ${tipBoard.tip_readcount }</label>
              <!-- <label class="col-sm-4 control-label" style="text-align: left; font-size:14px; text-align: right;"><strong>조회수 :</strong></label> -->
              <hr>
            <br>
            <c:if test="${!empty tipBoard.tip_pic}">
				<input type="hidden"  name="pic" value="${tipBoard.tip_pic}">
				<img src="/resources/tip_board_img/${tipBoard.tip_pic}" width=100%;>		
			</c:if>
			<br>
			<br>
            ${tipBoard.tip_content }
            
			
			
            </div>
           </div>
           
          
           </form>
           <br>


           <hr>

            <div class="row" style="float:right;">
              <!-- 관리자만 게시글 수정 보임 -->
              <c:if test="${sessionScope.user_no == '1'}">
              <button type="button" class="btn-4 btn-info" onClick="goTipBoardUpDelForm();">게시글 수정</button>&nbsp;&nbsp;&nbsp;
				</c:if>
              <button type="button" class="btn-4 btn-info"  onCLick="goTipBoardForm();">목록으로</button>
            </div>
         </div>
      </section>
      
      <form name="tipBoardForm" method="post" action="${requestScope.croot}/tipBoardForm.do">
      		<%-- <input type="hidden" name="tip_b_no" value="${param.tip_b_no}"> --%>
      		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
      		<input type="hidden" name="keyword1" value="${param.keyword1}">
      		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
      </form>
      
      <form name="tipBoardUpDelForm" method="post" action="${requestScope.croot}/tipBoardUpDelForm.do">
      		<input type="hidden" name="admin_no" value="${sessionScope.user_no}">
      		<input type="hidden" name="tip_b_no" value="${tipBoard.tip_b_no }">
      		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
      		<input type="hidden" name="keyword1" value="${param.keyword1}">
      		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
      </form>
      
      <!-- footer -->
      <footer class="footer_style_2">
         
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>Copyright © 2021 from KITE</strong></p>
         </div>
      </footer>
      
   </body>
</html>
