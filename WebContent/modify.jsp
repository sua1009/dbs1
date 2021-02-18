<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		int num = Integer.parseInt(request.getParameter("num"));
	%>
	
	<%@ include file = "dbconn.jsp" %>
	
	<%
	
		ResultSet rs = null;
		Statement stmt = null;
		
		try {
			String query = "select title, comments, writer, cdate, views, likes ";
			query += "from dbs ";
			query += "where num = " + num;
		
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			rs.next();
			
			%>
			<form action = "update.jsp" method="post">
				<p>제목 : <input type = "text" name= "title" value="<%=rs.getString("title")%>">
				<p>내용 : <textarea rows="5" cols = "80" name="comments"><%=rs.getString("comments") %></textarea>
				<button type = "submit">수정</button>
				<button type = "reset">취소</button>
			</form>
			<%			
		
		}catch(SQLException ex){
			out.println("데이터를 불러오는데 오류가 발생했습니다. <br>");
			out.println("SQLException : " + ex.getMessage());			
		}finally{
			if ( rs != null)
				rs.close();
			if( stmt != null)
				stmt.close();
			if( conn != null)
				conn.close();
			
		}
		
		
		
	%>
</body>
</html>