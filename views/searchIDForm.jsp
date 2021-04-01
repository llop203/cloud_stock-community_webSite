
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <title>SearchId</title>
   <Script>
$(document).ready(function(){
		
		var user_year = $(".user_year");
	    insertYear(user_year, 1930);
	    
	    var user_month = $(".user_month");
	    insertMonth(user_month); 

	    var user_day = $(".user_day");
	    insertDate(user_day); 


   inputData("[name=user_year]", "${loginDTO.user_year}");
   inputData("[name=user_month]", "${loginDTO.user_month}");
   inputData("[name=user_day]", "${loginDTO.user_day}");

	 $(".user_year , .user_month , .user_day").change( function () {
			
		var user_year  = $(".user_year").val();
		var user_month = $(".user_month").val();
		var user_day   = $(".user_day").val();			
	});
}); 


function checkDate(){
	var user_year = $(".user_year").val();
    var user_month = $(".user_month").val();
    var user_day = $(".user_day").val();
    
    var user_date = new Date(
        parseInt(user_year, 10),
        parseInt(user_month, 10)-1,
        parseInt(user_day, 10)
    );

    var today = new Date();

    if(today.getTime() < user_date.getTime()){
    	alert("현재날짜보다 미래를 선택하셨습니다.")
        $(".user_year").val("");
    	$(".user_month").val("");
    	$(".user_day").val("");
        return;
    }

    if((user_month==04 || user_month==06 || user_month==09 || user_month==11) && user_day==31){
    	alert("없는 날짜를 선택하셨습니다.")
    	$(".user_year").val("");
    	$(".user_month").val("");
    	$(".user_day").val("");
    	return;
    }

    else if(user_month == 02){
		var yoondal = (user_year % 4 == 0 && (user_year % 100 != 0 || user_year % 400 == 0));
		if(user_day > 29 || (user_day==29 && !yoondal)){
			alert("없는 날짜를 선택하셨습니다.")
	    	$(".user_year").val("");
	    	$(".user_month").val("");
	    	$(".user_day").val("");
	    	return;
		}
    }

}


	function checkSearchIDForm(){
		
		if( checkEmpty( "[name=user_name]", "이름을 입력해주세요.") ){ 
			$("[name=user_name]").focus();
			return; 	
		}
		if( checkPattern( "[name=user_name]", /^[가-힣]{2,6}$/, "이름을 2~6글자 한글로 입력 해 주세요.")  ){ 
			$("[name=user_name]").focus();
			return; 	
		}

		if( checkEmpty("[name=user_year]"   , "생년 을 선택해 주세요" 	 ) ){return;}		
		if( checkEmpty("[name=user_month]"  , "생월 을 선택해 주세요" 	 ) ){return;}		
		if( checkEmpty("[name=user_day]"    , "생일 을 선택해 주세요" 	 ) ){return;}
		
    
	    if( checkEmpty( "[name=user_phone]", "휴대전화번호를 - 제외하고 입력해주세요.") ){ 
			$("[name=user_phone]").focus();
			return; 	
		}
		if(checkPattern("[name=user_phone]", /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})?[0-9]{3,4}?[0-9]{4}$/ , "정확한 휴대폰 번호를 - 제외하고 입력해 주세요." ) ){
			$("[name=user_phone]").focus();
			return;
		}
		/* var user_birth = $("[name=user_year]").val()+$("[name=user_month]").val()+$("[name=user_day]").val(); */
		var user_birth = $("[name=user_year]").val()+"-"+$("[name=user_month]").val()+"-"+$("[name=user_day]").val();
		$("[name=user_birth]").val(user_birth);

		$.ajax({
			url : "checkIDProc.do"
			,method : "post"
			,data : $("[name=searchIDForm]").serialize()
			,success : function(idcheck){
				if(idcheck==1){
					document.searchIDForm.submit();
					}else{
						alert("일치하는 ID가 없습니다.");
					$("[name=user_name]").val("");
					$("[name=user_year]").val("");
					$("[name=user_month]").val("");
					$("[name=user_day]").val("");
					$("[name=user_phone]").val("");
					return;
				}
			}
			,error:function(){
				alert("서버접속실패")
				}			
			})
	}

   </Script>
   
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
                          <h2><span>ID 찾기</span></h2>
                       </div>
                    </div>
                 </div>

                 <form class="form-horizontal" name="searchIDForm" method="post" action="${requestScope.croot}/checkIDForm.do">
                   <div class="form-group">

                     <label class="col-sm-8 control-label" style="color:#f8f9fa; text-align: left;">NAME</label>
                     <div class="col-sm-8">
                       <input type="text" class="form-control" name="user_name" placeholder="NAME">
                     </div>
                   </div>
                   
                <tr>
                <td align=center>
                <div class="form-group">
             	<label class="col-sm-8 control-label" style="color:#f8f9fa; text-align:left;">생년월일</label>
             	<div class="col-sm-8">
             		<select name="user_year" class="user_year form-control"style="display:inline; width:220px; height:auto; padding: 2px 10px;">
               		<option value=" ">선택</option>
             		</select> <span style="color: white;">년</span>
               		<select name="user_month" class="user_month form-control" style="display:inline; width:220px; height:auto; padding: 2px 10px;" onchange="checkDate()">
                	<option value=" ">선택</option>
              		</select> <span style="color: white;">월</span>
               		<select name="user_day" class="user_day form-control"  style="display:inline; width:220px; height:auto; padding: 2px 10px;"onchange="checkDate()">
                	<option value=" ">선택</option>
              		</select> <span style="color: white;">일</span>
              		
              		<input type="hidden" name="user_birth">
              	 </div>
                 </div>
                   
               
                   <div class="form-group">
                     <label class="col-sm-8 control-label" style="color:#f8f9fa; text-align: left">PHONE NUMBER</label>
                     <div class="col-sm-8">
                       <input type="text" class="form-control" name="user_phone" placeholder="phone number" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
                     </div>
                   </div>
                 </form>
                  <br>
                 <div class="form-group">
                   <div class="col-sm-8">
                     <button type="button" class="btn-1 btn-login" onClick="checkSearchIDForm();">아이디 찾기</button>
                   </div>
                 </div>
                  <br>
                 <label class="col-sm-8 control-label" style="color:#f8f9fa;">
                 <a href="${croot}/loginForm.do" style="color:#f8f9fa;">로그인</a> |
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