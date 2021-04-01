<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>Analysis</title>
      
      <style>
      	.heading_style_1 h2::after {
		    width: 800px;
		    height: 5px;
		    background: #ddd;
		    content: "";
		    display: block;
		    margin: 15px 0 30px;
		}
      </style>
      
      <script>

		function check1(){

			$.ajax({
				url : "${requestScope.croot}/q7Proc.do",
				type : "post",
				data : {answer : "1"},
				success : function(q7_cnt){
					if(q7_cnt == 1){
						document.goq8.submit();
					}
					else
						alert("실패")
				},

				error : function(){
					alert("서버접속실패")
				}
	
			})

		}

		function check2(){
			
			$.ajax({
				url : "${requestScope.croot}/q7Proc.do",
				type : "post",
				data : {answer : "2"},
				success : function(q7_cnt){
					if(q7_cnt == 1){
						document.goq8.submit();
					}
					else
						alert("실패")
				},

				error : function(){
					alert("서버접속실패")
				}
	
			})

		}

		function check3(){

			$.ajax({
				url : "${requestScope.croot}/q7Proc.do",
				type : "post",
				data : {answer : "3"},
				success : function(q7_cnt){
					if(q7_cnt == 1){
						document.goq8.submit();
					}
					else
						alert("실패")
				},

				error : function(){
					alert("서버접속실패")
				}
	
			})

		}
      </script>
    </head>
   <body id="default_theme" class="services">
      <!-- header -->
      <header class="header header_style1">
         
      </header>



      <!-- end header -->
      <!-- section -->
      <br>

      <section class="layout_padding_board layer_style" style="padding-top: 130px;">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <div class="full text_align_center">
                     <div class="heading_main center_head_border heading_style_1">
                        <h2>투자를 하게 된다면 <span>기대 수익률</span>은?</h2>
                     </div>
                  </div>
               </div>
            </div>
          </div>

            <div class="container"><center>

              <div class="row">
              <div class="col-sm-12"><br>
              <button type="button" name="q7" class="btn btn-lg btn-service" style="font-size: 23px; height:20%;" onClick="check1()"><b>수익이 적어도 좋으니 최대한 원금 보장</b></button><br><br><br>
              <button type="button" name="q7"  class="btn btn-lg btn-service" style="font-size: 23px; height:20%;" onClick="check2()"><b>연 5% ~ 10% 정도 꾸준한 수익</b></button><br><br><br>
              <button type="button" name="q7"  class="btn btn-lg btn-service" style="font-size: 23px; height:20%;" onClick="check3()"><b>수익률이 높다면 위험이 높아도 상관없음</b></button><br><br><br>
				
            </div>
          </div>

            </div>

	</section>

           
      <footer class="footer_style_2">
         
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>Copyright © 2021 from KITE</strong></p>
         </div>
      </footer>
      <form name="goq8" method="post" action="${requestScope.croot}/q8.do"></form>
   </body>
</html>
