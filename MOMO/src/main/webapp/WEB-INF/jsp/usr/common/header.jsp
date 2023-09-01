<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<title>${pageTitle }</title>
<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />
<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.31.0/dist/full.css"
	rel="stylesheet" type="text/css" />
<!-- 제이쿼리 불러오기 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link rel="stylesheet" href="/resource/common.css" />
</head>

<body>
	<header id="header">
		<a href="http://127.0.0.1:8082/usr/home"  class="logo"><strong>MOMO</strong> : 모임의 모든 것</a>
		<ul class="icons">	
		</ul>
	</header>
	
	<div class="mt-4 h-12 flex container mx-auto text-4xl">
		<ul class="flex">
			<li class="hover:underline"><a
				class="h-full px-3 flex items-center"
				href="/usr/Mmaker/lastMoim"><button class="text-base px-2">지난모임</button></a></li>
			<li class="hover:underline"><a
				class="h-full px-3 flex items-center"
				href="/usr/Mmaker/scheduledMoim"><button class="text-base px-2">예정모임 </button></a></li>
			<c:if test="${rq.getLoginedMemberId() == 0 }">
				<li class="hover:underline"><a
					class="h-full px-2 flex items-center" href="/usr/login"><button class="text-base px-2">로그인</button></a></li>
				<li class="hover:underline"><a
					class="h-full px-2 flex items-center" href="/usr/join"><button class="text-base px-2">회원가입</button ></a></li>
			</c:if>
			<c:if test="${rq.getLoginedMemberId() != 0  }">
				<li class="hover:underline"><a
					class="h-full px-3 flex items-center" href="/usr/member/doLogout"><button class="text-base px-2">로그아웃</button></a></li>
			</c:if>
		</ul>
	</div>

	<section class="my-3 text-2xl">
		<div class="container mx-auto px-3">
		</div>
	</section>