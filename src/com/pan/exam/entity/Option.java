package com.pan.exam.entity;

public class Option {
   private int option_id;
   private String option;
   private String option_content;
   private int testquestion_id;
public int getOption_id() {
	return option_id;
}
public void setOption_id(int option_id) {
	this.option_id = option_id;
}
public String getOption() {
	return option;
}
public Option() {
	super();
}
@Override
public String toString() {
	return "Option [option_id=" + option_id + ", option=" + option + ", option_content=" + option_content
			+ ", testquestion_id=" + testquestion_id + "]";
}
public Option(int option_id, String option, String option_content, int testquestion_id) {
	super();
	this.option_id = option_id;
	this.option = option;
	this.option_content = option_content;
	this.testquestion_id = testquestion_id;
}
public void setOption(String option) {
	this.option = option;
}
public String getOption_content() {
	return option_content;
}
public void setOption_content(String option_content) {
	this.option_content = option_content;
}
public int getTestquestion_id() {
	return testquestion_id;
}
public void setTestquestion_id(int testquestion_id) {
	this.testquestion_id = testquestion_id;
}
}
