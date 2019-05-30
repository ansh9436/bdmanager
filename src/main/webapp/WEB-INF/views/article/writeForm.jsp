<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 쓰기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/articlewrite.css"/>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"></script>
<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/articlewrite.js"/>"></script>
</head>
<body>
<c:choose>
<c:when test="${param.article_id != null}">
	<c:set var="num" value="${param.article_id}"/>
	<c:set var="ref" value="${param.ref}"/>
	<c:set var="step" value="${param.step}"/>
	<c:set var="depth" value="${param.depth}"/>
</c:when>
<c:otherwise>
	<c:set var="num" value="0"/>
	<c:set var="ref" value="1"/>
	<c:set var="step" value="0"/>
	<c:set var="depth" value="0"/>
</c:otherwise>
</c:choose>
<header>	<!-- 헤더 영역 정의 -->
	<jsp:include page="../common/header.jsp" flush="false"/>
</header>
<section id="wrap">	<!-- 본문 영역 정의 -->
	<section id="lnav">	<!-- 사이드 메뉴 영역 정의 -->
		<jsp:include page="../common/lnav.jsp" flush="false"/>
	</section>
	<section id="content">	<!-- 내용 영역 정의 -->
		<c:if test="${num == 0}">
			<h2>게시글 작성</h2>
		</c:if>
		<c:if test="${num != 0}">
			<h2>댓글 작성</h2>
		</c:if>
		<form action="<c:url value='write' />" method="post" id="frm">
			<input type="hidden" name="board_id" value="${param.board_id}">
			<input type="hidden" name="num" value="${num}">
			<input type="hidden" name="ref" value="${ref}">
			<input type="hidden" name="step" value="${step}">
			<input type="hidden" name="depth" value="${depth}">
			<input type="hidden" name="author" value="">
			<table>
				<tr>
					<td>제목: </td>
					<td>
						<c:if test="${num == 0}">
							<input type="text" name="title" size="90" maxlength="60" placeholder="제목을 입력 하십시요." required/>
						</c:if>
						<c:if test="${num != 0}">
							<input type="text" name="title" size="90" maxlength="60" value="[답변]"/>
						</c:if>
					</td>
				</tr>
				<c:if test="${sessionScope.id != null}">
					<tr>
						<td>작성자: </td>
						<td><label>${sessionScope.member.nickname}</label></td>
					</tr>
					<input type="hidden" name="writer_name" value="${sessionScope.member.nickname}"/>
					<input type="hidden" name="email" value="${sessionScope.member.id}">
					<input type="hidden" name="password" value="${sessionScope.member.password}"/>
				</c:if>
				<c:if test="${sessionScope.id == null}">
					<tr>
						<td>작성자: </td>
						<td><input type="text" name="writer_name" /></td>
					</tr>
					<input type="hidden" name="email" value="이메일">
					<tr>
						<td>글암호: </td>
						<td><input type="password" name="password" /></td>
					</tr>
				</c:if>
				<tr>
					<td style="margin:0; padding:0;" colspan="2"><textarea name="content" rows="5" cols="80" style="width:100%; height:212px;"></textarea></td>
				</tr>
				<!-- 
				<c:if test="${board.nAttach > 0}">
					<tr>
						<td>첨부물 : </td>
						<td>
							<div id="input_file_area">
								<a href="javascript:addFileInput(${board.nAttach});">첨부 추가</a><br>
								<div class="attachBtn" id="aB1">
									<input type="file" name="file1"/>
									<a href="javascript:delFileInput(0)">첨부 삭제</a><br>
								</div>
								<div class="attachBtn" id="aB2">
									<input type="file" name="file2" />
									<a href="javascript:delFileInput(1)">첨부 삭제</a><br>
								</div>
								<div class="attachBtn" id="aB3">
									<input type="file" name="file3" />
									<a href="javascript:delFileInput(2)">첨부 삭제</a><br>
								</div>
								<div class="attachBtn" id="aB4">
									<input type="file" name="file4" />
									<a href="javascript:delFileInput(3)">첨부 삭제</a><br>
								</div>
								<div class="attachBtn" id="aB5">
									<input type="file" name="file5" />
									<a href="javascript:delFileInput(4)">첨부 삭제</a><br>
								</div>
							</div>
						</td>
					</tr>
				</c:if>
				 -->
			</table>
			<input id="addBtn" type="submit" value="전송" />
		</form>
	</section>
</section>
<footer>	<!-- 풋터 영역 정의 -->
	<jsp:include page="../common/footer.jsp" flush="false"/>
</footer>
</body>
</html>