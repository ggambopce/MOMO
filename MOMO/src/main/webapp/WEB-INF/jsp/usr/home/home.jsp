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
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>
				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h1>
								오늘하루 수고했어요<br /> 자 이제 놀아볼까요?
							</h1>
							<p>당신의 행복한 순간을 위해 준비합니다</p>
						</header>
						<p>원데이모임 모모</p>

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

				<!-- Section -->
				<section class="mt-8 text-xl">
					<header class="major">
						<h2>지난 모임</h2>
					</header>
					<div class="container mx-auto px-3">
						<div class="grid grid-cols-3 gap-4">
							<c:forEach var="mmaker" items="${mmakers}">
								<div class="border rounded-lg overflow-hidden">
									<img src="${mmaker.moimImg}" class="w-full h-40 object-cover"
										alt="Moim Image">
									<div class="p-4">
										<h2 class="text-lg font-semibold">
											<a href="detail?id=${mmaker.id}" class="hover:underline">${mmaker.moimMain}</a>
										</h2>
										<p class="text-gray-600">${mmaker.moimBody}</p>
										<p class="text-sm text-gray-500">${mmaker.writerName}|
											${mmaker.regDate.substring(2, 16)}</p>
										<div class="flex justify-between mt-4">
											<p class="text-sm text-gray-600">모임장소:
												${mmaker.moimPlace}</p>
											<p class="text-sm text-gray-600">모임일시:
												${mmaker.moimDatetime}</p>
										</div>
										<div class="flex justify-between mt-2">
											<p class="text-sm text-gray-600">모임비: ${mmaker.moimPrice}</p>
											<p class="text-sm text-gray-600">조회수: ${mmaker.hitCount}</p>
											<%-- 
							<tr>
								<td><c:if test="${rq.getLoginedMemberId() == 0 }">
										<span class="ml-2 badge">좋아요 : ${mmaker.goodReactionPoint }</span>
									<br />
									<span class="ml-2 badge">싫어요 : ${mmaker.badReactionPoint * -1 }</span>
									</c:if> <c:if test="${rq.getLoginedMemberId() != 0 }">
										<a id="goodBtn" class="btn btn-outline btn-xs" href="../reactionPoint/doInsertReactionPoint?relId=${mmaker.id }&relTypeCode=article&point=1">좋아요👍</a>
										<span class="ml-2 badge">좋아요 :
											${mmaker.goodReactionPoint }</span>
										<br />
										<a id="badBtn" class="btn btn-outline btn-xs" href="../reactionPoint/doInsertReactionPoint?relId=${mmaker.id }&relTypeCode=article&point=-1">싫어요👎</a>
										<span class="ml-2 badge">싫어요 :
											${mmaker.badReactionPoint * -1 }</span>
									</c:if></td>
							</tr>			 --%>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

				</section>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>예정 모임</h2>
					</header>

					<article>
						<div>
							<iframe src="http://127.0.0.1:8082/usr/Mmaker/scheduledMoim"
								width="100%" height="600" frameborder="0" scrolling="auto"></iframe>
						</div>
					</article>
					<div class="posts">
						<article>
							<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
							<h3>Interdum aenean</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
								nulla amet lorem feugiat tempus aliquam.</p>
							<ul class="actions">
								<li><a href="#" class="button">참여하기</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a>
							<h3>Nulla amet dolore</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem
								ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
								nulla amet lorem feugiat tempus aliquam.</p>
							<ul class="actions">
								<li><a href="#" class="button">참여하기</a></li>
							</ul>
						</article>
					</div>
				</section>
				<section>
					<header class="major">
						<h2>구독예정모임</h2>
					</header>
					<div class="features">
						<article>
							<span class="icon fa-gem"></span>
							<div class="content">
								<h3>Portitor ullamcorper</h3>
								<p>Aenean ornare velit lacus, ac varius enim lorem
									ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
									nulla amet lorem feugiat tempus aliquam.</p>
							</div>
						</article>
						<article>
							<span class="icon solid fa-paper-plane"></span>
							<div class="content">
								<h3>Sapien veroeros</h3>
								<p>Aenean ornare velit lacus, ac varius enim lorem
									ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
									nulla amet lorem feugiat tempus aliquam.</p>
							</div>
						</article>
						<article>
							<span class="icon solid fa-rocket"></span>
							<div class="content">
								<h3>Quam lorem ipsum</h3>
								<p>Aenean ornare velit lacus, ac varius enim lorem
									ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
									nulla amet lorem feugiat tempus aliquam.</p>
							</div>
						</article>
						<article>
							<span class="icon solid fa-signal"></span>
							<div class="content">
								<h3>Sed magna finibus</h3>
								<p>Aenean ornare velit lacus, ac varius enim lorem
									ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed
									nulla amet lorem feugiat tempus aliquam.</p>
							</div>
						</article>
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
						<li><a href="Mmaker/lastMoim">지난모임</a></li>
						<li><a href="Mmaker/detail">예정모임</a></li>
						<li><span class="opener">구독모임</span>
							<ul>
								<li><a href="#">Lorem Dolor</a></li>
								<li><a href="#">Ipsum Adipiscing</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><span class="opener">모임도구</span>
							<ul>
								<li><a href="#">Lorem Dolor</a></li>
								<li><a href="#">Ipsum Adipiscing</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><a href="#">설정</a></li>
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
							<p>오늘은 직접 다른사람의 행복을 위해 모임을 만들어보아요.</p>
						</article>
					</div>
					<ul class="actions">
						<li><a href="domake" class="button">모임만들기버튼</a></li>
					</ul>
				</section>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>고객센터</h2>
					</header>
					<p>Sed varius enim lorem ullamcorper dolore aliquam aenean
						ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin
						sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat
						tempus aliquam.</p>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
						<li class="icon solid fa-phone">(000) 000-0000</li>
						<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
							Nashville, TN 00000-0000
						</li>
					</ul>
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