package com.pan.exam.entity;

public class Admin {
			private int admin_id;//管理员id
			private String admin_name;//管理员姓名
			private String admin_email;//管理员email
			private  String admin_password;//管理员密码
			private String admin_login_time;//管理员注册时间
			private String admin_state;//管理员状态
			public int getAdmin_id() {
				return admin_id;
			}
			public void setAdmin_id(int admin_id) {
				this.admin_id = admin_id;
			}
			public String getAdmin_name() {
				return admin_name;
			}
			public void setAdmin_name(String admin_name) {
				this.admin_name = admin_name;
			}
			public String getAdmin_email() {
				return admin_email;
			}
			public void setAdmin_email(String admin_email) {
				this.admin_email = admin_email;
			}
			public String getAdmin_password() {
				return admin_password;
			}
			public void setAdmin_password(String admin_password) {
				this.admin_password = admin_password;
			}
			public String getAdmin_login_time() {
				return admin_login_time;
			}
			public void setAdmin_login_time(String admin_login_time) {
				this.admin_login_time = admin_login_time;
			}
			public String getAdmin_state() {
				return admin_state;
			}
			public void setAdmin_state(String admin_state) {
				this.admin_state = admin_state;
			}
			public Admin(int admin_id, String admin_name, String admin_email, String admin_password,
					String admin_login_time, String admin_state) {
				super();
				this.admin_id = admin_id;
				this.admin_name = admin_name;
				this.admin_email = admin_email;
				this.admin_password = admin_password;
				this.admin_login_time = admin_login_time;
				this.admin_state = admin_state;
			}
			public Admin() {
				super();
			}
			@Override
			public String toString() {
				return "Admin [admin_id=" + admin_id + ", admin_name=" + admin_name + ", admin_email=" + admin_email
						+ ", admin_password=" + admin_password + ", admin_login_time=" + admin_login_time
						+ ", admin_state=" + admin_state + "]";
			}
			
			
}
