package com.pan.exam.entity;

public class KnowledgePoint {
	private int knowledeg_id;
	private String knowledeg_name;
	private String knowledeg_describe;
	private int question_id;
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
	public KnowledgePoint(int knowledeg_id, String knowledeg_name,
			String knowledeg_describe, int question_id) {
		super();
		this.knowledeg_id = knowledeg_id;
		this.knowledeg_name = knowledeg_name;
		this.knowledeg_describe = knowledeg_describe;
		this.question_id = question_id;
	}
	public KnowledgePoint() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "KnowledgePoint [knowledeg_id=" + knowledeg_id
				+ ", knowledeg_name=" + knowledeg_name
				+ ", knowledeg_describe=" + knowledeg_describe
				+ ", question_id=" + question_id + "]";
	}
	
}
