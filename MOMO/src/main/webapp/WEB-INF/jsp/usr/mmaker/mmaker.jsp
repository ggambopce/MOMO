<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="모임만들기" />
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
			: 나의 모임만들기</a>
		<ul class="icons">
		</ul>
	</header>

		<div class="container mx-auto px-3">
			<form action="/usr/Mmaker/doWrite" method="POST">
				<div class="table-box-type-1">
					<table>
						<colgroup>
							<col width="200" />
						</colgroup>
						<tbody>
							<tr>
								<th>모임제목</th>
								<td><input class="input input-bordered w-full max-w-xs"
									type="text" name="moimMain" placeholder="모임제목을 입력해주세요" /></td>
							</tr>
							<tr>
								<th>모임내용</th>
								<td><textarea class="textarea textarea-bordered w-full"
										name="moimBody" placeholder="내용을 입력해주세요"></textarea></td>
							</tr>
						
							<tr>
								<th>모임사진</th>
								<td><input class="input input-bordered w-full max-w-xs"
									type="file" accept="image/*" name="moimImg" /></td>
							</tr>
							<tr>
								<th>모임일시</th>
								<td><input class="input input-bordered w-full max-w-xs"
									type="text" name="moimDatetime" placeholder="모임일시를 입력해주세요" /></td>
							</tr>
							<tr>
								<th>모임장소</th>
								<td><input class="input input-bordered w-full max-w-xs"
									type="text" name="moimPlace" placeholder="모임장소를 입력해주세요" /></td>
							</tr>
							<tr>
								<th>모임인원</th>
								<td><input class="input input-bordered w-full max-w-xs"
									type="text" name="moimMemberCnt" placeholder="모임인원을 입력해주세요" />명</td>
							</tr>
							<tr>
								<th>모임비</th>
								<td><input class="input input-bordered w-full max-w-xs"
									type="text" name="moimPrice" placeholder="모임비를 입력해주세요" />원</td>
							</tr>
							<tr>
								<td colspan="2"><button
										class="btn-text-link btn btn-active">모임만들기</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<div class="btns mt-2">
				<button class="btn-text-link btn btn-active" type="button"
					onclick="history.back();">뒤로가기</button>
			</div>
		</div>

	<%@ include file="../common/footer.jsp"%>