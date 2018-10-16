package com.pan.exam.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pan.exam.common.JdbcUtil;
import com.pan.exam.dao.admin.FieldDao;
import com.pan.exam.entity.Field;
import com.pan.exam.entity.KnowledgePoint;
/**
 * 题库管理模块服务层
 * @author Administrator
 *
 */
public class FieldService {
	//创建题库管理查询对象
	FieldDao fd = new FieldDao();
	
	public boolean addField(String fieldName,String describe) {
		return fd.addField(fieldName, describe);
	}
	public List<Field> showField() {
		return fd.showField();
	}
	public boolean addKnowledgePoint(String kName,String describe,int fid) {
		return fd.addKnowledgePoint(kName, describe, fid);
	}
	/**
	 * 显示所有知识点信息
	 * @return 返回题库和知识点
	 */
	public Map<String, List> showKnowledgePoint() {
		List<KnowledgePoint> list = fd.showKnowledgePoint();
		List<String> fnamelist = new ArrayList<>();
		Map<String, List> map = new HashMap<>();
		for (KnowledgePoint knowledgePoint : list) {
			Field f = (Field)JdbcUtil.select(Field.class, "select * from tb_question where question_id=?",knowledgePoint.getQuestion_id());
			fnamelist.add(f.getQuestion_name());
		}
		if(list.size()>0&&list!=null){
			map.put("list", list);
			map.put("fname", fnamelist);
		}else map = null;
		return map;
	}
	public List<KnowledgePoint> showKnowledgePointByField(String fname) {
		return fd.showKnowledgePointByField(fname);
	}
}
