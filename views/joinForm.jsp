
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <title>join</title>
   <script>

   var checkIDCnt = 0;

   $(document).ready(function(){
		
		var user_year = $(".user_year");
	    insertYear(user_year, 1930);
	    
	    var user_month = $(".user_month");
	    insertMonth(user_month); 

	    var user_day = $(".user_day");
	    insertDate(user_day); 


   inputData("[name=user_year]", "${joinDTO.user_year}");
   inputData("[name=user_month]", "${joinDTO.user_month}");
   inputData("[name=user_day]", "${joinDTO.user_day}");

	 $(".user_year , .user_month , .user_day").change( function () {
			
			var user_year  = $(".user_year").val();
			var user_month = $(".user_month").val();
			var user_day   = $(".user_day").val();			

		});

	 $("[name=user_id]").change(function(){
		 if(checkIDCnt!=0){
				checkIDCnt = 0;
			}
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

	function checkID(){
		var user_id = $(".user_id").val();

		if( checkEmpty( "[name=user_id]", "ID를 입력해주세요.") ){ 
			$("[name=user_id]").focus();
			return; 	
		}
		
		if( checkPattern( "[name=user_id]", /^[a-z]{6,12}$/, "ID는 6~12글자 영어 소문자로 입력 해 주세요.")  ){ 
			$("[name=user_id]").focus();
			return; 	
		}

		

		$.ajax({
			url : "${requestScope.croot}/idCheckProc.do"
			, type : "post"
			, data : $("[name=joinForm]").serialize()
			, success : function(getjoinCnt){
				if(getjoinCnt== -1){
					alert("사용 가능한 아이디 입니다.");
					checkIDCnt++;
				}else{
					alert("중복된 아이디가 있습니다.");
					checkIDCnt = 0;
					$("[name=user_id]").val("");
					$("[name=user_id]").focus();
					return;
				} 
			}
		})
	}

 
   
   	function checkJoinForm(){
   		if( checkEmpty( "[name=user_id]", "ID를 입력해주세요.") ){ 
			$("[name=user_id]").focus();
			return; 	
		}
		
		if( checkPattern( "[name=user_id]", /^[a-z]{6,12}$/, "ID는 6~12글자 영어 소문자로 입력 해 주세요.")  ){ 
			$("[name=user_id]").focus();
			return; 	
		}

   		if( checkEmpty( "[name=user_name]", "이름을 입력해주세요.") ){ 
			$("[name=user_name]").focus();
			return; 	
		}
		
		if( checkPattern( "[name=user_name]", /^[가-힣]{2,6}$/, "이름을 2~6글자 한글로 입력 해 주세요.")  ){ 
			$("[name=user_name]").focus();
			return; 	
		}
		
		if( checkEmpty( "[name=user_pwd]", "비밀번호를 입력해주세요.") ){ 
			$("[name=user_pwd]").focus();
			return; 	
		}
		
		if( checkPattern( "[name=user_pwd]", /^[a-z0-9]{6,10}$/, "비밀번호는 6~10 글자로 영어소문자 또는 숫자를 입력해주세요 .")  ){ 
			$("[name=user_pwd]").focus();
			return; 	
		}
		
		if( checkEmpty( "[name=user_is_pwd]", "비밀번호 확인을 입력해주세요.") ){ 
			$("[name=user_is_pwd]").focus();
			return;	
		}
		
		if($("[name=user_pwd]").val() != $("[name=user_is_pwd]").val()){
			alert("비밀번호와 일치 하지 않습니다.")
			$("[name=user_is_pwd]").val("")
			$("[name=user_is_pwd]").focus();
			return;	 
		}

		if( checkEmpty("[name=user_year]"   , "생년 을 선택해 주세요" 	 ) ){return;}
		
		if( checkEmpty("[name=user_month]"  , "생월 을 선택해 주세요" 	 ) ){return;}
		
		if( checkEmpty("[name=user_day]"    , "생일 을 선택해 주세요" 	 ) ){return;}
    
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

		if(isEmpty($("[name=pwd_q]"))){
			alert("비밀번호찾기 질문을 선택 해주세요.")
			$("[name=pwd_q]").focus();
			return;
		}

		if( checkEmpty( "[name=pwd_a]", "비밀번호찾기 질문의 답을 입력해 주세요.") ){
			$("[name=pwd_a]").focus();
			return; 
		}

		if( checkPattern( "[name=pwd_a]", /^[가-힣]{2,10}$/, "정확한 답을 입력해 주세요.")  ){ 
			$("[name=pwd_a]").focus();
			return; 	
		}

		if(isEmpty($("[name=user_gender]"))){
			alert("성별을 선택 해주세요.") 
			$("[name=user_gender]").focus();
			return; 	
		}

		if(checkIDCnt==0){
			alert("아이디 중복 확인 해주세요!");
			return;
		}

		$.ajax({
			url : "${requestScope.croot}/joinProc.do"
			, type : "post"
			, data : $("[name=joinForm]").serialize()
			, success : function(getjoinCnt){
				if(getjoinCnt==1){
					alert("회원가입 성공");
					location.replace("${requestScope.croot}/loginForm.do");
				}
				else if(getjoinCnt==-1){
					alert("중복된 아이디가 있습니다");
					checkIDCnt = 0;
					$("[name=user_id]").val("");
					$("[name=user_id]").focus();
				}
				else{
					alert("회원가입실패");
				} 
			}
			, error : function(){
				alert("서버접속 실패! 관리자에게 문의 요망!!");
				}
			})
 	}


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
                 <!-- 이미지 삽입 하는 곳 -->

                 <div class="col-md-9">
                    <div class="login_title">
                       <div class="slide_cont_login" style="text-align:left;">
                          <h2><span>회원가입</span></h2>
                       </div>
                    </div>
                 </div>


                 <form class="form-horizontal" name="joinForm">
                  <table width="80%" border="0">
                    <tr>
                      <td align=center>
                       <div class="form-group">
                         <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">ID</label>
                         <div class="row">
                         <div class="center">
                           <input type="text" class="form-control" style="display: inline; width: 50%; margin-right:20px;" name="user_id" placeholder="ID" maxlength="20">
                           <button type="button" class="btn-1 btn-login" style="width: 80px; min-width: unset;" onClick="checkID()">아이디체크</button>
                         </div>
                         </div>
                       </div>

                     <td align=center>
                        <div class="form-group">
                         <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">NAME</label>
                         <div class="col-md-10">
                           <input type="text" class="form-control" name="user_name" placeholder="NAME"  maxlength="20">
                         </div>
                       </div>


                 <tr>
                   <td align=center width="50%">
                    <div class="form-group">
                      <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;" maxlength="20">비밀번호</label>
                      <div class="col-md-10">
                        <input type="password" class="form-control" name="user_pwd" placeholder="PASSWORD">
                      </div>
                    </div>

                  <td align=center>
                     <div class="form-group">
                      <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">비밀번호 확인</label>
                      <div class="col-md-10">
                        <input type="password" class="form-control" name="user_is_pwd" placeholder="IS_PASSWORD"  maxlength="20">
                      </div>
                    </div>


              <tr>
                <td align=center>
                <div class="form-group">
             	<label class="col-md-10 control-label" style="color:#f8f9fa; text-align:left;">생년월일</label>
             	<div class="col-md-10">
             		<select name="user_year" class="user_year form-control" style="display:inline; width:90px; height:auto; padding: 2px 10px;">
               		<option value=" ">선택</option>
             		</select> <span style="color: white;">년</span>&nbsp;
               		<select name="user_month" class="user_month form-control" style="display:inline; width:90px; height:auto; padding: 2px 10px;" onchange="checkDate()">
                	<option value=" ">선택</option>
              		</select> <span style="color: white;">월</span>&nbsp;
               		<select name="user_day" class="user_day form-control" style="display:inline; width:90px; height:auto; padding: 2px 10px;" onchange="checkDate()">
                	<option value=" ">선택</option>
              		</select> <span style="color: white;">일</span>
              	 </div>
                 </div>
               <td align=center>
                  <div class="form-group">
                   <label class="col-md-10 control-label" style="color:#f8f9fa; text-align: left;">PHONE NUMBER</label>
                   <div class="col-md-10">
                     <input type="text" class="form-control" name="user_phone" placeholder="PHONE NUMBER" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="13" >
                   </div><!-- onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" -->
                 </div>

            </table>


              <div class="form-group">
                <label class="col-sm-9 control-label" style="color:#f8f9fa; text-align:left;">Email</label>
                <div class="col-sm-9">
                <input type="text" class="form-control" name="user_email" placeholder="Email" maxlength="30">
              </div>
              </div>


            <div class="form-group">
              <label class="col-sm-9 control-label" style="color:#f8f9fa; text-align:left;" >비밀번호 찾기 질문</label>
              <div class="col-sm-9">
              <select class="form-control" name="pwd_q" placeholder="비밀번호 찾기 질문">
                <option value=" ">선택</option>
                <option value="1">태어난 도시는 어디입니까?</option>
                <option value="2">어릴적 별명은 무엇입니까?</option>
                <option value="3">처음 다닌 학교이름은 무엇입니까?</option>
                <option value="4">처음 키운 애완동물 이름은 무엇입니까?</option>
                <option value="5">부모님이 처음 만난 도시는 어디 입니까?</option>
                </select>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-9 control-label" style="color:#f8f9fa; text-align:left;">비밀번호 찾기 답</label>
              <div class="col-sm-9">
              <input type="text" class="form-control" name="pwd_a" placeholder="비밀번호 찾기 답" maxlength="20">
            </div>
            </div>

            <div class="form-group">
              <label class="col-sm-9 control-label" style="color:#f8f9fa; text-align:left;">성별</label>
              <div class="col-sm-9">
              <select class="form-control" name="user_gender">
                <option value=" ">선택</option>
                <option value="남성">남성</option>
                <option value="여성">여성</option>
                </select>
              </div>
            </div>


        </div>
      </div>

    </center>

    </form>
     <br><br>
        <center>
          <table width="60%" border="0">
            <tr><td align=center>
                   <div class="form-group">
                     <div class="col-sm-10">
                       <button type="button" class="btn-1 btn-login" onClick="location.replace('${requestScope.croot}/loginForm.do');">로그인 화면</button>
                     </div>
                   </div>

              <td align=center>
                  <div class="form-group">
                    <div class="col-sm-10">
                       <button type="button" class="btn-1 btn-login" onClick="checkJoinForm();">가입신청</button>

                    </div>
                  </div>

              </table>
          </center>

           </div>


  </section>
      <!-- end section -->
      <!-- footer -->
      <footer class="footer_style_2">
         
      </footer>
     </body>
</html>
