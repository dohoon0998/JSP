<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 조회</title>
</head>
<header>
	<jsp:include page="Header.jsp"></jsp:include>
</header>
<body>
	<h3 align="center">환자 조회</h3>	
		<table align="center" border="1">
			<tr>
				<td>환자 코드</td>
				<td>환자 이름</td>
				<td>환자 생년월일</td>
				<td>환자 성별</td>
				<td>환자 전화번호</td>
				<td>환자 거주지</td>
			</tr>
			<%
			Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
            
            String sql = "select * from tbl_patient_202004";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            %>
            
            <% 
            
            while (rs.next()) {
            	String birth = rs.getString("p_birth").substring(0, 4) + "년" + rs.getString("p_birth").substring(4, 2) + "월" + rs.getString("p_birth").substring(6, 2);
            	String gender = rs.getString("p_gender");
            	String city = rs.getString("p_city");
            	
            	
            	if (gender.equals("M")) {
            		gender = "남";
            	}
            	else {
            			gender = "여";
            		}
            	
            	if (city.equals("10")) {
            		city = "서울";
            	} else if (city.equals("10")) {
            		city = ""
            	}
            	
            %>
                <tr align="center">
                <td><%= rs.getString("p_no")%></td>
                <td><%= rs.getString("p_name")%></td>
                <td><%= birth %></td>
                <td><%= gender%></td>
                <td><%= rs.getString("p_tel1")%>-<%= rs.getString("p_tel2")%>-<%= rs.getString("p_tel3")%></td>
                <td><%= rs.getString("p_city")%></td>
                </tr>                    
            <%
            }
            
            %>			
		</table>	
</body>
<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
</html>