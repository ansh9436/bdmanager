<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css"/>
</head>
<body>
<header>	<!-- 헤더 영역 정의 -->
	<jsp:include page="common/header.jsp" flush="false"/>
</header>
<section id="wrap">	<!-- 본문 영역 정의 -->
	<section id="lnav">	<!-- 사이드 메뉴 영역 정의 -->
		<jsp:include page="common/lnav.jsp" flush="false"/>
	</section>
	<section id="content">	<!-- 내용 영역 정의 -->
	
	</section>
</section>
<footer>	<!-- 풋터 영역 정의 -->
	<jsp:include page="common/footer.jsp" flush="false"/>
</footer>
</body>
</html>