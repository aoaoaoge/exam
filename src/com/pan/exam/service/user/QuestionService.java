package com.pan.exam.service.user;

import java.util.List;

import com.pan.exam.dao.user.QuestionDao;
import com.pan.exam.entity.Question_profession;
	
public class QuestionService {
		public static QuestionDao questionDao = new QuestionDao();
		/**
		 * 加载所有专业信息
		 * @return
		 */
		public static List<Question_profession> loadAllQuestions(){
			return questionDao.queryAllQuestions();
		}
		
}
