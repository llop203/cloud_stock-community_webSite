
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <title>ChangePWD</title>
   <script>


  		 $(document).ready(function(){
	   			$("[name=user_no]").val(${requestScope.user_no });
	  	});

		function goChangePWD() {
			if( checkEmpty( "[name=user_pwd]", "변경할 비밀번호를 입력해주세요.") ){ 
				$("[name=user_pwd]").focus();
				return; 	
			}
			
			if( checkPattern( "[name=user_pwd]", /^[a-z0-9]{6,10}$/, "변경 할 비밀번호는 6~10 글자로 영어소문자 또는 숫자를 입력해주세요 .")  ){ 
				$("[name=user_pwd]").focus();
				return; 	
			}
			
			if( checkEmpty( "[name=user_is_pwd]", "변경한 비밀번호 확인을 입력해주세요.") ){ 
				$("[name=user_is_pwd]").focus();
				return;	
			}
			
			if($("[name=user_pwd]").val() != $("[name=user_is_pwd]").val()){
				alert("변경한 비밀번호와 일치 하지 않습니다.")
				$("[name=user_is_pwd]").val("")
				$("[name=user_is_pwd]").focus();
				return;	 
			}
	
			$.ajax({
				url : "${requestScope.croot}/changePWDProc.do"
				,method : "post"
				,data : $("[name=changePWDForm]").serialize()
				,success : function(changePWDCnt){
					
					if(changePWDCnt==1){
						alert("변경 성공");
						location.replace('${requestScope.croot}/loginForm.do');
					}else{
						alert("변경실패\n관리자에게 문의해주세요!");
						location.replace('${requestScope.croot}/loginForm.do');
					}		
				}
				,error : function(){
					alert("서버접속실패")
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
                 <div class="col-sm-8">
                    <div class="login_title">
                       <div class="slide_cont_login" style="text-align:left;">
                          <h2><span>비밀번호 변경</span></h2>
                       </div>
                    </div>
                 </div>

                 <form name="changePWDForm" method="post">
                   <div class="form-group">
                     <label class="col-sm-8 control-label" style="color:#f8f9fa; text-align: left;">변경할 비밀번호를 입력해주세요</label>
                     <div class="col-sm-8">
                       <input type="password" class="form-control" name="user_pwd" placeholder="NEW PASSWORD" >
                     </div>
                   </div>
                   <div class="form-group">
                     <label class="col-sm-8 control-label" style="color:#f8f9fa; text-align: left;">변경할 비밀번호를 다시 입력해주세요</label>
                     <div class="col-sm-8">
                       <input type="password" class="form-control" name="user_is_pwd" placeholder="IS NEW PASSWORD">
                     </div>
                   </div>
					<input type="hidden" name="user_no">

                 </form>
                  <br>
                 <div class="form-group">
                   <div class="col-sm-8">
                     <button type="button" class="btn-1 btn-login" onClick="goChangePWD();">비밀번호 바꾸기</button>
                   </div>
                 </div>
                  <br>
                 
                 <label class="col-sm-8 control-label" style="color:#f8f9fa;">
                	 <a href="${croot}/loginForm.do" style="color:#f8f9fa;">로그인 화면</a>
                 </label>

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
