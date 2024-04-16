<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="Global.css">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보조회</title>
</head>
<body>
<%
ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select tm.m_no, tm.m_name, count(*) as total "
			+ " from tbl_vote202005 tv, tbl_member_202005 tm"
			+ " where tv.m_no = tm.m_no and v_confirm = 'Y'"
			+ " group by tm.m_no, tm.m_name"
			+ " order by total desc";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

%>
<section >
<jsp:include page="Header.jsp"></jsp:include>

<h3 >후보자등수</h3>
<div>
	<table border="1">
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>총투표건수</th>
		</tr>
                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>          
                    <td><%=rs.getString(3)%></td>
                                      
                </tr>
                <%
                }
                %>
	</table>
</div>
</section>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>