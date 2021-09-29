package com.fourman.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;


import com.fourman.dto.AdminLogin;
import com.fourman.dto.OrderDto;
import com.fourman.dto.ProductDto;
import com.fourman.dto.UserDto;
import com.fourman.util.DBConn;



public class AdminDao {
	
	
	public int adminlogin(String sysid,String syspw) {
		int resultValue=0;
		String sql=String.format(
				"select * from admin where sysid='%s' and syspw ",sysid,syspw);
		DBConn.getInstance();
		resultValue=DBConn.statementUpdate(sql);
		DBConn.dbClose();
		
		return resultValue;
	}
	
	public ArrayList<ProductDto> selectproduct() {
		ResultSet rs=null;
		ArrayList<ProductDto> pdtos=new ArrayList<ProductDto>();
		String sql="select * from product";
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				pdtos.add(
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
		return pdtos;
	}
	
	public ArrayList<ProductDto> searchProduct(String pname) {
		ResultSet rs=null;
		ArrayList<ProductDto> search=new ArrayList<ProductDto>();
		String sql=String.format("select * from product where pname like '%%%s%%'", pname);
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				search.add(
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
		return search;
	}
	
	
	public int insert(ProductDto dto) {
		int returnValue=0;
		String sql=String.format(
				"insert into product values('%s','%s','%s',%d,'%s','%s','%s',to_date(sysdate,'yyyy-MM-dd'))",dto.getPNum(),dto.getPname()
				,dto.getPkind(),dto.getPprice(),dto.getPContent(),dto.getPimage(),dto.getPbest());
		System.out.println(sql);
		DBConn.getInstance();
		returnValue=DBConn.statementUpdate(sql);
		DBConn.dbClose();
		return returnValue;
	}
	
	public int deleteproduct(String pnum) {
		int resultValue=0;
		String sql=String.format(
				"delete from product where pnum='%s'",pnum);
		System.out.println(sql);
		DBConn.getInstance();
		resultValue=DBConn.statementUpdate(sql);
		DBConn.dbClose();
		
		return resultValue;
	}
	
	public ArrayList<ProductDto> updateproduct(String pnum) {
		ResultSet rs=null;
		ArrayList<ProductDto> updateproduct=new ArrayList<ProductDto>();
		String sql=String.format("select * from product where pnum='%s'",pnum);
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				updateproduct.add(
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
		return updateproduct;
	}
	
	public int updateprdouct(String pnum, String pname,String pkind, int pprice, String pcontent, 
			String pimage, String pbest) {
		int resultValue=0;
		String sql=String.format(
				"update product set pname='%s',pkind='%s',pprice=%d,pcontent='%s',"
				+ "pimage='%s',pbest='%s' where pnum='%s'",
				pname,pkind,pprice,pcontent,pimage,pbest,pnum);
		DBConn.getInstance();
		resultValue=DBConn.statementUpdate(sql);
		DBConn.dbClose();
		
		return resultValue;
		
	}
	
//	private String Id;
//	private String Pw;
//	private String UserName;
//	private String Email;
//	private String Address;
//	private String PhoneNum;
	public ArrayList<UserDto> userList() {
		ResultSet rs=null;
		ArrayList<UserDto> userList=new ArrayList<UserDto>();
		String sql="select * from member";
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				userList.add(
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
		return userList;
	}
	public int deleteuser(String id) {
		int resultValue=0;
		String sql=String.format(
				"delete member where id='%s' ",id);
		DBConn.getInstance();
		resultValue=DBConn.statementUpdate(sql);
		DBConn.dbClose();
		
		return resultValue;
	}
	public ArrayList<UserDto> search_user(String id,String name) {
		ResultSet rs=null;
		ArrayList<UserDto> search_user=new ArrayList<UserDto>();
		String sql=String.format("select * from member where id like '%%%s%%' or username like '%%%s%%'", id,name);
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				search_user.add(
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
		return search_user;
	}
	public ArrayList<OrderDto> list_order(){
		ResultSet rs=null;
		ArrayList<OrderDto>  listorder=new ArrayList<OrderDto>();
		String sql="select * from orderinfo";
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				listorder.add(
						new OrderDto(
								rs.getString("ordernum"),
								rs.getString("id"),
								rs.getString("pnum"),
								rs.getInt("ordercount"),
								rs.getString("psize"),
								rs.getString("pcolor"),
								rs.getDate("orderdate"),
								rs.getInt("orderprice")
								)
						);
				} 
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return  listorder;
	}
	
	public int orderdelete(String ordernum) {
		int resultValue=0;
		String sql=String.format(
				"delete orderinfo where ordernum='%s' ",ordernum);
		System.out.println(sql);
		DBConn.getInstance();
		resultValue=DBConn.statementUpdate(sql);
		DBConn.dbClose();
		
		return resultValue;
	}
	
	public ArrayList<OrderDto> search_order(String ordernum, String userid ){
		ResultSet rs=null;
		ArrayList<OrderDto> search_order=new ArrayList<OrderDto>();
		String sql=String.format("select * from member where ordernum like '%%%s%%' "
				+ "or userid like '%%%s%%'",
				ordernum,userid);
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				search_order.add(
						new OrderDto(
								rs.getString("ordernum"),
								rs.getString("userid"),
								rs.getString("pnum"),
								rs.getInt("ordercount"),
								rs.getString("psize"),
								rs.getString("pcolor"),
								rs.getDate("orderdate"),
								rs.getInt("orderprice")
								)
						);
				} 
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return  search_order;
	}
}
