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
<title>검사결과입력</title>
</head>
<script type="text/javascript">
	function check() {
		var p_no = document.frm.p_no.value;		
		var t_code = document.frm.t_code.value;		
		var t_sdate = document.frm.t_sdate.value;		
		var t_status = document.frm.t_status.value;		
		var t_ldate = document.frm.t_ldate.value;		
		var t_result = document.frm.t_result.value;		
		
		if (p_no == "") {
			alert("환자코드를 입력하세요!");
		} 
		if (t_code == "") {
			alert("검사명을 선택하세요!");
		}
		if (t_sdate == "") {
			alert("검사시작일을 입력하세요!");
		}
		if (t_status == "") {
			alert("검사상태를 선택하세요!");
		}
		if (t_ldate == "") {
			alert("검사 완료일을 입력하세요!");
		}
		if (t_result == "") {
			alert("검사 결과를 선택하세요!");
		}		
		if (!(p_no == "" && t_code == "" && t_sdate == "" && t_status == "" && t_ldate == "" && t_resutl == "")){
			alert("정상적으로 등록되었습니다!");
			document.frm.submit();
		}
	}
	
	function reset_focus() {
		alert("모든 데이터를 삭제하고 처음부터 다시 입력합니다!");
		document.frm.reset();
		document.frm.p_no.focus();
		return false;
	}
</script>
<header>
	<jsp:include page="Header.jsp"></jsp:include>
</header>
<body>
	<h3 align="center">검사결과입력</h3>	
	<form name="frm" action="Paitend_Result_Process.jsp" method="post">
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
				<td><input type="text" name="t_sdate"> 예)20200101</td>
			</tr>
			<tr>
				<td>검사상태</td>
				<td><input type="radio" name="t_status" value="1">검사중
				<input type="radio" name="t_status" value="2">검사완료
				</td>
			</tr>
			<tr>
				<td>검사완료일</td>
				<td><input type="text" name="t_ldate"> 예)20200101</td>
			</tr>
			<tr>
				<td>검사결과</td>
				<td><input type="radio" name="t_result" value="X">미입력
				<input type="radio" name="t_result" value="P">음성
				<input type="radio" name="t_result" value="N">양성
				</td>
			</tr>
			<tr align="center"><td colspan="2">
			<input type="button" value="등록" onclick="check()">
			<input type="button" value="재입력" onclick="reset_focus()">
			
			</td>
			</tr>
		</table>	
	</form>
</body>
<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
</html>