<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBPKG.JDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	StringBuffer sb = new StringBuffer();
	sb.append(" select m_no, m_name from tbl_member_202005 ");

    String sql = sb.toString();
    System.out.println(sql);
    Connection conn = JDBConnection.getConnection();
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
	%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css?ver=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chkVal() {
		var test = document.tData;
		if(!test.num.value) {
			alert("주민번호가 입력되지 않았습니다!");
			test.num.focus();
			return false;
		}
		if(!test.name.value) {
			alert("성명이 입력되지 않았습니다!");
			test.name.focus();
			return false;
		}
		if(!test.hnum.value) {
			alert("후보번호가 선택되지 않았습니다!");
			test.hnum.focus();
			return false;
		}
		if(!test.ti.value) {
			alert("투표시간이 입력되지 않았습니다!");
			test.ti.focus();
			return false;
		}
		if(!test.ad.value) {
			alert("투표장소가 입력되지 않았습니다!");
			test.ad.focus();
			return false;
		}
		if(!test.ch.value) {
			alert("유권자확인이 선택되지 않았습니다!");
			test.ch.focus();
			return false;
		}
		}
	
</script>
</head>
<body>
	<%@ include file="inter.jsp"%>
	<section>
		<h2 class="title">투표하기</h2>
		<form action="addpro.jsp" name="tData" method="post" onsubmit="return chkVal()">
			<table border="1">
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="num"></td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>후보번호</td>
					<td>
					<select name="hnum">
						<option value=""></option>
						<% while(rs.next()){ %>
						<option value="<%= rs.getString(1) %>"><%= rs.getString(1) %>.<%= rs.getString(2) %></option>
						<%} %>
					</select>
					</td>
				</tr>
				<tr>
					<td>투표시간</td>
					<td><input type="text" name="ti"></td>
				</tr>
				<tr>
					<td>투표장소</td>
					<td><input type="text" name="ad"></td>
				</tr>
				<tr>
					<td>유권자확인</td>
					<td><input type="radio" name="ch" checked="checked" value="Y">확인 <input type="radio" name="ch" value="N">미확인</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="투표하기">
					<input type="reset" value="다시하기">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>