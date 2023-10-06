<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="모임 디테일" />
<%@ include file="../common/header.jsp"%>

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="grid grid-cols-3 gap-4">
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
						<p class="text-sm text-gray-600">번호:
						<div class="badge">${mmaker.id }</div>
						</p>
						<p class="text-sm text-gray-600">모임장소: ${mmaker.moimPlace}</p>
						<p class="text-sm text-gray-600">모임일시: ${mmaker.moimDatetime}</p>
						<p class="text-sm text-gray-600">모임인원: ${mmaker.moimMemberCnt}</p>
					</div>
					<div class="flex justify-between mt-2">
						<p class="text-sm text-gray-600">모임비: ${mmaker.moimPrice}</p>
						<p class="text-sm text-gray-600">조회수: ${mmaker.hitCount}</p>
						<p class="text-sm text-gray-600">작성일자: ${mmaker.regDate}</p>
						<p class="text-sm text-gray-600">수정일자: ${mmaker.updateDate}</p>
					</div>
					<div class="btns mt-2">
						<c:choose>
							<c:when test="${mmaker.actorCanChangeData}">
								<!-- "모임수정" 및 "모임삭제" 버튼 -->
								<a class="btn-text-link btn btn-active btn-ghost"
									href="modify?id=${mmaker.id}">모임수정</a>
								<a class="btn-text-link btn btn-active btn-ghost"
									href="doDelete?id=${mmaker.id}"
									onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">모임삭제</a>
							</c:when>
							<c:otherwise>
								<!-- "참여신청" 및 "참여취소" 버튼 -->
								<a class="btn-text-link btn btn-active btn-ghost"
									href="participation?id=${mmaker.id}">참여신청</a>
								<a class="btn-text-link btn btn-active btn-ghost"
									href="participationcancle?id=${mmaker.id}">참여취소</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<table class="table mt-4">
		<thead>
			<tr>
				<th>번호</th>
				<th>참여자</th>
				<th>참여상태</th>
				<th>참여신청관리</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${participation.no}</td>
				<td>${participation.memberId}</td>
				<td>${participation.participationStatus}</td>
				<td>${participation.participationTF}</td>
			</tr>
		</tbody>
	</table>
	<div class="btns mt-2">
		<button class="btn-text-link btn btn-active btn-ghost" type="button"
			onclick="history.back();">뒤로가기</button>
	</div>
</section>


<%@ include file="../common/footer.jsp"%>