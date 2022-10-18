<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<main>
		<div>
			<h1 class="mt-4">로그인</h1>
			<h4>시스템 이용을 위해 로그인 하시기 바랍니다.</h4>
			<nav></nav>
			<div class="find-btn">
				<table style="border: none;">
					<tr>
						<td><b>아이디</b></td>
						<td><input id="strId" size="30" required></td>
						<td rowspan="2"><button type="button" id="auth">로그인</button></td>
					</tr>
					<tr>
						<td><b>비밀번호</b></td>
						<td><input type="password" id="strPw" size="30"
							required></td>
						<td></td>
					</tr>
				</table>
				<div>
					<label><input type="checkbox" name="" value=""> <span
						style="vertical-align: top;">아이디 기억하기</span></label>
				</div>
				<div>
					<table style="border: none;">
						<tr>
							<td>회원가입 후 이용이 가능합니다.</td>
							<td>
								<button type="button" onclick="location.href='regist'">
									회원가입</button>
							</td>
						</tr>
						<tr>
							<td>시스템 이용 문의사항 (T) 053-000-0000</td>
							<td>
								<button type="button" onclick="#">아이디/비밀번호 찾기</button>
							</td>
						</tr>
					</table>
				</div>
				<form id="authForm" action="/auth" method="POST">
					<input type="hidden" id="rsaId" name="mbrId"> 
					<input type="hidden" id="rsaPw" name="mbrPw">
				</form>
			</div>
		</div>
	</main>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="/resources/js/common/rsa/jsbn.js"></script>
<script src="/resources/js/common/rsa/prng4.js"></script>
<script src="/resources/js/common/rsa/rng.js"></script>
<script src="/resources/js/common/rsa/rsa.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// authForm 내 hidden으로 된 아이디 및 비밀번호에 암호화 된 데이터 삽입 준비
	var rsaId = $("#rsaId");
	
	var rsaPw = $("#rsaPw");	
	
	var authForm = $("#authForm");

	// resources-js-common-rsa-rsa.js에 정의
	var rsa = new RSAKey();
	
	// 공개키 생성
	rsa.setPublic("${modulus}", "${exponent}");
	
	// 로그인 버튼 클릭 이벤트 처리
	$("#auth").on("click", function(e) {
		
		e.preventDefault();
		
		var strId = $("#strId").val();
		
		var strPw = $("#strPw").val();
		
		// 암호화 진행
		rsaId.val(rsa.encrypt(strId));
		
		rsaPw.val(rsa.encrypt(strPw));
		
		authForm.submit();
		
	});
	
	// resultMSG가 존재할 경우 alret 창을 띄운다.
	var resultMsg = "${resultMsg}";
	
	console.info("resultMsg : " + resultMsg);
	
	if (resultMsg > ' ') {
		
		alert(resultMsg);
	}
		
});
</script>
</html>