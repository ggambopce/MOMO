<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="예정모임" />
<%@ include file="../common/header.jsp"%>
<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="mb-2 flex justify-between items-end">
					<div><span>총 : ${mmakersCnt } 개</span></div>
					<c:if test="${rq.getLoginedMemberId() != 0  }">
						<a class="btn-text-link btn btn-active btn-ghost" href="write">WRITE</a>
					</c:if>
			</div>
		<div class="table-box-type-1">
			<table class="table w-full">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성일자</th>
						<th>모임장</th>
						<th>모임제목</th>
						<th>모임내용</th>
						<th>모임사진</th>
						<th>모임장소</th>
						<th>모임일시</th>
						<th>모임비</th>
						<th>모임목적</th>
						<th>모임관심사</th>
						<th>좋아요</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mmaker" items="${mmakers }">
						<tr class="hover">
							<td>${mmaker.id }</td>
							<td>${mmaker.regDate.substring(2, 16) }</td>
							<td>${mmaker.writerName }</td>
							<td><a class="hover:underline" href="detail?id=${mmaker.id }">${mmaker.moimMain }</a></td>
							<td>${mmaker.moimBody }</td>
							<td>${mmaker.moimImg }</td>
							<td>${mmaker.moimPlace }</td>
							<td>${mmaker.moimDatetime }</td>
							<td>${mmaker.moimPrice }</td>
							<td>${mmaker.moimAim }</td>
							<td>${mmaker.moimCategory }</td>
							<td>${mmaker.hitCount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>
<%@ include file="../common/footer.jsp"%>