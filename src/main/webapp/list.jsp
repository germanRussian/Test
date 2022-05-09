<%@page import="java.awt.datatransfer.Clipboard"%>
<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
String url = "jdbc:mysql://localhost:3306/smart?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;
ArrayList<boardVO> list = new ArrayList<boardVO>();
try {
	StringBuffer sql = new StringBuffer();
	sql.append(" SELECT num, title, writer, writeDate FROM board ");
	/* sql.append(" WHERE writer  "); */
	sql.append(" order by num desc");
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.prepareStatement(sql.toString());
	rs = stmt.executeQuery();
	while (rs.next()) {
		boardVO vo = new boardVO();
		vo.setNum(rs.getInt("num"));
		vo.setTitle(rs.getString("title"));
		vo.setWriter(rs.getString("writer"));
		vo.setWriteDate(rs.getTimestamp("writeDate"));
		list.add(vo);
	}
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} finally {
	try {
		if (rs != null)
	rs.close();
		if (stmt != null)
	stmt.close();
		if (conn != null)
	conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목 록 화 면</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<table class="table">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>제 목</th>
				<th>작 성 자</th>
				<th>작 성 일</th>
			</tr>
		</thead>
		<tbody>
		<%
		{
		Iterator<boardVO> it = list.iterator();
		while (it.hasNext()) {
			boardVO vo = it.next();
		%>
		
			<li>
				<div class="fL">
					<strong><%=vo.getNum()%>  <%=vo.getWriter()%>
					</strong><br> <span><%=vo.getWriteDate()%></span>
				</div>
				<div class="fR">
					
				</div>
			</li>
			
		<%
		}
		}
		%>
		<tbody>

		</tbody>
	</table>

</body>
</html>