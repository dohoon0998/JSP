<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<h3>구매 수정</h3>
<section>
	<div>
		<form action="RegiConfirm.jsp">
			<table border="1">
				<tr>
					<th>구매번호(수정불가)</th>
					<td><input type="text" readonly name="sale_no" value="0010"></td>
				</tr>
				
				<tr>
					<th>구매일자(수정불가)</th>
					<td><input type="text" readonly name="sale_ymd" value="20240402"></td>
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
					<th>점포코드</th>
					<td>
						<select name="sale_fg">
							<option></option>
							<option value="1">이태원점</option>
							<option value="2">한남점</option>
							<option value="2">도원점</option>
							<option value="2">혜화점</option>
							<option value="2">강동점</option>
						</select>		
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>
						<input type="checkbox" id="coding" name="interest" value="coding" checked />
						<label for="coding">라면</label>	
						<input type="checkbox" id="coding" name="interest" value="ye" />	
						<label for="ye">예감</label>
						<input type="checkbox" id="coding" name="interest" value="jade" />		
						<label for="jade">고소미</label>		
						<input type="checkbox" id="coding" name="interest" value="mouse" />		
						<label for="mouse">마우스</label>		
						<input type="checkbox" id="coding" name="interest" value="com"  />		
						<label for="com">컴퓨터</label>		
					</td>
				</tr>
				
				<tr>
					<th>구매수량</th>
					<td><input type="text" name="sale_cnt" value="2"></td>
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
				<td colspan="2"><input type="submit" value="수정"> | <input type="submit" value="삭제"></td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>