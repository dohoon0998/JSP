<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사결과입력</title>
</head>
<header>
	<jsp:include page="Header.jsp"></jsp:include>
</header>
<body>
	<h3 align="center">검사결과입력</h3>	
	<form name="frm" action="2.Paitend_Result_Process" method="post">
		<table align="center" border="1">
			<tr>
				<td>환자코드</td>
				<td><input type="text" name="p_no"> 예)1001</td>
			</tr>
			<tr>
				<td>검사명</td>
				<td>
				<select name="t_code">
				<option value="">검사명</option>
				<option value="T001">[T001]결핵</option>
				<option value="T002">[T002]장티푸스</option>
				<option value="T003">[T003]수두</option>
				<option value="T004">[T004]홍역</option>
				<option value="T005">[T005]클레라</option>
				</select></td>
			</tr>
			<tr>
				<td>검사시작일</td>
				<td><input type="text" name="t_sdate"> 예)20240101</td>
			</tr>
			<tr>
				<td>검사상태</td>
				<td><input type="radio" name="t_status" value="1">검사중
				<input type="radio" name="t_status" value="2">검사완료
				</td>
			</tr>
			<tr>
				<td>검사완료일</td>
				<td><input type="text" name="t_ldate"> 예)20240101</td>
			</tr>
			<tr>
				<td>검사결과</td>
				<td><input type="radio" name="t_result" value="X">미입력
				<input type="radio" name="t_result" value="P">음성
				<input type="radio" name="t_result" value="N">양성
				</td>
			</tr>
			<tr align="center"><td colspan="2">
			<input type="submit" value="등록">
			<input type="reset" value="재입력">
			</td>
			</tr>
		</table>	
	</form>
</body>
<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
<!-- html 폼에서 값을 넘기면 그 값을 받아오는게 getparameter다 -->
</html>