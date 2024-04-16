<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"></jsp:include>

<meta charset="UTF-8">
</head>
<body>
<section>
<h2>메뉴수정</h2>
<%

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(url, user, pw);

String sql3 = "select max(sale_no)+1 from sale_tbl_003";
String sql = "select store_cd, store_nm from store_tbl_007 group by store_cd, store_nm";
String sql1 = "select menu_cd, menu_nm from menu_tbl_007 group by menu_cd, menu_nm";
String sql2 = "select size_cd, size_nm from size_tbl_007 group by size_cd, size_nm";

Statement stmt = conn.createStatement();
 
%>
<%
Date da = new Date();
SimpleDateFormat simpledate = new SimpleDateFormat("yyyyMMdd");
String strDate = simpledate.format(da);
%>
<form action="RegiConfirm.jsp">

	<table border="1">
		<tr>
			<th>판매일자(자동발생)</th>
			<td>
			<input type="text" name="sale_ymd" readonly value="<%=strDate%>">
			</td>
		</tr>
		<tr>
			<th>판매번호(자동채번)</th>
			<td>
			<%  ResultSet rs = stmt.executeQuery(sql3);
			
			rs.next();
			
			String str1 = rs.getString(1);
			
				String str;
				if (str1.equals("10")) {
					str = "00" + rs.getString(1);
				} else {
					str = "000" + rs.getString(1);
				}
			%>
			<input type="text" name="sale_no" value="<%= str %>" readonly>
			</td>
		</tr>
		<tr>
			<th>판매점포</th>
			<td>
			<% rs = stmt.executeQuery(sql); %>
			<select name="store_cd">
				<option></option>
				<% while(rs.next()) {%>
				<option value="<%= rs.getString(1) %>"><%= rs.getString(2) %></option>
				<%
				}
				rs.close();
				%>
				
			</select>		
			</td>
		</tr>
		<tr>
			<th>메뉴코드</th>
			<td>
			<%  rs = stmt.executeQuery(sql1); %>
			<select name="menu_cd">
				<option></option>
				<% while(rs.next()) {%>
				<option value="<%= rs.getString(1) %>"><%= rs.getString(2) %></option>
				<%
				}
				rs.close();
				%>
			</select>		
			</td>
		</tr>
		<tr>
			<th>사이즈</th>
			<td>
			<%  rs = stmt.executeQuery(sql2); %>
			<select name="size_cd">
				<option></option>
				<% while(rs.next()) {%>
				<option value="<%= rs.getString(1) %>"><%= rs.getString(2) %></option>
				<%
				}
				rs.close();
				%>
			</select>		
			</td>
		</tr>
		<tr>
			<th>판매수량</th>
			<td>
			<input type="text" name="sale_cnt">
			</td>
		</tr>
		<tr>
			<th>수취구분</th>
			<td>
			<select name="pay_type">
				<option></option>
				<option value="01">현금</option>
				<option value="02">카드</option>
			</select>		
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
			<input type="submit" value="등록">
			</td>
		</tr>
	</table>
</form>
</section>
<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>