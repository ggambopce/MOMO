<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="지난모임" />
<%@ include file="../common/header.jsp"%>

<section class="mt-8 text-xl">
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
							<p class="text-sm text-gray-600">모임장소: ${mmaker.moimPlace}</p>
							<p class="text-sm text-gray-600">모임일시: ${mmaker.moimDatetime}</p>
							<p class="text-sm text-gray-600">모임인원: ${mmaker.moimMemberCnt}</p>
						</div>
						<div class="flex justify-between mt-2">
							<p class="text-sm text-gray-600">모임비: ${mmaker.moimPrice}</p>
							<p class="text-sm text-gray-600">조회수: ${mmaker.hitCount}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<%@ include file="../common/footer.jsp"%>