<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="모임 디테일" />
<%@ include file="../common/header.jsp"%>


<script>

	/*
	const params = {};
	params.id = parseInt('${param.id}');
	
	function MmakerDetail_doParticipation() {
		$.get('../Mmaker/doParticipation', {
			id : params.id
		}, function(data){
			
			$('#').empty().html(data.data1);
			
		}, 'json')			
	}
	
	MmakerDetail_doParticipation();
	*/
	
	// jQuery를 사용하여 클릭 이벤트 처리	
	$(function() {
		 console.log("Ready!");
		    // #myLink 요소를 클릭했을 때의 이벤트 핸들러
		    $("#idParticipationAdd").click(function(event) {
		        // 클릭 이벤트 발생 시의 동작
		        console.log("Link clicked!");
		        
		        var postData = {
		        	    "id": 999999,
		        	    "regDate": null,
		        	    "updateDate": null,
		        	    "memberId": null,
		        	    "relTypeCode": null,
		        	    "relId": 0,
		        	    "participationStatus": null,
		        	    "participationTF": null
		        	    };
		        
		        $.ajax({
		            url: "/api/post",
		            type: "POST",
		            contentType: "application/json",
		            data: JSON.stringify(postData),
		            success: function(response) {
		                // 성공적으로 응답 받았을 때의 처리
		                console.log("Response:", response);
		            },
		            error: function(xhr, status, error) {
		                // 요청이 실패했을 때의 처리
		                console.error("Request failed with status", status, error);
		            }
		        });
		        
		        event.preventDefault();
		    });
		});
</script>


<section class="text-xl" style="margin-top: -20px;">
    <div class="container mx-auto px-3">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-0" style="margin-top: -30px;">
            <div class="border rounded-lg overflow-hidden md:col-span-1" style="border: 4px solid #f56a6a;">
                <img src="${mmaker.moimImg}" class="w-full h-40 object-cover" alt="Moim Image">
                <div class="p-4">
                    <h2 class="text-lg font-semibold">
                        <a href="detail?id=${mmaker.id}" class="hover:underline">${mmaker.moimMain}</a>
                    </h2>
                    <p class="text-sm text-gray-500">${mmaker.writerName} ${mmaker.regDate.substring(2, 16)}</p>
                    <div class="flex-col mt-4">
                        <p class="text-sm text-gray-600">장소: ${mmaker.moimPlace}</p>
                        <p class="text-sm text-gray-600">일시: ${mmaker.moimDatetime}</p>
                        <p class="text-sm text-gray-600">인원: ${mmaker.moimMemberCnt}</p>
                        <p class="text-sm text-gray-600">모임비: ${mmaker.moimPrice}원</p>
                    </div>
                    <div class="btns mt-2">
                        <c:choose>
                            <c:when test="${mmaker.actorCanChangeData}">
                                <!-- "모임수정" 및 "모임삭제" 버튼 -->
                                <a class="btn-text-link btn btn-active btn-ghost" href="modify?id=${mmaker.id}">모임수정</a>
                                <a class="btn-text-link btn btn-active btn-ghost" href="doDelete?id=${mmaker.id}" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">모임삭제</a>
                            </c:when>
                            <c:otherwise>
                                <!-- "참여신청" 및 "참여취소" 버튼 -->
                                <a class="btn-text-link btn btn-active btn-ghost" id="idParticipationAdd">참여신청</a>
                                <a class="btn-text-link btn btn-active btn-ghost" href="participationcancle?id=${mmaker.id}">참여취소</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="md:col-span-2" style="margin-left: 5px; border: 4px solid #f56a6a; border-radius: 10px;">
                <p class="text-gray-600">${mmaker.moimBody}</p>
            </div>
            <div class="md:col-span-3" style="margin-top: 5px; border: 4px solid #f56a6a; border-radius: 10px;">
                <table class="text-gray-600" style="width: 100%; height: 100%; background-color: white;">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>참여자</th>
                            <th>참여상태</th>
                        </tr>
                    </thead>
                    <tbody id="ajaxParticipation">
                        <tr>
                            <td>${participation.id}1</td>
                            <td>${participation.memberId}이재용</td>
                            <td>${participation.participationStatus}참여</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="btns mt-2">
        <button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
    </div>
</section>


<%@ include file="../common/footer.jsp"%>