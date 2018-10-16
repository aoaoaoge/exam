package com.pan.exam.entity;

public class QuestionLiu {
		private int question_id;//题库id
		private String question_name;//题库名
		private String question_describe;//题库描述
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
		@Override
		public String toString() {
			return "QuestionLiu [question_id=" + question_id + ", question_name=" + question_name
					+ ", question_describe=" + question_describe + "]";
		}
		public QuestionLiu(int question_id, String question_name, String question_describe) {
			super();
			this.question_id = question_id;
			this.question_name = question_name;
			this.question_describe = question_describe;
		}
		public QuestionLiu() {
			super();
		}
		
}
