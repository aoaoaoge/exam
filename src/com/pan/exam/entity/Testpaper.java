package com.pan.exam.entity;

import java.util.Date;

public class Testpaper {
	private int testpaper_id;
	private String testpaper_name;
	private String testpaper_fangshi;
	private  String testpaper_type;
	private double testpaper_jigefenshu;
	private  String testpaper_time;
	private double testpaper_zongfen;
	private int admin_id;
	private String testpaper_zhuantai;
	private Date testpaper_modify;
	public int getTestpaper_id() {
		return testpaper_id;
	}
	public void setTestpaper_id(int testpaper_id) {
		this.testpaper_id = testpaper_id;
	}
	public String getTestpaper_name() {
		return testpaper_name;
	}
	public void setTestpaper_name(String testpaper_name) {
		this.testpaper_name = testpaper_name;
	}
	public String getTestpaper_fangshi() {
		return testpaper_fangshi;
	}
	public void setTestpaper_fangshi(String testpaper_fangshi) {
		this.testpaper_fangshi = testpaper_fangshi;
	}
	public String getTestpaper_type() {
		return testpaper_type;
	}
	public void setTestpaper_type(String testpaper_type) {
		this.testpaper_type = testpaper_type;
	}
	public double getTestpaper_jigefenshu() {
		return testpaper_jigefenshu;
	}
	public void setTestpaper_jigefenshu(double testpaper_jigefenshu) {
		this.testpaper_jigefenshu = testpaper_jigefenshu;
	}
	public String getTestpaper_time() {
		return testpaper_time;
	}
	public void setTestpaper_time(String testpaper_time) {
		this.testpaper_time = testpaper_time;
	}
	public double getTestpaper_zongfen() {
		return testpaper_zongfen;
	}
	public void setTestpaper_zongfen(double testpaper_zongfen) {
		this.testpaper_zongfen = testpaper_zongfen;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public String getTestpaper_zhuantai() {
		return testpaper_zhuantai;
	}
	public void setTestpaper_zhuantai(String testpaper_zhuantai) {
		this.testpaper_zhuantai = testpaper_zhuantai;
	}
	public Date getTestpaper_modify() {
		return testpaper_modify;
	}
	public void setTestpaper_modify(Date testpaper_modify) {
		this.testpaper_modify = testpaper_modify;
	}
	public Testpaper(int testpaper_id, String testpaper_name, String testpaper_fangshi, String testpaper_type,
			double testpaper_jigefenshu, String testpaper_time, double testpaper_zongfen, int admin_id,
			String testpaper_zhuantai, Date testpaper_modify) {
		super();
		this.testpaper_id = testpaper_id;
		this.testpaper_name = testpaper_name;
		this.testpaper_fangshi = testpaper_fangshi;
		this.testpaper_type = testpaper_type;
		this.testpaper_jigefenshu = testpaper_jigefenshu;
		this.testpaper_time = testpaper_time;
		this.testpaper_zongfen = testpaper_zongfen;
		this.admin_id = admin_id;
		this.testpaper_zhuantai = testpaper_zhuantai;
		this.testpaper_modify = testpaper_modify;
	}
	public Testpaper() {
		super();
	}
	
	

}
