<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    StringBuffer sb = new StringBuffer();
    sb.append(" select  ");
    sb.append(" m_no, ");
    sb.append(" m_name, ");
    sb.append(" p_name, ");
    sb.append(" p_school, ");
    sb.append(" substr(m_jumin, 1, 6)||'-'||substr(m_jumin, 7, 7), ");
    sb.append(" m_city, ");
    sb.append(" substr(p_tel1,1,2)||'-'||p_tel2||'-'||p_tel3 ");
    sb.append(" from tbl_member_202005 m, tbl_party_202005 p ");
    sb.append(" where m.p_code = p.p_code ");

    String sql = sb.toString();
    System.out.println(sql);
    Connection conn = JDBConnection.getConnection();
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css?ver=1">
</head>
<body>
		<%@ include file="inter.jsp"%>
		<section>
		<h2 class="title">후보조회</h2>
		
		<table border="1">
		<tr>
		<td>후보번호</td>
		<td>성명</td>
		<td>소속정당</td>
		<td>학력</td>
		<td>주민번호</td>
		<td>지역구</td>
		<td>대표전화</td>
		</tr>
		<% while(rs.next()){ %>
		<tr>
		<td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><% if(rs.getString(4).equals("1")){ %>
		고졸
		<% }else if(rs.getString(4).equals("2")){ %>
		학사
		<% }else if(rs.getString(4).equals("3")){ %>
		석사
		<% }else if(rs.getString(4).equals("4")){ %>
		박사
		<% } %>
		</td>
		<td><%= rs.getString(5) %></td>
		<td><%= rs.getString(6) %></td>
		<td><%= rs.getString(7) %></td>
		</tr>
		<%} %>
		</table>
		
		</section>
		<%@ include file="footer.jsp" %>
</body>
</html>