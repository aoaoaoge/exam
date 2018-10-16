package com.pan.exam.dao.admin;

import java.util.List;

import com.pan.exam.common.JdbcUtil;
import com.pan.exam.entity.User;

public class UserDao {
		/**
		 * 查询并返回users	
		 * @return
		 */
	public List<User> getUsers(){
		Object obj = JdbcUtil.selects(User.class, "select t.*,q.question_name from tb_user t join tb_question q on t.question_id=q.question_id");
		if(obj!=null) {
			return (List<User>)obj;
		}
		return null;
		
	}
	

}
