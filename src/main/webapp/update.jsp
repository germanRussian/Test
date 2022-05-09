<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>
</head>
<body>
	홈화면 > 게시판 수정하기
	<hr>
	<table border="1">
		<form action="updateAct.jsp" method="post">
		<input type="" name="num" id="num">
			<div>
				<span>제목</span><br>
				<input style="width: 500px" type="text" name="title">
			</div>
			<hr>
			<div>
				<span>내용</span><br>
				<input style="height: 500px; width: 500px" type="text"
					name="content">
			</div>
			<hr>
			<div>
				<span>작성자</span><br>
				<input style="width: 500px" type="text" name="writer">
			</div>
			<br>
			<button>수정하기</button>
			<button  onclick="location.href= list.jsp" >목록</button>
		</form>
</body>
</html>