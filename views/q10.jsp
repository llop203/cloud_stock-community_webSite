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
      	.input-size {
		    display: block;
		    width: 30%;
		    padding: .375rem .75rem;
		    font-size: 3rem;
		    line-height: 1.5;
		    color: #495057;
		    background-color: #fff;
		    background-clip: padding-box;
		    border: 10px solid #ced4da;
		    border-radius: .25rem;
		    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		    text-align: right;
		}
      
      </style>
      
      <script>
      $(document).ready(function(){

			var moneyObj = $("[name=money]");

			moneyObj.focus();
			
			moneyObj.keyup( function(){ 
				insertComma(    $(this)   );
				
			});

		});

		function check(){

			var money = $("[name=money]").val();
			if(money.split(" ").join("") == ""){
				alert("금액을 입력해주세요")
				return;
			}
			
			money = money.replace(/,/g, "");
			
			$.ajax({
				url : "${requestScope.croot}/q10Proc.do",
				type : "post",
				data : {answer : money},
				success : function(q10_cnt){
					if(q10_cnt == 1){
						document.resultList.submit();
					}
					else
						alert("실패")
				},

				error : function(){
					alert("서버접속실패")
				}
	
			})
			

		}

		function inputWon(){
			var money = $("[name=money]").val();
			money = money.replace(/,/g, "");
			
			$(".inputWon").text(numberToKorean(money)+"원");
			

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
                        <h2>현재 <span>월 수입</span> 금액은?</h2>
                     </div>
                  </div>
               </div>
            </div>
          </div>

            <div class="container"><center>

              <div class="row">
              	<div class="center">
              		<div class="col-sm-6"><br>
              			<div class="input-group mb-3">
			     			 <input type="text" name="money" class="form-control input-size" aria-label="Amount (to the nearest dollar)" onkeyup="inputWon()">
				 			 <span class="input-group-text" style="font-size: 3rem;">원</span>
			  			</div>
			  			<span class="inputWon" style="text-align: right; font-size: 40px; float: right"><br></span>
              		</div>
              	</div>
              </div>
            </div>

            <br>
           <div class="container"><center>
              <div class="row">
              	<div class="col-sm-12"><br><br><br>
              		<button type="button" class="btn btn-lg btn-service" style="font-size: 23px; height:40%;" onClick="check()"><b>확인</b></button><br><br><br>
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
     <form name="resultList" method="post" action="${requestScope.croot}/resultListForm.do"></form> 
   </body>
</html>
