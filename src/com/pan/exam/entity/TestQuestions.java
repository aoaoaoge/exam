package com.pan.exam.entity;

public class TestQuestions {
      private int testquestion_id;
      private String testquestion_type;
      private String testquestion_content;
      private String testquestion_answer;
      private String testionquestion_keyword;
	public int getTestquestion_id() {
		return testquestion_id;
	}
	public TestQuestions() {
		super();
	}
	public TestQuestions(int testquestion_id, String testquestion_type, String testquestion_content,
			String testquestion_answer, String testquestion_keyword) {
		super();
		this.testquestion_id = testquestion_id;
		this.testquestion_type = testquestion_type;
		this.testquestion_content = testquestion_content;
		this.testquestion_answer = testquestion_answer;
		this.testionquestion_keyword = testquestion_keyword;
	}
	@Override
	public String toString() {
		return "TestQuestion [testquestion_id=" + testquestion_id + ", testquestion_type=" + testquestion_type
				+ ", testquestion_content=" + testquestion_content + ", testquestion_answer=" + testquestion_answer
				+ ", testquestion_keyword=" + testionquestion_keyword + "]";
	}
	public void setTestquestion_id(int testquestion_id) {
		this.testquestion_id = testquestion_id;
	}
	public String getTestquestion_type() {
		return testquestion_type;
	}
	public void setTestquestion_type(String testquestion_type) {
		this.testquestion_type = testquestion_type;
	}
	public String getTestquestion_content() {
		return testquestion_content;
	}
	public void setTestquestion_content(String testquestion_content) {
		this.testquestion_content = testquestion_content;
	}
	public String getTestquestion_answer() {
		return testquestion_answer;
	}
	public void setTestquestion_answer(String testquestion_answer) {
		this.testquestion_answer = testquestion_answer;
	}
	public String getTestquestion_keyword() {
		return testionquestion_keyword;
	}
	public void setTestquestion_keyword(String testquestion_keyword) {
		this.testionquestion_keyword = testquestion_keyword;
	}
}
