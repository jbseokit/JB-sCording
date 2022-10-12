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
                <form role="form" action="/post" method="get">
                    <table style="border: none;">
                        <tr>
                            <td><b>아이디</b></td>
                            <td><input id="id" name='mbrId'
                                size="30" required></td>
                            <td rowspan="2"><button type="button">로그인</button></td>
                        </tr>
                        <tr>
                            <td><b>비밀번호</b></td>
                            <td><input type="password" id="pw"
                                name='mbrPw' size="30" required></td>
                            <td></td>
                        </tr>
                    </table>
                    <div>
                        <label><input type="checkbox" name=""
                            value=""> <span
                            style="vertical-align: top;">아이디 기억하기</span></label>
                    </div>
                    <div>
                        <table style="border: none;">
                            <tr>
                                <td>회원가입 후 이용이 가능합니다.</td>
                                <td>
                                    <button type="button"
                                        onclick="location.href='regist'">
                                        회원가입</button>
                                </td>
                            </tr>
                            <tr>
                                <td>시스템 이용 문의사항 (T) 053-000-0000</td>
                                <td>
                                    <button type="button" onclick="#">
                                        아이디/비밀번호 찾기</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </main>
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