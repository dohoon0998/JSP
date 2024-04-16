<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
			//1 단계 : JDBC 드라이버 로드.
			Class.forName("oracle.jdbc.OracleDriver");
			
			//2 단계 : 커넥션 객체 생성.
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			
			//3 단계 : PreparedStatement, Statement, ResultSet 객체생성.
			/*
			■ PreparedStatement : 쿼리문▶ insert, update, delete 문 사용시 사용함.
			■ Statement :         쿼리문▶ select 문 사용시 사용함.
			■ ResultSet :         쿼리문▶ select 문 사용시 사용함.
			*/
			PreparedStatement pstmt = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			// 4 단계 : String SQL을 통해 쿼리문 작성.
			String SQL = "select * from tbl_patient_202004";
			
			// 5 단계 : [select] Statement에 Connection.createStatement() 입력.
			stmt = con.createStatement();
						 
			// 6 단계 : [select] Statement에 executeQuery(SQL) 넣어주기.
			rs = stmt.executeQuery(SQL);
						
			// 7 단계 : [select] while문을 사용해 보여줄 테이블의 쿼리문을 ResultSet에 getString를 이용해 컬럼값 가져오기.
			while (rs.next()) {
				String p_no = rs.getString("p_no");
				String p_name = rs.getString("p_name");
				String p_birth = rs.getString("p_birth");
				String p_gender = rs.getString("p_gender");
				String p_tel1 = rs.getString("p_tel1");
				String p_tel2 = rs.getString("p_tel2");
				String p_tel3 = rs.getString("p_tel3");
				String p_city = rs.getString("p_city");	
				
				if (p_city.equals("10")) {
					p_city = "서울";
				} else if (p_city.equals("20")) {
					p_city = "경기";
				} else if (p_city.equals("30")) {
					p_city = "강원";
				} else {
					p_city = "대구";
				}
				
				if (p_gender.equals("M")) {
					p_gender = "남";
				} else {
					p_gender = "여";
				}
			%>	
			<%// 8 단계 : [select] <tr>,<td>를 이용해 값 출력. %>		
			<tr align="center">
				<td><%=p_no%></td>				
				<td><%=p_name%></td>				
				<td><%=p_birth.substring(0,4)+"년"+p_birth.substring(4,6)+"월"+p_birth.substring(6,8)+"일"%></td>				
				<td><%=p_gender%></td>				
				<td><%=p_tel1+"-"+p_tel2+"-"+p_tel3%></td>				
				<td><%=p_city%></td>				
				<%
				}
			// 9 단계 : [select] close() 사용하기.
				stmt.close();
				rs.close();
				con.close();
				%>
			</tr>
			
		</table>	
</body>
<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
</html>