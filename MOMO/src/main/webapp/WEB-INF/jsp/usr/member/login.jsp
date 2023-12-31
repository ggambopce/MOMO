<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Login" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/login.css" />
<script src="/resources/assets/js/login.js"></script>
<title>${pageTitle }</title>

</head>

<body>
	<header id="header">
		<a href="http://127.0.0.1:8082/usr/home" class="logo"><strong>MOMO</strong>
			: 모임의 모든 것</a>
		<ul class="icons">
		</ul>
	</header>

	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="/usr/member/doJoin" method="POST">
				<h1>Create Account</h1>
				<span>회원정보를 입력해주세요</span> 
				<input type="text" name="loginId" placeholder="아이디를 입력해주세요" /> 
				<input type="text" name="loginPw" placeholder="비밀번호를 입력해주세요" /> 
				<input type="text" name="loginPwChk" placeholder="비밀번호확인을 입력해주세요" /> 
				<input type="text" name="name" placeholder="이름을 입력해주세요" /> 
				<input type="text" name="nickname" placeholder="닉네임을 입력해주세요" /> 
				<input type="text" name="cellphoneNum" placeholder="전화번호를 입력해주세요" /> 
				<input type="text" name="gender" placeholder="성별을 입력해주세요" /> 
				<input type="text" name="birthday"placeholder="생년월일을 입력해주세요" /> 
				<button>Sign Up</button>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form action="/usr/member/doLogin" method="POST">
				<h1>Sign in</h1>
				<span>아이디와 비밀번호를 입력해주세요</span> <input type="text" name="loginId"
					placeholder="아이디 입력" /> <input type="text" name="loginPw"
					placeholder="비밀번호 입력" /> <a href="#">Forgot your password?</a>
				<button>Sign In</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>모임에 참여하기위해 로그인을 해주세요</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>회원가입을 위한 정보를 입력해주세요</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
<script>
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
  container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
  container.classList.remove("right-panel-active");
});</script>

</body>
</html>