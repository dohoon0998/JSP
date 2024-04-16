<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	boolean b = false;
request.setCharacterEncoding("UTF-8");
String write = request.getParameter("write");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String timestamp = request.getParameter("timestamp");
String idx = request.getParameter("idx");
%>
<%
ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select *  from comment_tbl where b_idx = ?";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, idx);
rs = pstmt.executeQuery();

rs.next();
%>
<jsp:include page="Header.jsp"></jsp:include>
<h1>게시판 조회</h1>
	<form action="DetailConfirm.jsp">
	<input readonly type="text" name="b_idx" class="idx" style="border:none;" value="<%= idx%>">
<table border="1">
<tr>
<th>제목</th>
<td colspan="3"><%= subject %></td>
</tr>
	<tr>
		<th>작성자</th>
			<td><%= write %></td>
		<th>작성일</th>
			<td>20<%= timestamp %></td>
	</tr>
	
	<tr>
		<td colspan="4"><%= content %></td>
	</tr>
	
	<tr>
		<th colspan="4" style="border-bottom: none;">댓글조회</th>
	</tr>
	
	<tr>
	<td>
	<%
					while(rs.next()){
						if(rs.getString(1) != null){
							b = true;
						}
						String b_id = rs.getString(1);
					%> <%= rs.getString(3) %> / <%= rs.getString(4) %> / <%= rs.getString(5) %>
						/ <a href="delpro.jsp?id=<%= b_id %>"><input class="del"
							type="button" value="삭제"></br></a> <% } %></td>
	</tr>
	
	<tr>
		<th>댓글 작성</th>
		<td>이름 : <input type="text" name="writer"> 내용 : <input type="text" name="content" style="width: 200px;"><input type="submit"></td>
	</tr>
</table>
</form>
<a href="List.jsp">목록</a>
<a href="Update.jsp?write=<%=write%>&subject=<%=subject%>&content=<%=content%>&idx=<%= idx%>">수정</a>
<a href="delpro2.jsp?idx=<%= idx %>"><input type="button" value="삭제"></a>

<a href=""></a>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>