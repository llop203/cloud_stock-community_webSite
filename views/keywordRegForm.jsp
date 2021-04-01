<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>


<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>Stock Dictionary</title>
      
      
      <script>
			function checkKeywordRegForm(){
				var key_name= $("[name=key_name]").val();
				if(key_name.split(" ").join("")==""){
					alert("제목을 입력해주세요!")
					return;
				}
				
				var key_content= $("[name=key_content]").val();
				if(key_content.split(" ").join("")==""){
					alert("내용을 입력해주세요!")
					return;
				}

				if(confirm("정말 등록 하시겠습니까?")==false) {return;}

				$.ajax({
					url: "${requestScope.croot}/keywordRegProc.do"
					, method: "post"
					, data: $("[name=keywordRegForm]").serialize()
					, success: function(keywordRegCnt){
									if(keywordRegCnt==1){
										
										alert("키워드 등록 성공!")
										document.goKeyList.submit();
										
									}
									else{
										alert("키워드 등록 실패!")
									}
								}
					, error: function(){
								alert("서버접속 실패!")
							}
				})
			}

		function goListForm(){
			document.goKeyList.submit();
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
                           <li class="active"><a href="${croot}/keywordListForm.do" style="font-size: 17px;"><strong>주식용어 사전</strong></a></li>
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
              <h3> 새 키워드 등록 </h3><hr>
            </div>
           </div>
        </form>
		<!-- [키워드 글쓰기] 화면을 출력하는 form 태그 선언 -->
          <form class="form-horizontal" name="keywordRegForm" method="post" action="${requestScope.croot}/keywordRegProc.do">
           <div class="row">
            <div class="col-md-12">
              <div class="form-group">

                <div class="col-md-12">
                  <input type="text" class="form-control" name="key_name" placeholder="제목" maxlength="50">
                </div>
              </div>
              <hr>
              <div class="col-md-12">
                <textarea class="form-control" name="key_content" rows="20"></textarea>
			</div>
            </div>
           </div>


         </form>
           <hr>

            <div class="row" style="float:right;">
              <button type="button" class="btn-4 btn-info" style="" onClick="checkKeywordRegForm()">키워드 등록</button>&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn-4 btn-info" style="" onClick="goListForm()">목록으로</button>
            </div>
         </div>
      </section>
      
      <footer class="footer_style_2">
         
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>fCopyright © 2021 from KITE</strong></p>
         </div>
      </footer>
      
   </body>
   
   <form name="goKeyList" method="post" action="${requestScope.croot}/keywordListForm.do"></form>
</html>
