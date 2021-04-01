<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>


<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
	   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>종목 비교</title>
      
	<style>	
	table.scroll tbody, table.scroll thead { 
		display: block; 
	}
	table.scroll tbody {
	    overflow-y: auto;
	    overflow-x: hidden;
	    max-height: 500px;
	}
	table.scroll tr {
	    display: flex;
	}
	table.scroll tr > td {
	    display: flex; 
	    justify-content: center;
	    flex-grow: 1;
	    flex-basis: 0;
	}		
	.borderColor {
		border-left: 1px solid; border-top: 1px solid; border-bottom: 1px solid; border-right: 1px solid;
	}
	</style>

   <script>
   $(document).ready(function(){	
	    tableAutoResize();
		printStockList( "" );
		
		$("[name=keyword]").keydown(function(event){
			if(event.keyCode==13){
				search();
			}
		});

		inputData("[name=is_clicked1]","${crawlingDTO.is_clicked1}");
		inputData("[name=selectedStockCode1]","${crawlingDTO.selectedStockCode1}");
		
		$(".stock_code").click(function(){
			var txt = $(this).text();

			if(txt=="코드번호"){
				$(".stock_code").text("코드번호▲");
				$(".orderby_stock_code").val("stock_code asc");				
			}
			else if(txt=="코드번호▲"){
				$(".stock_code").text("코드번호▼");
				$(".orderby_stock_code").val("stock_code desc");	
			}
			else if(txt=="코드번호▼"){
				$(".stock_code").text("코드번호");
				$(".orderby_stock_code").val("");
			}

			$(".stock_name").text("종목명");
			$(".orderby_stock_name").val("");
			$(".industrial_name").text("업종분류");
			$(".orderby_industrial_name").val("");

			var str = "";
			str += "orderby_stock_code=" + $(".orderby_stock_code").val();

			var keyword = $("[name=keyword]").val();
			keyword = $.trim(keyword);
			$("[name=keyword]").val(keyword);
			str += "&keyword=" + keyword;

			printStockList(str);			
		});
		$(".stock_name").click(function(){
			var txt = $(this).text();

			if(txt=="종목명"){
				$(".stock_name").text("종목명▲");
				$(".orderby_stock_name").val("stock_name asc");					
			}
			else if(txt=="종목명▲"){
				$(".stock_name").text("종목명▼");
				$(".orderby_stock_name").val("stock_name desc");
			}
			else if(txt=="종목명▼"){
				$(".stock_name").text("종목명");
				$(".orderby_stock_name").val("");
			}

			$(".stock_code").text("코드번호");
			$(".orderby_stock_code").val("");
			$(".industrial_name").text("업종분류");
			$(".orderby_industrial_name").val("");
			
			var str = "";
			str += "orderby_stock_name=" + $(".orderby_stock_name").val();

			var keyword = $("[name=keyword]").val();
			keyword = $.trim(keyword);
			$("[name=keyword]").val(keyword);
			str += "&keyword=" + keyword;

			printStockList(str);	
		});
		$(".industrial_name").click(function(){
			var txt = $(this).text();

			if(txt=="업종분류"){
				$(".industrial_name").text("업종분류▲");
				$(".orderby_industrial_name").val("industrial_name asc");			
			}
			else if(txt=="업종분류▲"){
				$(".industrial_name").text("업종분류▼");
				$(".orderby_industrial_name").val("industrial_name desc");		
			}
			else if(txt=="업종분류▼"){
				$(".industrial_name").text("업종분류");
				$(".orderby_industrial_name").val("");
			}

			$(".stock_code").text("코드번호");
			$(".orderby_stock_code").val("");
			$(".stock_name").text("종목명");
			$(".orderby_stock_name").val("");
			
			var str = "";
			str += "orderby_industrial_name=" + $(".orderby_industrial_name").val();

			var keyword = $("[name=keyword]").val();
			keyword = $.trim(keyword);
			$("[name=keyword]").val(keyword);
			str += "&keyword=" + keyword;

			printStockList(str);	
		});
		$(".rateOfReturn_1").click(function(){
			var txt = $(this).text();
			var arr = txt.split(" ");
			
			if(arr[0] == "1개월"){
				if(arr[1]=="수익률"){
					$(".rateOfReturn_1").text("1개월 수익률▲");
					$(".orderby_rateOfReturn_1").val("month1 asc");			
				}
				else if(arr[1]=="수익률▲"){
					$(".rateOfReturn_1").text("1개월 수익률▼");
					$(".orderby_rateOfReturn_1").val("month1 desc");		
				}
				else if(arr[1]=="수익률▼"){
					$(".rateOfReturn_1").text("1개월 수익률");
					$(".orderby_rateOfReturn_1").val("");
				}
			}
			else if(arr[0] == "3개월"){
				if(arr[1]=="수익률"){
					$(".rateOfReturn_1").text("3개월 수익률▲");
					$(".orderby_rateOfReturn_1").val("month3 asc");			
				}
				else if(arr[1]=="수익률▲"){
					$(".rateOfReturn_1").text("3개월 수익률▼");
					$(".orderby_rateOfReturn_1").val("month3 desc");		
				}
				else if(arr[1]=="수익률▼"){
					$(".rateOfReturn_1").text("3개월 수익률");
					$(".orderby_rateOfReturn_1").val("");
				}
			}
			else if(arr[0] == "6개월"){
				if(arr[1]=="수익률"){
					$(".rateOfReturn_1").text("6개월 수익률▲");
					$(".orderby_rateOfReturn_1").val("month6 asc");			
				}
				else if(arr[1]=="수익률▲"){
					$(".rateOfReturn_1").text("6개월 수익률▼");
					$(".orderby_rateOfReturn_1").val("month6 desc");		
				}
				else if(arr[1]=="수익률▼"){
					$(".rateOfReturn_1").text("6개월 수익률");
					$(".orderby_rateOfReturn_1").val("");
				}
			}
			$(".stock_code").text("코드번호");
			$(".orderby_stock_code").val("");
			$(".stock_name").text("종목명");
			$(".orderby_stock_name").val("");
			$(".industrial_name").text("업종분류");
			$(".orderby_industrial_name").val("");
			
			var txt2 = $(".rateOfReturn_2").text();
			var arr2 = txt2.split(" "); 
			$(".rateOfReturn_2").text(arr2[0] + " 수익률");
			$(".orderby_rateOfReturn_2").val("");
			var txt3 = $(".rateOfReturn_3").text();
			var arr3 = txt3.split(" "); 
			$(".rateOfReturn_3").text(arr3[0] + " 수익률");
			$(".orderby_rateOfReturn_3").val("");
			
			var str = "";
			str += "orderby_rateOfReturn_1=" + $(".orderby_rateOfReturn_1").val();

			var keyword = $("[name=keyword]").val();
			keyword = $.trim(keyword);
			$("[name=keyword]").val(keyword);
			str += "&keyword=" + keyword;

			printStockList2(str);
		});
		$(".rateOfReturn_2").click(function(){
			var txt = $(this).text();
			var arr = txt.split(" ");

			if(arr[0] == "3개월"){
				if(arr[1]=="수익률"){
					$(".rateOfReturn_2").text("3개월 수익률▲");
					$(".orderby_rateOfReturn_2").val("month3 asc");			
				}
				else if(arr[1]=="수익률▲"){
					$(".rateOfReturn_2").text("3개월 수익률▼");
					$(".orderby_rateOfReturn_2").val("month3 desc");		
				}
				else if(arr[1]=="수익률▼"){
					$(".rateOfReturn_2").text("3개월 수익률");
					$(".orderby_rateOfReturn_2").val("");
				}
			}
			else if(arr[0] == "6개월"){
				if(arr[1]=="수익률"){
					$(".rateOfReturn_2").text("6개월 수익률▲");
					$(".orderby_rateOfReturn_2").val("month6 asc");			
				}
				else if(arr[1]=="수익률▲"){
					$(".rateOfReturn_2").text("6개월 수익률▼");
					$(".orderby_rateOfReturn_2").val("month6 desc");		
				}
				else if(arr[1]=="수익률▼"){
					$(".rateOfReturn_2").text("6개월 수익률");
					$(".orderby_rateOfReturn_2").val("");
				}
			}
			else if(arr[0] == "1년"){
				if(arr[1]=="수익률"){
					$(".rateOfReturn_2").text("1년 수익률▲");
					$(".orderby_rateOfReturn_2").val("month12 asc");			
				}
				else if(arr[1]=="수익률▲"){
					$(".rateOfReturn_2").text("1년 수익률▼");
					$(".orderby_rateOfReturn_2").val("month12 desc");		
				}
				else if(arr[1]=="수익률▼"){
					$(".rateOfReturn_2").text("1년 수익률");
					$(".orderby_rateOfReturn_2").val("");
				}
			}
			$(".stock_code").text("코드번호");
			$(".orderby_stock_code").val("");
			$(".stock_name").text("종목명");
			$(".orderby_stock_name").val("");
			$(".industrial_name").text("업종분류");
			$(".orderby_industrial_name").val("");

			var txt1 = $(".rateOfReturn_1").text();
			var arr1 = txt1.split(" "); 
			$(".rateOfReturn_1").text(arr1[0] + " 수익률");
			$(".orderby_rateOfReturn_1").val("");
			var txt3 = $(".rateOfReturn_3").text();
			var arr3 = txt3.split(" "); 
			$(".rateOfReturn_3").text(arr3[0] + " 수익률");
			$(".orderby_rateOfReturn_3").val("");
			
			var str = "";
			str += "orderby_rateOfReturn_2=" + $(".orderby_rateOfReturn_2").val();

			var keyword = $("[name=keyword]").val();
			keyword = $.trim(keyword);
			$("[name=keyword]").val(keyword);
			str += "&keyword=" + keyword;

			printStockList2(str);
		});
		$(".rateOfReturn_3").click(function(){
			var txt = $(this).text();
			var arr = txt.split(" ");

			if(arr[0] == "6개월"){
				if(arr[1]=="수익률"){
					$(".rateOfReturn_3").text("6개월 수익률▲");
					$(".orderby_rateOfReturn_3").val("month6 asc");			
				}
				else if(arr[1]=="수익률▲"){
					$(".rateOfReturn_3").text("6개월 수익률▼");
					$(".orderby_rateOfReturn_3").val("month6 desc");		
				}
				else if(arr[1]=="수익률▼"){
					$(".rateOfReturn_3").text("6개월 수익률");
					$(".orderby_rateOfReturn_3").val("");
				}
			}
			else if(arr[0] == "1년"){
				if(arr[1]=="수익률"){
					$(".rateOfReturn_3").text("1년 수익률▲");
					$(".orderby_rateOfReturn_3").val("month12 asc");			
				}
				else if(arr[1]=="수익률▲"){
					$(".rateOfReturn_3").text("1년 수익률▼");
					$(".orderby_rateOfReturn_3").val("month12 desc");		
				}
				else if(arr[1]=="수익률▼"){
					$(".rateOfReturn_3").text("1년 수익률");
					$(".orderby_rateOfReturn_3").val("");
				}
			}
			else if(arr[0] == "3년"){
				if(arr[1]=="수익률"){
					$(".rateOfReturn_3").text("3년 수익률▲");
					$(".orderby_rateOfReturn_3").val("month36 asc");			
				}
				else if(arr[1]=="수익률▲"){
					$(".rateOfReturn_3").text("3년 수익률▼");
					$(".orderby_rateOfReturn_3").val("month36 desc");		
				}
				else if(arr[1]=="수익률▼"){
					$(".rateOfReturn_3").text("3년 수익률");
					$(".orderby_rateOfReturn_3").val("");
				}
			}
			else 
			$(".stock_code").text("코드번호");
			$(".orderby_stock_code").val("");
			$(".stock_name").text("종목명");
			$(".orderby_stock_name").val("");
			$(".industrial_name").text("업종분류");
			$(".orderby_industrial_name").val("");

			var txt1 = $(".rateOfReturn_1").text();
			var arr1 = txt1.split(" "); 
			$(".rateOfReturn_1").text(arr1[0] + " 수익률");
			$(".orderby_rateOfReturn_1").val("");
			var txt2 = $(".rateOfReturn_2").text();
			var arr2 = txt2.split(" "); 
			$(".rateOfReturn_2").text(arr2[0] + " 수익률");
			$(".orderby_rateOfReturn_2").val("");
			
			var str = "";
			str += "orderby_rateOfReturn_3=" + $(".orderby_rateOfReturn_3").val();

			var keyword = $("[name=keyword]").val();
			keyword = $.trim(keyword);
			$("[name=keyword]").val(keyword);
			str += "&keyword=" + keyword;

			printStockList2(str);
		});



		
		if($("#is_clicked1").val() == "no"){
			$("[name=chooseItem1]").hover(
				function(){
					$(this).find("svg").remove();
					$(this).find("div.imf_icon").html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"80\" height=\"80\" fill=\"#00D8FF\" class=\"bi bi-pin\" viewBox=\"0 0 16 16\"><path d=\"M4.146.146A.5.5 0 0 1 4.5 0h7a.5.5 0 0 1 .5.5c0 .68-.342 1.174-.646 1.479-.126.125-.25.224-.354.298v4.431l.078.048c.203.127.476.314.751.555C12.36 7.775 13 8.527 13 9.5a.5.5 0 0 1-.5.5h-4v4.5c0 .276-.224 1.5-.5 1.5s-.5-1.224-.5-1.5V10h-4a.5.5 0 0 1-.5-.5c0-.973.64-1.725 1.17-2.189A5.921 5.921 0 0 1 5 6.708V2.277a2.77 2.77 0 0 1-.354-.298C4.342 1.674 4 1.179 4 .5a.5.5 0 0 1 .146-.354zm1.58 1.408l-.002-.001zm-.002-.001l.002.001A.5.5 0 0 1 6 2v5a.5.5 0 0 1-.276.447h-.002l-.012.007-.054.03a4.922 4.922 0 0 0-.827.58c-.318.278-.585.596-.725.936h7.792c-.14-.34-.407-.658-.725-.936a4.915 4.915 0 0 0-.881-.61l-.012-.006h-.002A.5.5 0 0 1 10 7V2a.5.5 0 0 1 .295-.458 1.775 1.775 0 0 0 .351-.271c.08-.08.155-.17.214-.271H5.14c.06.1.133.191.214.271a1.78 1.78 0 0 0 .37.282z\"/></svg>");
					$(this).find("div.imf_head").html("<u><h3>종목 추가하기</h3></u>");
				}
				,function(){
					$(this).find("svg").remove();
					$(this).find("div.imf_icon").html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"80\" height=\"80\" fill=\"#00D8FF\" class=\"bi bi-pin-angle\" viewBox=\"0 0 16 16\"><path d=\"M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.92 5.92 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146zm.122 2.112v-.002zm0-.002v.002a.5.5 0 0 1-.122.51L6.293 6.878a.5.5 0 0 1-.511.12H5.78l-.014-.004a4.507 4.507 0 0 0-.288-.076 4.922 4.922 0 0 0-.765-.116c-.422-.028-.836.008-1.175.15l5.51 5.509c.141-.34.177-.753.149-1.175a4.924 4.924 0 0 0-.192-1.054l-.004-.013v-.001a.5.5 0 0 1 .12-.512l3.536-3.535a.5.5 0 0 1 .532-.115l.096.022c.087.017.208.034.344.034.114 0 .23-.011.343-.04L9.927 2.028c-.029.113-.04.23-.04.343a1.779 1.779 0 0 0 .062.46z\"/></svg>");
					$(this).find("div.imf_head").html("<h3>종목 추가하기</h3>");
				}
			);
		}
		else{
			$("[name=chooseItem1]").find("div.imf_icon").html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"80\" height=\"80\" fill=\"#00D8FF\" class=\"bi bi-pin\" viewBox=\"0 0 16 16\"><path d=\"M4.146.146A.5.5 0 0 1 4.5 0h7a.5.5 0 0 1 .5.5c0 .68-.342 1.174-.646 1.479-.126.125-.25.224-.354.298v4.431l.078.048c.203.127.476.314.751.555C12.36 7.775 13 8.527 13 9.5a.5.5 0 0 1-.5.5h-4v4.5c0 .276-.224 1.5-.5 1.5s-.5-1.224-.5-1.5V10h-4a.5.5 0 0 1-.5-.5c0-.973.64-1.725 1.17-2.189A5.921 5.921 0 0 1 5 6.708V2.277a2.77 2.77 0 0 1-.354-.298C4.342 1.674 4 1.179 4 .5a.5.5 0 0 1 .146-.354zm1.58 1.408l-.002-.001zm-.002-.001l.002.001A.5.5 0 0 1 6 2v5a.5.5 0 0 1-.276.447h-.002l-.012.007-.054.03a4.922 4.922 0 0 0-.827.58c-.318.278-.585.596-.725.936h7.792c-.14-.34-.407-.658-.725-.936a4.915 4.915 0 0 0-.881-.61l-.012-.006h-.002A.5.5 0 0 1 10 7V2a.5.5 0 0 1 .295-.458 1.775 1.775 0 0 0 .351-.271c.08-.08.155-.17.214-.271H5.14c.06.1.133.191.214.271a1.78 1.78 0 0 0 .37.282z\"/></svg>");
		}

		inputData("[name=is_clicked2]","${crawlingDTO.is_clicked2}");
		inputData("[name=selectedStockCode2]","${crawlingDTO.selectedStockCode2}");

		if($("#is_clicked2").val() == "no"){
			$("[name=chooseItem2]").hover(
				function(){
					$(this).find("svg").remove();
					$(this).find("div.imf_icon").html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"80\" height=\"80\" fill=\"#00D8FF\" class=\"bi bi-pin\" viewBox=\"0 0 16 16\"><path d=\"M4.146.146A.5.5 0 0 1 4.5 0h7a.5.5 0 0 1 .5.5c0 .68-.342 1.174-.646 1.479-.126.125-.25.224-.354.298v4.431l.078.048c.203.127.476.314.751.555C12.36 7.775 13 8.527 13 9.5a.5.5 0 0 1-.5.5h-4v4.5c0 .276-.224 1.5-.5 1.5s-.5-1.224-.5-1.5V10h-4a.5.5 0 0 1-.5-.5c0-.973.64-1.725 1.17-2.189A5.921 5.921 0 0 1 5 6.708V2.277a2.77 2.77 0 0 1-.354-.298C4.342 1.674 4 1.179 4 .5a.5.5 0 0 1 .146-.354zm1.58 1.408l-.002-.001zm-.002-.001l.002.001A.5.5 0 0 1 6 2v5a.5.5 0 0 1-.276.447h-.002l-.012.007-.054.03a4.922 4.922 0 0 0-.827.58c-.318.278-.585.596-.725.936h7.792c-.14-.34-.407-.658-.725-.936a4.915 4.915 0 0 0-.881-.61l-.012-.006h-.002A.5.5 0 0 1 10 7V2a.5.5 0 0 1 .295-.458 1.775 1.775 0 0 0 .351-.271c.08-.08.155-.17.214-.271H5.14c.06.1.133.191.214.271a1.78 1.78 0 0 0 .37.282z\"/></svg>");
					$(this).find("div.imf_head").html("<u><h3>종목 추가하기</h3></u>");
				}
				,function(){
					$(this).find("svg").remove();
					$(this).find("div.imf_icon").html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"80\" height=\"80\" fill=\"#00D8FF\" class=\"bi bi-pin-angle\" viewBox=\"0 0 16 16\"><path d=\"M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.92 5.92 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146zm.122 2.112v-.002zm0-.002v.002a.5.5 0 0 1-.122.51L6.293 6.878a.5.5 0 0 1-.511.12H5.78l-.014-.004a4.507 4.507 0 0 0-.288-.076 4.922 4.922 0 0 0-.765-.116c-.422-.028-.836.008-1.175.15l5.51 5.509c.141-.34.177-.753.149-1.175a4.924 4.924 0 0 0-.192-1.054l-.004-.013v-.001a.5.5 0 0 1 .12-.512l3.536-3.535a.5.5 0 0 1 .532-.115l.096.022c.087.017.208.034.344.034.114 0 .23-.011.343-.04L9.927 2.028c-.029.113-.04.23-.04.343a1.779 1.779 0 0 0 .062.46z\"/></svg>");
					$(this).find("div.imf_head").html("<h3>종목 추가하기</h3>");
				}
			);
		}
		else{
			$("[name=chooseItem2]").find("div.imf_icon").html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"80\" height=\"80\" fill=\"#00D8FF\" class=\"bi bi-pin\" viewBox=\"0 0 16 16\"><path d=\"M4.146.146A.5.5 0 0 1 4.5 0h7a.5.5 0 0 1 .5.5c0 .68-.342 1.174-.646 1.479-.126.125-.25.224-.354.298v4.431l.078.048c.203.127.476.314.751.555C12.36 7.775 13 8.527 13 9.5a.5.5 0 0 1-.5.5h-4v4.5c0 .276-.224 1.5-.5 1.5s-.5-1.224-.5-1.5V10h-4a.5.5 0 0 1-.5-.5c0-.973.64-1.725 1.17-2.189A5.921 5.921 0 0 1 5 6.708V2.277a2.77 2.77 0 0 1-.354-.298C4.342 1.674 4 1.179 4 .5a.5.5 0 0 1 .146-.354zm1.58 1.408l-.002-.001zm-.002-.001l.002.001A.5.5 0 0 1 6 2v5a.5.5 0 0 1-.276.447h-.002l-.012.007-.054.03a4.922 4.922 0 0 0-.827.58c-.318.278-.585.596-.725.936h7.792c-.14-.34-.407-.658-.725-.936a4.915 4.915 0 0 0-.881-.61l-.012-.006h-.002A.5.5 0 0 1 10 7V2a.5.5 0 0 1 .295-.458 1.775 1.775 0 0 0 .351-.271c.08-.08.155-.17.214-.271H5.14c.06.1.133.191.214.271a1.78 1.78 0 0 0 .37.282z\"/></svg>");
		}
		
		inputData("[name=is_clicked3]","${crawlingDTO.is_clicked3}");
		inputData("[name=selectedStockCode3]","${crawlingDTO.selectedStockCode3}");

		if($("#is_clicked3").val() == "no"){
			$("[name=chooseItem3]").hover(
				function(){
					$(this).find("svg").remove();
					$(this).find("div.imf_icon").html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"80\" height=\"80\" fill=\"#00D8FF\" class=\"bi bi-pin\" viewBox=\"0 0 16 16\"><path d=\"M4.146.146A.5.5 0 0 1 4.5 0h7a.5.5 0 0 1 .5.5c0 .68-.342 1.174-.646 1.479-.126.125-.25.224-.354.298v4.431l.078.048c.203.127.476.314.751.555C12.36 7.775 13 8.527 13 9.5a.5.5 0 0 1-.5.5h-4v4.5c0 .276-.224 1.5-.5 1.5s-.5-1.224-.5-1.5V10h-4a.5.5 0 0 1-.5-.5c0-.973.64-1.725 1.17-2.189A5.921 5.921 0 0 1 5 6.708V2.277a2.77 2.77 0 0 1-.354-.298C4.342 1.674 4 1.179 4 .5a.5.5 0 0 1 .146-.354zm1.58 1.408l-.002-.001zm-.002-.001l.002.001A.5.5 0 0 1 6 2v5a.5.5 0 0 1-.276.447h-.002l-.012.007-.054.03a4.922 4.922 0 0 0-.827.58c-.318.278-.585.596-.725.936h7.792c-.14-.34-.407-.658-.725-.936a4.915 4.915 0 0 0-.881-.61l-.012-.006h-.002A.5.5 0 0 1 10 7V2a.5.5 0 0 1 .295-.458 1.775 1.775 0 0 0 .351-.271c.08-.08.155-.17.214-.271H5.14c.06.1.133.191.214.271a1.78 1.78 0 0 0 .37.282z\"/></svg>");
					$(this).find("div.imf_head").html("<u><h3>종목 추가하기</h3></u>");
				}
				,function(){
					$(this).find("svg").remove();
					$(this).find("div.imf_icon").html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"80\" height=\"80\" fill=\"#00D8FF\" class=\"bi bi-pin-angle\" viewBox=\"0 0 16 16\"><path d=\"M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.92 5.92 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146zm.122 2.112v-.002zm0-.002v.002a.5.5 0 0 1-.122.51L6.293 6.878a.5.5 0 0 1-.511.12H5.78l-.014-.004a4.507 4.507 0 0 0-.288-.076 4.922 4.922 0 0 0-.765-.116c-.422-.028-.836.008-1.175.15l5.51 5.509c.141-.34.177-.753.149-1.175a4.924 4.924 0 0 0-.192-1.054l-.004-.013v-.001a.5.5 0 0 1 .12-.512l3.536-3.535a.5.5 0 0 1 .532-.115l.096.022c.087.017.208.034.344.034.114 0 .23-.011.343-.04L9.927 2.028c-.029.113-.04.23-.04.343a1.779 1.779 0 0 0 .062.46z\"/></svg>");
					$(this).find("div.imf_head").html("<h3>종목 추가하기</h3>");
				}
			);
		}
		else{
			$("[name=chooseItem3]").find("div.imf_icon").html("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"80\" height=\"80\" fill=\"#00D8FF\" class=\"bi bi-pin\" viewBox=\"0 0 16 16\"><path d=\"M4.146.146A.5.5 0 0 1 4.5 0h7a.5.5 0 0 1 .5.5c0 .68-.342 1.174-.646 1.479-.126.125-.25.224-.354.298v4.431l.078.048c.203.127.476.314.751.555C12.36 7.775 13 8.527 13 9.5a.5.5 0 0 1-.5.5h-4v4.5c0 .276-.224 1.5-.5 1.5s-.5-1.224-.5-1.5V10h-4a.5.5 0 0 1-.5-.5c0-.973.64-1.725 1.17-2.189A5.921 5.921 0 0 1 5 6.708V2.277a2.77 2.77 0 0 1-.354-.298C4.342 1.674 4 1.179 4 .5a.5.5 0 0 1 .146-.354zm1.58 1.408l-.002-.001zm-.002-.001l.002.001A.5.5 0 0 1 6 2v5a.5.5 0 0 1-.276.447h-.002l-.012.007-.054.03a4.922 4.922 0 0 0-.827.58c-.318.278-.585.596-.725.936h7.792c-.14-.34-.407-.658-.725-.936a4.915 4.915 0 0 0-.881-.61l-.012-.006h-.002A.5.5 0 0 1 10 7V2a.5.5 0 0 1 .295-.458 1.775 1.775 0 0 0 .351-.271c.08-.08.155-.17.214-.271H5.14c.06.1.133.191.214.271a1.78 1.78 0 0 0 .37.282z\"/></svg>");
		}
		
		$("[name=chooseItem1],[name=chooseItem2],[name=chooseItem3]").click(function(){
			$("[name=selectedStock]").val( $(this).attr("id") );
			if( 
				$(this).attr("id") == 2 
				&& $("#is_clicked1").val() == "no" 
			){
				alert("차례대로 종목을 선택해주세요.");
				$("[name=selectedStock]").val("");
				return;
			}
			else if(
				$(this).attr("id") == 3 
				&& ($("#is_clicked1").val() == "no" || $("#is_clicked2").val() == "no")
			){
				alert("차례대로 종목을 선택해주세요.");
				$("[name=selectedStock]").val("");
				return;
			}
            $('body').css("overflow-y","hidden");

    	    $('.modal').modal({backdrop: 'static'});
		});

		$("[name=modal_close]").click(function(){
            $('body').css("overflow-y","auto");

			$("[name=keyword]").val("");
			$(".stock_code").text("코드번호");
			$(".orderby_stock_code").val("");
			$(".stock_name").text("종목명");
			$(".orderby_stock_name").val("");
			$(".industrial_name").text("업종분류");
			$(".orderby_industrial_name").val("");
    		printStockList( "" );
    		
    		btn = document.getElementById('modal-select');
    		btn.disabled = "disalbed";
	    });

		$(".modal-footer [name=select]").click(function(){	
            $('body').css("overflow-y","auto");

            goCrawlingForm();
    		
    		btn = document.getElementById('modal-select');
    		btn.disabled = "disalbed";
        });

		$("[name=reset]").click(function(){
			$("[name=crawlingForm] [name=selectedStockCode1]").val("");
			$("[name=crawlingForm] #is_clicked1").val("no");		
			$("[name=crawlingForm] [name=selectedStockCode2]").val("");
			$("[name=crawlingForm] #is_clicked2").val("no");		
			$("[name=crawlingForm] [name=selectedStockCode3]").val("");
			$("[name=crawlingForm] #is_clicked3").val("no");	

			document.crawlingForm.action="/crawlingForm.do";
			document.crawlingForm.submit();		
		});

	    
		$("[name=compare_btn]").click(function(){
			var clicked_cnt = 0;
			if($("[name=crawlingForm] #is_clicked1").val() == "yes"){clicked_cnt++;}
			if($("[name=crawlingForm] #is_clicked2").val() == "yes"){clicked_cnt++;}
			if($("[name=crawlingForm] #is_clicked3").val() == "yes"){clicked_cnt++;}

			if(clicked_cnt < 2){
				alert("종목을 2개 이상 선택해주세요.");
				return;
			}

			document.crawlingForm.action="/crawlingInfoForm.do";
			document.crawlingForm.submit();					
	    });

	});

	function goCrawlingForm(){
		var num = $("[name=selectedStock]").val();
		var stock_code = $("[name=selectedStockCode]").val();
		
		$("[name=crawlingForm] [name=selectedStockCode" + num + "]").val(stock_code);
		$("[name=crawlingForm] #is_clicked" + num).val("yes");
		printStockList( "" );		
		
		document.crawlingForm.action="/crawlingForm.do";
		document.crawlingForm.submit();
	}


	function changeBorderColor(str){
		$("#tbody tr").removeClass('borderColor');
				
		str = fillzero(str, 6);

		var num = $("[name=selectedStock]").val();
		$("[name=crawlingForm] [name=selectedStockCode]").val(str);
		
		$("[name=stock_code]").each(function(){
			if( $(this).text() == str ){
				$(this).parent().addClass('borderColor');
			}
		});

		btn = document.getElementById('modal-select');
		btn.disabled = false;
	};
	
	function search(){
		if($("[name=rateOfReturn]").filter(":checked").length != 3){
			alert("수익률은 3개만 검색할 수 있습니다.");			
			return;
		}

		var keyword = $("[name=keyword]").val();
		keyword = $.trim(keyword);
		$("[name=keyword]").val(keyword);

		printStockList( "keyword=" + keyword );
	    $('.modal').modal({backdrop: 'static'});
	    
	};

	function searchAll(){
		
		$("[name=keyword]").val("");	

		printStockList( "" );

	    $('.modal').modal({backdrop: 'static'});

	}

	function get_checked_rateOfReturn(){
		var checked_rateOfReturn = "";
		
		$("[name=rateOfReturn]").filter(":checked").each(function (index){
			if(index != 0){
				checked_rateOfReturn += "&";
			}
			checked_rateOfReturn += "rateOfReturn=" + $(this).val();
		});
		
		return checked_rateOfReturn;
	}
	
	function printStockList(data){
	    
	    var checked_rateOfReturn = get_checked_rateOfReturn();

	    var arr = checked_rateOfReturn.split("&");
		
		for(var i=0 ; i<arr.length ; i++){
			if(arr[i].charAt(13) == 1){
				$(".rateOfReturn_" + (i+1)).text("1개월 수익률");
				$(".orderby_rateOfReturn_" + (i+1)).val("");
			}
			else if(arr[i].charAt(13) == 2){
				$(".rateOfReturn_" + (i+1)).text("3개월 수익률");
				$(".orderby_rateOfReturn_" + (i+1)).val("");
			}
			else if(arr[i].charAt(13) == 3){
				$(".rateOfReturn_" + (i+1)).text("6개월 수익률");
				$(".orderby_rateOfReturn_" + (i+1)).val("");
			}
			else if(arr[i].charAt(13) == 4){
				$(".rateOfReturn_" + (i+1)).text("1년 수익률");
				$(".orderby_rateOfReturn_" + (i+1)).val("");
			}
			else if(arr[i].charAt(13) == 5){
				$(".rateOfReturn_" + (i+1)).text("3년 수익률");
				$(".orderby_rateOfReturn_" + (i+1)).val("");
			}
		}
		
		$.ajax({
			url : "/crawlingProc.do"
			, type : "post"
			, data: data + "&" + checked_rateOfReturn
			, success : function(stockList){
				$("#tbody").empty(); 
				
				var str = "";

				if(stockList.length == 0){
					$("#stockListAllCnt").text(0);
					
					str += "<center><h3>검색 조건에 맞는 종목이 없습니다.</h3></center>";
				}
				else{
					$("#stockListAllCnt").text(stockList[0].stockListAllCnt);
					
					for(var i=0 ; i<stockList.length ; i++){
						var stock_code = parseInt(stockList[i].stock_code, 10);
						str += "<tr name='stockList' style='cursor:pointer' onClick='changeBorderColor(" + stock_code + ");'>";
						str += "<td align='center' name='stock_code'><span style='font-size:15px;'>" + stockList[i].stock_code + "</span></td>";
						str += "<td align='center'><span style='font-size:15px;'>" + stockList[i].stock_name + "</span></td>";
						str += "<td align='center'><span style='font-size:15px;'>" + stockList[i].industrial_name + "</span></td>";
						
						if(stockList[i].rateOfReturn_1 != ""){
							if(stockList[i].rateOfReturn_1.charAt(0) == "+"){
								str += "<td align='center'><span style='font-size:15px; color:red;'>" + stockList[i].rateOfReturn_1 + "</span></td>";
							}
							else if(stockList[i].rateOfReturn_1.charAt(0) == "-"){
								str += "<td align='center'><span style='font-size:15px; color:blue;'>" + stockList[i].rateOfReturn_1 + "</span></td>";
							}
							else if(stockList[i].rateOfReturn_1.charAt(0) == "0"){
								str += "<td align='center'><span style='font-size:15px;'>" + stockList[i].rateOfReturn_1 + "</span></td>";
							}
						}
						else {
							str += "<td align='center'><span style='font-size:15px;'></span></td>";
						}
						
						if(stockList[i].rateOfReturn_2 != ""){
							if(stockList[i].rateOfReturn_2.charAt(0) == "+"){
								str += "<td align='center'><span style='font-size:15px; color:red;'>" + stockList[i].rateOfReturn_2 + "</span></td>";
							}
							else if(stockList[i].rateOfReturn_2.charAt(0) == "-"){
								str += "<td align='center'><span style='font-size:15px; color:blue;'>" + stockList[i].rateOfReturn_2 + "</span></td>";
							}
							else if(stockList[i].rateOfReturn_2.charAt(0) == "0"){
								str += "<td align='center'><span style='font-size:15px;'>" + stockList[i].rateOfReturn_2 + "</span></td>";
							}
						}
						else {
							str += "<td align='center'><span style='font-size:15px;'></span></td>";
						}
						
						if(stockList[i].rateOfReturn_3 != ""){
							if(stockList[i].rateOfReturn_3.charAt(0) == "+"){
								str += "<td align='center'><span style='font-size:15px; color:red;'>" + stockList[i].rateOfReturn_3 + "</span></td>";
							}
							else if(stockList[i].rateOfReturn_3.charAt(0) == "-"){
								str += "<td align='center'><span style='font-size:15px; color:blue;'>" + stockList[i].rateOfReturn_3 + "</span></td>";
							}
							else if(stockList[i].rateOfReturn_3.charAt(0) == "0"){
								str += "<td align='center'><span style='font-size:15px;'>" + stockList[i].rateOfReturn_3 + "</span></td>";
							}
						}
						else {
							str += "<td align='center'><span style='font-size:15px;'></span></td>";
						}
					}
				}
				
				$("#tbody").html(str);
			}
			, error : function(){
				alert("서버 접속 실패!");
			}
		});

	}

	function printStockList2(data){
	    var checked_rateOfReturn = get_checked_rateOfReturn();
		
		$.ajax({
			url : "/crawlingProc.do"
			, type : "post"
			, data: data + "&" + checked_rateOfReturn
			, success : function(stockList){
				$("#tbody").empty(); 
				
				var str = "";

				if(stockList.length == 0){
					$("#stockListAllCnt").text(0);
					
					str += "<center><h3>검색 조건에 맞는 종목이 없습니다.</h3></center>";
				}
				else{
					$("#stockListAllCnt").text(stockList[0].stockListAllCnt);
					
					for(var i=0 ; i<stockList.length ; i++){
						var stock_code = parseInt(stockList[i].stock_code, 10);
						str += "<tr name='stockList' style='cursor:pointer' onClick='changeBorderColor(" + stock_code + ");'>";
						str += "<td align='center' name='stock_code'><span style='font-size:15px;'>" + stockList[i].stock_code + "</span></td>";
						str += "<td align='center'><span style='font-size:15px;'>" + stockList[i].stock_name + "</span></td>";
						str += "<td align='center'><span style='font-size:15px;'>" + stockList[i].industrial_name + "</span></td>";
						
						if(stockList[i].rateOfReturn_1 != ""){
							if(stockList[i].rateOfReturn_1.charAt(0) == "+"){
								str += "<td align='center'><span style='font-size:15px; color:red;'>" + stockList[i].rateOfReturn_1 + "</span></td>";
							}
							else if(stockList[i].rateOfReturn_1.charAt(0) == "-"){
								str += "<td align='center'><span style='font-size:15px; color:blue;'>" + stockList[i].rateOfReturn_1 + "</span></td>";
							}
							else if(stockList[i].rateOfReturn_1.charAt(0) == "0"){
								str += "<td align='center'><span style='font-size:15px;'>" + stockList[i].rateOfReturn_1 + "</span></td>";
							}
						}
						else {
							str += "<td align='center'><span style='font-size:15px;'></span></td>";
						}
						
						if(stockList[i].rateOfReturn_2 != ""){
							if(stockList[i].rateOfReturn_2.charAt(0) == "+"){
								str += "<td align='center'><span style='font-size:15px; color:red;'>" + stockList[i].rateOfReturn_2 + "</span></td>";
							}
							else if(stockList[i].rateOfReturn_2.charAt(0) == "-"){
								str += "<td align='center'><span style='font-size:15px; color:blue;'>" + stockList[i].rateOfReturn_2 + "</span></td>";
							}
							else if(stockList[i].rateOfReturn_2.charAt(0) == "0"){
								str += "<td align='center'><span style='font-size:15px;'>" + stockList[i].rateOfReturn_2 + "</span></td>";
							}
						}
						else {
							str += "<td align='center'><span style='font-size:15px;'></span></td>";
						}
						
						if(stockList[i].rateOfReturn_3 != ""){
							if(stockList[i].rateOfReturn_3.charAt(0) == "+"){
								str += "<td align='center'><span style='font-size:15px; color:red;'>" + stockList[i].rateOfReturn_3 + "</span></td>";
							}
							else if(stockList[i].rateOfReturn_3.charAt(0) == "-"){
								str += "<td align='center'><span style='font-size:15px; color:blue;'>" + stockList[i].rateOfReturn_3 + "</span></td>";
							}
							else if(stockList[i].rateOfReturn_3.charAt(0) == "0"){
								str += "<td align='center'><span style='font-size:15px;'>" + stockList[i].rateOfReturn_3 + "</span></td>";
							}
						}
						else {
							str += "<td align='center'><span style='font-size:15px;'></span></td>";
						}
					}
				}
				
				$("#tbody").html(str);
			}
			, error : function(){
				alert("서버 접속 실패!");
			}
		});

	}
	function fillzero(obj, len) {
		obj = '000000000000000'+obj;
		return obj.substring(obj.length-len);
	}
	
	function tableAutoResize(){
		var $table = $('#table_modal'),
			$bodyCells = $table.find('tbody tr:first').children(),
			colWidth; 

		$table.addClass('scroll');		 

		$(window).resize(function () {
			colWidth = $bodyCells.map(function () {
				return $(this).width();
			}).get();	 
			
			$table.find('thead tr').children().each(function (i, v) {
				$(v).width(colWidth[i]);
			});
		}).resize(); 
	}
   </script>
   </head>
   
   
   <body id="default_theme" class="home_page1">
   
   <!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title" id="staticBackdropLabel">종목검색</h3>
	        <button type="button" name="modal_close" class="close" data-dismiss="modal" aria-label="Close">
	          <span style="font-size:40" aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
	      
	      
	      
			  <div class="container-fluid"> 
			  
			  
			    <div class="row">
				  <label class="col-md-3 control-label" style="text-align: right; font-size:20px;"></label>
		          <label class="col-md-9 control-label" style="text-align: right; font-size:20px;">
		              <div class="input-group mb-3">
		                <input type="text" name="keyword" class="form-control" placeholder="코드번호 또는 종목명 또는 업종분류를 검색하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
		                <div class="input-group-append">
		                  <span class="input-group-text" id="basic-addon2" onClick="search();">검색</span>
		                  <span class="input-group-text" id="basic-addon2" onClick="searchAll();">모두 검색
		                  </span>
		                </div>
	                  </div>
		          </label>
			    </div>
			    <div class="row">
			      <label class="col-md-6 control-label" style="text-align: left;">
			      	<span style="font-size:15px;">검색결과 </span><span style="font-size:12px;">전체 : <strong id="stockListAllCnt">${stockListAllCnt}</strong>건</span><span style="font-size:10px;">(기준일:${standardStockDate})</span>
			      </label>
			      <div class="col-md-6 ml-auto" style="text-align: right;">
			      		수익률:&nbsp;
			      		<input type="checkbox" name="rateOfReturn" value="1" checked> 1개월
			      		<input type="checkbox" name="rateOfReturn" value="2" checked> 3개월
			      		<input type="checkbox" name="rateOfReturn" value="3" checked> 6개월
			      		<input type="checkbox" name="rateOfReturn" value="4"> 1년
			      		<input type="checkbox" name="rateOfReturn" value="5"> 3년
			      </div>
			    </div>
			    <div class="row">
			      <table class="table table-striped table-hover" id="table_modal">
				  <thead>
				    <tr>
				      <td scope="col" align="center"><span style="font-size:14px; cursor:pointer;" class="stock_code"><strong>코드번호</strong></span></td>
				      <td scope="col" align="center"><span style="font-size:14px; cursor:pointer;" class="stock_name"><strong>종목명</strong></span></td>
				      <td scope="col" align="center"><span style="font-size:14px; cursor:pointer;" class="industrial_name"><strong>업종분류</strong></span></td>
				      <td scope="col" align="center"><span style="font-size:14px; cursor:pointer;" class="rateOfReturn_1" id="1"><strong>1개월 수익률</strong></span></td>
				      <td scope="col" align="center"><span style="font-size:14px; cursor:pointer;" class="rateOfReturn_2" id="2"><strong>3개월 수익률</strong></span></td>
				      <td scope="col" align="center"><span style="font-size:14px; cursor:pointer;" class="rateOfReturn_3" id="3"><strong>6개월 수익률</strong></span></td>
				      
					  <input type="hidden" name="orderby_stock_code" class="orderby_stock_code">
					  <input type="hidden" name="orderby_stock_name" class="orderby_stock_name">
					  <input type="hidden" name="orderby_industrial_name" class="orderby_industrial_name">
					  <input type="hidden" name="orderby_rateOfReturn_1" class="orderby_rateOfReturn_1">
					  <input type="hidden" name="orderby_rateOfReturn_2" class="orderby_rateOfReturn_2">
					  <input type="hidden" name="orderby_rateOfReturn_3" class="orderby_rateOfReturn_3">
				    </tr>
				  </thead>
				  <tbody id="tbody">

				  </tbody>
				</table>
			  </div>
			    
				    
			 </div>  		
			 
			 
			 
		  </div>
		     
		     
		     
		      <div class="modal-footer">
			  <div class="container-fluid"> 
			    <div class="row">
			      <button type="button" name="select" id="modal-select" class="close" data-dismiss="modal" style="margin:auto; width=50%" disabled>선택완료</button>
		        </div>
		      </div>
		      </div>
		    </div>
		  </div>
		</div>
		
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
                           <li><a href="${croot}/tipBoardForm.do" style="font-size: 17px;"><strong>꿀팁게시판</strong></a></li>
                           <li><a href="${croot}/freeBoardForm.do" style="font-size: 17px;"><strong>자유게시판</strong></a></li>
                           <li><a href="${croot}/analysisForm.do" style="font-size: 17px;"><strong>성향 분석</strong></a></li>
                           <li class="active"><a href="${croot}/stockForm2.do" style="font-size: 17px;"><strong>KOSPI200 주가현황</strong></a></li>
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
                           <li><a href="${croot}/tipBoardForm.do" style="font-size: 17px;"><strong>꿀팁게시판</strong></a></li>
                           <li><a href="${croot}/freeBoardForm.do" style="font-size: 17px;"><strong>자유게시판</strong></a></li>
                           <li><a href="${croot}/analysisForm.do" style="font-size: 17px;"><strong>성향 분석</strong></a></li>
                           <li class="active"><a href="${croot}/stockForm2.do" style="font-size: 17px;"><strong>KOSPI200 주가현황</strong></a></li>
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
         				<h3><font style="color:white;">&nbsp;&nbsp;코스피 200</font></h3>
                        <h2>종목 비교</h2>
                     </div>
                  </div>
               </div>
                              
            </div>
         </div>
         
   
      </section>
      
      
      <form name="crawlingForm" method="post">
      <section class="layout_padding gradiant_bg cross_layout">
         <div class="container">      
         	<h3><font color="white">종목 조건 선택</font></h3>
         	<h4><span name="reset" style="float:right; cursor:pointer;"><font color="white">처음부터 다시하기</font></span></h4><br><br><br>     
      		<input type="hidden" name="selectedStock"> 
      		<input type="hidden" name="selectedStockCode"> 
            <div class="row">
            	
               <div class="col-md-4" >
                  <span name="chooseItem1" id="1" style="cursor:pointer" data-toggle="modal" data-target="#staticBackdrop" >
                  <input type="hidden" id="is_clicked1" name="is_clicked1" value="no" >
      			  <input type="hidden" name="selectedStockCode1">
                  <div class="information_blogs_crawling">
                     <div class="imf_icon">
	                     <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#00D8FF" class="bi bi-pin-angle" viewBox="0 0 16 16">
	                     	<path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.92 5.92 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146zm.122 2.112v-.002zm0-.002v.002a.5.5 0 0 1-.122.51L6.293 6.878a.5.5 0 0 1-.511.12H5.78l-.014-.004a4.507 4.507 0 0 0-.288-.076 4.922 4.922 0 0 0-.765-.116c-.422-.028-.836.008-1.175.15l5.51 5.509c.141-.34.177-.753.149-1.175a4.924 4.924 0 0 0-.192-1.054l-.004-.013v-.001a.5.5 0 0 1 .12-.512l3.536-3.535a.5.5 0 0 1 .532-.115l.096.022c.087.017.208.034.344.034.114 0 .23-.011.343-.04L9.927 2.028c-.029.113-.04.23-.04.343a1.779 1.779 0 0 0 .062.46z"/>
	                     </svg>
                     </div>
                     <div class="imf_head" style="margin-top: 70px; margin-bottom: 70px;">
                     	<c:if test="${empty selectedStockMap1}">
                     		<h3>종목 추가하기</h3>
                     	</c:if>
                     	<c:if test="${selectedStockMap1 != null}">
                     		<!-- <h4>${selectedStockMap1.stock_code}</h4> -->
                     		<h3>${selectedStockMap1.stock_name}</h3>
                     	</c:if>
                     </div>
                  </div>
                  </span>
               </div>

               <div class="col-md-4">
                  <span name="chooseItem2" id="2" style="cursor:pointer">
                  <input type="hidden" id="is_clicked2" name="is_clicked2" value="no" >
      			  <input type="hidden" name="selectedStockCode2">
                  <div class="information_blogs_crawling">
                     <div class="imf_icon">
	                     <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#00D8FF" class="bi bi-pin-angle" viewBox="0 0 16 16">
	                     	<path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.92 5.92 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146zm.122 2.112v-.002zm0-.002v.002a.5.5 0 0 1-.122.51L6.293 6.878a.5.5 0 0 1-.511.12H5.78l-.014-.004a4.507 4.507 0 0 0-.288-.076 4.922 4.922 0 0 0-.765-.116c-.422-.028-.836.008-1.175.15l5.51 5.509c.141-.34.177-.753.149-1.175a4.924 4.924 0 0 0-.192-1.054l-.004-.013v-.001a.5.5 0 0 1 .12-.512l3.536-3.535a.5.5 0 0 1 .532-.115l.096.022c.087.017.208.034.344.034.114 0 .23-.011.343-.04L9.927 2.028c-.029.113-.04.23-.04.343a1.779 1.779 0 0 0 .062.46z"/>
	                     </svg>
                     </div>
                     <div class="imf_head" style="margin-top: 70px; margin-bottom: 70px;">
                     	<c:if test="${empty selectedStockMap2}">
                     		<h3>종목 추가하기</h3>
                     	</c:if>
                     	<c:if test="${selectedStockMap2 != null}">
                     		<!-- <h4>${selectedStockMap2.stock_code}</h4> -->
                     		<h3>${selectedStockMap2.stock_name}</h3>
                     	</c:if>
                     </div>
                  </div>
                  </span>
               </div>

               <div class="col-md-4">
                  <span name="chooseItem3" id="3" style="cursor:pointer">
                  <input type="hidden" id="is_clicked3" name="is_clicked3" value="no">
      			  <input type="hidden" name="selectedStockCode3">
                  <div class="information_blogs_crawling">
                     <div class="imf_icon">
	                     <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#00D8FF" class="bi bi-pin-angle" viewBox="0 0 16 16">
	                     	<path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.92 5.92 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146zm.122 2.112v-.002zm0-.002v.002a.5.5 0 0 1-.122.51L6.293 6.878a.5.5 0 0 1-.511.12H5.78l-.014-.004a4.507 4.507 0 0 0-.288-.076 4.922 4.922 0 0 0-.765-.116c-.422-.028-.836.008-1.175.15l5.51 5.509c.141-.34.177-.753.149-1.175a4.924 4.924 0 0 0-.192-1.054l-.004-.013v-.001a.5.5 0 0 1 .12-.512l3.536-3.535a.5.5 0 0 1 .532-.115l.096.022c.087.017.208.034.344.034.114 0 .23-.011.343-.04L9.927 2.028c-.029.113-.04.23-.04.343a1.779 1.779 0 0 0 .062.46z"/>
	                     </svg>
                     </div>
                     <div class="imf_head" style="margin-top: 70px; margin-bottom: 70px;">
                     	<c:if test="${empty selectedStockMap3}">
                     		<h3>종목 추가하기</h3>
                     	</c:if>
                     	<c:if test="${selectedStockMap3 != null}">
                     		<!-- <h4>${selectedStockMap3.stock_code}</h4> -->
                     		<h3>${selectedStockMap3.stock_name}</h3>
                     	</c:if>
                     </div>
                  </div>
                  </span>
               </div>           
               
            </div>
         </div>
      </section>    
      </form>
      
      <center>
         <div>
          <button type="button" name="compare_btn" class="btn-4 btn-info" style="min-width:150px; height: 50px; font-size: 18px;">비교하기</button>
         </div>
      </center><br><br>
      
      
      
	<div class="container">    
        <div class="row">
        	<span style="font-size:40px">인기 검색 종목 TOP3</span>
        </div>
        
        <div class="row">
        	<span style="font-size:20px">&nbsp;</span>
        </div>
        
        <div class="row">
        
        <div class="card" style="float: left; width: 30%; height:200px;">
		  <div class="card-body" style="margin-top: 25px;">
		    <p class="card-text" style="font-size:20px; font-weight:bold;" align="center">
		    ${topRankStockMap1.stock_code }<br><br>
		    <span style="font-size:30px; font-weight:bolder;">${topRankStockMap1.stock_name }</span><br><br>
		    ${topRankStockMap1.industrial_name }
		    <!-- ${topRankStockMap1.selected_cnt } -->
		    </p>
		  </div>
		</div>
		
        <div class="card" style="float: left; width: 5%; visibility:hidden;">
		</div>
		
		<div class="card" style="float: left; width: 30%; height:200px;">
		  <div class="card-body" style="margin-top: 25px;">
		    <p class="card-text" style="font-size:20px; font-weight:bold;" align="center">
		    ${topRankStockMap2.stock_code }<br><br>
		    <span style="font-size:30px; font-weight:bolder;">${topRankStockMap2.stock_name }</span><br><br>
		    ${topRankStockMap2.industrial_name }
		    <!-- ${topRankStockMap2.selected_cnt } -->
		    </p>
		  </div>
		</div>
		
        <div class="card" style="float: left; width: 5%; visibility:hidden;">
		</div>
		
		<div class="card" style="float: left; width: 30%; height:200px;">
		  <div class="card-body" style="margin-top: 25px;">
		    <p class="card-text" style="font-size:20px; font-weight:bold;" align="center">
		    ${topRankStockMap3.stock_code }<br><br>
		    <span style="font-size:30px; font-weight:bolder;">${topRankStockMap3.stock_name }</span><br><br>
		    ${topRankStockMap3.industrial_name }
		    <!-- ${topRankStockMap3.selected_cnt } -->
		    </p>
		  </div>
		</div>
		
		
     </div>
      
  </div>
      <br><br>
       
      <!-- footer -->
      <footer class="footer_style_2">
         
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>fCopyright © 2021 from KITE</strong></p>
         </div>
      </footer>
      
   </body>
</html>
