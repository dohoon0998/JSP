<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

String sql = "select tr.no, tr.name, tp.p_class, tp.p_partner, tr.school, substr(tr.jumin, 1, 6), substr(tr.jumin, 7, 8), tr.major, tp.p_tel1, tp.p_tel2, tp.p_tel3"
			+ " from tbl_register tr, tbl_partner tp"
			+ " where tr.code = tp.p_code";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
<section>
<h2>후보조회</h2>
<div class="table">
	<table border="1">
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>반</th>
			<th>파트너</th>
			<th>학력</th>
			<th>주민번호</th>
			<th>전공학년반</th>
			<th>전화번호</th>
		</tr>
		 <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>          
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>          
                    <td><%=rs.getString(5).equalsIgnoreCase("1") ? "중졸" : rs.getString(5).equalsIgnoreCase("2") ? "고졸"
                    		: rs.getString(5).equalsIgnoreCase("3") ? "전문대졸" : rs.getString(5).equalsIgnoreCase("4") ? "대졸" 
                    		: rs.getString(5).equalsIgnoreCase("5") ? "석사수료" : rs.getString(5).equalsIgnoreCase("6") ? "석사취득" 
                    		: rs.getString(5).equalsIgnoreCase("7") ? "박사수료" : (rs.getString(5).equalsIgnoreCase("8") ? "박사취득" : "") %></td>
                    <td><%=rs.getString(6)%>-<%=rs.getString(7)%></td>  
                    <td><%=rs.getString(8)%></td>        
                    <td><%=rs.getString(9)%>-<%=rs.getString(10)%>-<%=rs.getString(11)%></td>                  
                </tr>

                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>          
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>          
                    <td><%=rs.getString(5).equalsIgnoreCase("1") ? "중졸" : rs.getString(5).equalsIgnoreCase("2") ? "고졸"
                    		: rs.getString(5).equalsIgnoreCase("3") ? "전문대졸" : rs.getString(5).equalsIgnoreCase("4") ? "대졸" 
                    		: rs.getString(5).equalsIgnoreCase("5") ? "석사수료" : rs.getString(5).equalsIgnoreCase("6") ? "석사취득" 
                    		: rs.getString(5).equalsIgnoreCase("7") ? "박사수료" : (rs.getString(5).equalsIgnoreCase("8") ? "박사취득" : "") %></td>
                    <td><%=rs.getString(6)%>-<%=rs.getString(7)%></td>  
                    <td><%=rs.getString(8)%></td>        
                    <td><%=rs.getString(9)%>-<%=rs.getString(10)%>-<%=rs.getString(11)%></td>                  
                </tr>
                <%
                }
                %>
	</table>
</div>
</section>
<a href="Index.jsp">홈으로</a>
</body>
</html>