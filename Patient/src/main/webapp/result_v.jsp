<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="Global.css">

<h3 class="H3">검사결과조회</h3>
<section class="Sec">
		
		<div class="vTableDiv">
			<table class="vTable2" border="1">
				<tr>
					<th> 환자번호 </th>
					<th> 환자명 </th>
					<th> 검사명 </th>
					<th> 검사시작일 </th>
					<th> 검사상태 </th>
					<th> 검사종료일 </th>
					<th> 검사결과 </th>
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

String sql = "select p.p_no, p.p_name, l.t_name, r.t_sdate, r.t_status, r.t_ldate, r.t_result "
		   + " from tbl_patient_202004 p, tbl_lab_test_202004 l, tbl_result_202004 r "
 		   + " where p.p_no = r.p_no and l.t_code = r.t_code "
		   + " order by p.p_no";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
    <tr>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getDate(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getDate(6)%></td>
        <td><%=rs.getString(7)%></td>                
    </tr>
    <%
                while (rs.next()) {
                	
                %>
                	<tr>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getDate(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getDate(6)%></td>
        <td><%=rs.getString(7)%></td>                
    </tr>
    <%
                }
    %>		 
		</table> 
		</div>
</section>
		
<jsp:include page="footer.jsp"></jsp:include>