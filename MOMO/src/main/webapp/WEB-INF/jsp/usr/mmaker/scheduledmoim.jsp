<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="${board.name } 예정 게시판" />
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
						<th>모임제목</th>
						<th>모임내용</th>
						<th>모임사진</th>
						<th>모임장</th>
						<th>모임장소</th>
						<th>모임일시</th>
						<th>모임비</th>
						<th>모임목적</th>
						<th>모임관심사</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mmaker" items="${mmakers }">
						<tr class="hover">
							<td>${mmaker.id }</td>
							<td>${mmaker.regDate.substring(2, 16) }</td>
							<td><a class="hover:underline" href="detail?id=${mmaker.id }">${mmaker.title }</a></td>
							<td>${mmaker.writerName }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>
<%@ include file="../common/footer.jsp"%>