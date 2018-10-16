package com.pan.exam.control.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pan.exam.service.user.RdmExeService;

import net.sf.json.JSONObject;

@WebServlet("/rdmloadexe/*")
public class RdmLoadExe extends BaseServlet{

	public void rdmexe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {  
		RdmExeService rdmser=new RdmExeService();
		//获取页数
		String pageNo = req.getParameter("pageNo");
		//获取每页显示数据数
		String pageSize = req.getParameter("pageSize");
		//将String转为int	
		int page = Integer.parseInt(pageNo);
		int size = Integer.parseInt(pageSize);
		int count=3;
			
		Map<String,Object> map=new HashMap<>();
		map=rdmser.tm(page, size);				

		String jsonStr = JSONObject.fromObject(map).toString();
		
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(jsonStr);
		
		
	}
	
	public void rdmopt(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RdmExeService rdmser=new RdmExeService();
		String testquestion_id=req.getParameter("testquestion_id");
		
			Map map=new HashMap<>();
			map=rdmser.xx(testquestion_id);						
			String jsonStr = JSONObject.fromObject(map).toString();		
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write(jsonStr);
			}
	
	
		
	
}
