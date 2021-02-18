<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>

<!-- 게시판의 전체 리스트 불러오기 -->
<!-- jsp페이지에서 자바 클래스를 사용하기 위해서 import -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 전체 목록</title>
<style>
	table {
		width : 100%;
		border : 1px solid black;
		border-collapse: collapse;
		}
		
	td, th {
		border : 1px solid black;
	}
	
	td > a {
		text-decoration : none;
	}
	
	.container {
		width : 960px;
		margin : 0px auto;	//중앙정렬
	}
	
</style>
</head>
<body>
	<!-- 기존에 만들어진 파일을 불러와서 해당 파일의 내용을 실행 -->
	<%@ include file = "dbconn.jsp" %>
	
	<div class="container">
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
				<th>추천</th>
			</tr>
		</thead>
		<tbody>
			<%
				/* SQL 쿼리(select문) 실행 후 그 결과값을 받아오는 데이터 타입  */
				ResultSet rs = null;
				/* 실제 SQL쿼리를 실행하기 위해서 사용 */
				/* select문 실행 결과를 ResultSet 클래스 타입의 객체에 저장 */
				/* inset, update, delete 문의 실행 결과는 int타입의 변수에 저장 */
				Statement smt =  null;
				
				try{
					String query = "select * from dbs";
					
					
					smt = conn.createStatement();
					/* select문 실행 시 executeQuery() 문 사용 */
					/* insert, update, delete문 실행 시 executeUpdate()사용 */
					rs = smt.executeQuery(query);
					
					while(rs.next()){
						String num = rs.getString("num");
						String title = rs.getString("title");
						String writer = rs.getString("writer");
						String cdate = rs.getString("cdate");
						String views = rs.getString("views");
						String likes = rs.getString("likes");
				%>
						<tr>
							<td><%= num %></td>
							<td><a href = "select.jsp?num=<%= num %>"><%= title %></a></td>
							<td><%= writer %></td>
							<td><%= cdate %></td>
							<td><%= views %></td>
							<td><%= likes %></td>
							<%
					}
				}catch(SQLException ex){
					out.println("dbs 테이블에서 게시글 목록 조회를 실패했습니다.<br>");
					out.println("SQLException : " + ex.getMessage());
				}finally{
					if (rs != null)
						rs.close();
					if (conn != null)
						conn.close();
				}
			
			%>
		</tbody>
	</table>
	<!-- <button id = "btn_write">글쓰기</button> -->
	<a href="write.jsp">글쓰기</a>
	</div>
</body>
</html>