package com.pan.exam.control.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.pan.exam.service.user.TestService;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;


@WebServlet("/test/*")
public class Testcontrol extends BaseServlet {
	
	TestService ts=new TestService();
	/**
	 *查找项目
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void chaxunlianxi(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//根据参数查找相关练习类型
		req.setCharacterEncoding("utf-8");
		String lx=req.getParameter("le");
		//获取用户名称
		int userid=1;
		Map ma=new HashMap<>();
		//获取到练习
		if(lx.equals("qianghua")) {
			//查询强化练习
			 ma=ts.cxlx(lx);
			 
		}if(lx.equals("cuoti")) {
			//查询做过的错题
			ma=ts.erroquestion(userid);
		}if(lx.equals("moni")) {
			//查询模拟试题
		    ma=ts.monitest();
		}
		//写入响应
		resp.setCharacterEncoding("utf-8");
		//转json格式的字符串
		JsonConfig config = new JsonConfig();
		String jsonStr = JSONObject.fromObject(ma).toString();
		resp.getWriter().write(jsonStr);
	
	}
	
	

	
	/**
	 * 练习
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void xuanze(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		//获取到练习题的相关专业名称
		String cs = req.getParameter("cs");
		//获得题目类型
		String x= req.getParameter("x");
		List question  = new ArrayList<>();
		Map option = new HashMap<>();
		if(x.equals("xz")) {
			//调用service层的方法处理查询题库---->选择题
			//获取题目
			question=ts.getquestion(cs);
			//获取选项
			option = ts.getoption(question);
		}else if(x.equals("pd")) {
			//调用service层的方法处理查询题库---->判断题
			
		}
		
		//跳转到做题界面
//		//写入响应
//		resp.setCharacterEncoding("utf-8");
//		//转json格式的字符串
//		JsonConfig config = new JsonConfig();
//		String jsonStr = JSONObject.fromObject(ma).toString();
//		resp.getWriter().write(jsonStr);
//				
		req.setAttribute("question", question);
		req.setAttribute("option", option);
		req.getRequestDispatcher("/jsp/user/makequestion.jsp").forward(req, resp);
		
		
		
	}
	
	
	
	

}
