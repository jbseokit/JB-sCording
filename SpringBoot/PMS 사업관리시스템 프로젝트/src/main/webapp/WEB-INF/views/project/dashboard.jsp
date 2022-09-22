<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<h2>대시보드</h2>
	
<!-- Step 1) Load D3.js -->
<script src="https://d3js.org/d3.v6.min.js"></script>

<!-- Step 2) Load billboard.js with style -->
<script src="C:\Users\HKIT\Desktop\New/billboard.js"></script>

<!-- Load with base style -->
<link rel="stylesheet" href="C:\Users\HKIT\Desktop\New/billboard.css">

<!-- Or load different theme style -->
<link rel="stylesheet" href="C:\Users\HKIT\Desktop\New/theme/insight.css">

<!-- Markup -->
<div id="chart"></div>
<script>
var chart = bb.generate({
    bindto: "#chart",
    data: {
        type: "bar",
        columns: [
            ["data1", 30, 200, 100, 170, 150, 250],
            ["data2", 130, 100, 140, 35, 110, 50]
        ]
    }
});
</script>



<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
