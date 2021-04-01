<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp"%>

<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <title>CheckID</title>
   <script>
   		

   </script>
   
</head>
<body id="default_theme" class="services">
  <header class="header_login" style="padding_bottom:60px;">

  </header>
  <section class="layout_padding gradiant_bg cross_layout_login">
     <div class="container">

        <div class="row">


           <div class="col-md-12">

                 <!-- 이미지 삽입 하는 곳 -->
                  <center>
                 <div class="col-sm-8">
                    <div class="login_title">
                       <div class="slide_cont_login" style="text-align:left;">
                          <h2><span>ID 확인</span></h2>
                       </div>
                    </div>
                 </div>
                  <br>
                 <form class="form-horizontal" name="checkIDForm">
                   <div class="form-group">
                     <label class="col-sm-8 control-label" style="color:#f8f9fa; font-size:20px;">고객님의 ID는 <strong>${SearchID.user_id}</strong>  입니다.</label>
                   </div>
                  <br>


                 </form>
                  <br>
                 <div class="form-group">
                   <div class="col-sm-8">
                     <button type="button" class="btn-1 btn-login" onClick="location.replace('${requestScope.croot}/loginForm.do');">로그인 화면</button>
                   </div>
                 </div>
                  <br>
                 <label class="col-sm-8 control-label" style="color:#f8f9fa;">
                   <a href="${croot}/searchPWDForm.do" style="color:#f8f9fa;">비밀번호 찾기</a>
                 </label>

               </center>
           </div>
        </div>
     </div>
  </section>
      <!-- end section -->
      <!-- footer -->
      <footer class="footer_style_2">
          
          <!-- footer bottom -->
         <!-- <div class="footer_bottom">
            <p><strong>footer에 들어갈 말</strong></p>
         </div> -->
      </footer>
      
   </body>
</html>
