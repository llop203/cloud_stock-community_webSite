<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>How To Invest</title>
      
      
      <script>
		var hashArr = [
			"#비트코인" , "#주식", "#주린이"
			, "#개미", "#투자", "#단리", "#복리"
			, "#매수", "#매도", "#호가", "#상한가"
			, "#하한가", "#공매도", "#손절", "#블루칩"
			, "#배당", "#양봉", "#음봉", "#주가", "#테마주"
			, "#익절", "#품절주", "#코스피", "#코스닥"
			, "#금융", "#펀드", "#금리", "#가계", "#공시"
			, "#이자", "#동학개미", "#서학개미"
		];

		var randomHash = [];

		function sameNum(k){
			for(var i=0; i<randomHash.length; i++){
				if(k==randomHash[i]){
					return true;
				}
			}
			return false;
		}

		var i = 0;
		while(i<6){
			var j = Math.floor(Math.random()*hashArr.length);
			if(! sameNum(j)){
				randomHash.push(j);
				i++;
			}
		}

		
     	
		
	//	alert(hashArr.length);

      

      $(document).ready(function(){
    //	  alert(randomHash);
   

          $("[name=hash1]").val(hashArr[randomHash[0]]);
		  $("[name=hash1]").text(hashArr[randomHash[0]]);

		  $("[name=hash2]").val(hashArr[randomHash[1]]);
		  $("[name=hash2]").text(hashArr[randomHash[1]]);

		  $("[name=hash3]").val(hashArr[randomHash[2]]);
		  $("[name=hash3]").text(hashArr[randomHash[2]]);

		  $("[name=hash4]").val(hashArr[randomHash[3]]);
		  $("[name=hash4]").text(hashArr[randomHash[3]]);

		  $("[name=hash5]").val(hashArr[randomHash[4]]);
		  $("[name=hash5]").text(hashArr[randomHash[4]]);

		  $("[name=hash6]").val(hashArr[randomHash[5]]);
		  $("[name=hash6]").text(hashArr[randomHash[5]]);

			
    	  inputData(".keyword1" ,"${requestScope.tipBoardSearchDTO.keyword1}");
    	  inputData(".selectPageNo" ,"${requestScope.tipBoardSearchDTO.selectPageNo}");   
  		  inputData(".rowCntPerPage" ,"${requestScope.tipBoardSearchDTO.rowCntPerPage}");
    	  

    	$("[name=rowCntPerPage]").change(function(){
  			search_when_pageNoClick();
  		});

  


    	  $(".pagingNumber").html(
  				getPagingNumber(
  					"${requestScope.tipBoardListAllCnt}"		// 검색 결과 총 갯수
  					, "${requestScope.tipBoardSearchDTO.selectPageNo}"		// 선택된 현재 페이지 번호
  					, "${requestScope.tipBoardSearchDTO.rowCntPerPage}"		// 페이지 당 출력 행의 갯수
  					, "10"						// 페이지 당 보여줄 페이지 번호 갯수
  					, "search_when_pageNoClick();"				// 페이지 번호 클릭 후 실행할 자스코드
  					 
  				)
  		);



      });

    	function search_when_pageNoClick() {
  		// 입력한 키워드 얻기
  		var keyword1 = $("[name=keyword1]").val();

  		// 입력한 키워드가 비어 있지 않으면
  		if(keyword1!=null && keyword1.split(" ").join("")!=""){
  		// 입력한 키워드 앞뒤 공백 제거하기
  			keyword1 = $.trim(keyword1);
  			
  		//	 name=keyword1 을가진 입력 양식에 앞뒤 공백 제거한 키워드 넣어주기
  			$("[name=keyword1]").val(keyword1);
  		}
  		
  		document.tipBoardForm.submit();
  	}
 
 	function search(){
		if(isEmpty($("[name=keyword1]")) && isEmpty($("[name=selectDepNo]"))&&isEmpty($("[name=selectJikupCode]"))){
			$("[name=selectPageNo]").val("1");
			$("[name=keyword1]").val("");
			 document.tipBoardForm.submit();
			 
		}
		var keyword1 = $("[name=keyword1]").val();	
		
		keyword1 = $.trim(keyword1);

		
		$("[name=keyword1]").val(keyword1); 
		$("[name=selectPageNo]").val("1");
		
		document.tipBoardForm.submit();

		
	}
     	 

      	function goTipBoardContentForm(tip_b_no){


      		$("[name=tipBoardContentForm] [name=tip_b_no]").val(tip_b_no);
      		$("[name=tipBoardContentForm] [name=selectPageNo]").val($("[name=tipBoardForm] [name=selectPageNo]").val());
      		$("[name=tipBoardContentForm] [name=keyword1]").val($("[name=tipBoardForm] [name=keyword1]").val());
            $("[name=tipBoardContentForm] [name=rowCntPerPage]").val($("[name=tipBoardForm] [name=rowCntPerPage]").val());
 
			//alert(tip_b_no);
 			document.tipBoardContentForm.submit();
         }

        function goTipBoardRegForm(){

        	
        	$("[name=tipBoardRegForm] [name=rowCntPerPage]").val($("[name=tipBoardForm] [name=rowCntPerPage]").val());
        	$("[name=tipBoardRegForm] [name=selectPageNo]").val($("[name=tipBoardForm] [name=selectPageNo]").val());	
        	$("[name=tipBoardRegForm] [name=keyword1]").val($("[name=tipBoardForm] [name=keyword1]").val());

			document.tipBoardRegForm.submit();
         }


        function tagSearh(hashTag){

			var str = hashTag
			str = str.replace("#","");
            
            
            $("[name=keyword1]").val(str); 
    		$("[name=selectPageNo]").val("1");

    		document.tipBoardForm.submit();
         }
      </script>
      
   </head>
   <body id="default_theme" class="home_page1">
 <c:if test="${sessionScope.user_no == null}">
   <header class="header header_style1">
         <div class="container">
            <div class="row">
               <div class="col-md-9 col-lg-10">
                  <div class="logo">
                  	<a href="${croot}/mainPageForm.do"><img src="/resources/img/cloudStock_3.png" style="width:150;" ></a>
                  </div>
                  <div class="main_menu float-right">
                    <!-- 메뉴바  -->
                     <div class="menu">
                        <ul class="clearfix">
                           <li><a href="${croot}/keywordListForm.do" style="font-size: 17px;"><strong>주식용어 사전</strong></a></li>
                           <li class="active"><a href="${croot}/tipBoardForm.do" style="font-size: 17px;"><strong>꿀팁게시판</strong></a></li>
                           <li><a href="${croot}/freeBoardForm.do" style="font-size: 17px;"><strong>자유게시판</strong></a></li>
                           <li><a href="${croot}/analysisForm.do" style="font-size: 17px;"><strong>성향 분석</strong></a></li>
                           <li><a href="${croot}/stockForm2.do" style="font-size: 17px;"><strong>KOSPI200 주가현황</strong></a></li>
                        </ul>
                     </div>
                  </div>
               </div>
               	<div class="col-md-3 col-lg-2">   
                    <div class="right_bt">
                           <a class="bt_main" href="${croot}/loginForm.do">로그인</a> 
                     </div>   
                </div>
          	</div>
       	</div>
  	</header>
  </c:if>
    <!------------------------------------------------------------------------------------>
   <c:if test="${sessionScope.user_no != null}">
      <header class="header header_style1">
         <div class="container">
            <div class="row">
               <div class="col-md-7 col-lg-9">
                  <div class="logo">
                  	<a href="${croot}/mainPageForm.do"><img src="/resources/img/cloudStock_3.png" style="width:150;" ></a>
                  </div>
                  <div class="main_menu float-right">
                    <!-- 메뉴바  -->
                     <div class="menu">
                        <ul class="clearfix">
                           <li><a href="${croot}/keywordListForm.do" style="font-size: 17px;"><strong>주식용어 사전</strong></a></li>
                           <li class="active"><a href="${croot}/tipBoardForm.do" style="font-size: 17px;"><strong>꿀팁게시판</strong></a></li>
                           <li><a href="${croot}/freeBoardForm.do" style="font-size: 17px;"><strong>자유게시판</strong></a></li>
                           <li><a href="${croot}/analysisForm.do" style="font-size: 17px;"><strong>성향 분석</strong></a></li>
                           <li><a href="${croot}/stockForm2.do" style="font-size: 17px;"><strong>KOSPI200 주가현황</strong></a></li>
                        </ul>
                     </div>
                  </div>
               </div>
               	<div class="col-md-5 col-lg-3">   
                   <div class="btn-group right_bt">
                  	 <a class="bt_main" href="${croot}/logoutForm.do">로그아웃</a>
                   	 <a class="white_bt bt_main" style="min-width: 85; padding: 0 15px; margin-left:15px;"  href="${croot}/myPageForm.do">myPage</a>
                   </div>     
                </div>
          	</div>
       	</div>
   	</header>
 </c:if>      
 
      
      
      <section id="banner_parallax" class="slide_banner1">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="full">
                     <div class="slide_cont">
                        <h2>How To Invest</h2>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end header -->
      <!-- section -->
      <section class="layout_padding_board layer_style">
          <div class="container">
          
          <form class="form-horizontal">
           <div class="row">
            <div class="col-md-12">
              <h3> 꿀팁게시판 <small>How To Invest</small></h3><br>
            </div>
           </div>
        </form>
          
          <form class="tipBoardForm" name="tipBoardForm" method="post" action="${requestScope.croot}/tipBoardForm.do">

              <div class="row" style="float:right;">

                <div class="form-group">

                  <div class="col-md-12">
                    <input type="text" class="form-control  keyword1" name="keyword1" placeholder="검색">
                  </div>
                </div>
                <button type="button" class="btn-2 btn-info"  onClick="search();">검색</button>
                <input type="hidden" name="selectPageNo" class="selectPageNo">
                <input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
              </div>
              <div class="row" >
                <div class="col-md-12">
                <div class="d-grid gap-3 d-md-block">
                  <button class="btn-3 btn-keyword" name="hash1" type="button" onClick="tagSearh($(this).val());" style="color: #9aaaab; background-color: white; border-color: #dee4e1; border-style: solid;"></button>&nbsp;&nbsp;&nbsp;
                  <button class="btn-3 btn-keyword" name="hash2" type="button" onClick="tagSearh($(this).val());" style="color: #9aaaab; background-color: white; border-color: #dee4e1; border-style: solid;"></button>&nbsp;&nbsp;&nbsp;
                  <button class="btn-3 btn-keyword" name="hash3" type="button" onClick="tagSearh($(this).val());" style="color: #9aaaab; background-color: white; border-color: #dee4e1; border-style: solid;"></button>&nbsp;&nbsp;&nbsp;
                  <button class="btn-3 btn-keyword" name="hash4" type="button" onClick="tagSearh($(this).val());" style="color: #9aaaab; background-color: white; border-color: #dee4e1; border-style: solid;"></button>&nbsp;&nbsp;&nbsp;
                  <button class="btn-3 btn-keyword" name="hash5" type="button" onClick="tagSearh($(this).val());" style="color: #9aaaab; background-color: white; border-color: #dee4e1; border-style: solid;"></button>&nbsp;&nbsp;&nbsp;
                  <button class="btn-3 btn-keyword" name="hash6" type="button" onClick="tagSearh($(this).val());" style="color: #9aaaab; background-color: white; border-color: #dee4e1; border-style: solid;"></button>
                  
                </div>
              </div>
              </div>

            <br><br>

		
			
            
            <c:forEach items="${requestScope.tipBoardList}" var="tipboard" varStatus="loopTagStatus">
            	<c:if test="${loopTagStatus.first || loopTagStatus.count%3==0}">
                	<div class="row">
                </c:if>
               <div class="col-md-4" style="padding-top:30;">
               
                 <div class="card" style="width: 18rem; cursor:pointer;" onClick="goTipBoardContentForm(${tipboard.tip_b_no});">
                     <c:if test="${empty tipboard.tip_pic}">
                     	<img src="/resources/img/cloudStock_3.png" class="card-img-top" alt="...">
                     </c:if>
                     <c:if test="${!empty tipboard.tip_pic}">
                     	<img src="/resources/tip_board_img/${tipboard.tip_pic}" class="card-img-top" >
                     </c:if>
                     <div class="card-body">
                     	<p><h5>${tipboard.tip_title}</h5></p>
                       
                     </div>
                  </div>
                </div>
                
                <c:if test="${loopTagStatus.last||loopTagStatus.count%3==0}">
                	</div>
                </c:if> 
                
			</c:forEach> 
           <br>
           
   
            </div>
            
            <div class="row" style="padding-top:40px;">
          		<div class="center">
          			<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
          		</div>
          	</div>
            </form>
      </section>
      
      <section class="layout_padding_board layer_style">
      	<c:if test="${sessionScope.user_no == '1'}">
      		<div class="container">
		      <div class="row" style="float:right;">
		      <!-- 관리자만 보이게 -->
		          <button type="button" class="btn-2 btn-info" onClick="goTipBoardRegForm();">게시글 작성</button>
		      </div>
		  </div>
      	</c:if>
      	
           <!-- <div class="container">
		      <div class="row" style="float:right;">
		      관리자만 보이게
		          <button type="button" class="btn-2 btn-info" onClick="goTipBoardRegForm();">게시글 작성</button>
		      </div>
		  </div> -->
		</section>
      
      <form name="tipBoardContentForm" method="post" action="${requestScope.croot}/tipBoardContentForm.do">
      
    	<input type="hidden" name="tip_b_no" >
      	
      	<input type="hidden" name="selectPageNo" >
		<input type="hidden" name="rowCntPerPage" >
		<input type="hidden" name="keyword1" >
      	<%-- <input type="hidden" name="tip_b_no" value="${requestScope.tipboard.tip_b_no}">
      	
      	<input type="hidden" name="selectPageNo" value="${param.selectPageNo }">
		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage }">
		<input type="hidden" name="keyword1" value="${param.keyword1 }"> --%>
      </form>
      
      <form name="tipBoardRegForm" method="post" action="${requestScope.croot}/tipBoardRegForm.do">
      	<input type="hidden" name="admin_no" value="${sessionScope.user_no}">
      	<input type="hidden" name="selectPageNo" value="${param.selectPageNo }">
		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage }">
		<input type="hidden" name="keyword1" value="${param.keyword1 }">
      </form>
      
      
      
      
      
      <!-- footer -->
      <footer class="footer_style_2">
         
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>Copyright © 2021 from KITE</strong></p>
         </div>
      </footer>
      
   </body>
</html>
