<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
</head>
<body>
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
					"jdbc:mariadb://127.0.0.1:3306/board",
					"root",
					"java1004");
		String sql = "select no, title, writer from board order by no desc limit 0, 10";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		// rs --> ArrayList모양으로 변경 (나중에)
	%>
		<h1>게시판 목록</h1>
			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
					</tr>
				</thead>
				<tbody>
					<%
						while(rs.next()){
					%>
							<tr>
								<td><%=rs.getInt("no") %></td>
								<td>
									<a href ='./boardOne.jsp?no=<%=rs.getInt("no")%>'>
									<%=rs.getString("title")%></a>
								</td>
								<td><%=rs.getString("writer") %></td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
		<table border="1">
			<tr>
				<td><a href="./boardInsertForm.jsp">리스트 추가하기</a></td>
			</tr>
		</table>
		
</body>
</html>