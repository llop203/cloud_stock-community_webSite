<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>


<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>메인페이지</title>
      
                  
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
      <!-- 본문 첫번째 세션 -->
      <section id="banner_parallax" class="slide_banner1">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <div class="full">
                     <div class="slide_cont">
                        <h2><span>Cloud Stock</span></h2>
                        <!-- <h4><b>클라우드 스톡만의 자산관리 성향 테스트</b></h4> -->
                        <div class="full slide_bt"> <a class="white_bt bt_main" href="${croot}/analysisForm.do">Get Stated</a> </div>
                     </div>
                  </div>
               </div>
               <div class="col-md-6">
                 <!-- 첫번째 세션에 사진넣은 div -->
                  <div class="full">
                     <div class="slide_pc_img wow fadeInRight" data-wow-delay="1s" data-wow-duration="2s"> <img src="${requestScope.croot}/resources/img/pc-banner.png" alt="#" /> </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end header -->
      <!-- section -->
      <!-- 본문 두번째 세션 -->
      <section class="layout_padding padding_top_0">
         
		<div class="carousel-inner">
                <div class="carousel-item active">
                  <div class="center">
                  <img src="${requestScope.croot}/resources/img/ser2.png" class="d-block w-80" alt="...">

                  <div class="col-md-6 cont_theme_blog">
                     <div class="full">
                        <h3>Our Mission</h3>
                        
                        <p>'<b style=""><font color="#3984c6" style="background-color: rgb(255, 255, 255);">CloudStock</font></b>' 은 2021년 <b><font color="#3984c6">KITE</font></b> 에서 새롭게 선보이는 투자자 들을 위한 사이트 입니다.</p>
                        <p>기존 타 사이트틀의 장점과 '<b style=""><font color="#3984c6" style="">CloudStock</font></b>' 만의 차별점을 가진 사이트가 탄생하게 되었습니다.</p>
                        <p>투자를 생각만 하고 잘 알지 못하여 망설이시는 분들과&nbsp; 이미 투자를 하고 계신 모든 분들의</p>
                        <p>자유로운 지식과 정보를 공유 하실 수 있는 공간 입니다.</p>
                        <p>단순히, 한 회사의 생각과 방향이 아닌 많은 투자자 분들의 자율적이고 효율적인 투자와 함께 하겠습니다.</p>
                        <p>'<b><font style="background-color: rgb(255, 255, 255);" color="#3984c6">CloudStock</font>
                        </b>' 에는 계획에서 투자까지 부담없이 진행 하실 수 있도록 도와 드릴 수 있다는 것에</p>
                        <p>큰 자부심을 가지고 있으며 또 이를 꾸준히 관리하고 확장시켜 나아가고자 합니다.</p>
                        <!-- <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </p> -->
                        <p>부디, 방문해 주시는 모든 분들께서 '<b style=""><font color="#3984c6" style="background-color: rgb(255, 255, 255);">CloudStock</font></b>'
                        을 통해 부담없이 행복한 투자를 즐기시길 희망합니다.</p><!-- <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
                        <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p> -->
                     </div>
                  </div>
                </div>



         
      </section>



      <!-- end section -->
      <!-- section -->
      <!-- 본문 세번째 세션 -->
      <section class="layout_padding gradiant_bg cross_layout">
         <div class="container">
            <div class="row">
            
            <div class="col-md-4">
                  <div class="information_blogs">
                     <div class="imf_icon"><svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#00D8FF" class="bi bi-search" viewBox="0 0 16 16">
                      <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg></div>
                     <div class="imf_head">
                        <h3>주식용어 사전</h3>
                     </div>
                     <div class="imf_cont">
                        <p>나를 힘들게 하는 주식용어 검색 사전 </p>
                     </div>
                     <div class="imf_read"><a href="${croot}/keywordListForm.do">주식용어 사전으로 이동</a></div>
                  </div>
               </div>

                <div class="col-md-4">
                  <div class="information_blogs">
                     <div class="imf_icon"><svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#00D8FF" class="bi bi-clipboard-data" viewBox="0 0 16 16">
                      <path d="M4 11a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1zm6-4a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0V7zM7 9a1 1 0 0 1 2 0v3a1 1 0 1 1-2 0V9z"/>
                      <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
                      <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
                    </svg></div>
                     <div class="imf_head">
                        <h3>꿀팁게시판</h3>
                     </div>
                     <div class="imf_cont">
                        <p>투자를 어떻게 시작해야 될지 모르겠다면?</p>
                     </div>
                     <div class="imf_read"><a href="${croot}/tipBoardForm.do">꿀팁게시판으로 이동</a></div>
                  </div>
               </div>
         
         
               <div class="col-md-4" >
                  <div class="information_blogs">
                     <!-- 이미지 삽입 하는 곳 -->
                     <div class="imf_icon"><svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#00D8FF" class="bi bi-graph-up" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M0 0h1v15h15v1H0V0zm10 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V4.9l-3.613 4.417a.5.5 0 0 1-.74.037L7.06 6.767l-3.656 5.027a.5.5 0 0 1-.808-.588l4-5.5a.5.5 0 0 1 .758-.06l2.609 2.61L13.445 4H10.5a.5.5 0 0 1-.5-.5z"/>
                      </svg></div>
                     <div class="imf_head">
                        <h3>KOSPI200 주가현황</h3>
                     </div>
                     <div class="imf_cont">
                        <p>대형주를 분석하여 나만의 포트폴리오를 구성</p>
                     </div>
                     <!-- 누르면 사이트 이동 -->
                     <div class="imf_read"><a href="${croot}/stockForm2.do">KOSPI200 주가현황으로 이동</a></div>
                  </div>
               </div>
         
             


            </div>
         </div>

      </section>


      <!-- end section -->
      <!-- footer -->

      <footer class="footer_style_2">
         
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>Copyright © 2021 from KITE</strong></p>
         </div>
      </footer>
      
   </body>
</html>