<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<!DOCTYPE html>

<html>
<head>
	
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <!-- site metas -->
   <title>login</title>
   <script>
	$(document).ready(function(){
		$("[name=user_id]").val("${cookie.user_id.value}");
		
		$("[name=is_login]").prop("checked", ${!empty cookie.user_id.value});

		})
		
	function checkLoginForm(){
		var user_id = $("[name=user_id]").val();

		if(user_id.split(" ").join("")==""){
			alert("아이디를 입력해 주세요.")
			return;
			}

		var user_pwd = $("[name=user_pwd]").val();

		if(user_pwd.split(" ").join("")==""){
			alert("암호를 입력해 주세요.")
			return;
			}

		$.ajax({
			url : "${requestScope.croot}/loginProc.do"
			, type : "post"
			, data : $("[name=loginForm]").serialize()
			, success : function(login_cnt){
				if(login_cnt==1){
					alert("로그인 성공");
					location.replace("${requestScope.croot}/mainPageForm.do");
				}else if(login_cnt==-1){
					alert("관리자 로그인 성공");
					location.replace("${requestScope.croot}/mainPageForm.do");
				}else if(login_cnt==-2){
					alert("입력하신 아이디 또는 암호가 틀립니다.");
					$("[name=user_id]").val("");
					$("[name=user_id]").val("${cookie.user_id.value}");
					$("[name=user_pwd]").val("");
				}else{
					alert("관리자 문의 요망");
				}
			}
			, error : function(){
				alert("서버접속실패");
			}
			

				
		});

	}

   </script>
</head>
<body id="default_theme" class="services">
  <header class="header_login" style="padding_bottom:60px;">
	
  </header>

  <section class="layout_padding gradiant_bg cross_layout_login">
     <div class="container">

        <div class="row">


           <div class="col-md-12">
             <center>
             <a href="${croot}/mainPageForm.do"><img src="/resources/img/cloudStock_1.png" width="50%" ></a>
           </center>
                 <!-- 이미지 삽입 하는 곳 -->
                  <center>
                 <div class="col-sm-8">
                    <div class="login_title">
                       <div class="slide_cont_login" style="margin-top:0px; text-align:left;">
                          <h2><span>로그인</span></h2>
                       </div>
                    </div>
                 </div>

                 <form name="loginForm" method="post">
                   <div class="form-group">

                     <label class="col-sm-8 control-label" style="color:#f8f9fa; text-align: left;">ID</label>
                     <div class="col-sm-8">
                       <input type="text" class="form-control" name="user_id" placeholder="ID" maxlength="20">
                     </div>
                   </div>
                   <div class="form-group">
                     <label class="col-sm-8 control-label" style="color:#f8f9fa; text-align: left">PASSWORD</label>
                     <div class="col-sm-8">
                       <input type="password" class="form-control" name="user_pwd" placeholder="PASSWORD" maxlength="20">
                     </div>
                   </div>
                   <div class="form-group">
                     <div class="col-sm-offset-2 col-sm-10">
                       <div class="checkbox" style="color:#f8f9fa">
                         <label>
                           <input type="checkbox" name="is_login" value="y"> id 기억
                         </label>
                       </div>
                     </div>
                   </div>
                 </form>

                 <div class="form-group">
                   <div class="col-sm-8">
                     <button type="button" class="btn-1 btn-login" onClick="checkLoginForm()">로그인</button>
                   </div>
                 </div>
                  <br>
                 <label class="col-sm-8 control-label" style="color:#f8f9fa;">
                   <a href="${croot}/searchIDForm.do" style="color:#f8f9fa;">아이디 찾기</a> |
                   <a href="${croot}/searchPWDForm.do" style="color:#f8f9fa;">비밀번호 찾기</a> |
                   <a href="${croot}/joinForm.do" style="color:#f8f9fa;">회원가입</a>
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
