<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardInsertForm</title>
</head>
<body>
	<%
		int no = Integer.parseInt(request.getParameter("no"));
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/board",
				"root",
				"java1004");
		
		String sql = "select no, title, content, writer, day from board where no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,no);
		ResultSet rs = stmt.executeQuery();
		
		String title = "";
		String content = "";
		String writer = "";
		String day = "";
		
		if(rs.next()){
			title = rs.getString("title");
			content = rs.getString("content");
			writer = rs.getString("writer");
			day = rs.getString("day");
		}
	%>
	<form method = "post" action="./boardUpdateAction.jsp">
		<table border = "1">
			<tr>
				<td>번호</td>
				<td><input type="text" name = "no" value= "<%=no%>" readonly ="readonly"></td>
			<tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name = "title" value= "<%=title %>"></td>
			<tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="content"><%=content%></textarea></td>
			<tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name = "writer" value= "<%=writer %>"></td>
			<tr>
			<tr>
				<td>날짜</td>
				<td><input type="text" name = "day" value= "<%=day %>" readonly ="readonly"></td>
			<tr>
		</table>
		<button type ="submit">수정</button>
	</form>
</body>
</html>