package com.pan.exam.service.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pan.exam.dao.user.ExecriseDao;
import com.pan.exam.entity.Option;
import com.pan.exam.entity.TestQuestions;
import com.pan.exam.entity.Testquestion;

public class ExecriseService {
   
	ExecriseDao exedao=new ExecriseDao();
	
	/**
	 * 查询题目
	 * @param int page,int size
	 * @return
	 */
	public Map<String, Object> tm(int page,int size) {
	List<TestQuestions> users =exedao.queryAllUsersOnpage(page,size);
	//
	int count=exedao.pageCount();
	Map<String, Object> map = new HashMap<>();		
	map.put("list", users);//
	map.put("count", count);
	return map;
	}
	
	/**
	 * 根据题目查询对应选项
	 * @param testquestion_id
	 * @return
	 */
	public Map<String,Object> xx(String testquestion_id) {
		List<Option> option =exedao.queryoption(testquestion_id);
		Map<String,Object> map=new HashMap<>();
		map.put("option", option);
		return map;
	}
	
	
}
