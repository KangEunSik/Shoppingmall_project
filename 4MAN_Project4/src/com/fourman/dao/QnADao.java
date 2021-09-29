package com.fourman.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.fourman.dto.QnABoardDto;

import com.fourman.util.DBConn;

public class QnADao {
	
	
	public ArrayList<QnABoardDto> userQnalist(String id,String page, String pageDataCount) { //마이페이지 유저 게시글
		ResultSet rs=null;
		ArrayList<QnABoardDto> qnauser=new ArrayList<QnABoardDto>();
		String sql=String.format("select * "+
				  "from (select rownum as rnum1,A.* "+
				  "from (select man4_board.* from man4_board "+ 
				  "where id='%s' order by bGroup desc,bStep asc) A "+ 
				  "where rownum <=%s*%s) "+
				  "where rnum1 >=(%s-1)*%s+1",id,page,pageDataCount,page,pageDataCount); 
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				qnauser.add(
				new QnABoardDto(
						  rs.getInt("bid"),
					      rs.getString("id"),
					      rs.getString("btitle"),
					      rs.getString("bcontent"),
					      rs.getDate("bdate"),
					      rs.getInt("bhit"),
					      rs.getInt("bgroup"),
					      rs.getInt("bstep"),
					      rs.getInt("bindent")
							)
						);
				} 
			}catch (SQLException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
		DBConn.dbClose();
		return qnauser;
	}
	public ArrayList<QnABoardDto> pageselect(String page, String pageDataCount) { //마이페이지 유저 게시글
		ResultSet rs=null;
		ArrayList<QnABoardDto> pageselect=new ArrayList<QnABoardDto>();
		String sql=String.format("select * "+
				  "from (select rownum as rnum1,A.* "+
				  "from (select man4_board.* from man4_board "+ 
				  "order by bGroup desc,bStep asc) A "+ 
				  "where rownum <=%s*%s) "+
				  "where rnum1 >=(%s-1)*%s+1",page,pageDataCount,page,pageDataCount);
				  System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				pageselect.add(
				new QnABoardDto(
						  rs.getInt("bid"),
					      rs.getString("id"),
					      rs.getString("btitle"),
					      rs.getString("bcontent"),
					      rs.getDate("bdate"),
					      rs.getInt("bhit"),
					      rs.getInt("bgroup"),
					      rs.getInt("bstep"),
					      rs.getInt("bindent")
							)
						);
				} 
			}catch (SQLException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
		DBConn.dbClose();
		return pageselect;
	}
	
	
	public ArrayList<QnABoardDto> Qnadetail(int bid) { // 게시글 상세 페이지
		ResultSet rs=null;
		ArrayList<QnABoardDto> qnadetail=new ArrayList<QnABoardDto>();
		String sql=String.format("select * from man4_board where bid=%d order by bgroup desc,bstep asc",bid); 
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		
		if(rs!=null) {
			try {
			while(rs.next()) {
				qnadetail.add(
				new QnABoardDto(
						  rs.getInt("bid"),
					      rs.getString("id"),
					      rs.getString("btitle"),
					      rs.getString("bcontent"),
					      rs.getDate("bdate"),
					      rs.getInt("bhit"),
					      rs.getInt("bgroup"),
					      rs.getInt("bstep"),
					      rs.getInt("bindent")
							)
						);
				} 
			}catch (SQLException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
		DBConn.dbClose();
		return qnadetail;
	}
	
	
	public int qnawrite(QnABoardDto qnawirte) {
		int returnValue=0;
		String sql=String.format(
		"insert into man4_board(bid,id,btitle,bcontent,bhit,bgroup,bstep,bindent) " + 
		"values(man4_board_seq.nextval,'%s','%s','%s',0,man4_board_seq.currval,0,0)"
		,qnawirte.getId(),qnawirte.getBtitle(),qnawirte.getBcontent());
		System.out.println(sql);
		DBConn.getInstance();
		returnValue=DBConn.statementUpdate(sql);
		DBConn.dbClose();
		
		return returnValue;
	}
	public int qna_update(String id, int bid,String title, String content) {
		int resultValue=0;
		String sql=String.format(
				"update man4_board set btitle='%s',bcontent='%s' "
				+ "where id='%s' and bid=%d",
				title,content,id,bid);
		System.out.println(sql);
		DBConn.getInstance();
		resultValue=DBConn.statementUpdate(sql);
		DBConn.dbClose();
		
		return resultValue;
		
	}
	public int qna_delete(String id, int bid) {
		int resultValue=0;
		String sql=String.format(
				"delete man4_board where id='%s'and bid=%d ",id,bid);
		System.out.println(sql);
		DBConn.getInstance();
		resultValue=DBConn.statementUpdate(sql);
		DBConn.dbClose();
		
		return resultValue;
	}
	public int dataCount() {
		ResultSet rs=null;
		int resultValue=0;
		String sql=
				"select  count(bid) bCount from man4_board ";
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		try {
			while(rs.next()) {
				resultValue=rs.getInt("bCount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConn.dbClose();
		
		return resultValue;
	}
	public int userdataCount(String id) {
		ResultSet rs=null;
		int resultValue=0;
		String sql=
				String.format("select  count(bid) bCount from man4_board where id='%s' ",id);
		System.out.println(sql);
		DBConn.getInstance();
		rs=DBConn.statementQuery(sql);
		try {
			while(rs.next()) {
				resultValue=rs.getInt("bCount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConn.dbClose();
		
		return resultValue;
	}
	public void reply(String bId, String bGroup, String bIndent, String bStep, String id, String bTitle,
			String bContent) {
		replyShape(bGroup,bStep);
		try {
			
		
		String sql=String.format("insert into man4_board(bid,id,btitle,bcontent,bgroup,bstep,bindent) "
				+ "values (man4_board_seq.nextval,'"+id+"','"
				+bTitle+"','"+bContent+"',"
				+"%s,%d,%d)"
			,bGroup
			,Integer.parseInt(bStep)+1
			,Integer.parseInt(bIndent)+1
		);
		DBConn.getInstance();
		System.out.println(sql);
		DBConn.statementUpdate(sql);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DBConn.dbClose();
	}
	
	
	private int replyShape(String bGroup, String bStep) {
		// bGroup중에서 bstep보다 큰 데이터들을 하나씩 증가시킨다.
		int resultValue=0;
		try {
		String sql=String.format(
				"update man4_board "
				+"set bstep=bstep+1 "
			+"where bGroup=%s and bstep > %s",
				Integer.parseInt(bGroup),Integer.parseInt(bStep));
		System.out.println(sql);
		DBConn.getInstance();
		resultValue=DBConn.statementUpdate(sql);
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConn.dbClose();
		return resultValue;
	}
	
	
}
