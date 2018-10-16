package com.pan.exam.dao.admin;

import java.util.ArrayList;
import java.util.List;

import com.pan.exam.common.JdbcUtil;
import com.pan.exam.entity.Field;
import com.pan.exam.entity.KnowledgePoint;

/**
 * 题库管理数据访问层
 * @author Administrator
 *
 */
public class FieldDao {
	/**
	 * 添加题库
	 * @param fieldName 题库名
	 * @param describe 描述
	 * @return
	 */
	public boolean addField(String fieldName,String describe) {
		return JdbcUtil.update("insert into tb_question(question_name,question_describe) values(?,?)",fieldName,describe );
	}
	/**
	 * 查询所有的题库信息
	 * @return
	 */
	public List<Field> showField() {
		List<Field> list = JdbcUtil.selects(Field.class, "select * from tb_question");
		return list;
	}
	/**
	 * 添加知识点
	 * @param kName 知识点名
	 * @param describe 描述
	 * @param fid 题库id
	 * @return
	 */
	public boolean addKnowledgePoint(String kName,String describe,int fid) {
		return JdbcUtil.update("insert into tb_knowledge(knowledeg_name,knowledeg_describe,question_id) values(?,?,?)",kName,describe,fid );
	}
	/**
	 * 查询所有的知识点
	 * @return
	 */
	public List<KnowledgePoint> showKnowledgePoint() {
		List<KnowledgePoint> list = JdbcUtil.selects(KnowledgePoint.class, "select * from tb_knowledge");
		return list;
	}
	/**
	 * 按题库查找知识点
	 * @return
	 */
	public List<KnowledgePoint> showKnowledgePointByField(String fname) {
		Field f = (Field)JdbcUtil.select(Field.class, "select * from tb_question where question_name=?",fname);
		List<KnowledgePoint> klist = JdbcUtil.selects(KnowledgePoint.class, "select * from tb_knowledge where question_id=?",f.getQuestion_id());
		return klist;
	}
	/**
	 * 根据题库名查询题库编号
	 * @param fieldNames 题库名
	 * @return
	 */
	public List<Field> getFieldIdByFieldName(List<String> fieldNames){
		List<Field> list = new ArrayList<>();
		for (String str : fieldNames) {
			Field f = (Field)JdbcUtil.select(Field.class, "select question_id from tb_question where question_name=?",str);
			list.add(f);
		}
		return list;
	}
	/**
	 * 根据知识点名查询题库编号
	 * @param knowledgePointNames 知识点名
	 * @return
	 */
	public List<KnowledgePoint> getKnowledgePointIdByKnowledgePointName(List<String> knowledgePointNames){
		List<KnowledgePoint> list = new ArrayList<>();
		for (String str : knowledgePointNames) {
			KnowledgePoint k = (KnowledgePoint)JdbcUtil.select(KnowledgePoint.class, "select knowledeg_id from tb_knowledge where knowledeg_name=?",str);
			list.add(k);
		}
		return list;
	}
}
