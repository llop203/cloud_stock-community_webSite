<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <title>myPage</title>

   <script>
		 var user_pwd = "${myPage.user_pwd}";
   		 var user_gender = "${myPage.user_gender}";
   		 
   		 /* var user_birth = "${myPage.user_birth}";
   		 var birthArray = user_birth.split('-'); */
   		 
		$(document).ready(function(){
			/*alert(birthArray[0]);
			

			$("[name=user_year]").val(2001);
			
			inputData("[name=user_year]", "birthArray[0]");
		   	inputData("[name=user_month]", "birthArray[1]");
		   	inputData("[name=user_day]", "birthArray[2]"); */

			
			
			$("[name=user_gender]").val(user_gender);
			

		});

		

		function goMyPageUpdate(){

			// 업데이트 유효성 검사
			if( checkEmpty( "[name=user_name]", "이름을 입력해주세요.") ){ 
				$("[name=user_name]").focus();
				return; 	
			}

			if( checkPattern( "[name=user_name]", /^[가-힣]{2,6}$/, "이름을 2~6글자 한글로 입력 해 주세요.")  ){ 
				$("[name=user_name]").focus();
				return; 	
			}

			if($("[name=new_pwd]").val()!=""){
				if( checkPattern( "[name=new_pwd]", /^[a-z0-9]{6,10}$/, "비밀번호는 6~10 글자로 영어소문자 또는 숫자를 입력해주세요 .")  ){ 
					$("[name=new_pwd]").focus();
					return; 	
				}
				if( checkEmpty( "[name=is_new_pwd]", "비밀번호 확인을 입력해주세요.") ){ 
					$("[name=is_new_pwd]").focus();
					return;	
				}
				if($("[name=new_pwd]").val() != $("[name=is_new_pwd]").val()){
					alert("비밀번호와 일치 하지 않습니다.")
					$("[name=is_new_pwd]").val("")
					$("[name=is_new_pwd]").focus();
					return;	 
				}
			}
			
			if($("[name=new_pwd]").val()=="" && $("[name=is_new_pwd]").val()!=""){
				alert("비밀번호를 입력해 주세요");
				$("[name=new_pwd]").focus();
			}

	    
		    if( checkEmpty( "[name=user_phone]", "휴대전화번호를 입력해주세요.") ){ 
				$("[name=user_phone]").focus();
				return; 	
			}

		    if(checkPattern("[name=user_phone]", /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/ , "정확한 휴대폰 번호를 입력해 주세요." ) ){
				$("[name=user_phone]").focus();
				return;
			}
			
			if( checkEmpty( "[name=user_email]", "이메일을 입력해주세요.") ){
				$("[name=user_email]").focus();
				return; 
			}
			if( checkPattern( "[name=user_email]", /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/, "정확한 이메일을 입력해 주세요.")  ){ 
				$("[name=user_email]").focus();
				return; 	
			}
			

			if(isEmpty($("[name=user_gender]"))){
				alert("성별을 선택 해주세요.") 
				$("[name=user_gender]").focus();
				return; 	
			}

			/* var user_birth = $("[name=user_year]").val()+"-"+$("[name=user_month]").val()+"-"+$("[name=user_day]").val(); 
			$("[name=user_birth]").val(user_birth); */
			
			
			if(confirm("정말 수정하시겠습니까?")==false){return;}

			var is_user_pwd = prompt("비밀번호를 입력해주세요");

    		if(is_user_pwd!=user_pwd){
				alert("비밀번호가 틀립니다.");
				return;
	    	}


    		$.ajax({
    			url:"${requestScope.croot}/myPageUpdateProc.do" 
    			, type:"post"
    			, data : $('[name=myPageUpDelForm]').serialize()
    			, success : function(updateCnt){
   					if(updateCnt==1){
   						alert("수정 성공");
   						location.replace("${requestScope.croot}/myPageForm.do");
   					}
   					else{
   						alert("수정할 수 없습니다. 관리자에게 문의 하세요");
   						location.replace("${requestScope.croot}/myPageForm.do");
   					}						
    			}
    			, error : function(){
    				alert("연결실패");
    			}
    		});

		}

		

		/*
		function goMyPageDelete(){

			if(confirm("정말 탈퇴하시겠습니까?")==false){return;}

			var is_user_pwd = prompt("비밀번호를 입력해주세요");

    		if(is_user_pwd!=user_pwd){
				alert("비밀번호가 틀립니다.");
				return;
	    	}

    		$.ajax({
    			url:"${requestScope.croot}/myPageDeleteProc.do" 
    			, type:"post"
    			, data : $('[name=myPageUpDelForm]').serialize()
    			, success : function(deleteCnt){
   					if(deleteCnt==1){
   						alert("탈퇴 성공");
   						location.replace("${requestScope.croot}/mainPageForm.do");
   					}
   					else if(deleteCnt==-1){
   						alert("관리자이므로 탈퇴할 수 없습니다");

   	   				}
   					else{
   						alert("탈퇴할 수 없습니다. 관리자에게 문의 하세요");
   						location.replace("${requestScope.croot}/myPageForm.do");
   					}						
    			}
    			, error : function(){
    				alert("연결실패");
    			}
    		}); 
		}*/

		
   </script>
   
