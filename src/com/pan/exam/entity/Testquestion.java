package com.pan.exam.entity;

public class Testquestion {
	private int question_id;
	private String testquestion_content;
	private String testquestion_refrenceanswer;
	private String testquestion_source;
	private String testquestion_examination;
	private String testquestion_keyword;
	private String testionquestioni_analysis;
	private String testquestion_type;
	public Testquestion(int question_id, String testquestion_content, String testquestion_refrenceanswer,
			String testquestion_source, String testquestion_examination, String testquestion_keyword,
			String testionquestioni_analysis, String testquestion_type) {
		super();
		this.question_id = question_id;
		this.testquestion_content = testquestion_content;
		this.testquestion_refrenceanswer = testquestion_refrenceanswer;
		this.testquestion_source = testquestion_source;
		this.testquestion_examination = testquestion_examination;
		this.testquestion_keyword = testquestion_keyword;
		this.testionquestioni_analysis = testionquestioni_analysis;
		this.testquestion_type = testquestion_type;
	}
	public String getTestquestion_type() {
		return testquestion_type;
	}
	public void setTestquestion_type(String testquestion_type) {
		this.testquestion_type = testquestion_type;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public Testquestion() {
		super();
	}
	public Testquestion(int question_id, String testquestion_content,
			String testquestion_refrenceanswer, String testquestion_source, String testquestion_examination,
			String testquestion_keyword, String testionquestioni_analysis) {
		super();
		this.question_id = question_id;
		this.testquestion_content = testquestion_content;
		this.testquestion_refrenceanswer = testquestion_refrenceanswer;
		this.testquestion_source = testquestion_source;
		this.testquestion_examination = testquestion_examination;
		this.testquestion_keyword = testquestion_keyword;
		this.testionquestioni_analysis = testionquestioni_analysis;
	}

	public String getTestquestion_content() {
		return testquestion_content;
	}
	public void setTestquestion_content(String testquestion_content) {
		this.testquestion_content = testquestion_content;
	}
	public String getTestquestion_refrenceanswer() {
		return testquestion_refrenceanswer;
	}
	public void setTestquestion_refrenceanswer(String testquestion_refrenceanswer) {
		this.testquestion_refrenceanswer = testquestion_refrenceanswer;
	}
	public String getTestquestion_source() {
		return testquestion_source;
	}
	public void setTestquestion_source(String testquestion_source) {
		this.testquestion_source = testquestion_source;
	}
	public String getTestquestion_examination() {
		return testquestion_examination;
	}
	public void setTestquestion_examination(String testquestion_examination) {
		this.testquestion_examination = testquestion_examination;
	}
	public String getTestquestion_keyword() {
		return testquestion_keyword;
	}
	public void setTestquestion_keyword(String testquestion_keyword) {
		this.testquestion_keyword = testquestion_keyword;
	}
	public String getTestionquestioni_analysis() {
		return testionquestioni_analysis;
	}
	public void setTestionquestioni_analysis(String testionquestioni_analysis) {
		this.testionquestioni_analysis = testionquestioni_analysis;
	}
	
}
