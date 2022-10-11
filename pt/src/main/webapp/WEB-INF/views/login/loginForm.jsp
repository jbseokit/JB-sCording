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
	<div class="main" id="divPosition">
		<h2 class="logo">로그인</h2>
        <h4> 시스템 이용을 위해 로그인 하시기 바랍니다. </h4>
		<div class="container">
			<b>아이디</b> <input type="text" placeholder="ID" id="id" name="id" class="account"><br>
			<b>비밀번호</b> <input type="password" placeholder="Password" id="password"	name="password" class="account">
			<button  id="login" name="loginTry" class="loginBtn">로그인</button>
			<p id="alert" class="account"></p>
		</div>
	</div>
</body>
</html>

<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
		const id = document.getElementById('id');
        const password = document.getElementById('password');
        const login = document.getElementById('login');
        let errStack = 0;
        
        var enterSn = '${enter.mbr_sn}';
        var enterId = '${enter.mbr_id}';
        var enterPw = '${enter.mbr_pw}';
        
        login.addEventListener('click', function(e){    

            
            if (id.value == enterId) {
                if (password.value == enterPw) {
                    errStack -= 5;
                    alert('로그인 되었습니다!');
                    location.href = "/human/hr-list";
                }
                else {
                    alert('아이디와 비밀번호를 다시 한 번 확인해주세요!')
                    errStack++;
                    
                }
            } else {
                alert('아이디와 비밀번호를 다시 한 번 확인해주세요!')

            }

            if (errStack >= 5) {
                alert('비밀번호를 5회 이상 틀리셨습니다. 비밀번호 찾기를 권장드립니다.')
            }
        });     
        
    
    });
</script> -->