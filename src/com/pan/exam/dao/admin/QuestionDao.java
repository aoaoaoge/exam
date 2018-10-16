package com.pan.exam.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pan.exam.common.JdbcUtil;
import com.pan.exam.entity.Field;
import com.pan.exam.entity.KnowledgePoint;
import com.pan.exam.entity.Question;
import com.pan.exam.entity.Question_Field_KnowledgePoint;
/**
 * 试题管模块理数据访问层
 * @author Administrator
 *
 */
public class QuestionDao {
	/**
	 * 数据库增加试题
	 * @param questionType 		试题类型
	 * @param questionContent 	题目
	 * @param rightAnswer 		正确答案
	 * @param source			来源
	 * @param examPoint			考点
	 * @param keyword			关键字
	 * @param analysis			解析
	 * @return
	 */
	public boolean addQuestion(String questionType,String questionContent,String rightAnswer,String source,String examPoint,String keyword,String analysis) {
		return JdbcUtil.update("insert into tb_testquestion(testquestion_type,testquestion_content,testquestion_answer,testquestion_source,testquestion_examination,testionquestion_keyword,testionquestion_analysis) values(?,?,?,?,?,?,?)",questionType,questionContent,rightAnswer,source,examPoint,keyword,analysis );
	}
	/**
	 * 数据库答案表增加答案
	 * 通过题目名查询到题目id对答案选项表进行绑定
	 * @param questionContent	题目
	 * @param optionContents	选项内容
	 * @return
	 */
	public boolean addOption(String questionContent,String[] optionContents){
		Question q = (Question)JdbcUtil.select(Question.class, "select testquestion_id from tb_testquestion where testquestion_content=?",questionContent);
		int count = 0;
		char op = 'A';
		for(int i = 0;i<optionContents.length;i++) {
			JdbcUtil.update("insert into tb_option(options,option_content,testquestion_id) values('"+(op++)+"',?,?)",optionContents[i],q.getTestquestion_id() );
			count++;
			if(optionContents.length == count){
				return true;
			}
		}
		return false;
	}
	/**
	 * 通过题目查询试题编号
	 * @param questionNames
	 * @return
	 */
	public List<Question> getQuestionIdByQuestionName(List<String> questionContent){
		List<Question> list = new ArrayList<>();
		for (String str : questionContent) {
			Question q = (Question)JdbcUtil.select(Question.class, "select testquestion_id from tb_testquestion where testquestion_content=?",str);
			list.add(q);
		}
		return list;
	}
	/**
	 * 试题知识点中间表信息插入
	 * @param questionContent
	 * @param knoledgePointName
	 * @return
	 */
	public boolean addQuestion_KnoledgePoint(String questionContent,List<String> knoledgePointName){
		Question q = (Question)JdbcUtil.select(Question.class, "select testquestion_id from tb_testquestion where testquestion_content=?",questionContent);
		int count = 0;
		for (String str : knoledgePointName) {
			KnowledgePoint k = (KnowledgePoint)JdbcUtil.select(KnowledgePoint.class, "select knowledeg_id from tb_knowledge where knowledeg_name=?",str);
			JdbcUtil.update("insert into tb_question_testquestion(testquestion_id,knowledeg_id) values(?,?)", q.getTestquestion_id(),k.getKnowledeg_id());
			count++;
			if(knoledgePointName.size() == count){
				return true;
			}
		}
		return false;
	}
	/**
	 * 通过题库名连表查询试题列表
	 * @param Fname
	 * @return
	 */
	public List<Question> showQuestByFieldName(int pageno,String Fname){
		List<Question> list = JdbcUtil.selects(Question.class, "select tb_testquestion.testquestion_id,testquestion_content,testquestion_type,tb_question.question_name as fieldName,tb_knowledge.knowledeg_name as knowledgePointName,tb_testquestion.testquestion_answer,testquestion_source,testquestion_examination,testionquestion_keyword,testionquestion_analysis " + 
				"from tb_question,tb_question_testquestion,tb_knowledge,tb_testquestion " + 
				"where tb_question.question_id = tb_knowledge.question_id " + 
				"	and tb_question_testquestion.knowledeg_id = tb_knowledge.knowledeg_id " + 
				"	and tb_testquestion.testquestion_id = tb_question_testquestion.testquestion_id " + 
				"	and question_name like '%"+Fname+"%' limit "+((pageno-1)*5)+",5");
		return list;
	}
	/**
	 * 获取对应题库类型的试题数量
	 * @param Fname
	 * @return
	 */
	public int countQuestByFieldName(String Fname){
		Connection conn = JdbcUtil.conn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {
			ps = conn.prepareStatement("select count(*) " + 
									"from tb_question,tb_question_testquestion,tb_knowledge,tb_testquestion " + 
									"where tb_question.question_id = tb_knowledge.question_id " +
									"	and tb_question_testquestion.knowledeg_id = tb_knowledge.knowledeg_id "+
									"	and tb_testquestion.testquestion_id = tb_question_testquestion.testquestion_id " +
									"	and question_name like '%"+Fname+"%' ");
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
	/**
	 * 通过知识点名连表查询试题列表
	 * @param Fname
	 * @return
	 */
	public List<Question> shwoQusetionsByPoint(int pageno,String knowledgePointName){
		List<Question> list = JdbcUtil.selects(Question.class, "select tb_testquestion.testquestion_id,testquestion_content,testquestion_type,tb_question.question_name as fieldName,tb_knowledge.knowledeg_name as knowledgePointName,tb_testquestion.testquestion_answer,testquestion_source,testquestion_examination,testionquestion_keyword,testionquestion_analysis " + 
				"from tb_question,tb_question_testquestion,tb_knowledge,tb_testquestion " + 
				"where tb_question.question_id = tb_knowledge.question_id " + 
				"	and tb_question_testquestion.knowledeg_id = tb_knowledge.knowledeg_id " + 
				"	and tb_testquestion.testquestion_id = tb_question_testquestion.testquestion_id " + 
				"	and knowledeg_name like '%"+knowledgePointName+"%' limit "+((pageno-1)*5)+",5");
		return list;
	}
	
	/**
	 * 获取对应知识点类型的试题数量
	 * @param Fname
	 * @return
	 */
	public int countQusetionsByPoint(String knowledgePointName){
		Connection conn = JdbcUtil.conn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {
			ps = conn.prepareStatement("select count(*) " + 
									"from tb_question,tb_question_testquestion,tb_knowledge,tb_testquestion " + 
									"where tb_question.question_id = tb_knowledge.question_id " +
									"	and tb_question_testquestion.knowledeg_id = tb_knowledge.knowledeg_id "+
									"	and tb_testquestion.testquestion_id = tb_question_testquestion.testquestion_id " +
									"	and knowledeg_name like '%"+knowledgePointName+"%' ");
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
	
	/**
	 * 更新试题类型
	 * @param qid 					试题号
	 * @param knowledgePointName 	知识点名
	 * @return
	 */
	public boolean updateQusertion(int qid,String knowledgePointName){
		return JdbcUtil.update("UPDATE tb_question_testquestion SET knowledeg_id = (SELECT knowledeg_id FROM tb_knowledge WHERE knowledeg_name = ?) where testquestion_id = ? ", knowledgePointName,qid);
	}
}
