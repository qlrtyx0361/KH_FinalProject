<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${b.bookName}</title>
	<c:import url="../common/header.jsp"/>
	<style>
		.selector img {
			position: absolute; top:0; left: 0;
			width: 100%;
			height: 100%;
		}
		
		td {
			padding: 0 10px;
			height: 36px;
		}
		
		.book-info {
			height: 600px;
		}
	</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrapper px-md-4">
						<div class="row no-gutters">
							<div class="col-md-7">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<div class="row">
										<div class="col-md-12">
											<table>
												<tr><td colspan=2><h2>${b.bookName}</h2></td></tr>
												<tr>
													<td>지은이</td>
													<td>${b.bookWriter}</td>
												</tr>
												<tr>
													<td>출판사</td>
													<td>${b.bookPublisher}</td>
												</tr>
												<tr>
													<td>출간일</td>
													<td>${b.bookPublicationDate}</td>
												</tr>
												<tr>
													<td>정가</td>
													<td>${b.bookPrice}</td>
												</tr>
												<tr>
													<td>판매가</td>
													<td>${b.bookSellPrice}</td>
												</tr>
												<tr>
													<td>포인트</td>
													<td>${b.bookPoint}</td>
												</tr>
												<tr>
													<td>배송비</td>
													<td>
														<c:if test="${b.bookPrice ge 10000}">무료</c:if><c:if test="${b.bookPrice lt 10000}">2500원</c:if>
													</td>
												</tr>
												<tr>
													<td>ISBN</td>
													<td>${b.isbn}</td>
												</tr>
												<tr>
													<td>페이지 수</td>
													<td>${b.bookPage}</td>
												</tr>
												<tr>
													<td>무게</td>
													<td>${b.bookWeight}</td>
												</tr>
												<tr>
													<td>수량</td>
													<td>
														<input type="number" name="cartCount" id="cartCount" maxlength="3" value="1"/>
														<div style="padding:0; display:none;" id="totalDiv">
															총 상품금액 <span id="totalPrice"></span>원
														</div>
													</td>
												</tr>
											</table>
											<br />
											<button class="btn btn-primary">장바구니 담기</button>
											<button class="btn btn-success">바로 구매</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-5 order-md-first d-flex align-items-stretch">
								<div id="carousel" class="carousel slide" data-ride="carousel">
									<ol class="carousel-indicators">
										<c:forEach var="bi" items="${biList}" varStatus="vs">
										<li data-target="#carousel" data-slide-to="${vs.index}" <c:if test="${vs.index eq 0}">class="active"</c:if>></li>
										</c:forEach>
									</ol>
									<div class="carousel-inner">
										<c:forEach var="bi" items="${biList}" varStatus="vs">
										<div class="carousel-item" id="item${vs.index}">
											<img class="d-block w-100" src="${pageContext.request.contextPath}/resources/bookUpload/${bi.fileName}" alt="이미지">
										</div>
										</c:forEach>
									</div>
									<a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a>
									<a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$('#item0').addClass('active');
		
		$('#cartCount').on('change', function() {
			if($(this).val() > 1) {
				$('#totalDiv').css('display', 'inline');
				$('#totalPrice').html(${b.bookSellPrice} * $(this).val());
			} else {
				$('#totalDiv').css('display', 'none');
			}
		});
	</script>
</body>
</html>