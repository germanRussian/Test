<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
/* DB연결 */

request.setCharacterEncoding("utf-8");

String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");

String url = "jdbc:mysql://localhost:3306/smart?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

StringBuffer sql = new StringBuffer();
sql.append(" SELECT *  FROM board");
sql.append(" where num = ? ");

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

/* 
String num = "";
String title = "";
String content = "";
String writer = "";

 */

/* DB정보를 가져와서 화면에 출력*/
try {
	//드라이버로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	//연결
	conn = DriverManager.getConnection(url, user, password);
	//SQL
	stmt = conn.prepareStatement(sql.toString());
	//값 설정(쿼리 문 '?'에 들어 갈 값)
	stmt.setString(1, (String) session.getAttribute("sessId"));
	// 출력
	rs = stmt.executeQuery();

	/* 한건에 해당하는 것만 내용을 가져올 것이기 때문에 if문 사용 while문은 여러건을 가져올때.*/
	if (rs.next()) {

		num = rs.getString("num");
		title = rs.getString("title");
		content = rs.getString("content");
		writer = rs.getString("writer");

	}
} catch (Exception e) {
	e.getLocalizedMessage();

} finally {
	//닫기
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();

}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기 화면</title>
</head>
<body>
	홈화면 > 게시판 글 상세보기
	<hr>
	<form action="update.jsp" method="post">
		<input type="" name="num" id="num">
		<div>
			<span>제목</span><br>
			<input style="width: 500px" type="text" name="title" <%=title %>>
		</div>
		<hr>
		<div>
			<span>내용</span><br>
			<input style="height: 500px; width: 500px" type="text" name="content"<%=content %>>
		</div>
		<hr>
		<div>
			<span>작성자</span><br>
			<input style="width: 500px" type="text" name="writer" <%=writer %>>
		</div>
		<br>
		<button >글 수정</button>
		

	</form>
	
	<button onclick="loaction.href='list.jsp'">목록으로</button>




</body>
</html>