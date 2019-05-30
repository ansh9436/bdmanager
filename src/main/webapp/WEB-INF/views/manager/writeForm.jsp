<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 만들기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardwrite.css"/>
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
		<h2>게시판 만들기</h2>
		<form action="<c:url value='write' />" method="post">
			게시판 이름: <input type="text" name="board_name" size="20"/> <br/>
			게시판 유형: <select name="board_type">
						<option value="기본">기본</option>
						<option value="Q&A">Q&#38A</option>
						<option value="이미지">이미지</option>
						<option value="공지사항">공지사항</option>
						<option value="자료실">자료실</option>
						<option value="방명록">방명록</option>
					</select><br>
			url : <input type="text" name="url" size="40"><br>
			비밀글 허용여부 : <input type="radio" name="secret" value="T">&nbsp;감추기&nbsp;&nbsp;&nbsp;
					<input type="radio" name="secret" value="F" checked="checked">&nbsp;보여주기<br>
			읽기 권한 : <select name="read_allow">
						<option value="all">모두 허용</option>
						<option value="login">로그인 후</option>
						<option value="customer">고객</option>
						<option value="business">상인</option>
						<option value="admin">관리자</option>
					</select><br>
			쓰기 권한 : <select name="write_allow">
						<option value="all">모두 허용</option>
						<option value="login">로그인 후</option>
						<option value="customer">고객</option>
						<option value="business">상인</option>
						<option value="admin">관리자</option>
					</select><br>
			댓글 쓰기 권한 : <select name="reply_allow">
						<option value="all">모두</option>
						<option value="login">로그인 후</option>
						<option value="customer">고객</option>
						<option value="business">상인</option>
						<option value="admin">관리자</option>
					</select><br>
			수정 권한 : <select name="modify_allow">
						<option value="all">모두</option>
						<option value="login">로그인 후</option>
						<option value="customer">고객</option>
						<option value="business">상인</option>
						<option value="writer">작성자</option>
						<option value="admin">관리자</option>
					</select><br>
			삭제 권한 : <select name="remove">
						<option value="writer">작성자</option>
						<option value="admin">관리자</option>
					</select><br>
			다운로드 권한 : <select name="download">
						<option value="all">모두</option>
						<option value="login">로그인 후</option>
						<option value="customer">고객</option>
						<option value="business">상인</option>
						<option value="admin">관리자</option>
					</select><br>
			업로드 권한 : <select name="upload">
						<option value="all">모두</option>
						<option value="login">로그인 후</option>
						<option value="customer">고객</option>
						<option value="business">상인</option>
						<option value="admin">관리자</option>
					</select><br>
			첨부 파일 수 : <input type="number" name="nAttach" min="0" max="5"><br>
			첨부 파일 크기제한(한 개) : <select name="aSize">
						<option value="0">0</option>
						<option value="50KB">50KB</option>
						<option value="200KB">200KB</option>
						<option value="1MB">1MB</option>
						<option value="10MB">10MB</option>
						<option value="100MB">100MB</option>
					</select><br>
			내용 표시 형식 : <select name="display_format">
						<option value="1">제목만 표시</option>
						<option value="2">내용 일부 표시</option>
						<option value="3">내용 전부 표시</option>
					</select><br>
			게시판 설명: <br/>
			<textarea name="board_desc" cols="80" rows="3"></textarea>
			<br/>
			<input id="addBtn" type="submit" value="전송" />
		</form>
	</section>
</section>
<footer>	<!-- 풋터 영역 정의 -->
	<jsp:include page="../common/footer.jsp" flush="false"/>
</footer>
</body>
</html>