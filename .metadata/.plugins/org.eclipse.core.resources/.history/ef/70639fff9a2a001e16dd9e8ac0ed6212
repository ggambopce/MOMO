<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title>로그인</title>
    <link rel="stylesheet" th:href="@{/css/default.css}" />
    <link rel="stylesheet" th:href="@{/css/common.css}" />
    <link rel="stylesheet" th:href="@{/css/content.css}" />
    <link rel="stylesheet" th:href="@{/css/button.css}" />
	<style>
		#login_box .signup_btn {background:#42d870; border:0; border-bottom:solid 3px #4ed177; border-radius:50px; width:100%; height:52px; line-height:52px; font-size:16px; color:#fff; text-align:center; margin:20px 0 15px;}
	</style>
</head>

<body>
	<div id="login_wrap">
		<div id="login_box">
			<div class="login_con">
				<div class="login_tit">
					<h2>모모 : 모임의 모든 것 </h2>
					<p>LOG<i>IN</i></p>
				</div>

				<div class="login_input">
					<form id="loginForm" onsubmit="return false;" autocomplete="off" action="doLogin"method="post">
						<ul>
							<li>
								<label for="loginId" class ="skip_info">아이디</label>
								<input type="text" id="loginId" name="loginId" placeholder="아이디를 입력해주세요" title="아이디" />
							</li>
							<li>
								<label for="password" class="skip_info">비밀번호</label>
								<input type="text" id="loginPw" name="loginPw" title="비밀번호" placeholder="비밀번호를 입력해주세요" />
							</li>
						</ul>
						<button type="button" onclick="login();" class="login_btn">로그인</button>
						<button type="button" onclick="openSignupPopup();" class="signup_btn">회원가입</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<
</body>
</html>