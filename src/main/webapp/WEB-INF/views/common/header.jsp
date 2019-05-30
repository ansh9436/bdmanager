<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 게시판 관리 기능에 의하여 게시판의 추가, 삭제, 변경 등에 대한 처리를 하는 javascript 파일 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css"/>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<nav>
	<div id="gnbMenu">
		<ul id="gnb">
			<li class="item" id="item1">
				<a href="" class="menu">지식창고</a>
				<div class="sub" id="sub1">
					<ul class="subGnb" id="subGnb1">
						<!-- 게시판 추가로 게시판 보기로 추가될 li 영역 -->
						<!-- 
						<li><a href="${pageContext.request.contextPath}/article/list?board_id=1&p=1">시 모음</a></li>
						 -->
					</ul>
				</div>
			</li>
			<li class="item" id="item2">
				<a class="menu" href="<c:url value="/manager/list"/>">관리자</a>
			</li>
		</ul>
	</div>
</nav>