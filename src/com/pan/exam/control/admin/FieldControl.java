package com.pan.exam.control.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.pan.exam.common.BaseServlet;
import com.pan.exam.common.JdbcUtil;
import com.pan.exam.entity.Field;
import com.pan.exam.entity.KnowledgePoint;
import com.pan.exam.service.admin.FieldService;

//servlet方法调用
@WebServlet("/field/*")
/**
 * 题库管理控制层
 * @author Administrator
 *
 */
public class FieldControl extends BaseServlet{
	//题库管理服务层对象
	private FieldService fs = new FieldService();
	/**
	 * 添加题库方法
	 * @param req 请求
	 * @param resp 响应
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addField(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String fname = req.getParameter("fname");
		String fdescribe = req.getParameter("fdescribe");
		boolean res = fs.addField(fname, fdescribe);
		if(res){
			req.setAttribute("res", "添加成功！");
		}
		else req.setAttribute("res", "添加失败！");
		req.getRequestDispatcher("/jsp/admin/add-field.jsp").forward(req, resp);
	}
	/**
	 * 显示所有题库信息方法
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showField(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		List<Field> list = fs.showField();
		if(list.size()>0&&list!=null){
			String jsonStr = JSONArray.fromObject(list).toString();
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write(jsonStr);
		}
	}
	/**
	 * 增加知识点
	 * @param req
	 * @param resp
	 */
	public void addKnowledgePoint(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int fid = Integer.parseInt(req.getParameter("fid"));
		String kname = req.getParameter("kname");
		String kdescribe = req.getParameter("kdescribe");
		boolean res = fs.addKnowledgePoint(kname, kdescribe, fid);
		//System.out.println(res);
		if(res){
			req.setAttribute("res", "添加成功！");
		}
		else req.setAttribute("res", "添加失败！");
		req.setCharacterEncoding("utf-8");
		req.getRequestDispatcher("/jsp/admin/add-point.jsp").forward(req, resp);
	}
	/**
	 * 显示所有知识点信息
	 * @param req
	 * @param resp
	 */
	public void showKnowledgePoint(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Map<String, List> map = fs.showKnowledgePoint();
		if(map!=null){
			String jsonStr = JSONObject.fromObject(map).toString();
			req.setCharacterEncoding("utf-8");
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write(jsonStr);
		}
		else{
			String jsonStr = "{massage:'失败！'}";
			resp.getWriter().write(jsonStr);
		}
	}
	public void selcetPointByField(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String fname = req.getParameter("fname");
		List<KnowledgePoint> list = fs.showKnowledgePointByField(fname);
		String jsonStr = JSONArray.fromObject(list).toString();
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(jsonStr);
	}
}
