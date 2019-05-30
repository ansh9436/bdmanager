<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록 보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardlist.css"/>
</head>
<body>
<header>	<!-- 헤더 영역 정의 -->
	<jsp:include page="../common/header.jsp" flush="false"/>
</header>
<section id="wrap">	<!-- 본문 영역 정의 -->
	<section id="lnav">	<!-- 사이드 메뉴 영역 정의 -->
		<jsp:include page="../common/lnav.jsp" flush="false"/>
	</section>
	<section id="content">	<!-- 내용 영역 정의 -->
		<h1>게시판 목록 보기</h1>
		<table border="1">
			<c:if test="${pageMaker.totalCount > 0}">
			<tr>
				<td colspan="6">
				${pageMaker.cri.pageStart}-${pageMaker.cri.pageEnd}
				[${pageMaker.cri.page}/${pageMaker.totalPageCount}]
				</td>
			</tr>
			</c:if>

			<c:choose>
			<c:when test="${list.size() == 0}">
				<tr>
					<td colspan="6">
						게시판이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td style="text-align: center" width="6%">번호</td>
					<td style="text-align: center" width="21%">게시판 이름</td>
					<td style="text-align: center" width="13%">게시판 유형</td>
					<td style="text-align: center" width="32%">URL</td>
					<td style="text-align: center" width="17%">생성일</td>
					<td style="text-align: center" width="11%">게시글 수</td>
				</tr>
				<c:forEach var="board" items="${list}">
					<tr>
						<td>${board.board_id}</td>
						<td>
							<c:set var="query" value="board_id=${board.board_id}&page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}"/>
							<a href="<c:url value="manager/read?${query}"/>">${board.board_name}</a>
						</td>
						<td>${board.board_type}</td>
						<td>${board.url}</td>
						<td><fmt:formatDate value="${board.creating_date}" 
							pattern="yyyy-MM-dd" /></td>
						<td>${board.nofArticle}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6">
						<c:if test="${pageMaker.prev == true}">
							<a href="<c:url value="/manager/list?page=${pageMaker.startPage-1}&perPageNum=${pageMaker.cri.perPageNum}"/>">이전</a>
						</c:if>
						<c:forEach var="pno" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<a href="<c:url value="/manager/list?page=${pno}&perPageNum=${pageMaker.cri.perPageNum}" />">[${pno}]</a>
						</c:forEach>
						<c:if test="${pageMaker.next == true}">
							<a href="<c:url value="/manager/list?page=${pageMaker.endPage+1}&perPageNum=${pageMaker.cri.perPageNum}"/>">다음</a>
						</c:if>
					</td>
				</tr>
			</c:otherwise>
			</c:choose>
			
			<tr>
				<td colspan="6">
					<a href="write">게시판 만들기</a>
				</td>
			</tr>	
		</table>
	</section>
</section>
<footer>	<!-- 풋터 영역 정의 -->
	<jsp:include page="../common/footer.jsp" flush="false"/>
</footer>
</body>
</html>