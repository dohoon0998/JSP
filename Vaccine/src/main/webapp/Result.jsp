<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"></jsp:include>
<link rel="stylesheet" href="Global.css">

<meta charset="UTF-8">
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String sql1 = "select tv.hospcode, th.hospname, count(tv.hospcode) "
			+ "from tbl_hosp_202108 th, tbl_vaccresv_202108 tv "
			+ "where th.hospcode = tv.hospcode "
			+ "group by tv.hospcode, th.hospname "
			+ "order by tv.hospcode";

String sql2 = "select count(*) from tbl_vaccresv_202108";

Statement stmt = conn.createStatement();
%>
<section>
        <h3 class="H3">병원별 접종건수 통계</h3>
    <section class="Sec">
        <div>
            <table border=1>
                <tr>
                    <th>병원코드</th>
                    <th>병원명</th>
                    <th>접종건수</th>
                       
                </tr>
                <%  ResultSet rs = stmt.executeQuery(sql1);
							
					while(rs.next()) {				
				%>
				<tr>
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>	
				</tr>		
				<%
					}
				%>
				<%
				 rs = stmt.executeQuery(sql2);
				
				while(rs.next()) {
				%>
				<tr>
				<td></td>
				<th>총 누계</th>
				<th><%= rs.getString(1) %></th>
				</tr>
				<%
				}
				rs.close();
				%>
            </table>
        </div>
    </section>
<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>