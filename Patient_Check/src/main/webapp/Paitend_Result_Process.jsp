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
<title>검사결과조회</title>
</head>
<body>
	<%
	//1 단계 : JDBC 드라이버 로드.
	Class.forName("oracle.jdbc.OracleDriver");

	//2 단계 : 커넥션 객체 생성.
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

	//3 단계 : PreparedStatement, Statement, ResultSet 객체생성.
	/*
	■ PreparedStatement : 쿼리문▶ insert, update, delete 문 사용시 사용함.
	■ Statement :         쿼리문▶ select 문 사용시 사용함.
	■ ResultSet :         쿼리문▶ select 문 사용시 사용함.
	*/
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	// 4 단계 : String SQL을 통해 쿼리문 작성.
	String SQL = "insert into tbl_result_202004 values(?, ?, ?, ?, ?, ?)";

	// 5 단계 : [insert, update, delete] 폼에서 입력한 값을 받아서 request.getParameter을 통해 저장.
	String p_no = request.getParameter("p_no");
	String t_code = request.getParameter("t_code");
	String t_sdate = request.getParameter("t_sdate");
	String t_status = request.getParameter("t_status");
	String t_ldate = request.getParameter("t_ldate");
	String t_result = request.getParameter("t_result");
	out.println("p_no : "+p_no);
	out.print(t_code);
	out.print(t_sdate);
	out.print(t_status);
	out.print(t_ldate);
	out.print(t_result);

	// 6 단계 : [insert, update, delete] PreparedStatement에 Connection.prepareStatement(SQL) 입력.	
	pstmt = con.prepareStatement(SQL);

	// 7 단계 : [insert, update, delete] PreparedStatement에 setString를 통해 컬럼명 저장하기.	
	pstmt.setString(1, p_no);
	pstmt.setString(2, t_code);
	pstmt.setString(3, t_sdate);
	pstmt.setString(4, t_status);
	pstmt.setString(5, t_ldate);
	pstmt.setString(6, t_result);

	// 8 단계 : [insert, update, delete] PreparedStatement에 executeUpdate() 넣어주기.	
	pstmt.executeUpdate();

	// 9 단계 : [select] close() 사용하기.
	pstmt.close();	
	con.close();
	%>
</body>
</html>