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

String sql = "select tl.scode, ts.sname, substr(sum(tp.cost * tl.amount), 1, 3), substr(sum(tp.cost * tl.amount), 4, 3) "
			+ "from tbl_product_01 tp, tbl_shop_01 ts, tbl_salelist_01 tl "
			+ "where tp.pcode = tl.pcode and ts.scode = tl.scode "
			+ "group by tl.scode, ts.sname "
			+ "order by tl.scode";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
<section>
<h2>후보조회</h2>
<div class="table">
	<table border="1">
		<tr>
			<th>판매번호</th>
			<th>상품코드</th>
			<th>판매날짜</th>
			
			
		</tr>
		 <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>          
                    <td><%=rs.getString(3)%>,<%=rs.getString(4)%></td>
                              
                                  
                </tr>

                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>          
                    <td><%=rs.getString(3)%>,<%=rs.getString(4)%></td>
                                            
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