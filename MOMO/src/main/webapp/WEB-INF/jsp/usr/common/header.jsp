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
</head>

<body>
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header id="header">
					<a href="../home" class="logo"><strong>MOMO</strong> : 모임의 모든 것</a>
					<div class="mt-4 h-12 flex container mx-auto text-4xl">
						<ul class="flex">
							<li class="hover:underline"><a
								class="h-full px-3 flex items-center" href="/usr/Mmaker/moimL"><button
										class="text-base px-2">지난모임</button></a></li>
							<li class="hover:underline"><a
								class="h-full px-3 flex items-center" href="/usr/Mmaker/moimP"><button
										class="text-base px-2">예정모임</button></a></li>
							<c:if test="${rq.getLoginedMemberId() == 0 }">
								<li class="hover:underline"><a
									class="h-full px-2 flex items-center" href="/usr/login"><button
											class="text-base px-2">로그인</button></a></li>
								<li class="hover:underline"><a
									class="h-full px-2 flex items-center" href="/usr/join"><button
											class="text-base px-2">회원가입</button></a></li>
							</c:if>
							<c:if test="${rq.getLoginedMemberId() != 0  }">
								<li class="hover:underline"><a
									class="h-full px-3 flex items-center"
									href="/usr/member/doLogout"><button class="text-base px-2">로그아웃</button></a></li>
							</c:if>
						</ul>
					</div>

				</header>
				<!-- Search -->
				<section id="searchKeyword" class="alt">
					<form method="post" action="#">
						<input type="text" name="searchKeyword" placeholder="검색어를 입력해주세요" maxlength="20"/>
					</form>
				</section>
