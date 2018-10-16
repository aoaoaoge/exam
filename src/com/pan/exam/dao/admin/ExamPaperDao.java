package com.pan.exam.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pan.exam.common.JdbcUtil;

public class ExamPaperDao {
	
	public boolean addExamPaper(String testpaper_name,String methodOfPaper,String paperType,String passScore,String score,String time) {
		
		return JdbcUtil.update("INSERT INTO tb_testpaper(testpaper_name,testpaper_fangshi,testpaper_type,testpaper_jigefenshu,testpaper_zongfen,testpaper_time,admin_id,testpaper_modify) " + 
				"VALUES(?,?,?,?,?,?,'4',NOW())", testpaper_name,methodOfPaper,paperType,passScore,score,time);
	}
	public boolean addExamPaper_Question(String testpaper_name,String[] qusetionnum,String[] points) {
		boolean flage = false; 
		for(int i=0;i<points.length;i++){
			if(points[i] != ""){
				String sql = "INSERT INTO tb_subject(testquestion_id," + 
						"testpaper_id,subject_count) " + 
						"VALUES((SELECT testpaper_id FROM tb_testpaper WHERE testpaper_name=?),)";
				flage = JdbcUtil.update(sql, testpaper_name);
			}
		}
		String sql = "INSERT INTO tb_subject(testquestion_id," + 
				"testpaper_id,subject_count) " + 
				"VALUES((SELECT testpaper_id FROM tb_testpaper WHERE testpaper_name=?),)";
		return flage;
	}
	/**
	 * 查询对应试题类型的试题数量
	 * @param qtype	试题类型
	 * @return		数量
	 */
	public int countQuestionByQuestionType(int qtype){
		Connection conn = JdbcUtil.conn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {
			ps = conn.prepareStatement("select count(*) from tb_testquestion where testquestion_type="+qtype+"");
			rs = ps.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
}
