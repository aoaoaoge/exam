package com.pan.exam.entity;

public class Options {
	private int option_id;
	private String options;
	private String option_content;
	private String option_picture_url;
	private int testquestion_id;
	public int getOption_id() {
		return option_id;
	}
	public void setOption_id(int option_id) {
		this.option_id = option_id;
	}
	public String getOption() {
		return options;
	}
	public void setOption(String options) {
		this.options = options;
	}
	public String getOption_content() {
		return option_content;
	}
	public void setOption_content(String option_content) {
		this.option_content = option_content;
	}
	public String getOption_picture_url() {
		return option_picture_url;
	}
	public void setOption_picture_url(String option_picture_url) {
		this.option_picture_url = option_picture_url;
	}
	public int getTestquestion_id() {
		return testquestion_id;
	}
	public void setTestquestion_id(int testquestion_id) {
		this.testquestion_id = testquestion_id;
	}
	public Options() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Options(int option_id, String options, String option_content,
			String option_picture_url, int testquestion_id) {
		super();
		this.option_id = option_id;
		this.options = options;
		this.option_content = option_content;
		this.option_picture_url = option_picture_url;
		this.testquestion_id = testquestion_id;
	}
	
}
