package com.fourman.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.fourman.dto.ProductDto;
import com.fourman.util.DBConn;

public class ProductDao {
	public ArrayList<ProductDto> SearchProduct(String pname) {
		ResultSet rs=null;
		ArrayList<ProductDto> search=new ArrayList<ProductDto>();
		String sql=String.format("select * from product where pname like '%%%s%%'",pname); //
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
}
