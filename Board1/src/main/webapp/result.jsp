<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
boolean b = false;
String id = request.getParameter("id");
String na = request.getParameter("na");
String ti = request.getParameter("ti");
String co = request.getParameter("co");
String da = request.getParameter("da");
String cr = request.getParameter("cr");

StringBuffer sb = new StringBuffer();
sb.append(" select * from comment_tbl where b_idx = ? ");
String sql = sb.toString();
Connection conn = JDBConnection.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<script type="text/javascript">
function go() {
	alert("댓글이 있어 삭제가 불가합니다.");
}
</script>
<body>
	<%@ include file="inter.jsp"%>
	<section>
		<h2 class="title">게시판 조회</h2>

		<form action="repro.jsp">
			<input readonly="readonly" type="text" name="idx" class="idx"
				value="<%= id %>">
			<table border="1">
				<tr>
					<td colspan="3">제목</td>
					<td colspan="3"><%=ti%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=na%></td>
					<td>작성일</td>
					<td><%=da%></td>
					<td>수정일</td>
					<td><%=cr%></td>
				</tr>
				<tr>
					<td colspan="6"><%=co%></td>
				</tr>
				<tr>
					<td colspan="6"><strong>댓글조회</strong></br> <%
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
					<td colspan="6"><strong>댓글작성</strong>
					</br> 이름 <input class="nam" type="text" name="nam"> 
					내용 <input class="ti" type="text" name="con"> 
					<input type="submit" value="작성완료"></td>
				</tr>
			</table>
			<div class="sub">
				<a href="list.jsp"><input type="button" value="목록"></a> <a
					href="edit.jsp?id=<%= id %>&na=<%= na %>&ti=<%= ti %>&co=<%= co %>"><input
					type="button" value="수정"></a> 
					<%
					if(b == false){
					%>
					<a href="delpro2.jsp?id=<%= id %>"><input type="button" value="삭제"></a>
					<% } %>
					<%
					if(b == true){
					%>
					<input type="button" onclick="go()" value="삭제">
					<% } %>
			</div class="sub">
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>





