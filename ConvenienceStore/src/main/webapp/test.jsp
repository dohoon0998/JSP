<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String sql = "select max(sale_no)+1, sysdate from sale_tbl_003 group by sysdate";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

rs.next();
%>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<h3>매출 등록</h3>
<section>
	<div>
		<form action="Regi5">
			<table border="1">
				<tr>
					<th>구매번호(자동발생)</th>
					<td><input type="text" readonly name="sale_no" value="00<%=rs.getString(1)%>"></td>
				</tr>
				
				<tr>
					<th>구매일자(자동발생)</th>
					<td><input type="text" readonly name="sale_ymd" value="<%= rs.getString(2).substring(0, 10) %>"></td>
				</tr>
				
				<tr>
					<th>구매구분</th>
					<td>
						<select name="sale_fg">
							<option></option>
							<option value="1">판매</option>
							<option value="2">취소</option>
						</select>		
					</td>
				</tr>
				
				<tr>
					<th>구매점포</th>
					<td>
						<input type="checkbox" id="coding" name="interest" value="coding" checked />
						<label for="coding">코딩</label>		
					</td>
				</tr>
				
				<tr>
					<th>구매상품</th>
					<td>
						<input type="checkbox" id="coding" name="interest" value="coding" checked />
    					<label for="coding">코딩</label>		
					</td>
				</tr>
				
				<tr>
					<th>구매수량</th>
					<td><input type="text" name="sale_cnt"></td>
				</tr>		
				
				<tr>
					<th>구취구분</th>
					<td>
						<select name="pay_type">
							<option></option>
							<option value="01">현금</option>
							<option value="02">카드</option>
						</select>		
					</td>
				</tr>	
				
				<tr>
				<td colspan="2"><input type="submit" value="등록"><a href="List.jsp">조회</a></td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>