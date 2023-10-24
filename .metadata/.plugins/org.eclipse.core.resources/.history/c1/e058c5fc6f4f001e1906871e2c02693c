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
			<div class="table-box-type-1">
				<table class="table table-zebra">
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
							<th>제목</th>
							<td>${mmaker.moimMain }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>${mmaker.moimBody }</td>
						</tr>
					</tbody>
				</table>
			</div>
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
							<p class="text-sm text-gray-600">모임인원:
								${mmaker.moimMemberCnt}</p>
						</div>
						<div class="flex justify-between mt-2">
							<p class="text-sm text-gray-600">모임비: ${mmaker.moimPrice}</p>
							<p class="text-sm text-gray-600">조회수: ${mmaker.hitCount}</p>
							<p class="text-sm text-gray-600">작성일자: ${mmaker.regDate}</p>
							<p class="text-sm text-gray-600">수정일자: ${mmaker.updateDate}</p>
							<%-- 	<tr>
								<td><c:if test="${rq.getLoginedMemberId() == 0 }">
										<span class="ml-2 badge">좋아요 : ${mmaker.goodReactionPoint }</span>
									<br />
									<span class="ml-2 badge">싫어요 : ${mmaker.badReactionPoint * -1 }</span>
									</c:if> <c:if test="${rq.getLoginedMemberId() != 0 }">
										<a id="goodBtn" class="btn btn-outline btn-xs" href="../reactionPoint/doInsertReactionPoint?relId=${mmaker.id }&relTypeCode=mmaker&point=1">좋아요👍</a>
										<span class="ml-2 badge">좋아요 :
											${mmaker.goodReactionPoint }</span>
										<br />
										<a id="badBtn" class="btn btn-outline btn-xs" href="../reactionPoint/doInsertReactionPoint?relId=${mmaker.id }&relTypeCode=mmaker&point=-1">싫어요👎</a>
										<span class="ml-2 badge">싫어요 :
											${mmaker.badReactionPoint * -1 }</span>
									</c:if></td>
							</tr> --%>
						</div>
					</div>
				</div>
		</div>
	</div>
	<div class="btns mt-2">
		<button class="btn-text-link btn btn-active btn-ghost" type="button"
			onclick="history.back();">뒤로가기</button>
		<c:if test="${mmaker.actorCanChangeData }">
			<a class="btn-text-link btn btn-active btn-ghost"
				href="modify?id=${mmaker.id }">수정</a>
			<a class="btn-text-link btn btn-active btn-ghost"
				href="doDelete?id=${mmaker.id }"
				onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
		</c:if>
	</div>
</section>

<script>
		function replyWrite_submitForm(form) {
			
			form.body.value = form.body.value.trim();
			
			if (form.body.value.length < 2) {
				alert('2글자 이상 입력해주세요');
				form.body.focus();
				return;
			}
			
			form.submit();
		}
		
		originalForm = null;
		originalId = null;
		
		function replyModify_getForm(replyId, i) {
			
			if (originalForm != null) {
				replyModify_cancle(originalId);
			}
			
			$.get('../reply/getReplyContent', {
				id : replyId
			}, function(data) {
				let replyContent = $('#' + i);
				
				originalId = i;
				originalForm = replyContent.html();
				
				let addHtml = `
					<form action="../reply/doModify" method="POST" onsubmit="replyWrite_submitForm(this); return false;">
						<input type="hidden" name="id" value="\${data.data1.id }" />
						<div class="mt-2 border border-gray-400 rounded-lg text-base p-4">
							<div class="mb-2"><span>\${data.data1.writerName}</span></div>
							<textarea class="textarea textarea-bordered w-full" name="body" placeholder="댓글을 남겨보세요">\${data.data1.body }</textarea>
							<div class="flex justify-end">
								<a onclick="replyModify_cancle(\${i});" class="btn-text-link btn btn-active btn-sm mr-2">취소</a>
								<button class="btn-text-link btn btn-active btn-sm">등록</button>
							</div>
						</div>
					</form>
					`;
					
				replyContent.empty().html("");
				replyContent.append(addHtml);
				
			}, 'json');
		}
		
		function replyModify_cancle(i) {
			let replyContent = $('#' + i);
			replyContent.html(originalForm);
			
			originalForm = null;
			originalId = null;
		}
	</script>

<section class="my-5 text-xl">
	<div class="container mx-auto px-3">
		<h2>댓글</h2>

		<c:forEach var="reply" items="${replies }" varStatus="status">
			<div id="${status.count }"
				class="py-2 pl-16 border-bottom-line text-base">
				<div class="flex justify-between items-end">
					<div class="font-semibold">
						<span>${reply.writerName }</span>
					</div>
					<c:if test="${reply.actorCanChangeData }">
						<div class="dropdown">
							<button class="btn btn-circle btn-ghost btn-sm mr-8">
								<svg xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 24 24" class="inline-block w-5 h-5 stroke-current">
									<path stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2"
										d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path></svg>
							</button>
							<ul tabindex="0"
								class="menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box w-20">
								<li><a
									onclick="replyModify_getForm(${reply.id }, ${status.count });">수정</a></li>
								<li><a href="../reply/doDelete?id=${reply.id }"
									onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a></li>
							</ul>
						</div>
					</c:if>
				</div>
				<div class="my-1 text-lg pl-2">
					<span>${reply.getForPrintBody() }</span>
				</div>
				<div class="text-xs text-gray-400">
					<span>${reply.updateDate }</span>
				</div>
			</div>
		</c:forEach>

		<c:if test="${rq.getLoginedMemberId() != 0 }">
			<form action="../reply/doWrite" method="POST"
				onsubmit="replyWrite_submitForm(this); return false;">
				<input type="hidden" name="relTypeCode" value="mmaker" /> <input
					type="hidden" name="relId" value="${mmaker.id }" />
				<div class="mt-4 border border-gray-400 rounded-lg text-base p-4">
					<div class="mb-2">
						<span>${rq.getLoginedMember().getNickname() }</span>
					</div>
					<!-- 						밑의 방식으로도 가능함 -->
					<%-- 						<div class="mb-2"><span>${rq.loginedMember.nickname }</span></div> --%>
					<textarea class="textarea textarea-bordered w-full" name="body"
						placeholder="댓글을 남겨보세요"></textarea>
					<div class="flex justify-end">
						<button class="btn-text-link btn btn-active btn-sm">등록</button>
					</div>
				</div>
			</form>
		</c:if>
	</div>
</section>


<%@ include file="../common/footer.jsp"%>