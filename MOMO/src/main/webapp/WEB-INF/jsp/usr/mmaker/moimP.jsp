<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="지난모임" />
<%@ include file="../common/header.jsp"%>

<section class="mt-8 text-xl"style="margin-top: -20px;">
	<div class="container mx-auto px-3" style="margin-top: -30px;">
		<div class="grid grid-cols-3 gap-4">
			<c:forEach var="mmaker" items="${mmakers}">
				<div class="border rounded-lg overflow-hidden" style="border: 4px solid #f56a6a; border-radius: 10px;">
					<img src="${mmaker.moimImg}" class="w-full h-60 object-cover"
						alt="Moim Image">
					<div class="p-4">
						<h2 class="text-gray-400 font-semibold">
							<a href="detail?id=${mmaker.id}" class="hover:underline">${mmaker.moimMain}</a>
						</h2>
						<p class="text-sm text-gray-500">${mmaker.writerName}|
							${mmaker.regDate.substring(2, 10)}</p>
						<div class="flex-col mt-4">
							<p class="text-sm text-gray-600">장&nbsp;&nbsp;&nbsp;소: ${mmaker.moimPlace}</p>
							<p class="text-sm text-gray-600">일&nbsp;&nbsp;&nbsp;시: ${mmaker.moimDatetime}</p>
						    <p class="text-sm text-gray-600">인&nbsp;&nbsp;&nbsp;원: ${mmaker.moimMemberCnt}명</p>
							<p class="text-sm text-gray-600">모임비: ${mmaker.moimPrice}원 </p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>





<%@ include file="../common/footer.jsp"%>