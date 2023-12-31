<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>모임의 모든것:모모</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />
<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.31.0/dist/full.css"
	rel="stylesheet" type="text/css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="home" class="logo"><strong>MOMO</strong> : 모임의 모든 것</a>

				</header>
				<!-- Search -->
				<section id="search" class="alt">
					<form>
				 		<select class="ml-2 w-40 select select bordered" name="searchKeywodKType">
				 			<option value= "moimMain">제목</option>
				 			<option value= "writeName">모임장</option>	
				 		</select>
				 		<input class= "ml-2 w-auto input input-bordered" name= "searchKeyword" placeholder="검색어를 입력해주세요" maxlength= "20"/>
				 		<button class= "ml-2 w-20 botton">검색</button>
				 	</form>
				</section> 	
				<!-- Section -->
				<section class="mt-8 text-xl" style="margin-top: -30px;">
					<header class="major" style="margin-top: -50px;">
						<h2>전체 모임 일정</h2>
					</header>
					<div class="container mx-auto px-3">
						<div class="grid grid-cols-3 gap-4">
							<c:forEach var="mmaker" items="${mmakers}">
								<div class="border rounded-lg overflow-hidden"
									style="border: 4px solid #f56a6a; border-radius: 10px;">
									<img src="${mmaker.moimImg}" class="w-full h-60 object-cover"
										alt="Moim Image">
									<div class="p-4">
										<h2 class="text-gray-400 font-semibold">
											<a href="Mmaker/detail?id=${mmaker.id}" class="hover:underline">${mmaker.moimMain}</a>
										</h2>
										<p class="text-sm text-gray-500">${mmaker.writerName}|
											${mmaker.regDate.substring(2, 10)}</p>
										<div class="flex-col mt-4">
											<p class="text-sm text-gray-600">장&nbsp;&nbsp;&nbsp;소:
												${mmaker.moimPlace}</p>
											<p class="text-sm text-gray-600">일&nbsp;&nbsp;&nbsp;시:
												${mmaker.moimDatetime}</p>
											<p class="text-sm text-gray-600">인&nbsp;&nbsp;&nbsp;원:
												${mmaker.moimMemberCnt}</p>
											<p class="text-sm text-gray-600">모임비:
												${mmaker.moimPrice}원</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</section>
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>모모</h2>
					</header>
					<ul>
						<li><a href="home">홈</a></li>
						<li><a href="Mmaker/moimL">지난모임</a></li>
						<li><a href="Mmaker/moimP">예정모임</a></li>
					</ul>
				</nav>
				<!-- Section -->
				<section>
					<header class="major">
						<h2>모임만들기</h2>
					</header>
					<div class="mini-posts">
						<article>
							<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
							<p>오늘은 직접 모임을 만들어보아요.</p>
						</article>
					</div>
					<ul class="actions">
						<li><a href="domake" class="button">모임만들기</a></li>
					</ul>
				</section>
				<!-- Section -->
				<section>
					<header class="major">
						<h2>고객센터</h2>
					</header>
					<p>무엇이든 물어보세요.</p>
					<ul class="contact">
						<li class="icon solid fa-phone">(000) 000-0000</li>
						<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
							Nashville, TEL 00000-0000
						</li>
					</ul>
					<c:if test="${rq.getLoginedMemberId() == 0 }">
						<ul class="actions">
							<li class="hover:underline">
							<li><a href="member/login" class="button big">로그인</a></li>
							</li>
						</ul>
						<ul class="actions">
							<li class="hover:underline">
							<li><a href="join" class="button big">회원가입</a></li>
							</li>
						</ul>
					</c:if>
					<c:if test="${rq.getLoginedMemberId() != 0  }">
						<ul class="actions">
							<li class="hover:underline">
							<li><a href="member/doLogout" class="button big">로그아웃</a></li>
							</li>
						</ul>
					</c:if>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>

			</div>
		</div>

	</div>
	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>



</body>
</html>