</head>
<body id="default_theme" class="services">
  <header class="header_login" style="padding_bottom:60px;">

  </header>

  <section class="layout_padding gradiant_bg cross_layout_login">
     <div class="container">
    <center>
        <div class="row">
           <div class="col-md-12">
                 <div class="col-md-10">
                    <div class="login_title">
                       <div class="slide_cont_login" style="text-align:left;">
                          <h2><span>내 정보 수정</span></h2>
                       </div>
                    </div>
                 </div>
          <br>

        <form class="form-horizontal" name="myPageUpDelForm" method="post" action="${requestScope.croot}/myPageForm.do">
       <%--  <input type="hidden" value="${myPage.user_no}"> --%>
         <table width="80%" border="0">
           <tr>
             <td align=center>
              <div class="form-group" style="margin-bottom: 2rem;">
                <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">ID</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" name="user_id" placeholder="ID" readonly onfocus="this.blur()" value="${myPage.user_id}">
                </div>
              </div>

            <td align=center>
               <div class="form-group" style="margin-bottom: 2rem;">
                <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">NAME</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" name="user_name" placeholder="NAME" value="${myPage.user_name}" readonly onfocus="this.blur()">
                </div>
              </div>
        <tr>
          <td align=center>
           <div class="form-group" style="margin-bottom: 2rem;">
             <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">성별</label>
             <div class="col-md-10">
             <select class="form-control" name="user_gender" >
               <option value="">성별</option>
               <option value="남성">남성</option>
               <option value="여성">여성</option>
               </select>
             </div>
           </div>

         <td align=center>
            <div class="form-group" style="margin-bottom: 2rem;">
             <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">Email</label>
             <div class="col-md-10">
               <input type="text" class="form-control" name="user_email" placeholder="Email" value="${myPage.user_email}" maxlength="30">
             </div>
           </div>
     <tr>
       <td align=center>
          <div class="form-group" style="margin-bottom: 2rem;">
             	<label class="col-md-10 control-label" style="color:#f8f9fa; text-align:left;">생년월일</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" name="user_birth" readonly value="${myPage.user_birth}" onfocus="this.blur()">
                </div>
		  </div>

      <td align=center>
         <div class="form-group" style="margin-bottom: 2rem;">
          <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">PHONE NUMBER</label>
          <div class="col-md-10">
            <input type="text" class="form-control" name="user_phone" placeholder="PHONE NUMBER" value="${myPage.user_phone}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
          </div>
        </div>
     <tr>
          <td align=center>
             <div class="form-group">
               <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">새 암호</label>
               <div class="col-md-10">
                 <input type="password" class="form-control" name="new_pwd" placeholder="NEW PASSWORD" maxlength="20">
               </div>
             </div>

         <td align=center>
            <div class="form-group">
             <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">암호 확인</label>
             <div class="col-md-10">
               <input type="password" class="form-control" name="is_new_pwd" placeholder="IS NEW PASSWORD" maxlength="20">
             </div>
           </div>


   </table>
	 </form>

    </center>

   
     <br><br>
        <center>
          <table width="70%" border="0">
            <tr>
              <td align=center>
                   <div class="form-group">
                     <div class="col-sm-10">
                       <button type="button" class="btn-1 btn-login" onClick="location.replace('${requestScope.croot}/myPageForm.do');">내 정보</button>
                     </div>
                   </div>
              <td align=center>
                  <div class="form-group">
                    <div class="col-sm-10">
                       <button type="button" class="btn-1 btn-login" onClick="goMyPageUpdate();">수정하기</button>
                    </div>
                  </div>
              <!-- <td align=center>
                  <div class="form-group">
                    <div class="col-sm-10">
                       <button type="button" class="btn-1 btn-login" onClick="goMyPageDelete();">탈퇴하기</button>
                    </div>
                  </div> -->
              </table>
          </center>
      <!-- 수정하기 탈퇴하기 누르면 원래 암호 입력 -->


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
