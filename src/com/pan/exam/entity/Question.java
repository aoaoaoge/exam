package com.pan.exam.entity;

public class Question {
	private int testquestion_id;
	private String testquestion_type;
	private String testquestion_content;
	private String testquestion_refrenceanswer;
	private String testquestion_answer;
	private String testquestion_source;
	private String testquestion_examination;
	private String testionquestion_keyword;
	private String testionquestion_analysis;
	private String fieldName;
	private String knowledgePointName;
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getKnowledgePointName() {
		return knowledgePointName;
	}
	public void setKnowledgePointName(String knowledgePointName) {
		this.knowledgePointName = knowledgePointName;
	}
	public int getTestquestion_id() {
		return testquestion_id;
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
	public String getTestquestion_refrenceanswer() {
		return testquestion_refrenceanswer;
	}
	public void setTestquestion_refrenceanswer(String testquestion_refrenceanswer) {
		this.testquestion_refrenceanswer = testquestion_refrenceanswer;
	}
	public String getTestquestion_answer() {
		return testquestion_answer;
	}
	public void setTestquestion_answer(String testquestion_answer) {
		this.testquestion_answer = testquestion_answer;
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
	public String getTestionquestion_keyword() {
		return testionquestion_keyword;
	}
	public void setTestionquestion_keyword(String testionquestion_keyword) {
		this.testionquestion_keyword = testionquestion_keyword;
	}
	public String getTestionquestion_analysis() {
		return testionquestion_analysis;
	}
	public void setTestionquestion_analysis(String testionquestion_analysis) {
		this.testionquestion_analysis = testionquestion_analysis;
	}
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Question(int testquestion_id, String testquestion_type,
			String testquestion_content, String testquestion_refrenceanswer,
			String testquestion_answer, String testquestion_source,
			String testquestion_examination, String testionquestion_keyword,
			String testionquestion_analysis) {
		super();
		this.testquestion_id = testquestion_id;
		this.testquestion_type = testquestion_type;
		this.testquestion_content = testquestion_content;
		this.testquestion_refrenceanswer = testquestion_refrenceanswer;
		this.testquestion_answer = testquestion_answer;
		this.testquestion_source = testquestion_source;
		this.testquestion_examination = testquestion_examination;
		this.testionquestion_keyword = testionquestion_keyword;
		this.testionquestion_analysis = testionquestion_analysis;
	}
	public Question(int testquestion_id, String testquestion_type,
			String testquestion_content, String testquestion_refrenceanswer,
			String testquestion_answer, String testquestion_source,
			String testquestion_examination, String testionquestion_keyword,
			String testionquestion_analysis, String fieldName,
			String knowledgePointName) {
		super();
		this.testquestion_id = testquestion_id;
		this.testquestion_type = testquestion_type;
		this.testquestion_content = testquestion_content;
		this.testquestion_refrenceanswer = testquestion_refrenceanswer;
		this.testquestion_answer = testquestion_answer;
		this.testquestion_source = testquestion_source;
		this.testquestion_examination = testquestion_examination;
		this.testionquestion_keyword = testionquestion_keyword;
		this.testionquestion_analysis = testionquestion_analysis;
		this.fieldName = fieldName;
		this.knowledgePointName = knowledgePointName;
	}
}
