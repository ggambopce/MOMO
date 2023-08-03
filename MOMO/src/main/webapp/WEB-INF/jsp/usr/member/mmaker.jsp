<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="모임만들기" />
<%@ include file="../common/header.jsp"%>
<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<form action="/usr/Mmaker/doWrite" method="POST">
			<div class="table-box-type-1">
				<table>
					<colgroup>
						<col width="200" />
					</colgroup>
					<tbody>
						<tr>
							<th>모임제목</th>
							<td><input class="input input-bordered w-full max-w-xs"
								type="text" name="moimMain" placeholder="모임제목을 입력해주세요" /></td>
						</tr>
						<tr>
							<th>모임내용</th>
							<td><textarea class="textarea textarea-bordered w-full"
									name="moimBody" placeholder="내용을 입력해주세요"></textarea></td>
						</tr>
						<tr>
							<th>모임사진</th>
							<td><input class="input input-bordered w-full max-w-xs"
								type="text" name="moimImg" placeholder="모임사진을 입력해주세요" /></td>
						</tr>
						<tr>
							<th>모임일시</th>
							<td><input class="input input-bordered w-full max-w-xs"
								type="text" name="moimDatetime" placeholder="모임일시를 입력해주세요" /></td>
						</tr>
						<tr>
							<th>모임장소</th>
							<td><input class="input input-bordered w-full max-w-xs"
								type="text" name="moimPlace" placeholder="모임장소를 입력해주세요" /></td>
						</tr>
						<tr>
							<th>모임인원</th>
							<td><input class="input input-bordered w-full max-w-xs"
								type="text" name="moimMemberCnt" placeholder="모임장소를 입력해주세요" /></td>
						</tr>
						<tr>
							<th>모임비</th>
							<td><input class="input input-bordered w-full max-w-xs"
								type="text" name="moimPrice" placeholder="모임비를 입력해주세요" /></td>
						</tr>
						<tr>
							<th>모임목적</th>
							<td><label> <input type="radio" name="moimAim"
									value="1" checked /> &nbsp;재미 
							</label> &nbsp;&nbsp;&nbsp; <label> <input type="radio"
									name="moimAim" value="2" /> &nbsp;성장
							</label></td>
						</tr>
						<tr>
							<th>관심사</th>
							<td><label> <input type="radio" name="moimCategory"
									value="1" checked /> &nbsp;독서 
							</label> &nbsp;&nbsp; <label> <input type="radio"
									name="moimCategory" value="2" /> &nbsp;운동
							</label>&nbsp;&nbsp; <label> <input type="radio"
									name="moimCategory" value="3" /> &nbsp;영화
							</label>&nbsp;&nbsp; <label> <input type="radio"
									name="moimCategory" value="4" /> &nbsp;와인
							</label></td>
						</tr>

						<tr>
							<td colspan="2"><button class="btn-text-link btn btn-active">모임만들기</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		<div class="btns mt-2">
			<button class="btn-text-link btn btn-active" type="button"
				onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>
<%@ include file="../common/footer.jsp"%>