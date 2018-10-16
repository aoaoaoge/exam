package com.pan.exam.entity;

public class User {

	
		private int user_id;//1
		private int question_id;//2
		private String user_password;//3
		private String user_name;//4
		private String user_email;//5
		private String user_province;//6
		private String user_company;//7
		private String user_department;//8
		private String user_state;//9
		private String user_login_time;//10
		private String question_name;//11
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
		public String getUser_login_time() {
			return user_login_time;
		}
		public void setUser_login_time(String user_login_time) {
			this.user_login_time = user_login_time;
		}
		public String getQuestion_name() {
			return question_name;
		}
		public void setQuestion_name(String question_name) {
			this.question_name = question_name;
		}
		public User(int user_id, int question_id, String user_password, String user_name, String user_email,
				String user_province, String user_company, String user_department, String user_state,
				String user_login_time, String question_name) {
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
			this.question_name = question_name;
		}
		
		
		public User(int user_id, String user_name, String user_email, String user_province, String user_company,
				String user_department, String user_state, String user_login_time, String question_name) {
			super();
			this.user_id = user_id;
			this.user_name = user_name;
			this.user_email = user_email;
			this.user_province = user_province;
			this.user_company = user_company;
			this.user_department = user_department;
			this.user_state = user_state;
			this.user_login_time = user_login_time;
			this.question_name = question_name;
		}
		public User() {
			super();
		}
		@Override
		public String toString() {
			return "User [user_id=" + user_id + ", question_id=" + question_id + ", user_password=" + user_password
					+ ", user_name=" + user_name + ", user_email=" + user_email + ", user_province=" + user_province
					+ ", user_company=" + user_company + ", user_department=" + user_department + ", user_state="
					+ user_state + ", user_login_time=" + user_login_time + ", question_name=" + question_name + "]";
		}
		
		
		
		
	

}
