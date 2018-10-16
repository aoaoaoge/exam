package com.pan.exam.entity;

public class UserHistory_question_erro {
	private int testquestion_id;
	private int user_id;
	private String userhistory_answer;
	private int testquestion_type;
	
	public UserHistory_question_erro(int testquestion_id, int user_id, String userhistory_answer,
			int testquestion_type) {
		super();
		this.testquestion_id = testquestion_id;
		this.user_id = user_id;
		this.userhistory_answer = userhistory_answer;
		this.testquestion_type = testquestion_type;
	}

	public int getTestquestion_id() {
		return testquestion_id;
	}

	public void setTestquestion_id(int testquestion_id) {
		this.testquestion_id = testquestion_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUserhistory_answer() {
		return userhistory_answer;
	}

	public void setUserhistory_answer(String userhistory_answer) {
		this.userhistory_answer = userhistory_answer;
	}

	public int getTestquestion_type() {
		return testquestion_type;
	}

	public void setTestquestion_type(int testquestion_type) {
		this.testquestion_type = testquestion_type;
	}

	public UserHistory_question_erro() {
		super();
	}
	
}
