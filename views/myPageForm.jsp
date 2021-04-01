
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <title>myPage</title>
   
</head>
<body id="default_theme" class="services">
  <header class="header_login" style="padding_bottom:60px;">

  </header>

  <section class="layout_padding gradiant_bg cross_layout_login">
     <div class="container">
    <center>
        <div class="row">
           <div class="col-md-12">
                 <!-- 이미지 삽입 하는 곳 -->

                 <div class="col-md-8">
                    <div class="login_title">
                       <div class="slide_cont_login" style="text-align:left;">
                          <h2><span>내 정보</span></h2>
                       </div>
                    </div>
                 </div>
          <br>
      <form class="form-horizontal">
         <table width="80%" border="0">
           <tr>
             <td align=center>
              <div class="form-group" style="margin-bottom: 3rem;">
                <label class="col-md-10 control-label" style="color:#f8f9fa;">ID</label>
                <label class="col-md-10 control-label" name="user_id" style="color:#D4F4FA;">${myPage.user_id}</label>
              </div>

            <td align=center>
               <div class="form-group" style="margin-bottom: 3rem;">
                <label class="col-md-10 control-label" style="color:#f8f9fa;">NAME</label>
                <label class="col-md-10 control-label" style="color:#D4F4FA;">${myPage.user_name}</label>
              </div>


        <tr>
          <td align=center>
           <div class="form-group" style="margin-bottom: 3rem;">
             <label class="col-md-10 control-label" style="color:#f8f9fa;">성별</label>
             <label class="col-md-10 control-label" style="color:#D4F4FA;">${myPage.user_gender}</label>
           </div>

         <td align=center>
            <div class="form-group" style="margin-bottom: 3rem;">
             <label class="col-md-10 control-label" style="color:#f8f9fa;">Email</label>
             <label class="col-md-10 control-label" style="color:#D4F4FA;">${myPage.user_email}</label>
           </div>
     <tr>
       <td align=center>
          <div class="form-group" >
            <label class="col-md-10 control-label" style="color:#f8f9fa;">BIRTH DAY</label>
            <label class="col-md-10 control-label" style="color:#D4F4FA;">${myPage.user_birth}</label>
          </div>

      <td align=center>
         <div class="form-group" >
          <label class="col-md-10 control-label" style="color:#f8f9fa;">PHONE NUMBER</label>
          <label class="col-md-10 control-label" style="color:#D4F4FA;">${myPage.user_phone}</label>
        </div>
        <!-- 
        <tr>
          <td align=center>
          	<div class="form-group">
          	
              <label class="col-md-10 control-label" style="color:#f8f9fa;">성향</label>
              <label class="col-md-10 control-label" style="color:#D4F4FA;">ISTP</label>
            </div>
          	
             <div class="form-group">
               <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">SALARY</label>
               <label class="col-md-10 control-label" style="color:#D4F4FA; text-align: left;">123123</label>
             </div>

         <td align=center>
            <!-- <div class="form-group">
             <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">ASSET</label>
             <label class="col-md-10 control-label" style="color:#D4F4FA; text-align: left;">123123</label>
           </div> -->
         

   </table>

    </center>

    </form>
     <br><br>
        <center>
          <table width="60%" border="0">
            <tr><td align=center>
                   <div class="form-group">
                     <div class="col-sm-10">
                       <button type="button" class="btn-1 btn-login" onClick="location.replace('${requestScope.croot}/mainPageForm.do');">메인페이지</button>
                     </div>
                   </div>
            <c:if test="${sessionScope.user_no == '1' }">
               <td align=center>
                  <div class="form-group">
                    <div class="col-sm-10">
                       <button type="button" class="btn-1 btn-login" onClick="location.replace('${requestScope.croot}/memberListForm.do');">관리자페이지</button>
                    </div>
                  </div>
			</c:if>
              <td align=center>
                  <div class="form-group">
                    <div class="col-sm-10">
                       <button type="button" class="btn-1 btn-login" onClick="location.replace('${requestScope.croot}/myPageUpDelForm.do');">수정하기</button>
                    </div>
                  </div>

              </table>
          </center>



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
