package com.pan.exam.control.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.pan.exam.common.BaseServlet;
import com.pan.exam.entity.Question;
import com.pan.exam.service.admin.QuestionService;
import com.sun.mail.util.QEncoderStream;

@WebServlet("/question/*")
/**
 * 试题管理模块控制层
 * @author Administrator
 *
 */
public class QuestionControl extends BaseServlet{
	//业务层对象实例化
	private QuestionService qs = new QuestionService();
	
	/**
	 * 试题增加方法
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addQuestion(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String questionType = req.getParameter("qtype");
		String[] knowledgePoints = req.getParameterValues("kps");
		String questionContent = req.getParameter("question_content");
		String[] optionContents = req.getParameterValues("option_content");
		String rightAnswer = req.getParameter("right_answer");
		String source= req.getParameter("source");
		String examPoint = req.getParameter("exam_point");
		String keyword = req.getParameter("keyword");
		String analysis = req.getParameter("analysis");
		boolean res = qs.add_question(questionType, questionContent, rightAnswer, source, examPoint, keyword, analysis, optionContents, knowledgePoints);
		
		if(res){
			req.setAttribute("res", "添加成功！");
		}
		else req.setAttribute("res", "添加失败！");
		
		
		req.setCharacterEncoding("utf-8");
		req.getRequestDispatcher("/jsp/admin/question-add.jsp").forward(req, resp);
	}
	/**
	 * 异步请求处理
	 * 通过题目名查询所有试题
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showQusetionByField(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String fname = req.getParameter("fname");
		int pageno = Integer.parseInt(req.getParameter("pageno"));
		Map<String, Object> map = qs.showQuestByFieldName(pageno,fname);
		String jsonstr = JSONObject.fromObject(map).toString();
		resp.getWriter().write(jsonstr);
	}
	/**
	 * 异步请求处理
	 * 通过知识点名查询所有试题
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void shwoQusetionsByPoint(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		int pageno = Integer.parseInt(req.getParameter("pageno").trim());
		String knowledgePointName = req.getParameter("knowledgePointName");
		Map<String, Object> map = qs.shwoQusetionsByPoint(pageno,knowledgePointName);
		String jsonstr = JSONObject.fromObject(map).toString();
		resp.getWriter().write(jsonstr);
	}
	/**
	 * 修改试卷类型
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateQusertion(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		int qid = Integer.parseInt(req.getParameter("qusetid"));
		String kname = req.getParameter("kname");
		boolean res = qs.updateQusertion(qid, kname);
		resp.getWriter().write(String.valueOf(res));
	}
}
