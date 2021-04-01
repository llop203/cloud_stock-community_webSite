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
	      $(document).ready(function() {
			
		      
	  		//여기 아래 부분
	  		$('#summernote').summernote({

	  			/* toolbar: [
    			    // [groupName, [list of button]]
    			    ['fontname', ['fontname']],
    			    ['fontsize', ['fontsize']],
    			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    			    ['color', ['forecolor','color']],
    			    ['table', ['table']],
    			    ['para', ['ul', 'ol', 'paragraph']],
    			    ['height', ['height']],
    			    ['insert',['picture','link','video']],
    			    ['view', ['fullscreen', 'help']]
    			],
    			  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
    			  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'], */
	  			  height: 300,                 // 에디터 높이
	  			  minHeight: null,             // 최소 높이
	  			  maxHeight: null,             // 최대 높이
	  			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	  			  lang: "ko-KR",					// 한글 설정
	  			  placeholder: '최대 2048자까지 쓸 수 있습니다'		//placeholder 설정
		    	     
	  		});
	  	});

      function goTipBoardForm(){
			document.tipBoardForm.submit();
			
		}

		function goTipBoardUpdate(){

			if(confirm("정말 수정하시겠습니까?")==false){return;}

			var admin_pwd = prompt("관리자 비밀번호를 입력해주세요");

    		if(admin_pwd!=${admin_pwd.admin_pwd}){
				alert("관리자 비밀번호가 틀립니다.");
				return;
	    	}

			$.ajax({
				url:"${requestScope.croot}/tipBoardUpdateProc.do" 
				, type:"post"
   				, processData: false
   				, contentType: false 
   				, enctype: 'multipart/form-data'
				,data : new FormData($("[name=tipBoardUpDelForm]").get(0))//$('[name=tipBoardUpDelForm]').serialize()
				, success : function(updateCnt){
					if(updateCnt==1){
						alert("수정 성공");
						document.tipBoardContentForm.submit();
					}
					else if(updateCnt==-1){
						alert("수정실패")
					}
					else{
						alert("수정할 수 없습니다. 관리자에게 문의 하세요");
					}
					
				}
				, error : function(){
					alert("연결 실패");
				}
		});

		}

		function goTipBOardDelete(){

			if(confirm("정말 삭제하시겠습니까?")==false){return;}

			var admin_pwd = prompt("관리자 비밀번호를 입력해주세요");

    		if(admin_pwd!=${admin_pwd.admin_pwd}){
				alert("관리자 비밀번호가 틀립니다.");
				return;
	    	}

			$.ajax({
				url:"${requestScope.croot}/tipBoardDeleteProc.do" 
				, type:"post"
				,data : $('[name=tipBoardUpDelForm]').serialize()
				, success : function(deleteCnt){
					if(deleteCnt==1){
						alert("게시글 휴지통 성공");
						document.tipBoardForm.submit();
					}
					else{
						alert("휴지통 실패");
					}
					
				}
				, error : function(){
					alert("연결 실패");
				}
		});

		}

		function gomain(){
	  		location.replace("${requestScope.croot}/mainPageForm.do")
	  	  }

      </script>
      
   </head>
   <body id="default_theme" class="home_page1">
   	<script>
	   	<c:if test="${sessionScope.user_no != 1}">
			alert("관리자만 접근 가능합니다.");
			gomain();
		 </c:if>
	  

      </script>
      
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
              <h3> 꿀팁 게시판 수정/삭제</h3><hr>
            </div>
           </div>
        </form>
			
            <form class="tipBoardUpDelForm" name="tipBoardUpDelForm" method="post" action="${requestScope.croot}/tipBoardForm.do">
           <div class="row">
            <div class="col-md-12">
              <input type="hidden" name="admin_no" value="${sessionScope.user_no}">
              <input type="hidden" name="tip_b_no" value="${tipBoard.tip_b_no}">
              <input type="text" class="form-control" name="tip_title" placeholder="제목" value="${tipBoard.tip_title }">
              <br>
              <label class="col-md-8 control-label" style="text-align: left; font-size:14px;"><strong>작성자</strong> : ${tipBoard.admin_name }</label>
              <label class="col-md-3 control-label" style="text-align: left; font-size:14px;"><strong>작성일</strong> : ${tipBoard.tip_date }</label>
              <br>
              <label class="col-md-8 control-label" style="text-align: left; font-size:14px;"></label>
              <label class="col-md-3 control-label" style="text-align: left; font-size:14px;"><strong>조회수</strong> : ${tipBoard.tip_readcount }</label>
              <br>
              <hr>
             <br>
             <c:if test="${!empty tipBoard.tip_pic}">
				<input type="hidden"  name="pic" value="${tipBoard.tip_pic}">
				<img src="/resources/tip_board_img/${tipBoard.tip_pic}" width=100%;>		
			 </c:if>
             <br>
             <br>
             
            <textarea class="form-control" name="tip_content" id="summernote" rows="20" >${tipBoard.tip_content }</textarea>
			
			<br>
            <br>
            <div class="form-group">
			    <label>File input</label>
			    <input type="file" name="tip_pic2">
			   <!--  <p class="help-block">Example block-level help text here.</p> -->
			  </div>

            </div>
           </div>


           </form>
           <br>


           <hr>

            <div class="row" style="float:right;">
              <!-- 관리자만 게시글 수정 보임 -->
              <button type="button" class="btn-4 btn-info" onClick="goTipBoardUpdate();">게시글 수정</button>&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn-4 btn-info" onClick="goTipBOardDelete();">게시글 삭제</button>&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn-4 btn-info" onClick="goTipBoardForm();">목록으로</button>
            </div>
         </div>
      </section>
      
      <form name="tipBoardForm" method="post" action="${requestScope.croot}/tipBoardForm.do">
      		
      		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
      		<input type="hidden" name="keyword1" value="${param.keyword1}">
      		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
      </form>
      
      <form name="tipBoardContentForm" method="post" action="${requestScope.croot}/tipBoardContentForm.do">
      		<input type="hidden" name ="tip_b_no" value="${tipBoard.tip_b_no}">
      		<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
      		<input type="hidden" name="keyword1" value="${param.keyword1}">
      		<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
      </form>
     
      <!-- end section -->
      <!-- footer -->
      <footer class="footer_style_2">
         
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>Copyright © 2021 from KITE</strong></p>
         </div>
      </footer>
      
   </body>
</html>
