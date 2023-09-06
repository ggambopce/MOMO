<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="모임수정 " />
<%@ include file="../common/header.jsp" %>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doModify" method="POST">
				<input type="hidden" name="id" value="${mmaker.id }"/>
				<div class="table-box-type-1">
					<table  class="table table-zebra w-full">
						<colgroup>
							<col width="200" />
						</colgroup>
						<tbody>
							<tr>
								<th>번호</th>
								<td><div class="badge">${mmaker.id }</div></td>
							</tr>
							<tr>
								<th>작성날짜</th>
								<td>${mmaker.regDate }</td>
							</tr>
							<tr>
								<th>수정날짜</th>
								<td>${mmaker.updateDate }</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${mmaker.writerName }</td>
							</tr>
							<tr>
								<th>모임제목</th>
								<td><input class="input input-bordered w-full" type="text" name="moimMain" value="${mmaker.moimMain }" placeholder="모임제목을 입력해주세요"/></td>
							</tr>
							<tr>
								<th>모임내용</th>
								<td><textarea class="textarea textarea-bordered w-full" name="moimBody" placeholder="모임내용을 입력해주세요">${mmaker.moimBody }</textarea></td>
							</tr>
							<tr>
								<th>모임장소</th>
								<td><input class="input input-bordered w-full" type="text" name="moimPlace" value="${mmaker.moimPlace }" placeholder="모임장소를 입력해주세요"/></td>
							</tr>
							<tr>
								<th>모임비</th>
								<td><input class="input input-bordered w-full" type="text" name="moimPrice" value="${mmaker.moimPrice }" placeholder="모임비를 입력해주세요"/></td>
							</tr>
							
						<td colspan="2"><button class="btn-text-link btn btn-active btn-ghost">수정</button></td>
						</tbody>
					</table>
				</div>
			</form>
			<div class="btns mt-2">
				<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
	
	<script>
		function getReactionPoint(){
			
			$.get('../reactionPoint/getReactionPoint', {
				relId : ${mmaker.id},
				relTypeCode : 'mmaker'
			}, function(data) {
				
				if (data.data1.sumReactionPoint > 0) {
					let goodBtn = $('#goodBtn');
					goodBtn.removeClass('btn-outline');
					goodBtn.attr('href', '../reactionPoint/doDeleteReactionPoint?relId=${mmaker.id }&relTypeCode=article&point=1');
				} else if (data.data1.sumReactionPoint < 0) {
					let badBtn = $('#badBtn');
					badBtn.removeClass('btn-outline');
					badBtn.prop('href', '../reactionPoint/doDeleteReactionPoint?relId=${article.id }&relTypeCode=article&point=-1');
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
						</div>
						<div class="flex justify-between mt-2">
							<p class="text-sm text-gray-600">모임비: ${mmaker.moimPrice}</p>
							<p class="text-sm text-gray-600">조회수: ${mmaker.hitCount}</p>
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
							</tr>			
						</div>
					</div>
				</div>
			</c:forEach>
		</div>



	</div>
	</div>
</section>
<%@ include file="../common/footer.jsp" %>