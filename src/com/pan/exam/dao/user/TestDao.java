package com.pan.exam.dao.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pan.exam.common.JdbcUtil;
import com.pan.exam.entity.Knowledeg;
import com.pan.exam.entity.Opinon_ch;
import com.pan.exam.entity.Test;
import com.pan.exam.entity.Testpaper;
import com.pan.exam.entity.Testquestion;
import com.pan.exam.entity.UserHistory_question_erro;


public class TestDao {
	
	/**
	 * 查询全部知识点
	 * @return0-
	 */
	public List cxzsd(){
		List<Knowledeg> list= new ArrayList<>();
		list=JdbcUtil.selects(Knowledeg.class,"select  knowledeg_name from tb_knowledge" );
		return list;
	}
	
	
	/**
	 * 查询练习根据知识点名称
	 * @param name
	 * @return
	 */
	public List cxlx(String name){
		List li=new ArrayList<>();
		li=JdbcUtil.selects(Testquestion.class,"select * from tb_testquestion left join tb_question_testquestion on(tb_testquestion.testquestion_id=tb_question_testquestion.testquestion_id) LEFT JOIN tb_knowledge on(tb_knowledge.question_id=tb_question_testquestion.question_id)where knowledeg_name='"+name+"'");
		return li;
	}
	
	/**
	 * 查询错题
	 * @param name
	 * @return
	 */
	public List erroxz(int uid) {
		List li=new ArrayList<>();
		li=JdbcUtil.selects(UserHistory_question_erro.class, "select * from tb_userhistory left join (tb_testquestion) on(tb_userhistory.testqustion_id=tb_testquestion.testquestion_id) where userhistory_resule='0' and user_id=? ", uid);
		return li;
	}
	
	/**
	 * 查询全部试题
	 * @return
	 */
	public List paper() {
		List li = new ArrayList<>();
		li=JdbcUtil.selects(Testpaper.class, "select * from tb_testpaper");
		return li;
	}
	
	
	/**
	 * 根据名称获取问题
	 * @param name
	 * @return
	 */
	public List questions(String name) {
		List li = new ArrayList<>();
		li=JdbcUtil.selects(Test.class, "select * from tb_knowledge left join tb_question on(tb_knowledge.question_id =tb_question.question_id) LEFT JOIN tb_question_testquestion on (tb_question.question_id = tb_question_testquestion.question_id)LEFT JOIN tb_testquestion on(tb_testquestion.testquestion_id=tb_question_testquestion.testquestion_id) where Knowledeg_name=? ", name);
		return li;
	}
	
	/**
	 * 根据问题获取选项
	 * @param name
	 * @return
	 */
	public List option(String name) {
		List li = new ArrayList<>();
		li=JdbcUtil.selects(Opinon_ch.class, "select * from tb_option left join tb_testquestion on(tb_option.testquestion_id =tb_testquestion.testquestion_id) where testquestion_content=? ", name);
	
		return li;
	}
	
	
	
	
	
	
	
}
