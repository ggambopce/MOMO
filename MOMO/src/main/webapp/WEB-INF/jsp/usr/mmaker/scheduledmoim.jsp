<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="예정모임" />
<%@ include file="../common/header.jsp" %>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
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
			
			<div class="btns mt-2">
				<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
				<c:if test="${mmaker.actorCanChangeData }">
					<a class="btn-text-link btn btn-active btn-ghost" href="modify?id=${mmaker.id }">수정</a>
					<a class="btn-text-link btn btn-active btn-ghost" href="doDelete?id=${mmaker.id }" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
				</c:if>
			</div>
		</div>
	</section>
<%@ include file="../common/footer.jsp" %>