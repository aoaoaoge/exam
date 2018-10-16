package com.pan.exam.control.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pan.exam.entity.Question_profession;
import com.pan.exam.service.user.QuestionService;

import net.sf.json.JSONArray;
@WebServlet("/load")
public class QuestionServlet extends BaseServlet{
	
	protected void load(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Question_profession> list = QuestionService.loadAllQuestions();
		
		req.getSession().setAttribute("list", list);
		
		resp.setContentType("text/html;charset=utf-8");
		
		resp.getWriter().write(JSONArray.fromObject(list).toString());
	}
}
