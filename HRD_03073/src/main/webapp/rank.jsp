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
    sb.append(" m.m_no, ");
    sb.append(" m_name, ");
    sb.append(" count(v.m_no) as total ");
    sb.append(" from tbl_vote202005 v, tbl_member_202005 m ");
    sb.append(" where v.m_no = m.m_no ");
    sb.append(" group by m.m_no, m_name ");
    sb.append(" order by total desc ");

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
		<h2 class="title">후보자등수</h2>
		
		<table border="1">
		<tr>
		<td>후보번호</td>
		<td>성명</td>
		<td>총투표건수</td>
		</tr>
		<% while(rs.next()){ %>
		<tr>
		<td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		</tr>
		<%} %>
		</table>
		
		</section>
		<%@ include file="footer.jsp" %>
</body>
</html>