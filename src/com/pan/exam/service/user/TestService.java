package com.pan.exam.service.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.pan.exam.dao.user.TestDao;
import com.pan.exam.entity.Knowledeg;
import com.pan.exam.entity.Opinon_ch;
import com.pan.exam.entity.Option;
import com.pan.exam.entity.Test;
import com.pan.exam.entity.TestQuestions;
import com.pan.exam.entity.Testpaper;
import com.pan.exam.entity.UserHistory_question_erro;

public class TestService {

	TestDao td= new TestDao();
	
	/**
	 * 查询强化专用
	 * @param lx
	 * @return
	 */
	public Map cxlx(String lx){
		Map<String,List> ma=new HashMap<>();
		List mm=new ArrayList<>();
		mm =td.cxzsd();
		for(int i=0;i<mm.size();i++) {
			Knowledeg a=(Knowledeg)mm.get(i);
			String name =a.getKnowledeg_name();
			ma.put(name, td.cxlx(name));
		}
		return ma;
	}
	
	/**
	 * 根据用户id查询用户做错的题
	 * @param userid
	 * @return
	 */
	public Map erroquestion(int uid) {
		List<UserHistory_question_erro> li = td.erroxz(uid);
		Map<String,List> ma=new HashMap<>();
		ma.put("erro", li);
		return ma;
	}
	
	/**
	 * 查询试题
	 * @return
	 */
	public Map monitest() {
		List<Testpaper> li = td.paper();
		Map<String,List> ma=new HashMap<>();
		ma.put("shiti", li);
		return ma;
	}
	
	
	
	
	
	/**
	 * 根据知识点类型获取题目
	 * @param name
	 * @return
	 */
	public List getquestion(String name) {
		List li = new ArrayList<>();
		li=td.questions(name);		
		return li;
	}
	
	/**
	 * 根据题目集合获取option集合
	 * @param name
	 * @return
	 */
	public Map getoption(List li) {

		Map<Integer, List> ma= new HashMap<>();
		int i=0;
		//遍历问题集合，查询option
		Iterator it = li.iterator();
		while(it.hasNext()) {
			Test name=(Test)it.next();
			String n = name.getTestquestion_content();
			List op=td.option(n);
			ma.put(i++, op);
		}
		return ma;
	}
}
