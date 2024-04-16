package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;

@WebServlet("/")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doPro(request, response);
	}
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String command = uri.substring(context.length());
		String site = null;
		
		System.out.println("command:"+command);
		
		MemberDAO member = new MemberDAO();
		
		switch(command) {
		case "/home" :
			
			site = "index.jsp";
			break;
		
		case "/add" :		
			site = member.nextCustno(request, response);
			break;
		
		case "/list" :			
			site = member.selectAll(request, response);
			break;
		
		case "/result" :		
			site = member.selectResult(request, response);
			break;
		case "/insert" :		
			String result3 = member.insert(request, response);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter ouy = response.getWriter();
			if(result3 == "") {
				ouy.println("<script>");
				ouy.println(" alert('실패!'); location.href='"+context+"';  ");
				ouy.println("</script>");
				ouy.flush();
			}else {
				ouy.println("<script>");
				ouy.println("alert('회원등록이 완료되었습니다!'); location.href='"+context+"'; ");
				ouy.println("</script>");
				ouy.flush();
			}
			break;
		case "/modify" :		
			site = member.modify(request, response);
			break;
		case "/update" :
			int result1 = member.update(request, response);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			if(result1 == 1) {
				out.println("<script>");
				out.println(" alert('회원수정이 완료 되었습니다!'); location.href='"+context+"';  ");
				out.println("</script>");
				out.flush();
			}else {
				out.println("<script>");
				out.println("alert('수정실패!'); location.href='"+context+"'; ");
				out.println("</script>");
				out.flush();
			}
			break;
		case "/delete" :
			int result2 = member.delete(request, response);
			response.setContentType("text/html; charset=UTF-8");
			out = response.getWriter();
			if(result2 == 1) {
				out.println("<script>");
				out.println(" alert('회원삭제가 완료 되었습니다!'); location.href='"+context+"';  ");
				out.println("</script>");
				out.flush();
			}else {
				out.println("<script>");
				out.println("alert('삭제실패!'); location.href='"+context+"'; ");
				out.println("</script>");
				out.flush();
			}
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(site);
		dispatcher.forward(request,  response);
	}
}