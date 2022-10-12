<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<main>
		<div>
			<h1>회원가입</h1>
			<h4>정확한 정보를 입력해주십시오. 타 정보 무단 도용 또는 허위 정보 입력 시 회원가입 승인이 되지 않으며
				불이익을 받으실 수 있습니다.</h4>
			<div class="find-btn">
				<form role="form" action="/regist" method="post">
					<table style="border: none;">
						<tr>
							<td colspan="5" align="left">회원정보</td>
							<td style="color: orange;"><b>(*)필수입력항목</b></td>
						</tr>
						<tr>
							<td> <span style="color: orange;"><b>(*)</b></span> 아이디</td>
							<td><input id="id" name='mbrId' size="30"
								required></td>
							<td><button type="button" id="check">중복확인</button></td>
							<td> <span style="color: orange;"><b>(*)</b></span> 이름</td>
							<td><input id="name" name='mbrNm' size="30"
								required></td>
							<td></td>
						</tr>
						<tr>
							<td> <span style="color: orange;"><b>(*)</b></span> 비밀번호</td>
							<td><input type="password" id="pw" name='mbrPw'
								size="30" required></td>
							<td></td>
							<td> <span style="color: orange;"><b>(*)</b></span> 비밀번호 확인</td>
							<td><input type="password" id="pwv"
								name='mbrPwVal' size="30" required></td>
							<td></td>
						</tr>
						<tr>
							<td> <span style="color: orange;"><b>(*)</b></span> 휴대폰번호</td>
							<td><input id="phone" name='mbrPhone' size="30"
								required></td>
							<td></td>
							<td> <span style="color: orange;"><b>(*)</b></span> 이메일주소</td>
							<td><input id="email" name='mbrEm' size="30"
								required></td>
							<td style="text-align: center;"><button>가입</button></td>
						</tr>
					</table><p>
				</form>
			</div>
		</div>
	</main>
</body>
</html>