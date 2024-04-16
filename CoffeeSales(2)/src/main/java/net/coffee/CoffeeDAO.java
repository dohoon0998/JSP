package net.coffee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBOpen;

public class CoffeeDAO {
	
	//1) 판매현황
	public ArrayList<SaleDTO> salelist(){
        ArrayList<SaleDTO> list=null;
        try{
            Connection con=DBOpen.getConnection();
            StringBuilder sql=new StringBuilder();
            sql.append(" select TSALE.saleno ,TSALE.pcode, TSALE.saledate, TSALE.scode, TPRO.name, TSALE.amount, (TPRO.cost * TSALE.amount) as TOT ");
            sql.append(" from ");
            sql.append("     tbl_salelist_01 TSALE join tbl_product_01 TPRO  ");
            sql.append("     on TSALE.pcode = TPRO.pcode "); 
            sql.append("     ORDER BY TSALE.saleno ");
            
            PreparedStatement pstmt=con.prepareStatement(sql.toString());
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
                list=new ArrayList<SaleDTO>();
                do{
                	SaleDTO dto=new SaleDTO();
                    dto.setSaleno(rs.getInt("saleno"));
                    dto.setPcode(rs.getString("pcode"));
                    dto.setSaledate(rs.getString("saledate"));
                    dto.setScode(rs.getString("scode"));
                    dto.setName(rs.getString("name"));
                    dto.setAmount(rs.getInt("amount"));
                    dto.setTot(rs.getInt("tot"));
                    list.add(dto);
                }while(rs.next());
            }else{
                list=null;
            }//if end
        }catch(Exception e){
            System.out.println("판매현황조회실패:"+e);
        }//try end
        return list;
    }//list() end	
	
	//2) 매장별 판매액
	public ArrayList<ShopDTO> shoplist(){
        ArrayList<ShopDTO> list=null;
        try{
            Connection con=DBOpen.getConnection();
            StringBuilder sql=new StringBuilder();
            sql.append(" select AA.scode, TSH.sname, AA.SHAP ");
            sql.append(" from ( ");
            sql.append("     SELECT TSALE.scode, SUM(TPRO.cost * tsale.amount) as SHAP  ");
            sql.append("     from tbl_salelist_01 TSALE join tbl_product_01 TPRO "); 
            sql.append("     on TSALE.pcode = TPRO.pcode "); 
            sql.append("     GROUP BY TSALE.scode ) AA join tbl_shop_01 TSH "); 
            sql.append("     on AA.scode = TSH.scode ");
            
            PreparedStatement pstmt=con.prepareStatement(sql.toString());
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
                list=new ArrayList<ShopDTO>();
                do{
                	ShopDTO dto=new ShopDTO();
                    dto.setScode(rs.getString("scode"));
                    dto.setSname(rs.getString("sname"));
                    dto.setShap(rs.getInt("shap"));
                    list.add(dto);
                }while(rs.next());
            }else{
                list=null;
            }//if end
        }catch(Exception e){
            System.out.println("매장별 판매액 조회실패:"+e);
        }//try end
        return list;
    }//list() end	
	
	//3) 상품별 판매액
		public ArrayList<ProDTO> prolist(){
	        ArrayList<ProDTO> list=null;
	        try{
	            Connection con=DBOpen.getConnection();
	            StringBuilder sql=new StringBuilder();
	            sql.append(" select TPRO.pcode, TPRO.name, sum(TPRO.cost * tsale.amount) as HAP ");
	            sql.append(" from tbl_product_01 TPRO join tbl_salelist_01 TSALE ");
	            sql.append(" on TSALE.pcode = TPRO.pcode  ");
	            sql.append(" GROUP BY TPRO.pcode, TPRO.name "); 
	            sql.append(" ORDER BY TPRO.pcode ASC "); 
	            
	            PreparedStatement pstmt=con.prepareStatement(sql.toString());
	            ResultSet rs=pstmt.executeQuery();
	            if(rs.next()){
	                list=new ArrayList<ProDTO>();
	                do{
	                	ProDTO dto=new ProDTO();
	                    dto.setPcode(rs.getString("pcode"));
	                    dto.setName(rs.getString("name"));
	                    dto.setHap(rs.getInt("hap"));
	                    list.add(dto);
	                }while(rs.next());
	            }else{
	                list=null;
	            }//if end
	        }catch(Exception e){
	            System.out.println("매장별 판매액 조회실패:"+e);
	        }//try end
	        return list;
	    }//list() end	
		
	//4) 판매등록
		//1) Data Insert
		public int insert(SaleDTO dto) {
			int cnt = 0;
			try {
				//1. DB연결
				Connection con=DBOpen.getConnection();
				StringBuilder sql = new StringBuilder();
						
				//2. Insert SQL문 작성
				sql.append(" INSERT INTO tbl_salelist_01 ( saleno, pcode, saledate, scode, amount ) "); 
				sql.append(" VALUES( ");
				sql.append(" ?,?,SYSDATE,?,? ) ");
						
				//3. SQL문 변환
				PreparedStatement pstmt = con.prepareStatement(sql.toString());
						
				//4. Value값 불러오기
				pstmt.setInt(1, dto.getSaleno());
				pstmt.setString(2, dto.getPcode());
				pstmt.setString(3, dto.getScode());
				pstmt.setInt(4, dto.getAmount());
								
				//5. 실행
				cnt = pstmt.executeUpdate();
						
			} catch(Exception e) {
				System.out.println("행추가일때: "+e);
			}
			return cnt;
		}	
		
}