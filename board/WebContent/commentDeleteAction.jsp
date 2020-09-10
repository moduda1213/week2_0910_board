<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");

	int commentNo = Integer.parseInt(request.getParameter("commentNo")); // 삭제할 행 불러오기
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));  // 댓글 삭제 후 boardOne 화면을 유지하기 위해
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/board",
				"root",
				"java1004");
	
	String sql = "delete from comment where comment_no=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	
	//해당 번호에 행 데이터 가져오기
	stmt.setInt(1,commentNo);
	
	stmt.executeUpdate();
	
	response.sendRedirect("./boardOne.jsp?no="+boardNo);
%>