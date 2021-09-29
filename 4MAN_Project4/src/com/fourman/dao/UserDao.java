package com.fourman.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.fourman.dto.OrderDto;
import com.fourman.dto.CartDto;
import com.fourman.dto.CartListDto;
import com.fourman.dto.OrderDetailDto;
import com.fourman.dto.ProductDto;
import com.fourman.dto.UserDto;
import com.fourman.util.DBConn;

public class UserDao {
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	private int ret;
	
	public ArrayList<ProductDto> BestProduct() {
		ResultSet rs=null;
		ArrayList<ProductDto> best=new ArrayList<ProductDto>();
		String sql="select * from product where pbest='1'"; //1은베스트 상품 0은 베스트 상품이 아님
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				best.add(
				new ProductDto(
						rs.getString("PNum"),
						rs.getString("Pname"),
						rs.getString("Pkind"),
						rs.getInt("Pprice"),
						rs.getString("PContent"),
						rs.getString("Pimage"),
						rs.getString("Pbest"),
						rs.getDate("Pregist")
							)
						);
				} 
			}catch (SQLException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
		DBConn.dbClose();
		return best;
	}
	public ArrayList<ProductDto> detailProduct(String Pnum) {
		ResultSet rs=null;
		ArrayList<ProductDto> detail=new ArrayList<ProductDto>();
		String sql=String.format("select * from product where Pnum='%s'",Pnum);
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				detail.add(
				new ProductDto(
						rs.getString("PNum"),
						rs.getString("Pname"),
						rs.getString("Pkind"),
						rs.getInt("Pprice"),
						rs.getString("PContent"),
						rs.getString("Pimage"),
						rs.getString("Pbest"),
						rs.getDate("Pregist")
							)
						);
				} 
			}catch (SQLException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
		DBConn.dbClose();
		return detail;
	}
	public int insert(UserDto user) {
		int returnValue=0;
		String sql=String.format(
		"insert into member values ('%s','%s','%s','%s','%s','%s')"
		, user.getId(),user.getPw(),user.getUserName()
		,user.getEmail(),user.getAddress(),user.getPhoneNum());
		DBConn.getInstance();
		returnValue=DBConn.statementUpdate(sql);
		DBConn.dbClose();
		
		return returnValue;
	}
	

	public ArrayList<UserDto> findId(String name, String email) {
		ResultSet rs=null;
		ArrayList<UserDto> findId=new ArrayList<UserDto>();
		String sql=String.format("select * from member where UserName='%s' and email='%s'",name,email);
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				findId.add(
				new UserDto(
						rs.getString("Id"),
						rs.getString("Pw"),
						rs.getString("UserName"),
						rs.getString("Email"),
						rs.getString("Address"),
						rs.getString("PhoneNum")
							)
						);
				} 
			}catch (SQLException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
		DBConn.dbClose();
		return findId;
	}
	public ArrayList<UserDto> findPw(String name,String id, String email) {
		ResultSet rs=null;
		ArrayList<UserDto> findPw=new ArrayList<UserDto>();
		String sql=String.format("select * from member where UserName='%s' and id='%s' and email='%s'",name,id,email);
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				findPw.add(
				new UserDto(
						rs.getString("Id"),
						rs.getString("Pw"),
						rs.getString("UserName"),
						rs.getString("Email"),
						rs.getString("Address"),
						rs.getString("PhoneNum")
							)
						);
				} 
			}catch (SQLException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
		DBConn.dbClose();
		return findPw;
	}
	public int logIn(String id, String pw) {
			
			
			try {
				Connection con=DBConn.getInstance();
				String sql = "select pw from member where id=?";
				System.out.println(sql);
				pst = con.prepareStatement(sql);
				pst.setString(1, id);
				rs = pst.executeQuery();
				
				if(rs.next()) {
					if(rs.getString(1).equals(pw)) {
						return 1;
					}else {
						return 0;
					}
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DBConn.dbClose();
				
			}
			return -1;
			
		}
//private String ordernum;
//private String userid;
//private String pnum;
//private int ordercount;
//private String psize;
//private String pcolor;
//private Date orderdate;

		public int insert_order(OrderDto orderdto) {
		int returnValue=0;
		String sql=String.format(
		"insert into orderinfo values (orderinfo_seq.nextval,'%s','%s',%d,'%s','%s',to_date(sysdate,'yyyy-MM-DD'),%d)"
				,orderdto.getUserid(),orderdto.getPnum(),orderdto.getOrdercount(),
				orderdto.getPsize(),orderdto.getPcolor(),orderdto.getOrderprice());
		System.out.println(sql);
		DBConn.getInstance();
		returnValue=DBConn.statementUpdate(sql);
		DBConn.dbClose();
		
		return returnValue;
	}
		
//		private String ordernum;
//		private String userid;
//		private String pnum;
//		private String pname;
//		private String pimage;
//		private int pprice;
//		private int ordercount;
//		private String psize;
//		private String pcolor;
//		private Date orderdate;
		
		public ArrayList<OrderDetailDto> select_order(String id) {
			ResultSet rs=null;
			ArrayList<OrderDetailDto> orderdetail=new ArrayList<OrderDetailDto>();
			String sql=String.format("select oi.ordernum,oi.id,oi.pnum,pd.pname,pd.pimage,oi.orderprice,"
					+ "oi.ordercount,oi.psize,oi.pcolor,oi.orderdate from orderinfo oi,product pd where oi.pnum=pd.pnum and oi.id='%s' order by oi.orderdate desc"
					,id);
			System.out.println(sql);
			DBConn.getInstance();
			rs=DBConn.statementQuery(sql);
			
			if(rs!=null) {
				try {
				while(rs.next()) {
					orderdetail.add(
					new OrderDetailDto(
							rs.getString("ordernum"),
							rs.getString("id"),
							rs.getString("pnum"),
							rs.getString("pname"),
							rs.getString("pimage"),
							rs.getInt("orderprice"),
							rs.getInt("ordercount"),
							rs.getString("psize"),
							rs.getString("pcolor"),
							rs.getDate("orderdate")
								)
							);
					} 
				}catch (SQLException e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
			DBConn.dbClose();
			return orderdetail;
		}
		
		public ArrayList<ProductDto> NewProduct() {
			ResultSet rs=null;
			ArrayList<ProductDto> New=new ArrayList<ProductDto>();
			String sql="select * from product order by pregist desc"; //등록 날짜가 최신순으로
			DBConn.getInstance();
			rs=DBConn.statementQuery(sql);
			
			if(rs!=null) {
				try {
				while(rs.next()) {
					New.add(
					new ProductDto(
							rs.getString("PNum"),
							rs.getString("Pname"),
							rs.getString("Pkind"),
							rs.getInt("Pprice"),
							rs.getString("PContent"),
							rs.getString("Pimage"),
							rs.getString("Pbest"),
							rs.getDate("Pregist")
								)
							);
					} 
				}catch (SQLException e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
			DBConn.dbClose();
			return New;
		}
		public ArrayList<ProductDto> TopProduct() {
			ResultSet rs=null;
			ArrayList<ProductDto> Top=new ArrayList<ProductDto>();
			String sql="select * from product where pkind='top'"; //상품 종류가 상의
			DBConn.getInstance();
			rs=DBConn.statementQuery(sql);
			
			if(rs!=null) {
				try {
				while(rs.next()) {
					Top.add(
					new ProductDto(
							rs.getString("PNum"),
							rs.getString("Pname"),
							rs.getString("Pkind"),
							rs.getInt("Pprice"),
							rs.getString("PContent"),
							rs.getString("Pimage"),
							rs.getString("Pbest"),
							rs.getDate("Pregist")
								)
							);
					} 
				}catch (SQLException e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
			DBConn.dbClose();
			return Top;
		}
		public ArrayList<ProductDto> PantsProduct() {
			ResultSet rs=null;
			ArrayList<ProductDto> Pants=new ArrayList<ProductDto>();
			String sql="select * from product where pkind='pants'"; //상품 종류가 상의
			DBConn.getInstance();
			rs=DBConn.statementQuery(sql);
			
			if(rs!=null) {
				try {
				while(rs.next()) {
					Pants.add(
					new ProductDto(
							rs.getString("PNum"),
							rs.getString("Pname"),
							rs.getString("Pkind"),
							rs.getInt("Pprice"),
							rs.getString("PContent"),
							rs.getString("Pimage"),
							rs.getString("Pbest"),
							rs.getDate("Pregist")
								)
							);
					} 
				}catch (SQLException e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
			DBConn.dbClose();
			return Pants;
		}
		public ArrayList<ProductDto> ShoesProduct() {
			ResultSet rs=null;
			ArrayList<ProductDto> Shoes=new ArrayList<ProductDto>();
			String sql="select * from product where pkind='shoes'"; //상품 종류가 상의
			DBConn.getInstance();
			rs=DBConn.statementQuery(sql);
			
			if(rs!=null) {
				try {
				while(rs.next()) {
					Shoes.add(
					new ProductDto(
							rs.getString("PNum"),
							rs.getString("Pname"),
							rs.getString("Pkind"),
							rs.getInt("Pprice"),
							rs.getString("PContent"),
							rs.getString("Pimage"),
							rs.getString("Pbest"),
							rs.getDate("Pregist")
								)
							);
					} 
				}catch (SQLException e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
			DBConn.dbClose();
			return Shoes;
		}
		
		public int insert_cart(CartDto cartdto) {
			int returnValue=0;
			String sql=String.format(
			"insert into cart values (cart_seq.nextval,'%s','%s',%d,'%s','%s',%d)"
			, cartdto.getId(),cartdto.getPnum(),cartdto.getOrdercount(),
			cartdto.getPsize(),cartdto.getPcolor(),cartdto.getCartprice());
			DBConn.getInstance();
			returnValue=DBConn.statementUpdate(sql);
			DBConn.dbClose();
			
			return returnValue;
		}
		
		

		public ArrayList<CartListDto> cartlist(String id) {
			ResultSet rs=null;
			ArrayList<CartListDto> cartList=new ArrayList<CartListDto>();
			String sql=String.format("select ca.cartnum,ca.pnum, pd.pname, pd.pimage, ca.ordercount, ca.psize, ca.pcolor, ca.cartprice" + 
					" from cart ca, product pd where ca.pnum=pd.pnum and id='%s' order by ca.cartnum desc",id); //상품 종류가 상의
			System.out.println(sql);
			DBConn.getInstance();
			rs=DBConn.statementQuery(sql);
			
			if(rs!=null) {
				try {
				while(rs.next()) {
					cartList.add(
					new CartListDto(
							rs.getString("cartnum"),
							rs.getString("pnum"),
							rs.getString("pname"),
							rs.getString("pimage"),
							rs.getInt("ordercount"),
							rs.getString("psize"),
							rs.getString("pcolor"),
							rs.getInt("cartprice")
								)
							);
					} 
				}catch (SQLException e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
			DBConn.dbClose();
			return cartList;
		}
		public int cartdelete(String id, String pnum) {
			int resultValue=0;
			String sql=String.format(
					"delete cart where id='%s' and pnum='%s'",id,pnum);
			DBConn.getInstance();
			resultValue=DBConn.statementUpdate(sql);
			DBConn.dbClose();
			
			return resultValue;
		}
		
	
		
		
		public ArrayList<UserDto> UserInfo(String id) {
			ResultSet rs=null;
			ArrayList<UserDto> userinfo=new ArrayList<UserDto>();
			String sql=String.format("select * from member where id='%s'",id); //등록 날짜가 최신순으로
			DBConn.getInstance();
			rs=DBConn.statementQuery(sql);
			
			if(rs!=null) {
				try {
				while(rs.next()) {
					userinfo.add(
					new UserDto(
							rs.getString("Id"),
							rs.getString("Pw"),
							rs.getString("UserName"),
							rs.getString("Email"),
							rs.getString("Address"),
							rs.getString("PhoneNum")
								)
							);
					} 
				}catch (SQLException e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
			DBConn.dbClose();
			return userinfo;
		}
		public int user_update(String id, String name,String pw, String email, String phone, String address) {
			int resultValue=0;
			String sql=String.format(
					"update member set pw='%s',username='%s',email='%s',address='%s',phonenum='%s' where id='%s'",
					pw,name,email,address,phone);
			DBConn.getInstance();
			resultValue=DBConn.statementUpdate(sql);
			DBConn.dbClose();
			
			return resultValue;
			
		}
		public int DeleteUser(String pw,String userName,String id) {
			
			try {
				
				Connection con=DBConn.getInstance();
				String sql = "select pw,username from member where id=?";
				pst = con.prepareStatement(sql);
				pst.setString(1, id);
				rs = pst.executeQuery();
				
				if(rs.next()) {
					if(pw.equals(rs.getString("pw"))&&userName.equals(rs.getString("username"))) {
						sql = "delete from member where username=? and id=? and pw=?";
						pst = con.prepareStatement(sql);
						pst.setString(1, userName);
						pst.setString(2, id);
						pst.setString(3, pw);
						ret=pst.executeUpdate();
						ret=1;
						System.out.println("삭제성공");
					}else {
						ret=0;
						System.out.println("삭제실패");
					}
				}else {
					ret=-1;
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBConn.dbClose();
				
			}
			return ret;
			
		}
		
			public int idcheck(String id) {
			
			
			try {
				Connection con=DBConn.getInstance();
				String sql = "select id from member where id=?";
				System.out.println(sql);
				pst = con.prepareStatement(sql);
				pst.setString(1, id);
				rs = pst.executeQuery();
				
				if(rs.next()) {
					if(rs.getString(1).equals(id)) {
						return 1;
					}else {
						return 0;
					}
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DBConn.dbClose();
				
			}
			return -1;
			
		}
}
