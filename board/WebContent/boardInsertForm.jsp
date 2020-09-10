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
	<h1>boardList 추가</h1>
	<table border ="1">
		<tr>
			<td><a href="./index.jsp">메인으로</a></td>
			<td><a href="./boardList.jsp">boardList 화면으로</a></td>
		</tr>
	</table>
	
	<form method = "post" action = "./boardInsertAction.jsp">
		<div>번호 : <input type = "text" name = "no"></div>
		<div>제목 : <input type = "text" name = "title"></div>
		<div>내용 : <textarea rows="10" cols="50" name="content"></textarea></div>
		<div>글쓴이 : <input type = "text" name = "writer"></div>
		<div>날짜 : <input type = "text" name = "day"></div>
		<button type ="submit">등록</button>
	</form>
</body>
</html>