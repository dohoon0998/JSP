<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="Global.css">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>voteMember</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<section>
<h3>투표하기</h3>
<form action="RegiConfirm.jsp" name="form">
<div>
	<table border="1">
		<tr>
			<th>주민번호</th>
			<td>
			<input type="text" name="v_jumin" id="v_jumin"> ex)8906153154726
			</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>
			<input type="text" name="v_name" id="n_name">
			</td>
		</tr>
		<tr>
			<th>투표번호</th>
			ㅊ
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
			<input type="text" name="v_area" id="v_area">
			</td>
		</tr>
		<tr>
			<th>유권자확인</th>
			<td>
			<input type="radio" name="v_confirm" value="Y" id="v_confirm">확인 
			<input type="radio" name="v_confirm" value="N" id="v_confirm">미확인
			</td>
		</tr>
		<tr>
			<td>
			<button class="btn" type="submit" >투표하기</button>
			<button class="btn" type="button" onclick="fn_reset()">다시하기</button>
			</td>
		</tr>
	</table>
</div>
</form>
</section>
</body>
<!-- <script>
function fn_submit(){
	var f = document.form;	
	
	var v_jumin = f.v_jumin.value;
	if(v_jumin == ""){
		alert("주민번호가 입력되지 않았습니다!");
		f.v_jumin.focus(); return false;
	}
	var v_name = f.v_name.value;
	if(v_name == ""){
		alert("성명이 입력되지 않았습니다!");
		f.v_name.focus(); return false;
	}
	if(f.m_no.value == ""){
		alert("후보번호가 선택되지 않았습니다!");
		f.m_no.focus(); return false;
	}
	if(f.v_time.value == ""){
		alert("투표시간이 입력되지 않았습니다!");
		f.v_time.focus(); return false;
	}
	if(f.v_area.value == ""){
		alert("투표장소가 입력되지 않았습니다!");
		f.v_area.focus(); return false;
	}	
	if(f.v_confirm.value == ""){
		alert("유권자확인이 선택되지 않았습니다!");
		return false;
	}
	f.submit();
}
function fn_reset(){
alert("정보를 지우고 처음부터 다시 입력합니다!");
document.getElementById("v_jumin").focus();
f.v_jumin.focus();
return false;
location="Regi.jsp";
}

function fn_onload(){
document.form.v_jumin.focus();
document.form.onload();
}
</script> -->
<jsp:include page="Footer.jsp"></jsp:include>

</html>