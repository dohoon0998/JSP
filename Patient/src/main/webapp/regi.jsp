<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="Global.css">

<jsp:include page = "header.jsp"></jsp:include>

	<h3 class="H3">검사결과입력</h3>
<section class="Sec">
	
	<form action="regiAction.jsp" name="regiForm">	
	<div class="vTableDiv2">
	<table class="vTable" border="1">
		<tr>
			<th> 환자번호</th>
			<td> <input name="p_no"> 예)1001</td>
		</tr>
		<tr>
			<th> 검사코드</th>
			<td> <select name="t_code" id="t_code">
					<option selected="selected" value=""> 검사명
					<option value="T001"> [T001]결핵
					<option value="T002"> [T002]장티푸스
					<option value="T003"> [T003]수두
					<option value="T004"> [T004]홍역
					<option value="T005"> [T005]콜레라
				</select>
			</td>
		</tr>
		<tr>
			<th> 검사시작일자</th>
			<td> <input name="t_sdate"> 예)20200101</td>
		</tr>
		<tr>
			<th> 검사상태</th>
			<td> 
				<input type="radio" name="t_status" value="검사중">검사중
				<input type="radio" name="t_status" value="검사완료">검사완료
			</td>
		</tr>
		<tr>
			<th> 검사완료일자</th>
			<td> <input name="t_ldate"> 예)20200101</td>
		</tr>
		<tr>
			<th> 검사결과</th>
			<td> 
				<input type="radio" name="t_result" value="미입력"> 미입력
				<input type="radio" name="t_result" value="양성"> 양성
				<input type="radio" name="t_result" value="음성"> 음성
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" value="검사결과등록" onclick="return check()">
				<input type="reset" value="다시쓰기" onclick="rewrite()">
			</td>
		</tr>
	</table>
	</div>
	</form>
	<script>
	function check(){
		
		if(document.regiForm.p_no.value.length == 0 ){
			alert("환자번호가 입력되지 않았습니다!");
			return false;
		} 

		if(document.regiForm.t_code.value.length == 0 ){
			alert("검사코드가 선택되지 않았습니다!");
			return false;
		} 

		if(document.regiForm.t_sdate.value.length == 0 ){
			alert("검사시작일자가 입력되지 않았습니다!");
			return false;
		} 
		
		if(document.regiForm.t_status.value.length == 0){
			alert("검사상태가 선택되지 않았습니다.");
			return false;
		}
		if(document.regiForm.t_ldate.value.length == 0){
			alert("검사완료일자가 입력되지 않았습니다.");
			return false;
		}
		if(document.regiForm.t_result.value.length == 0){
			alert("검사결과가 선택되지 않았습니다.");
			return false;
		}
		
		alert("검사결과가 정상적으로 등록되었습니다. ")
		return true;
	}
	</script>
</section>

<jsp:include page = "footer.jsp"></jsp:include>