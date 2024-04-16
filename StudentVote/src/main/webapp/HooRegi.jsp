<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
</head>
<body>
<section>
<h2>투표하기</h2>
<form action="HooRegiConfirm.jsp">

	<table border="1">
		<tr>
			<th>후보번호</th>
			<td>
			<input type="text" name="no" id="no">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
			<input type="text" name="name" id="name">
			</td>
		</tr>
		<tr>
			<th>팀번호</th>
			<td>
			<select name="code" id=code">
				<option></option>
				<option value="p1">1팀</option>
				<option value="p2">2팀</option>
				<option value="p3">3팀</option>
				<option value="p4">4팀</option>
				<option value="p5">5팀</option>
			</select>		
			</td>
		</tr>
		<tr>
			<th>학력</th>
			<td>
			<select name="school" id="school">
				<option></option>
				<option value="1">중졸</option>
				<option value="2">고졸</option>
				<option value="3">전문대졸</option>
				<option value="4">대졸</option>
				<option value="5">석사수료</option>
				<option value="6">석사취득</option>
				<option value="7">박사수료</option>
				<option value="8">박사취득</option>
			</select>		
			</td>
		</tr>
		<tr>
			<th>주민번호</th>
			<td>
			<input type="text" name="jumin1" id="jumin1">
			 - <input type="text" name="jumin2" id="jumin2">
			
			</td>
		</tr>
		<tr>
			<th>전공학년반</th>
			<td>
			<input type="text" name="major" id="major">
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
			<input type="submit" value="등록">
			</td>
		</tr>
	</table>
</form>
</section>
<a href="Index.jsp">홈으로</a>
</body>
</html>