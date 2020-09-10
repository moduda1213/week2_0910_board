<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	int no = Integer.parseInt(request.getParameter("no"));
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/board",
				"root",
				"java1004");
	
	String sql = "delete from board where no=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1,no);
	stmt.executeUpdate();
	
	response.sendRedirect("./boardList.jsp");
%>
