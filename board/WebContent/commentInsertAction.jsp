<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	//commentListAction.jsp
	request.setCharacterEncoding("utf-8");
	String commentContent =request.getParameter("commentContent");
	String commentWriter =request.getParameter("commentWriter");
	
	int boardNo = Integer.parseInt(request.getParameter("boardNo")); // board_no
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/board",
				"root",
				"java1004");
	
	String sql = "insert into comment(board_no, comment_content,comment_writer) values(?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1,boardNo);
	stmt.setString(2,commentContent);
	stmt.setString(3,commentWriter);
	
	stmt.executeUpdate();
	
	response.sendRedirect("./boardOne.jsp?no="+boardNo);
%>