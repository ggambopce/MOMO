<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="모임 디테일" />
<%@ include file="../common/header.jsp"%>
<script>
		function getReactionPoint(){
			
			$.get('../reactionPoint/getReactionPoint', {
				relId : ${mmaker.id},
				relTypeCode : 'mmaker'
			}, function(data) {
				
				if (data.data1.sumReactionPoint > 0) {
					let goodBtn = $('#goodBtn');
					goodBtn.removeClass('btn-outline');
					goodBtn.attr('href', '../reactionPoint/doDeleteReactionPoint?relId=${mmaker.id }&relTypeCode=mmaker&point=1');
				} else if (data.data1.sumReactionPoint < 0) {
					let badBtn = $('#badBtn');
					badBtn.removeClass('btn-outline');
					badBtn.prop('href', '../reactionPoint/doDeleteReactionPoint?relId=${mmaker.id }&relTypeCode=mmaker&point=-1');
				}
				
			}, 'json');
			
		}
		
		$(function() {
			getReactionPoint();
		})
	</script>

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
					<div class="btns mt-2">
						<c:if test="${mmaker.actorCanChangeData }">
							<a class="btn-text-link btn btn-active btn-ghost"
								href="modify?id=${mmaker.id }">수정</a>
							<a class="btn-text-link btn btn-active btn-ghost"
								href="doDelete?id=${mmaker.id }"
								onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
						</c:if>
					</div>
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
				</div>
			</div>
		</div>
	</div>
	<div class="btns mt-2">
		<button class="btn-text-link btn btn-active btn-ghost" type="button"
			onclick="history.back();">뒤로가기</button>
	</div>
</section>


<%@ include file="../common/footer.jsp"%>