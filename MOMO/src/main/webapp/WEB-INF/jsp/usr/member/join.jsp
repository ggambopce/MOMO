<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Join" />
<%@ include file="../common/header.jsp" %>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="/usr/member/doJoin" method="POST">
				<div class="table-box-type-1">
					<table>
						<colgroup>
							<col width="200" />
						</colgroup>
						<tbody>
							<tr>
								<th>아이디</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="loginId" placeholder="아이디를 입력해주세요"/></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="loginPw" placeholder="비밀번호를 입력해주세요"/></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="loginPwChk" placeholder="비밀번호확인을 입력해주세요"/></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="name" placeholder="이름을 입력해주세요"/></td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="nickname" placeholder="닉네임을 입력해주세요"/></td>
							</tr>
							<tr>
								<th>성별</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="gender" placeholder="성별을 입력해주세요"/></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="birthday" placeholder="생년월일을 입력해주세요"/></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<div class="btns mt-2">
				<button class="btn-text-link btn btn-active" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
<%@ include file="../common/footer.jsp" %>