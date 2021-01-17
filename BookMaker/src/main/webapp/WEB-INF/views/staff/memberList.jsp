<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 관리</title>
	<c:import url="../common/header.jsp"/>
	<style>
		table {
			text-align: center;
		}
	</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="container">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th style="width: 10%;">No</th>
					<th style="width: 30%;">아이디</th>
					<th style="width: 20%;">이름</th>
					<th style="width: 20%;">등급</th>
					<th style="width: 20%;">멤버십 등급</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${list}">
				<c:if test="${member.memberNo ne m.memberNo}">
				<tr id="${m.memberNo}">
					<td>${m.memberNo}</td>
					<td>${m.memberId}</td>
					<td>${m.name}</td>
					<td>
						<select>
							<option value="MEMBER">MEMBER</option>
							<option value="STAFF">STAFF</option>
						</select>
						<input type="hidden" value="${m.memberType}" />
					</td>
					<td>${m.gradeName}</td>
				</tr>
				</c:if>
				</c:forEach>
			</tbody>
		</table>
		<c:out value="${pageBar}" escapeXml="false"/>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$(function() {
			alert('1234');
			$('tr[id]').each(function() {
				$(this).children().eq(1).on("click", function(){
					var memberNo = $(this).parent().attr("id");

					location.href = "${pageContext.request.contextPath}/staff/memberDetail.do?memberNo=" + memberNo;
				});
			});

			$('tr[id]').each(function() {
				$(this).children().eq(1).on('mouseenter', function() {
					$(this).css('cursor', 'pointer');
				}).on('mouseleave', function() {
					$(this).css('cursor', 'default');
				});
			});

			$('tr>td').parent().on('mouseenter', function() {
				$(this).attr('class', 'table-active');
			}).on('mouseleave', function() {
				$(this).removeAttr('class', 'table-active');
			});

			$('select').each(function() {
				if($(this).next().val() == 'MEMBER') {
					$(this).children().eq(0).attr('selected', 'selected');
				} else {
					$(this).children().eq(1).attr('selected', 'selected');
				}
			});
		});

		$('select').on('change', function() {
			var memberNo = $(this).parent().parent().attr('id');
			var memberType = $(this).children('option:selected').val();
			
			$.ajax({
	            url  : "${pageContext.request.contextPath}/staff/updateMemberType.do",
	            data : { memberNo : memberNo, memberType : memberType},
	            dataType: "json",
	            success : function(data){
	                if (data == true) {
		            	alert('등급 변경 성공');
		            } else {
			            alert('등급 변경 실패');
			        }
	            }, error : function(jqxhr, textStatus, errorThrown){
	            	console.log("ajax 처리 실패");
	                //에러로그
	                console.log(jqxhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            }
        	});
		});
	</script>
</body>
</html>