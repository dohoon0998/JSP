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
		<form action="RegiConfirm.jsp">
			<table border="1">
				<tr>
					<th>판매번호(자동발생)</th>
					<td><input type="text" readonly name="sale_no" value="00<%=rs.getString(1)%>"></td>
				</tr>
				
				<tr>
					<th>판매일자(자동발생)</th>
					<td><input type="text" readonly name="sale_ymd" value="<%= rs.getString(2).substring(0, 10) %>"></td>
				</tr>
				
				<tr>
					<th>판매구분</th>
					<td>
						<select name="sale_fg">
							<option></option>
							<option value="1">판매</option>
							<option value="2">취소</option>
						</select>		
					</td>
				</tr>
				
				<tr>
					<th>판매점포</th>
					<td>
						<select name="store_cd">
							<option></option>
							<option value="A001">이태원점</option>
							<option value="A002">한남점</option>
							<option value="A003">도원점</option>
							<option value="B001">혜화점</option>
							<option value="C001">방배점</option>
							<option value="D001">사당점</option>
							<option value="D002">흑석점</option>
							<option value="E001">금호점</option>
						</select>		
					</td>
				</tr>
				
				<tr>
					<th>판매상품</th>
					<td>
						<select name="goods_cd">
							<option></option>
							<option value="110001">라면</option>
							<option value="110002">빵</option>
							<option value="110003">과자</option>
							<option value="110004">탄산음료</option>
							<option value="110005">삼각김밥</option>
							<option value="110006">초콜릿</option>
							<option value="110007">우유</option>
						</select>		
					</td>
				</tr>
				
				<tr>
					<th>판매수량</th>
					<td><input type="text" name="sale_cnt"></td>
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
				<td colspan="2"><input type="submit" value="등록"><a href="List.jsp">조회</a></td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>