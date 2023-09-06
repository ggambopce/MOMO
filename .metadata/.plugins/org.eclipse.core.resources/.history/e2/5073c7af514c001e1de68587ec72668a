<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Modify" />
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
<%@ include file="../common/footer.jsp" %>