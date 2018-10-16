package com.pan.exam.entity;


import java.util.Date;

/**
 * 
 * 用户实体类
 * @author Administrator
 *
 */
public class Login {
		private int user_id;
		private int question_id;
		private String user_password;
		private String user_name;
		private String user_email;
		private String user_province;
		private String user_company;
		private String user_department;
		private String user_state;
		private Date user_login_time;
		private String user_type;
		private String user_specialty;
		public int getUser_id() {
			return user_id;
		}
		public void setUser_id(int user_id) {
			this.user_id = user_id;
		}
		public int getQuestion_id() {
			return question_id;
		}
		public void setQuestion_id(int question_id) {
			this.question_id = question_id;
		}
		public String getUser_password() {
			return user_password;
		}
		public void setUser_password(String user_password) {
			this.user_password = user_password;
		}
		public String getUser_name() {
			return user_name;
		}
		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}
		public String getUser_email() {
			return user_email;
		}
		public void setUser_email(String user_email) {
			this.user_email = user_email;
		}
		public String getUser_province() {
			return user_province;
		}
		public void setUser_province(String user_province) {
			this.user_province = user_province;
		}
		public String getUser_company() {
			return user_company;
		}
		public void setUser_company(String user_company) {
			this.user_company = user_company;
		}
		public String getUser_department() {
			return user_department;
		}
		public void setUser_department(String user_department) {
			this.user_department = user_department;
		}
		public String getUser_state() {
			return user_state;
		}
		public void setUser_state(String user_state) {
			this.user_state = user_state;
		}
		public Date getUser_login_time() {
			return user_login_time;
		}
		public void setUser_login_time(Date user_login_time) {
			this.user_login_time = user_login_time;
		}
		public String getUser_type() {
			return user_type;
		}
		public void setUser_type(String user_type) {
			this.user_type = user_type;
		}
		public String getUser_specialty() {
			return user_specialty;
		}
		public void setUser_specialty(String user_specialty) {
			this.user_specialty = user_specialty;
		}
		
		
		public Login() {
			super();
		}
		public Login(int user_id, int question_id, String user_password, String user_name, String user_email,
				String user_province, String user_company, String user_department, String user_state,
				Date user_login_time, String user_type, String user_specialty) {
			super();
			this.user_id = user_id;
			this.question_id = question_id;
			this.user_password = user_password;
			this.user_name = user_name;
			this.user_email = user_email;
			this.user_province = user_province;
			this.user_company = user_company;
			this.user_department = user_department;
			this.user_state = user_state;
			this.user_login_time = user_login_time;
			this.user_type = user_type;
			this.user_specialty = user_specialty;
		}
		
		
		
		
}
