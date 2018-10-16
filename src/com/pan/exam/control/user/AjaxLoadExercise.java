package com.pan.exam.control.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pan.exam.entity.TestQuestions;
import com.pan.exam.service.user.ExecriseService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/ajaxloadexercise/*")
public class AjaxLoadExercise extends BaseServlet{

	
	public void ajaxexe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {  
		ExecriseService exeser=new ExecriseService();
		//获取页数
		String pageNo = req.getParameter("pageNo");
		//获取每页显示数据数
		String pageSize = req.getParameter("pageSize");
		//将String转为int	
		int page = Integer.parseInt(pageNo);
		int size = Integer.parseInt(pageSize);
		Map<String,Object> map=new HashMap<>();
		map=exeser.tm(page, size);				

		String jsonStr = JSONObject.fromObject(map).toString();
		
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(jsonStr);
		
		
	}
	
	public void ajaxopt(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ExecriseService exeser=new ExecriseService();
		String testquestion_id=req.getParameter("testquestion_id");
		
			Map map=new HashMap<>();
			map=exeser.xx(testquestion_id);						
			String jsonStr = JSONObject.fromObject(map).toString();		
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write(jsonStr);
			}
	
	
	
	
	
	

	
	
}
