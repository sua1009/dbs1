<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.jsp" method="post">
		<p>제목 : <input type ="text" name = "title" placeholder = "제목을 입력하세요">
		<p>작성자 : <input type ="text" name = "writer" >
		<p>글내용 : <textarea rows ="5" cols="80" name = "comment"></textarea>
		
		<button type="submit">확인</button>
		<button type="reset">취소</button>
	</form>
</body>
</html>