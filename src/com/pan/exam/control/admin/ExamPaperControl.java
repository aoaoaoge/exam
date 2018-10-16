package com.pan.exam.control.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pan.exam.common.BaseServlet;
import com.pan.exam.service.admin.ExamPaperService;
@WebServlet("/exampaper/*")
public class ExamPaperControl extends BaseServlet{
	
	private ExamPaperService eps = new ExamPaperService();
	
	/**
	 * 判断试题数量是否足够
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void countQuestion(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String[] qusetionnum = req.getParameterValues("questionnum");
		boolean res = eps.countQuestion(qusetionnum);
		resp.getWriter().write(String.valueOf(res));

	}
	
	public void addExamPaper(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String paperName = req.getParameter("paperName");
		String methodOfPaper = req.getParameter("MethodOfPaper");
		String paperType = req.getParameter("paperType");
		String passScore= req.getParameter("passscore");
		String score = req.getParameter("score");
		String[] points = req.getParameterValues("pointByQuestion");
		String time = req.getParameter("time");
		String[] qusetionnum = req.getParameterValues("qusetionnum");
		boolean res = eps.addExamPaperQuestion(paperName, methodOfPaper, paperType, passScore, score, time, qusetionnum, points);
		
		
		
	}
}
