<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/login_header.jsp"%>

<style>
.main {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	border: 1px solid lightgrey;
	border-radius: 5px;
	position: absolute;
	height: 300px;
	width: 500px;
	margin: -150px 0px 0px -200px;
	top: 50%;
	left: 50%;
	padding: 5px;
}

.logo {
	margin-top: 0px;
	margin-bottom: 40px;
}

#id {
	width: 100%;
}

#password {
	width: 100%;
}

#login {
	width: 100%;
	background-color: skyblue;
	border-color: transparent;
	color: white;
}

.account {
	display: block;
	margin-bottom: 3px;
	padding: 3px;
	border: 1px solid lightgray;
	border-radius: 3px;
}

#alert {
	border-color: transparent;
}
</style>
<body>
	<div class="main" id="divPosition">
		<h1 class="logo">KIT-PMS 사업 관리 시스템</h1>
		<div class="container">
		<form class="loginForm" name="loginForm" action="/" method="post">
			<input type="text" placeholder="사번을 입력해주세요." id="mbr_sn" name="mbr_sn" class="account" size=57% maxlength=12 required>
			<button  id="login" name="login" class="loginBtn">사번인증</button>
			<p id="alert" class="account"></p>
		</form>
			
		</div>
	</div>
</body>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>