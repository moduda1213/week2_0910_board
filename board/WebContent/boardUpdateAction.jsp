<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	String day = request.getParameter("day");
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/board",
				"root",
				"java1004");
	String sql = "update board set title =?, content=?, writer=? where no=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1,title);
	stmt.setString(2,content);
	stmt.setString(3,writer);
	stmt.setInt(4,no);
	
	stmt.executeUpdate();
	
	response.sendRedirect("./boardOne.jsp?no="+no); //다시 전송
%>