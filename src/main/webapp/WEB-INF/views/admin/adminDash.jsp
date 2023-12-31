<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>관리자 페이지</title>
<style>
@charset "utf-8";
 
body {
	background: #F3F5F7;
}
 
 
main {
	width: 90%;
	max-width: 1200px;
	margin: 20px auto 100px;
}
 
section {
	background: #fff;	
	padding: 10px 5px;
	border: 1px solid #E0E5EE;
	margin-bottom: 20px;
}
 
section.detail {
	display: none;
    max-height: 400px;
    overflow-y: auto;
}
 
.today {
	display: flex;
	justify-content: space-between;	
	align-items: center;
}
 
.today #today {
	font-weight: bold;
	margin-left: 10px;
}
 
.sales_today_detail_title {
	margin-bottom: 5px; 
	font-weight: 500;
	display: flex;
	justify-content: space-between;
}
 
.sales_today_detail {
	display: grid;
	grid-template-columns: 3fr 1fr 1fr;
    grid-template-rows: 40px;
}
 
.sales_today_detail > div {
	border: 1px solid #ddd;
	line-height: 40px;
	padding-left: 10px; 
	white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
 
 
section.graph_section {
	overflow-x: auto;	
}
 
section.graph_section::-webkit-scrollbar {
    display: none;
}
 
 
.box {
	min-width: 650px;
}
 
 
main button {
	padding: 5px 10px;
	border-radius: 5px;
	background: #fff;
	border: 1px solid #ccc;
	font-size: 1.2rem;
}
 
main #date {
	padding: 5px 10px;
	border-radius: 5px;
	font-weight: bold;
	border: 1px solid #ccc;
	font-size: 1.2rem;
}
 
main h1 {
	margin: 20px 0;
}
 
main .graph_box {
	position: relative;
	height: 55vh;
}
 
main .graph_box .graph_background {
	position: absolute;
	top: 0;
	width: 100%;
	height: 100%;
	
	display: none; 
	
}
 
main .graph_box .graph_background div {
	height: 20%;
	width: 100%;
	border: 1px solid #ddd;
	border-top: none;
}
 
main .graph_box ul {
	display: flex;
	height: 100%;
}
 
main .graph_box ul li {
	flex: 1;
	margin-right: 5px;
	display: flex;
	align-items: center;
	justify-content: end;
	flex-direction: column;
}
 
main .graph_box .graph {
	width: 30%;
	min-height: 3px;
	background: green;
	z-index: 1;
	border-radius: 5px 5px 0 0;
	position: relative;
	transition: 0.1s;
	cursor: pointer;
}
 
main .graph_box .graph:hover {
    transform: scaleX(1.2);
    background: red;
}
 
main .graph_box .sales {
	font-size: 1.15rem;
}
 
main .graph_box .graph_date {
	font-size: 1.15rem;
}
 
 
 
@media ( max-width :1250px) {
	#tab {
		width: 100%;
	}
}
 
@media ( max-width :1024px) {
	section.tab {
		margin-top: 0px;
		display: none;
	}
	.tab .box {
		display: block;
	}
	header .admin_page_btn {
		display: none;
	}
	header .menu_tab {
		display: block;
	}
}
 
@media ( max-width :767px) {
	main {
		width: 95%;
	}
	section.tab ul li {
		font-size: 16px;
		height: 50px;
	}
	section.tab ul li a {
		line-height: 50px;
	}
}
 
@media ( max-width :480px) {
	main {
		width: 100%;
	}
	
	
}
</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>    
    
    
    
</head>
<body>
    <main style="width: 80%; max-width: 800px; margin: 20px auto;">
		<canvas id="bar-chart" width="300" height="250" ></canvas>    
	</main>
    <script>
	    new Chart(document.getElementById("bar-chart"), {
	    	  type: 'bar',
	    	  data: {
	    	    labels: [	
	    	    <c:forEach items="${monthTotals}" var="monthTotal" varStatus="loop">
	    	    	"${monthTotal.key}"${loop.last ? '' : ','}
	    		</c:forEach>
	    		],
	    	    datasets: [{ 
	    	        data: [  
	    	        	<c:forEach items="${monthTotals}" var="monthTotal" varStatus="loop">
	    					${monthTotal.value}${loop.last ? '' : ','}
		    			</c:forEach>
		    			],
	    	        label: "월 매출",
	    	        fill: false,
	    	        backgroundColor: ["#c45850", "#c45850","#c45850","#c45850","#c45850","#c45850","#c45850","#c45850","#c45850","#c45850","#c45850"]    	        

	    	      }
	    	    ]
	    	  },
	    	  options: {
	    	    title: {
	    	      display: true,
	    	      text: '매출 추이',
   	              fontSize: 30
	    	    }
	    	  }
	    	});
    </script>
</body>
</html>
