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
<title>투표결과조회</title>
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

String sql = "select v_name, subStr(v_jumin, 1, 2), subStr(v_jumin, 3, 2), subStr(v_jumin, 5, 2), subStr(v_jumin, 7, 1), choice_no, subStr(v_time, 1, 2), subStr(v_time, 3, 4), v_confirm from tbl_vote";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
<section>
<h2>투표결과조회</h2>
<div class="table">
	<table border="1">
		<tr>
			<th>이름</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>후보번호</th>
			<th>투표시간</th>
			<th>유권자확인</th>
		</tr>
		 <tr>
                    <td><%=rs.getString(1)%></td>
                    <td>20<%=rs.getString(2)%>년<%=rs.getString(3)%>월<%=rs.getString(4)%>일</td>         
                    <td><%=rs.getString(5).equalsIgnoreCase("3") ? "남" 
                    		: (rs.getString(5).equalsIgnoreCase("4") ? "여" : "")%></td>          
                    <td><%=rs.getString(6)%></td>                
                    <td><%=rs.getString(7)%>:<%=rs.getString(8)%></td>        
                    <td><%=rs.getString(9).equalsIgnoreCase("Y") ? "확인" : (rs.getString(9).equalsIgnoreCase("N") ? "미확인" : "")%></td>                 
        </tr>

                <%
                while (rs.next()) {
                %>
                <tr>
                <td><%=rs.getString(1)%></td>
                    <td>20<%=rs.getString(2)%>년<%=rs.getString(3)%>월<%=rs.getString(4)%>일</td>         
                    <td><%=rs.getString(5).equalsIgnoreCase("3") ? "남" 
                    		: (rs.getString(5).equalsIgnoreCase("4") ? "여" : "")%></td>          
                    <td><%=rs.getString(6)%></td>                
                    <td><%=rs.getString(7)%>:<%=rs.getString(8)%></td>        
                    <td><%=rs.getString(9).equalsIgnoreCase("Y") ? "확인" : (rs.getString(9).equalsIgnoreCase("N") ? "미확인" : "")%></td>                 
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