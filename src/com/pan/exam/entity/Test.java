package com.pan.exam.entity;

public class Test {
	private int knowledeg_id;
	private String knowledeg_name;
	private String knowledeg_describe;
	private int question_id;
	public Test() {
		super();
	}
	
	public Test(int knowledeg_id, String knowledeg_name, String knowledeg_describe, int question_id,
			String question_name, String question_describe, String testquestion_type, String testquestion_content,
			String testquestion_refrenceanswer, String testquestion_answer, String testquestion_examination,
			String testquestion_keyword, String testquestion_analysis, int testquestion_id) {
		super();
		this.knowledeg_id = knowledeg_id;
		this.knowledeg_name = knowledeg_name;
		this.knowledeg_describe = knowledeg_describe;
		this.question_id = question_id;
		this.question_name = question_name;
		this.question_describe = question_describe;
		this.testquestion_type = testquestion_type;
		this.testquestion_content = testquestion_content;
		this.testquestion_refrenceanswer = testquestion_refrenceanswer;
		this.testquestion_answer = testquestion_answer;
		this.testquestion_examination = testquestion_examination;
		this.testquestion_keyword = testquestion_keyword;
		this.testquestion_analysis = testquestion_analysis;
		this.testquestion_id = testquestion_id;
	}

	public int getKnowledeg_id() {
		return knowledeg_id;
	}
	public void setKnowledeg_id(int knowledeg_id) {
		this.knowledeg_id = knowledeg_id;
	}
	public String getKnowledeg_name() {
		return knowledeg_name;
	}
	public void setKnowledeg_name(String knowledeg_name) {
		this.knowledeg_name = knowledeg_name;
	}
	public String getKnowledeg_describe() {
		return knowledeg_describe;
	}
	public void setKnowledeg_describe(String knowledeg_describe) {
		this.knowledeg_describe = knowledeg_describe;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public String getQuestion_name() {
		return question_name;
	}
	public void setQuestion_name(String question_name) {
		this.question_name = question_name;
	}
	public String getQuestion_describe() {
		return question_describe;
	}
	public void setQuestion_describe(String question_describe) {
		this.question_describe = question_describe;
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
	public String getTestquestion_analysis() {
		return testquestion_analysis;
	}
	public void setTestquestion_analysis(String testquestion_analysis) {
		this.testquestion_analysis = testquestion_analysis;
	}
	public int getTestquestion_id() {
		return testquestion_id;
	}
	public void setTestquestion_id(int testquestion_id) {
		this.testquestion_id = testquestion_id;
	}

	private String question_name;
	private String question_describe;
	private String testquestion_type;
	private String testquestion_content;
	private String testquestion_refrenceanswer;
	private String testquestion_answer;
	private String testquestion_examination;
	private String testquestion_keyword;
	private String testquestion_analysis;
	private int testquestion_id;
}
