package com.pan.exam.entity;

public class Knowledeg {
	private int knowledeg_id;
	private String knowledeg_name;
	private String knowledef_describe;
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
	public String getKnowledef_describe() {
		return knowledef_describe;
	}
	public void setKnowledef_describe(String knowledef_describe) {
		this.knowledef_describe = knowledef_describe;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public Knowledeg(int knowledeg_id, String knowledeg_name, String knowledef_describe, int question_id) {
		super();
		this.knowledeg_id = knowledeg_id;
		this.knowledeg_name = knowledeg_name;
		this.knowledef_describe = knowledef_describe;
		this.question_id = question_id;
	}
	public Knowledeg() {
		super();
	}

}
