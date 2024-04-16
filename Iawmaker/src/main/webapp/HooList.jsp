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

String sql = "select tm.m_no, tm.m_name, tp.p_name, tm.p_school, substr(tm.m_jumin, 1, 6), substr(tm.m_jumin, 7, 7) , tm.m_city, tp.p_tel1, tp.p_tel2, tp.p_tel3 "
			+ "from tbl_member_202005 tm, tbl_party_202005 tp "
			+ "where tm.p_code = tp.p_code ";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

%>
<section>
<h3>후보조회</h3>
<div>
	<table border="1">
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>소속정당</th>
			<th>학력</th>
			<th>주민번호</th>
			<th>지역구</th>
			<th>전화번호</th>
		</tr>
                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>          
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4).equalsIgnoreCase("1") ? "고졸" : rs.getString(4).equalsIgnoreCase("2") ? "학사" 
                    		: rs.getString(4).equalsIgnoreCase("3") ? "석사" : (rs.getString(4).equalsIgnoreCase("4") ? "박사" : "")%></td>          
                    <td><%=rs.getString(5)%>-<%=rs.getString(6)%></td>  
                    <td><%=rs.getString(7) %></td>
                    <td><%=rs.getString(8)%>-<%=rs.getString(9)%>-<%=rs.getString(10)%></td>                  
                </tr>
                <%
                }
                %>
	</table>
</div>

<jsp:include page="Footer.jsp"></jsp:include>
</section>
</body>
</html>