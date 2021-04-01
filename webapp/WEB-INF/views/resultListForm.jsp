<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>

<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      
      <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
      
      <title>Analysis</title>
      
      <script>

      $(document).ready(function(){
    	  inputText();
      });
      
      function inputText(){
			$(".inputResult").text("- ${getResultList.user_name}님은 ${getResultList.age_area}대로  ${getResultList.q4_content} "+numberToKorean( ${getResultList.user_purp})+"원을 목표로 돈을 모으고 있으십니다. ");
			$(".inputResult2").text("- ${getResultList.user_name}님의 목표인 "+numberToKorean( ${getResultList.user_purp})+"원을 달성하기 위해서 최소 월 급여의 60%를 매 월 저축 하시는 것을 추천드립니다. ");
			$(".inputResult3").text("- ${getResultList.user_name}님의 투자 성향은 ${getResultList.char_name}입니다. ");
			$(".inputMyAsset").text(numberToKorean( ${getResultList.user_asset})+"원");
			$(".inputMySalary").text(numberToKorean( ${getResultList.user_salary})+"원");
			$(".inputMyPurp").text(numberToKorean( ${getResultList.user_purp})+"원");
			$(".inputSaveSalary").text(numberToKorean( ${getResultList.save_salary})+"원");

			
		}
     

      </script>
     
      

      
   </head>
   <body id="default_theme" class="services">
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
                           <li class="active"><a href="${croot}/analysisForm.do" style="font-size: 17px;"><strong>성향 분석</strong></a></li>
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
                        <h2>Analysis</h2>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end header -->
      <!-- section -->
  
          <div class="container"><center>

              <div class="row">
              		<div class="col-sm-12"><br>
              			<div class="input-group mb-3">
              				<div class="container" style="background-color: #F6F6F6; text-align: left">
								<c:if test="${getResultList.char_no == 1}">
								<br>
								<h2 style="color: black; text-align: center"><b>${getResultList.user_name}님은 </b></h2><h2 style="color: #4374D9; text-align: center" ><b>안전 추구형</b><h2 style="color: black; text-align: center"><b>투자자입니다.</b></h2>
								<hr>
								<h3 style="color: #8C8C8C">
								안정 추구형 투자자는 높은 수익률보다 원금 손실의 최소화를 더 중시합니다.<br>
								안정성을 위해 낮은 수익률을 수용할 수 있으며, 일반적으로 현재의 생활수준을 방어하기 위한 <br>
								목표를 가지며 예·적금 +α 수준의 수익률을 기대합니다.<br>
								손실위험을 최소화하기 위해 이자소득이나 배당소득 중심의 안정적인 포트폴리오를 구성하며 예·적금보다<br>
								높은 수익을 위해 자산 중 일부를 변동성 높은 상품에 투자할 의향이 있는 투자자입니다.
								</h3><br>
								</c:if>
								
								<c:if test="${getResultList.char_no == 2}">
								<br>
								<h2 style="color: black; text-align: center"><b>${getResultList.user_name}님은 </b></h2><h2 style="color: #1DDB16; text-align: center" ><b>중립형</b><h2 style="color: black; text-align: center"><b>투자자입니다.</b></h2>
								<hr>
								<h3 style="color: #8C8C8C">
								위험중립형 투자자는 리스크(자산 가치의 변동 정도)감소와 수익 추구를 동시에 원하는 투자자입니다.<br>
								장기적인 투자에 있어 중위험 중수익을 감내할 수 있는 투자성향입니다.<br>
								일반적으로 위험중립형 투자자는 단기 하락을 버티면서 장기적인 성장을 원하며 시장 수준의 수익률을 유지하는 것이 목표입니다.<br> 
								채권형 자산과 같은 안전 자산과 더불어 위험자산인 주식형 자산 또한 상당부분 투자할 의향이 있는 투자자입니다.<br>
								</h3><br>
								</c:if>
								
								<c:if test="${getResultList.char_no == 3}">
								<br>
								<h2 style="color: black; text-align: center"><b>${getResultList.user_name}님은 </b></h2><h2 style="color: #FF0000; text-align: center" ><b>공격형</b><h2 style="color: black; text-align: center"><b>투자자입니다.</b></h2>
								<hr>
								<h3 style="color: #8C8C8C">
								공격형 투자자는 시장평균 이상의 고수익을 추구하며 그에 따르는 리스크(자산 가치의 변동 정도)를 감내할 수 있는 투자자입니다.<br>
								일반적으로 공격형 투자자는 장기적인 투자에 있어 원금보존보다 수익률의 극대화를 더 중시하며 고위험이지만 잠재적이고 의미 있는 재산증식을 목표로 합니다. <br>
								투자자금의 대부분을 주식형 자산 등의 위험자산에 투자할 의향이 있는 투자자입니다. <br>
								</h3><br>
								</c:if>
							</div>
							<hr>
							<div class="container" style="background-color: #FAEBFF;">
								<h4 style="color: #003399" class="inputResult" ></h4>
								<h4 style="color: #003399">- ${getResultList.user_name}님은 ${getResultList.q1_content}, 현재 자산의 대부분은 ${getResultList.q2_content} 입니다.</h4>
								<h4 style="color: #003399" class="inputResult2"></h4>
							</div><br><br>
							<h4>● 연령 평균 자산 비교</h4>
              				<table>
              					<tr>
              						<!-- 20대 혹은 이하 일 경우 -->
              						<c:if test="${getResultList.age_area <= 20}">
              						<td>
					     			  <canvas id="myChart1" width="500px" height="500px"></canvas>(단위 : 만원)
										<script>
										var ctx = document.getElementById('myChart1').getContext('2d');
										var myChart1 = new Chart(ctx, {
										    type: 'bar',
										    data: {
										        labels: ['현재 총 자산'],
										        datasets: [{
										            label: '${getResultList.user_name}님의 상태',
										            data: [${getResultList.user_asset_won}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '20대 평균',
										            data: [2034],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true
										                }
										            }]
										        }
										    }
										});
										</script>
										
									</td>
									<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										<canvas id="myChart2" width="500px" height="500px"></canvas>(단위 : 만원)<br><br><br>
										<script>
										var ctx = document.getElementById('myChart2').getContext('2d');
										var myChart2 = new Chart(ctx, {
										    type: 'bar',
										    data: {
										        labels: ['현재 월 급여'],
										        datasets: [{
										            label: '${getResultList.user_name}님의 상태',
										            data: [${getResultList.user_salary_won}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '20대 평균',
										            data: [190],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true
										                }
										            }]
										        }
										    }
										});
										</script>
										</c:if>
										</td>
										
										<!-- 30대 일 경우 -->
										<c:if test="${getResultList.age_area == 30}">
										<td>
					     			 	 <canvas id="myChart1" width="500px" height="500px"></canvas>(단위 : 만원)
										<script>
										var ctx = document.getElementById('myChart1').getContext('2d');
										var myChart1 = new Chart(ctx, {
										    type: 'bar',
										    data: {
										        labels: ['현재 총 자산'],
										        datasets: [{
										            label: '${getResultList.user_name}님의 상태',
										            data: [${getResultList.user_asset_won}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '${getResultList.age_area}대 평균',
										            data: [5264],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true
										                }
										            }]
										        }
										    }
										});
										</script>

									</td>
									<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td>

										<canvas id="myChart2" width="500px" height="500px"></canvas>(단위 : 만원)<br><br><br>
										<script>
										var ctx = document.getElementById('myChart2').getContext('2d');
										var myChart2 = new Chart(ctx, {
										    type: 'bar',
										    data: {
										        labels: ['현재 월 급여'],
										        datasets: [{
										            label: '${getResultList.user_name}님의 상태',
										            data: [${getResultList.user_salary_won}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '${getResultList.age_area}대 평균',
										            data: [276],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true
										                }
										            }]
										        }
										    }
										});
										</script>
										</c:if>
										
										<!-- 40대 일 경우 -->
										<c:if test="${getResultList.age_area == 40}">
										<td>
					     			  <canvas id="myChart1" width="500px" height="500px"></canvas>(단위 : 만원)
										<script>
										var ctx = document.getElementById('myChart1').getContext('2d');
										var myChart1 = new Chart(ctx, {
										    type: 'bar',
										    data: {
										        labels: ['현재 총 자산'],
										        datasets: [{
										            label: '${getResultList.user_name}님의 상태',
										            data: [${getResultList.user_asset_won}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '${getResultList.age_area}대 평균',
										            data: [8661],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true
										                }
										            }]
										        }
										    }
										});
										</script>

									<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td>

										<canvas id="myChart2" width="500px" height="500px"></canvas>(단위 : 만원)<br><br><br>
										<script>
										var ctx = document.getElementById('myChart2').getContext('2d');
										var myChart2 = new Chart(ctx, {
										    type: 'bar',
										    data: {
										        labels: ['현재 월 급여'],
										        datasets: [{
										            label: '${getResultList.user_name}님의 상태',
										            data: [${getResultList.user_salary_won}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '${getResultList.age_area}대 평균',
										            data: [300],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true
										                }
										            }]
										        }
										    }
										});
										</script>
										</c:if>
										
										<!-- 50대 일 경우 -->
										<c:if test="${getResultList.age_area == 50}">
										<td>
					     			  <canvas id="myChart1" width="500px" height="500px"></canvas>(단위 : 만원)
										<script>
										var ctx = document.getElementById('myChart1').getContext('2d');
										var myChart1 = new Chart(ctx, {
										    type: 'bar',
										    data: {
										        labels: ['현재 총 자산'],
										        datasets: [{
										            label: '${getResultList.user_name}님의 상태',
										            data: [${getResultList.user_asset_won}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '${getResultList.age_area}대 평균',
										            data: [10700],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true
										                }
										            }]
										        }
										    }
										});
										</script>

									<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										<canvas id="myChart2" width="500px" height="500px"></canvas>(단위 : 만원)<br><br><br>
										<script>
										var ctx = document.getElementById('myChart2').getContext('2d');
										var myChart2 = new Chart(ctx, {
										    type: 'bar',
										    data: {
										        labels: ['현재 월 급여'],
										        datasets: [{
										            label: '${getResultList.user_name}님의 상태',
										            data: [${getResultList.user_salary_won}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '${getResultList.age_area}대 평균',
										            data: [250],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true
										                }
										            }]
										        }
										    }
										});
										</script>
										</c:if>
										
										<!-- 60대 이상 일 경우 -->
										<c:if test="${getResultList.age_area >= 60}">
										<td>
					     			  <canvas id="myChart1" width="500px" height="500px"></canvas>(단위 : 만원)
										<script>
										var ctx = document.getElementById('myChart1').getContext('2d');
										var myChart1 = new Chart(ctx, {
										    type: 'bar',
										    data: {
										        labels: ['현재 총 자산'],
										        datasets: [{
										            label: '${getResultList.user_name}님의 상태',
										            data: [${getResultList.user_asset_won}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '60대 이상 평균',
										            data: [8744],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true

										                }
										            }]
										        }
										    }
										});
										</script>
									<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										<canvas id="myChart2" width="500px" height="500px"></canvas>(단위 : 만원)<br><br><br>
										<script>
										var ctx = document.getElementById('myChart2').getContext('2d');
										var myChart2 = new Chart(ctx, {
										    type: 'bar',
										    data: {
										        labels: ['현재 월 급여'],
										        datasets: [{
										            label: '${getResultList.user_name}님의 상태',
										            data: [${getResultList.user_salary_won}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '60대 이상 평균',
										            data: [152],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true
										                }
										            }]
										        }
										    }
										});
										</script>
										</c:if>
								</tr>
								</table>
							
							
							<table class="table" border="1" style="text-align: center; border: 1px solid #dee2e6">
							
							<!-- 20대 이하부터 -->
							<c:if test="${getResultList.age_area <= 20}">
								<tr>
									<th style="background-color: #E0FFDB"></th>
									<th style="background-color: #E0FFDB">${getResultList.user_name}님의 상태</th>
									<th style="background-color: #E0FFDB">20대 평균</th>
									<th style="background-color: #E0FFDB">평균대비</th>
								</tr>
								
								<tr>
									<th style="background-color: #E0FFDB">총 자산</th>
									<td class="inputMyAsset"></td>
									<td>2,034만원</td>
									<td>${getResultList.asset_20}</td>
								</tr>
								
								<tr>
									<th style="background-color: #E0FFDB">월 급여</th>
									<td class="inputMySalary"></td>
									<td>190만원</td>
									<td>${getResultList.salary_20}</td>
								</tr>
							</c:if>
							
							<!-- 30대 -->
							<c:if test="${getResultList.age_area == 30}">
								<tr>
									<th style="background-color: #E0FFDB"></th>
									<th style="background-color: #E0FFDB">${getResultList.user_name}님의 상태</th>
									<th style="background-color: #E0FFDB">30대 평균</th>
									<th style="background-color: #E0FFDB">평균대비</th>
								</tr>
								
								<tr>
									<th style="background-color: #E0FFDB">총 자산</th>
									<td class="inputMyAsset"></td>
									<td>5,264만원</td>
									<td>${getResultList.asset_30}</td>
								</tr>
								
								<tr>
									<th style="background-color: #E0FFDB">월 급여</th>
									<td class="inputMySalary"></td>
									<td>276만원</td>
									<td>${getResultList.salary_30}</td>
								</tr>
							</c:if>
							
							<!-- 40대 -->
							<c:if test="${getResultList.age_area == 40}">
								<tr>
									<th style="background-color: #E0FFDB"></th>
									<th style="background-color: #E0FFDB">${getResultList.user_name}님의 상태</th>
									<th style="background-color: #E0FFDB">40대 평균</th>
									<th style="background-color: #E0FFDB">평균대비</th>
								</tr>
								
								<tr>
									<th style="background-color: #E0FFDB">총 자산</th>
									<td class="inputMyAsset"></td>
									<td>8,661만원</td>
									<td>${getResultList.asset_40}</td>
								</tr>
								
								<tr>
									<th style="background-color: #E0FFDB">월 급여</th>
									<td class="inputMySalary"></td>
									<td>300만원</td>
									<td>${getResultList.salary_40}</td>
								</tr>
							</c:if>
							
							<!-- 50대 -->
							<c:if test="${getResultList.age_area == 50}">
								<tr>
									<th style="background-color: #E0FFDB"></th>
									<th style="background-color: #E0FFDB">${getResultList.user_name}님의 상태</th>
									<th style="background-color: #E0FFDB">50대 평균</th>
									<th style="background-color: #E0FFDB">평균대비</th>
								</tr>
								
								<tr>
									<th style="background-color: #E0FFDB">총 자산</th>
									<td class="inputMyAsset"></td>
									<td>1.07억원</td>
									<td>${getResultList.asset_50}</td>
								</tr>
								
								<tr>
									
									<th style="background-color: #E0FFDB">월 급여</th>
									<td class="inputMySalary"></td>
									<td>250만원</td>
									<td>${getResultList.salary_50}</td>
								</tr>
							</c:if>
							
							<!-- 60대 이상 -->
							<c:if test="${getResultList.age_area == 60}">
								<tr>
									<th style="background-color: #E0FFDB"></th>
									<th style="background-color: #E0FFDB">${getResultList.user_name}님의 상태</th>
									<th style="background-color: #E0FFDB">60대 평균</th>
									<th style="background-color: #E0FFDB">평균대비</th>
								</tr>
								
								<tr>
									<th style="background-color: #E0FFDB">총 자산</th>
									<td class="inputMyAsset"></td>
									<td>8,744만원</td>
									<td>${getResultList.asset_60}</td>
								</tr>
								
								<tr>
									<th style="background-color: #E0FFDB">월 급여</th>
									<td class="inputMySalary"></td>
									<td>152만원</td>
									<td>${getResultList.salary_60}</td>
								</tr>
							</c:if>
							</table>
							
							<h4>● 목표달성 기간</h4>
							
							<table class="table" border="1" style="text-align: center; border: 1px solid #dee2e6">
								<tr>
									<th style="background-color: #D4F4FA">목표금액</th>
									<th style="background-color: #D4F4FA">현재자산</th>
									<th style="background-color: #D4F4FA">추천 월 저축금액</th>
									<th style="background-color: #D4F4FA">달성기간</th>
								</tr>
								
								<tr>
									<td class="inputMyPurp"></td>
									<td class="inputMyAsset"></td>
									<td class="inputSaveSalary" style="color: red"></td>
									<td style="color: red"><b>약 ${getResultList.purp_goal} 년</b></td>
								</tr>
							</table>
							
							
						<c:if test="${getResultList.char_no == 1}">
						<div class="container" style="background-color: #FAEBFF;">
								<h4 style="color: #003399">생각보다 목표달성 기간이 길게 느껴지셨나요?</h4>
								<h4 style="color: #003399">그렇다면 <span style="color: red">복리의 마법</span>이 필요할 때 입니다!</h4><br>
								<h3 style="color: #003399">안정 추구형 투자자인 ${getResultList.user_name}님이 매 월 월급의 60%를 </h3><br>
								<h3 style="color: #003399">매년 3% 수익률인 상품에 10년 동안 투자했을 때의 예상결과를 확인해보세요.</h3><br>
							</div><br><br>
						</c:if>
						
						<c:if test="${getResultList.char_no == 2}">
						<div class="container" style="background-color: #FAEBFF;">
								<h4 style="color: #003399">생각보다 목표달성 기간이 길게 느껴지셨나요?</h4>
								<h4 style="color: #003399">그렇다면 <span style="color: red">복리의 마법</span>이 필요할 때 입니다!</h4><br>
								<h3 style="color: #003399">중립형 투자자인 ${getResultList.user_name}님이 매 월 월급의 60%를 </h3><br>
								<h3 style="color: #003399">매년 5% 수익률인 상품에 10년 동안 투자했을 때의 예상결과를 확인해보세요.</h3><br>
							</div><br><br>
						</c:if>
						
						<c:if test="${getResultList.char_no == 3}">
						<div class="container" style="background-color: #FAEBFF;">
								<h4 style="color: #003399">생각보다 목표달성 기간이 길게 느껴지셨나요?</h4>
								<h4 style="color: #003399">그렇다면 <span style="color: red">복리의 마법</span>이 필요할 때 입니다!</h4><br>
								<h3 style="color: #003399">공격형 투자자인 ${getResultList.user_name}님이 매 월 월급의 60%를 </h3><br>
								<h3 style="color: #003399">매년 8% 수익률인 상품에 10년 동안 투자했을 때의 예상결과를 확인해보세요.</h3><br>
							</div><br><br>
						</c:if>
						<h4>● 복리투자</h4>
						<div class="center">
              			<div class="col-sm-8"><br>
              				<div class="input-group mb-3">
              				
              				<c:if test="${getResultList.char_no == 1}">
              					<canvas id="myChart3" width="500px" height="300px"></canvas>(단위 : 만원)
										<script>

										/* 복리 효과는 3, 7, 10 */
										var ctx = document.getElementById('myChart3').getContext('2d');
										var myChart3 = new Chart(ctx, {
										    type: 'line',
										    data: {
										        labels: ['0', '2년', '4년', '6년', '8년', '10년'],
										        datasets: [{
										            label: '예상 투자 수익률 (연 3%)',
										            data: [0, ${getResultList.year2_invest1}, ${getResultList.year4_invest1}, ${getResultList.year6_invest1}, ${getResultList.year8_invest1}, ${getResultList.year10_invest1}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '투자를 하지 않았을 때',
										            data: [0, ${getResultList.year2}, ${getResultList.year4}, ${getResultList.year6}, ${getResultList.year8}, ${getResultList.year10}],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										            
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true
										                }
										            }]
										        }
										    }
										});
										</script>
									</c:if>
									
									<c:if test="${getResultList.char_no == 2}">
              					<canvas id="myChart3" width="800px" height="500px"></canvas>(단위 : 만원)
										<script>


										var ctx = document.getElementById('myChart3').getContext('2d');
										var myChart3 = new Chart(ctx, {
										    type: 'line',
										    data: {
										        labels: ['0', '2년', '4년', '6년', '8년', '10년'],
										        datasets: [{
										            label: '예상 투자 수익률 (연 5%)',
										            data: [0, ${getResultList.year2_invest2}, ${getResultList.year4_invest2}, ${getResultList.year6_invest2}, ${getResultList.year8_invest2}, ${getResultList.year10_invest2}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '투자를 하지 않았을 때',
										            data: [0, ${getResultList.year2}, ${getResultList.year4}, ${getResultList.year6}, ${getResultList.year8}, ${getResultList.year10}],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true
										                }
										            }]
										        }
										    }
										});
										</script>
									</c:if>
									
									<c:if test="${getResultList.char_no == 3}">
              					<canvas id="myChart3" width="800px" height="500px"></canvas>(단위 : 만원)
										<script>

										/* 복리 효과는 3, 7, 10 */
										var ctx = document.getElementById('myChart3').getContext('2d');
										var myChart3 = new Chart(ctx, {
										    type: 'line',
										    data: {
										        labels: ['0', '2년', '4년', '6년', '8년', '10년'],
										        datasets: [{
										            label: '예상 투자 수익률 (연 8%)',
										            data: [0, ${getResultList.year2_invest3}, ${getResultList.year4_invest3}, ${getResultList.year6_invest3}, ${getResultList.year8_invest3}, ${getResultList.year10_invest3}],
										            backgroundColor: [
										            	 'rgba(255, 99, 132, 0.2)',
										            ],
										            borderColor: [
										            	 'rgba(255, 99, 132, 1)',
										            ],
										            borderWidth: 1
										        }, {
										        	label: '투자를 하지 않았을 때',
										            data: [0, ${getResultList.year2}, ${getResultList.year4}, ${getResultList.year6}, ${getResultList.year8}, ${getResultList.year10}],
										            backgroundColor: [
										                'rgba(54, 162, 235, 0.2)',
										            ],
										            borderColor: [
										                'rgba(54, 162, 235, 1)',
										            ],
										            borderWidth: 1
										        }]
										    },
										    options: {
										        scales: {
										            yAxes: [{
										                ticks: {
										                    beginAtZero: true
										                }
										            }]
										        }
										    }
										});
										</script>
									</c:if>
								</div>
							</div>
							</div>
							<br>
							<div class="center">
              					<div class="col-sm-12"><br>
              						<div class="input-group mb-3">
										<c:if test="${getResultList.char_no == 1}">
							
							<h4>● 추천 투자 상품</h4>
							<table class="table" border="1" style="text-align: center; border: 1px solid #dee2e6">
								<tr>
									<th style="background-color: #FFFFD2">투자성향</th>
									<th style="background-color: #FFFFD2">${getResultList.user_name}님의 예상 투자기간</th>
									<th style="background-color: #FFFFD2">추천 투자 상품</th>
									<th style="background-color: #FFFFD2">1년 예상 수익률</th>
								</tr>
								<tr>
									<td style="text-align: center">안전 추구형</td>
									<td>${getResultList.q6_content}</td>
									<td>
										MMA,<br>
										CMA,<br>
										은행 예 / 적금,<br>
										국채,<br>
										지방채
									</td>
									<td style="color: red; font-size: 20px;"><b>약 2 ~ 4%</b></td>
								</tr>
							</table>
							</c:if>
							
							<c:if test="${getResultList.char_no == 2}">
							<h4>● 추천 투자 상품</h4>
							<table class="table" border="1" style="text-align: center; border: 1px solid #dee2e6">
								<tr>
									<th style="background-color: #FFFFD2">투자성향</th>
									<th style="background-color: #FFFFD2">${getResultList.user_name}님의 예상 투자기간</th>
									<th style="background-color: #FFFFD2">추천 투자 상품</th>
									<th style="background-color: #FFFFD2">1년 예상 수익률</th>
								</tr>
								<tr>
									<td style="text-align: center">중립형</td>
									<td>${getResultList.q6_content}</td>
									<td>
										코스피 200 대형주,<br>
										업종 및 지수 추종 ETF,<br>
										업종 및 지수 추종 대형 펀드,<br>
										고배당 주(배당 3 ~ 5% 이상),<br>
										신용도 중간의 회사채
									</td>
									<td style="color: red; font-size: 25px;">±<b> 5 ~ 10%</b></td>
								</tr>
							</table>
							</c:if>
							
							<c:if test="${getResultList.char_no == 3}">
							<h4>● 추천 투자 상품</h4>
							<table class="table" border="1" style="text-align: center; border: 1px solid #dee2e6">
								<tr>
									<th style="background-color: #FFFFD2">투자성향</th>
									<th style="background-color: #FFFFD2">${getResultList.user_name}님의 예상 투자기간</th>
									<th style="background-color: #FFFFD2">추천 투자 상품</th>
									<th style="background-color: #FFFFD2">1년 예상 수익률</th>
								</tr>
								<tr>
									<td style="text-align: center">공격형</td>
									<td>${getResultList.q6_content}</td>
									<td>
										코스닥 중/소형주,<br>
										선물옵션,<br>
										파생 ETF,<br>
										ETN,<br>
										테마주,<br>
										IPO 청약
									</td>
									<td style="color: red; font-size: 25px;">±<b> 15% 이상</b></td>
								</tr>
							</table>
							
							</c:if>
							<span>※ 본 정보는 투자 판단에 대한 참고임을 밝혀드립니다. 상품의 가치하락 및 가격하락에 대해서는 보장을 하지 않습니다.</span>
							
							
							
							
									</div>
								</div>
							</div>
							
							<br><br>
							<div class="center" style="padding-top:50px;">
								<div class="col-md-12">
									<a href="${croot}/stockForm2.do"><button type="button" class="btn-4 btn-info" style="min-width: 420px; height: 50px; font-size: 20px;">KOSPI200 주가현황 보러가기</button></a>
								</div>
							</div>
							
							
						
						
						</div>
					</div>
					</div>
							
							
							
			  			</div>


      <footer class="footer_style_2">
         
         <!-- footer bottom -->
         <div class="footer_bottom">
            <p><strong>Copyright © 2021 from KITE</strong></p>
         </div>
      </footer>
     <form name="goq10" method="post" action="${requestScope.croot}/q10.do"></form> 
   </body>
</html>
