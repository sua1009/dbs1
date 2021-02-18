<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택한 글 확인</title>
<style>
	table {
		width : 100%;
		border : 1px solid black;
		border-collapse: collapse;
		}
		
	td, th {
		border : 1px solid black;
	}
	
	.container {
		width : 960px;
		margin : 0px auto;	//중앙정렬
	}
	
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String number = request.getParameter("num");
		int num = Integer.parseInt(number);
		/* 주소창에 localhost:8090/dbs1/select.jsp?num=글번호 입력 */
	%>

	<%@ include file = "dbconn.jsp" %>
	<!-- select문을 사용하여 지정한 글의 내용을 가져옴 -->
	<%
		ResultSet rs = null;
		Statement stmt = null;

		try{
			String  query = "select title, comments, writer, cdate, ";
			query += "views, likes ";
			query += "from dbs ";
			query += "where num  = " + num;
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			
			/* while (rs.next()){
				String title = rs.getString("title");
				String comments = rs.getString("comments");
				String writer = rs.getString("writer");
				String cdate = rs.getString("cdate");
				String views = rs.getString("views");
				String likes = rs.getString("likes");
				
				out.println(title + "<br>");
				out.println(comments + "<br>");
				out.println(writer + "<br>");
				out.println(cdate + "<br>");
				out.println(views + "<br>");
				out.println(likes + "<br>");
			} */
		
			%>
			<div class = "container">
			<table>
				<thead>
					<tr>
						<th colspan=3><%= rs.getString("title") %></th>
						
				</thead>
				<tbody>
					<tr>
						<td><%= rs.getString("writer") %></td>
						<td><%= rs.getString("views") %></td>
						<td><%= rs.getString("likes") %></td>
					</tr>
					<tr>
						<td colspan=3><%= rs.getString("comments") %></td>
					</tr>
				</tbody>
				
			</table>
			</div>
			<a href="./lists.jsp">목록으로</a>
			<a href="./modify.jsp?num=<%=num %>">수정하기</a>
	<% 
			
		}catch(SQLException ex){
			out.println("글 조회를 실패했습니다.<br>");
			out.println("SQLException : " + ex.getMessage());
		}finally{
			if (stmt != null){
				stmt.close();
			}
			if (conn != null){
				conn.close();
			}
			if (rs != null){
				rs.close();
			}
		}
	%>
</body>
</html>