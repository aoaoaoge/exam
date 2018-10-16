package com.pan.exam.dao.user;

import java.util.List;

import com.pan.exam.common.JdbcUtil;
import com.pan.exam.entity.Question_profession;

public class QuestionDao {
		/**
		 * 查询并返回所有专业信息
		 * @return
		 */
		public List<Question_profession> queryAllQuestions(){
			Object obj = JdbcUtil.selects(Question_profession.class, "select * from tb_question");
			if(obj!=null){
				return (List<Question_profession>)obj;
			}
			return null;
		}
			
}
