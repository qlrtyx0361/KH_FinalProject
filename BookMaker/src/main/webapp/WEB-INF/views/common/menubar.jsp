<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="header">
	<div class="container-fluid px-md-5  pt-4 pt-md-5">
		<div class="row justify-content-between">
			<div class="col-md-8 order-md-last">
				<div class="row">
					<div class="col-md-6 text-center">
					<div >
					<img src="../images/로고.jpg" alt="로고">
					</div>
						<a class="navbar-brand" href="index.jsp" >책 사 <span>Book Maker</span> <small>책을 사랑하는 사람들</small></a>
						
						
					</div>
					<div class="col-md-6 d-md-flex justify-content-end mb-md-0 mb-3">
						<form action="#" class="searchform order-lg-last">
		          			<div class="form-group d-flex">
		            			<input type="text" class="form-control pl-3" placeholder="Search">
		            			<button type="submit" placeholder="" class="form-control search"><span class="fa fa-search"></span></button>
		          			</div>
		        		</form>
					</div>
					<div>
						<c:if test="${empty member}">
		      
		                     <button class="btn btn-outline-success my-2 my-sm-0" type="button" data-toggle="modal" data-target="#loginModal">로그인</button>
		                     &nbsp;
		                     <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do'">회원가입</button>
		                 </c:if>
		                 <c:if test="${!empty member}">
		                     <span><a href="${pageContext.request.contextPath}/member/memberView.do?userId=${member.userId}" title="내정보보기">${member.userName}</a> 님, 안녕하세요</span>
		                    
		                     &nbsp;
		                     <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">로그아웃</button>
		                 </c:if>
					</div>
				</div>
			</div>
			<div class="col-md-4 d-flex">
				
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container-fluid">
	    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	    		<span class="fa fa-bars"></span> Menu
	    	</button>
	    	<div class="collapse navbar-collapse" id="ftco-nav">
		        <ul class="navbar-nav m-auto">
		        	<li class="nav-item"><a href="#" class="nav-link">Home</a></li>
		        	<li class="nav-item"><a href="${pageContext.request.contextPath}/views/book/about.jsp" class="nav-link">About</a></li>
		        	<li class="nav-item"><a href="#" class="nav-link">Coming Soon</a></li>
		        	<li class="nav-item"><a href="#" class="nav-link">Top Seller</a></li>
		        	<li class="nav-item active"><a href="#" class="nav-link">Books</a></li>
		        	<li class="nav-item"><a href="#" class="nav-link">Author</a></li>
		        	<li class="nav-item"><a href="#" class="nav-link">Blog</a></li>
		        	<li class="nav-item"><a href="#" class="nav-link">Contact</a></li>
		        </ul>
			</div>
		</div>
	</nav>
</div>