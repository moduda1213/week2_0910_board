<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	int commentNo = Integer.parseInt(request.getParameter("commentNo")); // 수정할 행 불러오기
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));  // 댓글 수정 후 boardOne 화면을 유지하기 위해
	String commentContent = request.getParameter("commentContent");
	String commentWriter = request.getParameter("commentWriter");
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/board",
				"root",
				"java1004");
	
	String sql = "update comment set board_no =?, comment_content=?, comment_writer=? where comment_no=?";
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1,boardNo);
	stmt.setString(2,commentContent);
	stmt.setString(3,commentWriter);
	stmt.setInt(4,commentNo);
	
	stmt.executeUpdate();
	
	response.sendRedirect("./boardOne.jsp?no="+boardNo);
%>
	