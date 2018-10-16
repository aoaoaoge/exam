package com.pan.exam.dao.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pan.exam.common.JdbcUtil;

import com.pan.exam.entity.Option;
import com.pan.exam.entity.TestQuestions;



public class RdmExeDao {

	/**
	 * 获取题目信息
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public List<TestQuestions> queryAllUsersOnpage(int pageNo,int pageSize,int[] rdmquesid){
		//访问数据库
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<TestQuestions> list = new ArrayList<>();
		try {
			
			con = JdbcUtil.conn();					
			String count = "";
			for (int i =0;i<rdmquesid.length;i++) {
				if(i==rdmquesid.length-1) {
					count+=rdmquesid[i]+"";
					break;
				}
				count+=rdmquesid[i]+",";
			}						
			ps = con.prepareStatement("select * from tb_testquestion where testquestion_id in ("+count+") limit ?,?");
			ps.setInt(1, (pageNo-1)*pageSize);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			
			while(rs.next()) {				
				TestQuestions user = new TestQuestions(rs.getInt("testquestion_id"), rs.getString("testquestion_type"), rs.getString("testquestion_content"),
						rs.getString("testquestion_answer"),rs.getString("testionquestion_keyword"));
				
				list.add(user);
				
			}
			
		}  catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.shutdownConnection(con, ps, rs);
		}
		for(TestQuestions user:list) {
			System.out.println(user);
		}
		return  list;
	}
	


	//获取总页数
	public int pageCount() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;		
		try {
			
			con =JdbcUtil.conn();
			ps = con.prepareStatement("select count(*) from tb_testquestion ");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//获取题目对应的选项
	public List<Option> queryoption(String testquestion_id){
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	List<Option> option = new ArrayList<>();
	try {
		
		con = JdbcUtil.conn();
		
		ps = con.prepareStatement("select * from tb_option where testquestion_id=?");	
		ps.setString(1, testquestion_id);				
		rs = ps.executeQuery();
		
		while(rs.next()) {
			
			Option user = new Option(rs.getInt("option_id"), rs.getString("option"), rs.getString("option_content"),rs.getInt("testquestion_id"));
							
			option.add(user);
		}
	}  catch (SQLException e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.shutdownConnection(con, ps, rs);
		}
	return option;
	
}
}