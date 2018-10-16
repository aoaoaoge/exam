package com.pan.exam.entity;

public class Question_Field_KnowledgePoint {
	private int question_testquestion_id;
	private int	testquestion_id;
	private int	qustion_id;
	private int	knowledeg_id;
	public int getQuestion_testquestion_id() {
		return question_testquestion_id;
	}
	public void setQuestion_testquestion_id(int question_testquestion_id) {
		this.question_testquestion_id = question_testquestion_id;
	}
	public int getTestquestion_id() {
		return testquestion_id;
	}
	public void setTestquestion_id(int testquestion_id) {
		this.testquestion_id = testquestion_id;
	}
	public int getQustion_id() {
		return qustion_id;
	}
	public void setQustion_id(int qustion_id) {
		this.qustion_id = qustion_id;
	}
	public int getKnowledeg_id() {
		return knowledeg_id;
	}
	public void setKnowledeg_id(int knowledeg_id) {
		this.knowledeg_id = knowledeg_id;
	}
	public Question_Field_KnowledgePoint() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Question_Field_KnowledgePoint(int question_testquestion_id,
			int testquestion_id, int qustion_id, int knowledeg_id,
			String fieldName, String knowledgePointName) {
		super();
		this.question_testquestion_id = question_testquestion_id;
		this.testquestion_id = testquestion_id;
		this.qustion_id = qustion_id;
		this.knowledeg_id = knowledeg_id;
	}
	
	
}
