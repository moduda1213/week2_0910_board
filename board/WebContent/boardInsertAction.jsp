<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");

	//boardInsertForm정보 요청하기	
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	String day = request.getParameter("day");
	
	//maria db 접속
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/board",
				"root",
				"java1004");
	
	String sql = "insert into board(no,title,content,writer,day) values(?,?,?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	//변경 내용 적용
	stmt.setInt(1,no);
	stmt.setString(2,title);
	stmt.setString(3,content);
	stmt.setString(4,writer);
	stmt.setString(5,day);
	
	stmt.executeUpdate(); // 변경내용 sql명령에 따라 적용
	
	response.sendRedirect("./boardList.jsp");//작업이 끝나면 ./boardList.jsp로 이동
%>