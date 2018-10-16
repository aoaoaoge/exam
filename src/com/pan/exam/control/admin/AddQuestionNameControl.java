package com.pan.exam.control.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.pan.exam.entity.QuestionLiu;
import com.pan.exam.entity.User;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@WebServlet("/addqustion_name")
public class AddQuestionNameControl extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<QuestionLiu>	list = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?useSSL=true", "root", "root");
			ps = con.prepareStatement("select * from  tb_question");
			rs= ps.executeQuery();
			while(rs.next()) {
				QuestionLiu q = new QuestionLiu(rs.getInt(1),rs.getString(2),rs.getString(3));
				list.add(q);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
				rs.close();
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//将Java对象转换为json格式的字符串
			String jsonStr = JSONArray.fromObject(list).toString();
			//将json格式的字符串写入到响应中
			//防止中文乱码，设置响应的字符编码
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write(jsonStr);
		
			 
			
		}
		
		
	}
		
}
