<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Global.css">
<meta charset="UTF-8">
<title>후보조회</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<%
ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select idx, writer, subject, content, substr(date1, 1, 17) "
			+ "from board_tbl";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();


%>
<section>
<h3>게시판 목록/조회</h3>
<div>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><a href="Detail.jsp?write=<%=rs.getString(2)%>&subject=<%=rs.getString(3)%>&content=<%=rs.getString(4)%>&timestamp=<%=rs.getString(5)%>&idx=<%= rs.getString(1)%>"><%=rs.getString(1)%></a></td>
                    <td><%=rs.getString(2)%></td>          
                    <td><a href="Detail.jsp?write=<%=rs.getString(2)%>&subject=<%=rs.getString(3)%>&content=<%=rs.getString(4)%>&timestamp=<%=rs.getString(5)%>&idx=<%= rs.getString(1)%>"><%=rs.getString(3)%></a></td>
                    <td><%=rs.getString(4)%></td>
                    <td>20<%=rs.getString(5)%></td>                            
                </tr>
                <%
                
}
                %>
	</table>
	<a href="Wrtie.jsp">작성하기</a>
</div>

<jsp:include page="Footer.jsp"></jsp:include>
</section>
</body>
</html>