package com.pan.exam.dao.user;

import java.net.Authenticator.RequestorType;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.pan.exam.common.JdbcUtil;
/**
 * 添加数据库dao层
 * @author Administrator
 *
 */
public class RegisterDao {
	
	public boolean addRegis(String user_name,String user_email,String user_password,String field)
	{
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		boolean obj=JdbcUtil.update("insert into tb_user(user_id,user_name,user_email,user_password,user_login_time,user_state,question_id) values (default,?,?,?,'"+simpleDateFormat.format(new Date())+"',1,?)",user_name,user_email,user_password,field);
		if(obj) {
			return true;
		}
		return false;
	}

}
