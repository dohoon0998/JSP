<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="header.jsp"></jsp:include>
    <link rel="stylesheet" href="Global.css">
    
    	<h3 class="H3">(지역별)검사건수통계</h3>
    <section class="Sec">
    	
    	<div class="vTableDiv">
    		<table class="vTable" border="1">
    			<tr>
    				<th>지역코드</th>
    				<th>지역명</th>
    				<th>검사건수</th>
    			</tr>
    			<%
ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select  ppcity, count(ppcity) from "+ 
		"(select r.p_no rpno, p.p_no ppno, p.p_city ppcity from "+
		"(select * from tbl_patient_202004) p, tbl_result_202004 r "+
		"where r.p_no = p.p_no ) "+
		"GROUP by ppcity "+
		"order by ppcity ";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

while (rs.next()) {
	String city = rs.getString(1);
	String cityStr ="" ;
		switch(city){
		case "10": cityStr = "서울"; break;
		case "20": cityStr = "경기"; break;
		case "30": cityStr = "강원"; break;
		case "40": cityStr = "대구"; break;
		}
	String cityCount = rs.getString(2);
%>
				
    			<tr>
    				<td><%=city %></td>
    				<td><%=cityStr %></td>
    				<td><%=cityCount %></td>
    			</tr>
    			<%
				}
    			%>
    		</table>
    	</div>
    </section>
    
    <jsp:include page="footer.jsp"></jsp:include>