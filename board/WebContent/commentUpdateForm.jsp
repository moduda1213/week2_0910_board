<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/board",
				"root",
				"java1004");
		
		String sql = "select board_no, comment_content, comment_writer from comment where comment_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,commentNo);
		
		ResultSet rs = stmt.executeQuery();
		
		String boardNo = "";
		String commentContent = "";
		String commentWriter = "";
		
		if(rs.next()){
			boardNo = rs.getString("board_no");
			commentContent = rs.getString("comment_content");
			commentWriter = rs.getString("comment_writer");
		}
	%>
		<h1>덧글 수정화면 </h1>
		<form method="post" action="./commentUpdateAction.jsp">
			<input type = "hidden" name="boardNo" value="<%=boardNo %>">
			<input type = "hidden" name="commentNo" value="<%=commentNo %>">
			<textarea rows="2" cols="50" name = "commentContent"><%=commentContent %></textarea>
			<input type = "text" name = "commentWriter" value="<%=commentWriter%>">
			<button type ="submit">수정</button>
		</form>
</body>
</html>