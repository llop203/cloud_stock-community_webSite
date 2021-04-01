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
		    width: 730px;
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
				url : "${requestScope.croot}/q6Proc.do",
				type : "post",
				data : {answer : "1"},
				success : function(q6_cnt){
					if(q6_cnt == 1){
						document.goq7.submit();
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
				url : "${requestScope.croot}/q6Proc.do",
				type : "post",
				data : {answer : "2"},
				success : function(q6_cnt){
					if(q6_cnt == 1){
						document.goq7.submit();
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
				url : "${requestScope.croot}/q6Proc.do",
				type : "post",
				data : {answer : "3"},
				success : function(q6_cnt){
					if(q6_cnt == 1){
						document.goq7.submit();
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
                        <h2>투자를 하게 된다면 <span>투자기간</span>은?</h2>
                     </div>
                  </div>
               </div>
            </div>
          </div>

            <div class="container"><center>

              <div class="row">
              <div class="col-sm-12"><br>
              <button type="button" name="q6" class="btn btn-lg btn-service" style="font-size: 23px; height:20%;" onClick="check1()"><b>10년 이상</b></button><br><br><br>
              <button type="button" name="q6"  class="btn btn-lg btn-service" style="font-size: 23px; height:20%;" onClick="check2()"><b>1년  ~ 10년</b></button><br><br><br>
              <button type="button" name="q6"  class="btn btn-lg btn-service" style="font-size: 23px; height:20%;" onClick="check3()"><b>1년 이하</b></button><br><br><br>
				
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
      <form name="goq7" method="post" action="${requestScope.croot}/q7.do"></form>
   </body>
</html>
