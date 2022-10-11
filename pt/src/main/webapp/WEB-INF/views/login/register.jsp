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
        <div class="container-fluid px-4">
            <h1 class="mt-4">회원가입</h1>
            <h4>정확한 정보를 입력해주십시오. 타 정보 무단 도용 또는 허위 정보 입력 시 회원가입 승인이
                되지 않으며 불이익을 받으실 수 있습니다.</h4>
            <div class="panel-heading">*는 필수입력 항목입니다</div>
            <nav class="navbar bg-light">
                <div class="container-fluid"></div>
            </nav>
            <div class="card mb-4">
                <form role="form" action="/human/hr-register"
                    method="post">
                    <table border="1">
                        <th colspan="5">회원정보</th> <th>*는 필수입력 항목입니다</th>
                        <tr>
                            <td>(*)아이디</td>
                            <td><input class="form-control" name='mbr_id' size="30"></td>
                            <td><button type="submit" class="btn btn-primary">중복확인</button></td>
                            <td>(*)이름</td>
                            <td><input class="form-control" name='mbr_nm' size="30"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>(*)비밀번호</td>
                            <td><input type="password" class="form-control" name='mbr_pw' size="30"></td>
                            <td></td>
                            <td>(*)비밀번호 확인</td>
                            <td>5번째 칸</td>
                            <td>6번째 칸</td>
                        </tr>
                        <tr>
                            <td>(*)휴대폰번호</td>
                            <td>2번째 칸</td>
                            <td>3번째 칸</td>
                            <td>4번째 칸</td>
                            <td>5번째 칸</td>
                            <td>6번째 칸</td>
                        </tr>
                    </table>

                    <div class="form-group">
                        <label>(*)아이디</label> <input
                            class="form-control" name='mbr_id'>
                        <label>(*)이름</label> <input class="form-control"
                            name='mbr_nm'>
                    </div>
                    <br>

                    <div class="form-group">
                        <label>(*)비밀번호</label> <input
                            class="form-control" name='mbr_pw'>
                        <label>(*)비밀번호확인</label> <input
                            class="form-control" name='mbr_pw_val'>
                    </div>
                    <br>

                    <div class="form-group">
                        <label>(*)휴대폰번호</label> <input
                            placeholder="숫자만 입력" class="form-control"
                            name='mbr_phone'> <label>(*)이메일주소</label>
                        <input class="form-control" name='mbr_em'>
                    </div>
                    <br>

                    <button type="submit" class="btn btn-primary">완료</button>
                    <button type="reset" class="btn btn-danger"
                        onclick="history.back(-1)">취소</button>
                </form>
            </div>
            <div style="height: 100vh"></div>
        </div>
    </main>
</body>
</html>