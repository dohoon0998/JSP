package member;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

import common.JDBConnect;


	public class MemberDAO extends JDBConnect {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;	 
		
		public static Connection getConnection() throws Exception{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			return con;
		}

		public MemberDAO(ServletContext application) {
			super(application);
		}

		
		public MemberDTO InsertUser(int custno, String custname, String phone, String address, String joindate, String grade, String city) {
			MemberDTO dto = new MemberDTO();
			try {
				String query = "INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city) VALUES(?, ?, ?, ?, ?, ?, ?)";
				psmt = con.prepareStatement(query);
				psmt.setLong(1, custno);
				psmt.setString(2, custname);
				psmt.setString(3, phone);
				psmt.setString(4, address);
				psmt.setString(5, joindate);
				psmt.setString(6, grade);
				psmt.setString(7, city);
				rs = psmt.executeQuery();
				if (rs.next()) {
					dto.setCustno(custno);
					dto.setCustname(custname);
					dto.setPhone(phone);
					dto.setAddress(address);
					dto.setJoindate(joindate);
					dto.setGrade(grade);
					dto.setCity(city);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return dto;
		}
		
		
		public String nextCustno(ServletContext request){
			try {
				conn = getConnection();
				String sql = "SELECT max(custno)+1 custno FROM member_tbl_02";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				int custno = 0;
				if(rs.next()) custno = rs.getInt(1);
				
				request.setAttribute("custno", custno);
				conn.close();
				ps.close();
				rs.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return "add.jsp";
		}
}
