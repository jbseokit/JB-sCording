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
				<form role="form" action="/regist" method="post" id="regForm">
					<table style="border: none;">
						<tr>
							<td colspan="5" align="left">회원정보</td>
							<td style="color: orange;"><b>(*)필수입력항목</b></td>
						</tr>
						<tr>
							<td> <span style="color: orange;"><b>(*)</b></span> 아이디</td>
							<td><input id="id" name="mbrId" size="30" required></td>
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
							<td><input type="password" class="pwCheck" id="pwv" size="30" required></td>
							<td><span id="pwvSuccess" style="display:none; color: blue;">비밀번호 일치</span>
                                <span id="pwvDanger" style="display:none; color: red; ">비밀번호 불일치</span>
                            </td>
						</tr>
						<tr>
							<td> <span style="color: orange;"><b>(*)</b></span> 휴대폰번호</td>
							<td><input id="phone" name='mbrPhone' size="30"
								required></td>
							<td></td>
							<td> <span style="color: orange;"><b>(*)</b></span> 이메일주소</td>
							<td><input id="email" name='mbrEm' size="30"
								required></td>
							<td style="text-align: center;" width="120px"><button type="button" id="reg">가입</button></td>
						</tr>
					</table><p>
				</form>
			</div>
		</div>
	</main>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="/resources/js/common/aes/aes_pack.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 체크 여부 (중복 = 0, 중복X = 1)
	var check = 0;
	
	// 중복 확인 누르지 않고 가입하는 경우
	var clickcnt = 0;

	// check 버튼 클릭 시 함수 호출
	$("#check").click(function() {
		
		// 중복 확인 버튼 클릭 시 카운트 +1
		clickcnt += 1;

		// 입력된 아이디 변수
		var id = $("#id").val();
		
		$.ajax({
			
			async : true,
			type : "POST",
			data : id,
			url : "check",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				
				if (data.cnt > 0) {
					
					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					
				} else {
					
					alert("사용가능한 아이디입니다.");
					
					check = 1;
					
				}
				
			},
			error : function(error) {
				
				alert("아이디 입력 후 중복확인을 눌러주세요.");
				
			}
		});
		
	});
	
	$("#reg").click(function() {
		
		// 회원 가입 시 이름 출력
		var name = $("#name").val();
		
		if (clickcnt > 0 && name > ' ') {
			
			$("#regForm").submit();
			
			alert(name + "님 회원가입을 축하합니다.");
			
		} else {
			
			alert("아이디 중복확인 또는 입력 정보가 부족합니다.")
			
		}
		
	});
	
	$(".pwCheck").focusout(function() {
		
		var pw = $("#pw").val();
		
		var pwv = $("#pwv").val();
		
		if ( pw != '' && pwv == '') {
			
			null;
		
		} else if ( pw != '' || pwv != '') {
			
			if ( pw == pwv ) {
				
				$("#pwvSuccess").css('display', 'inline-block');

				$("#pwvDanger").css('display', 'none');
				
			} else {
				
				$("#pwvSuccess").css('display', 'none');

				$("#pwvDanger").css('display', 'inline-block');
				
			}

		} 
			
	});
	
});
</script>
</html>