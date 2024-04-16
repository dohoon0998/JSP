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
<form action="RegiConfirm.jsp">

	<table border="1">
		<tr>
			<th>주민번호</th>
			<td>
			<input type="text" name="v_jumin" id="v_jumin"> 예 : 8906153154726
			</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>
			<input type="text" name="v_name" id="v_name">
			</td>
		</tr>
		<tr>
			<th>투표번호</th>
			<td>
			<select name="choice_no" id="choice_no">
				<option></option>
				<option value="1">[1]김광찬</option>
				<option value="2">[2]유관순</option>
				<option value="3">[3]이율곡</option>
				<option value="4">[4]이순신</option>
				<option value="5">[5]김연아</option>
			</select>		
			</td>
		</tr>
		<tr>
			<th>투표시간</th>
			<td>
			<input type="text" name="v_time" id="v_time">
			</td>
		</tr>
		<tr>
			<th>투표장소</th>
			<td>
			<input type="text" name="v_erea" id="v_erea">
			</td>
		</tr>
		<tr>
			<th>유권자확인</th>
			<td>
			<input style="float:none;" type="radio" name="v_confirm" value="Y" id="v_confirm">확인 
			<input style="float:none;" type="radio" name="v_confirm" value="N" id="v_confirm">미확인
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
			<input type="submit" value="투표하기">
			</td>
		</tr>
	</table>
</form>
<button onClick="window.location.reload()">다시쓰기</button>
</section>
<a href="Index.jsp">홈으로</a>

</body>
</html>