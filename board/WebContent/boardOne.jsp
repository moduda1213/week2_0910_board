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
	
		int no = Integer.parseInt(request.getParameter("no"));
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
					"jdbc:mariadb://127.0.0.1:3306/board",
					"root",
					"java1004");
		String sql = "select title, content, writer, day from board where no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		
		stmt.setInt(1,no);
		ResultSet rs = stmt.executeQuery();
		String title = "";
		String content ="";
		String writer = "";
		String day ="";
		if(rs.next()){
			title = rs.getString("title");
			content = rs.getString("content");
			writer = rs.getString("writer");
			day = rs.getString("day");
		}
		// rs --> ArrayList모양으로 변경 (나중에)
	%>
		<h1>게시글 보기</h1>
			<table border="1">
				<tr>
					<td>번호</td>
					<td><%=no %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><%=title %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="50" name="content"><%=content%></textarea></td>
				</tr>
				<tr>
					<td>글쓴이</td>
					<td><%=writer %></td>
				</tr>
				<tr>
					<td>날짜</td>
					<td><%=day %></td>
				</tr>
			</table>
		<table border ="1">
			<tr>
				<td><a href = "./boardList.jsp">boardList 화면으로</a></td>
				<td><a href = "./boardUpdateForm.jsp?no=<%=no%>">수정하기</a></td>
				<td><a href = "./boardDeleteAction.jsp?no=<%=no%>">삭제하기</a></td>
			</tr>
		</table>
		
		<!-- commentList -->
		<% 
			String sql2 = "select comment_no, comment_content, comment_writer from comment where board_no=?";
			PreparedStatement stmt2 = conn.prepareStatement(sql2);
			stmt2.setInt(1,no);
			ResultSet rs2 = stmt2.executeQuery();
			
		%>
			<h2>덧글 목록</h2>
			<table border ="1">
			<%
				while(rs2.next()){
			%>
					<tr>
						<td><input type="text" value='<%=rs2.getString("comment_content") %>' readonly="readonly"></td>
						<td><input type="text" value='<%=rs2.getString("comment_writer") %>' readonly="readonly"></td>
						<td>
							<a href="./commentDeleteAction.jsp?commentNo=<%=rs2.getInt("comment_no")%>
							&boardNo=<%=no%>">삭제</a>
						</td>
						<td> <!-- 수정할 댓글 정보 보내기 -->	
							<a href="./commentUpdateForm.jsp?commentNo=<%=rs2.getInt("comment_no")%>">수정</a>
						</td>
					</tr>
			<%		
				}
			%>
			</table>
			
		<!-- commentInsertForm -->
		<h2>덧글 입력</h2>
		<form method="post" action="./commentInsertAction.jsp">
			<input type = "hidden" name="boardNo" value="<%=no %>">
			<textarea rows="2" cols="50" name = "commentContent"></textarea>
			<input type = "text" name = "commentWriter">
			<button type ="submit">입력</button>
		</form>
</body>
</html>