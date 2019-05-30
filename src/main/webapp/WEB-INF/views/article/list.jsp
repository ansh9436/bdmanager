<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록 보기</title>
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
		<h1>게시판 이름 : ${board.board_name}</h1>
		<table>
			<c:if test="${pageMaker.totalCount > 0}"><!-- 게시글이 있는지 검사 -->
			<tr>
				<td colspan="5"><!-- 페이지에 대한 정보를 표시 -->
				${pageMaker.cri.pageStart}-${pageMaker.cri.pageEnd}
				[${pageMaker.cri.page}/${pageMaker.totalPageCount}]
				</td>
			</tr>
			</c:if>

			<c:choose>
			<c:when test="${list.size() == 0}"><!-- 게시글이 없을 때 안내문 표시 -->
				<tr>
					<td colspan="5">
						게시글이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr><!-- 게시글에 대한 표시 타이틀 부분 -->
					<td class="title_head" width="9%">번호</td>
					<td class="title_head" width="54%">제목</td>
					<td class="title_head" width="11%">작성자</td>
					<td class="title_head" width="17%">작성일</td>
					<td class="title_head" width="9%">조회수</td>
				</tr>
				<c:forEach var="article" items="${list}"><!-- 각 게시글에 대하여 -->
					<tr>
						<td>${article.article_id}</td>
						<td width="40%">
							<c:if test="${article.depth > 0}"><!-- 댓글에 대한 depth 표시 -->
								<c:forEach begin="1" end="${article.depth}">-</c:forEach>&gt;
							</c:if>
							<c:if test="${article.secret == 'T'}"><!-- 제목 처리 (비밀글 여부에 따라 다르게 처리)-->
								<c:choose>
									<c:when test="${sessionScope.member.category == 'admin'}">
										<c:set var="query" value="article_id=${article.article_id}&page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}"/>
										<a href="<c:url value="/article/read?${query}"/>">${fn:substring(article.title, 0, 28)}</a>
									</c:when>
									<c:when test="${sessionScope.id == article.email}">
										<c:set var="query" value="article_id=${article.article_id}&page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}"/>
										<a href="<c:url value="/article/read?${query}"/>">${fn:substring(article.title, 0, 28)}</a>
									</c:when>
									<c:otherwise>
										${fn:substring(article.title, 0, 28)}
									</c:otherwise>
								</c:choose>
								&nbsp;<img width="13px" height="13px" alt="*" src="<c:url value="/resources/images/secret_image.png"/>">
							</c:if>
							<c:if test="${article.secret != 'T'}">
								<c:choose>
								<c:when test="${board.read_allow == 'all'}">
									<c:set var="query" value="article_id=${article.article_id}&page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}"/>
									<a href="<c:url value="/article/read?${query}"/>">${fn:substring(article.title, 0, 28)}</a>
								</c:when>
								<c:when test="${board.read_allow == 'login' && sessionScope.id != null}">
									<c:set var="query" value="article_id=${article.article_id}&page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}"/>
									<a href="<c:url value="/board/read?${query}"/>">${fn:substring(article.title, 0, 28)}</a>
								</c:when>
								<c:when test="${board.read_allow == 'login' && sessionScope.id == null}">
									${fn:substring(article.title, 0, 28)}
								</c:when>
								<c:when test="${sessionScope.id != null && sessionScope.member.category == board.read_allow}">
									<c:set var="query" value="article_id=${article.article_id}&page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}"/>
									<a href="<c:url value="/article/read?${query}"/>">${fn:substring(article.title, 0, 28)}</a>
								</c:when>
								<c:otherwise>
									${fn:substring(article.title, 0, 28)}
								</c:otherwise>
								</c:choose>
							</c:if>
						</td>
						<td>${article.writer_name}</td>
						<td><fmt:formatDate value="${article.createdAt}" pattern="yyyy-MM-dd" /></td>
						<td>${article.read_count}</td>
					</tr>
					<c:choose>
					<c:when test="${board.display_format==2}"><!-- 본문의 표시 방법 처리 -->
						<tr>
							<td colspan="5">${fn:substring(article.content, 0, 200)}</td>
						</tr>
					</c:when>
					<c:when test="${board.display_format==3}">
						<tr>
							<td colspan="5">${article.content}</td>
						</tr>
					</c:when>
					</c:choose>
				</c:forEach>
				<tr>
					<td colspan="5"><!-- 페이징 처리(링크 표시) -->
						<c:if test="${pageMaker.prev == true}">
							<a href="<c:url value="/article/list?board_id=${board.board_id}&page=${pageMaker.startPage-1}&perPageNum=${pageMaker.cri.perPageNum}"/>">이전</a>
						</c:if>
						<c:forEach var="pno" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<a href="<c:url value="/article/list?board_id=${board.board_id}&page=${pno}&perPageNum=${pageMaker.cri.perPageNum}" />">[${pno}]</a>
						</c:forEach>
						<c:if test="${pageMaker.next == true}">
							<a href="<c:url value="/article/list?board_id=${board.board_id}&page=${pageMaker.endPage+1}&perPageNum=${pageMaker.cri.perPageNum}"/>">다음</a>
						</c:if>
					</td>
				</tr>
			</c:otherwise>
			</c:choose>
			<!-- 글쓰기 권한에 따른 글쓰기 허용여부 처리 -->
			<c:choose>
				<c:when test="${board.write_allow == 'all'}">
					<tr>
						<td colspan="5"><a href="write?board_id=${board.board_id}">글쓰기</a></td>
					</tr>
				</c:when>
				<c:when test="${board.write_allow == 'login' && sessionScope.id != null}">
					<tr>
						<td colspan="5"><a href="write?board_id=${board.board_id}">글쓰기</a></td>
					</tr>
				</c:when>
				<c:when test="${sessionScope.id != null && sessionScope.member.category == board.write_allow}">
					<tr>
						<td colspan="5"><a href="write?board_id=${board.board_id}">글쓰기</a></td>
					</tr>
				</c:when>
			</c:choose>
		</table>
	</section>
</section>
<footer>	<!-- 풋터 영역 정의 -->
	<jsp:include page="../common/footer.jsp" flush="false"/>
</footer>
</body>
</html>