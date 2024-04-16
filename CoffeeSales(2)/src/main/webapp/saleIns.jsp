<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="net.coffee.*"%>
<jsp:useBean id="dao" class="net.coffee.CoffeeDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.coffee.SaleDTO"></jsp:useBean>    
    
<%
	request.setCharacterEncoding("UTF-8");
	int saleno = Integer.parseInt(request.getParameter("saleno").trim());
	String pcode = request.getParameter("pcode").trim();
	String scode = request.getParameter("scode").trim();
	int amount = Integer.parseInt(request.getParameter("amount").trim());

	dto.setSaleno(saleno);
	dto.setPcode(pcode);
	dto.setScode(scode);
	dto.setAmount(amount);
	
	int cnt = dao.insert(dto);
	if (cnt == 0){
		out.println("실행되지 않음");
	} else {
		out.println("<script>");
		out.println(" alert('상품이 등록되었습니다.');");
		out.println(" location.href='saleList.jsp';");
		out.println("</script>");
	}
%>