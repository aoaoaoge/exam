package com.pan.exam.control.admin;

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

import com.pan.exam.entity.User;


import net.sf.json.JSONObject;
@WebServlet("/getusers")
public class UserControl extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageNo = Integer.parseInt(req.getParameter("pageNo"));
		int pageSize = Integer.parseInt(req.getParameter("pageSize"));
		List<User>	list = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = getRows();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?useSSL=true", "root", "root");
			ps = con.prepareStatement("select t.*,q.question_name from tb_user t join tb_question q on t.question_id=q.question_id limit ?,?");
			ps.setInt(1, (pageNo-1)*pageSize);
			ps.setInt(2, pageSize);
			rs= ps.executeQuery();
			while(rs.next()) {
				User u = new User(rs.getInt("user_id"),rs.getString("user_name"),rs.getString("user_email"),rs.getString("user_province"),rs.getString("user_company"),rs.getString("user_department"),rs.getString("question_name"),rs.getString("user_login_time"),rs.getString("user_state"));
				list.add(u);
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
		}
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);

		//将Java对象转换为json格式的字符串
		String jsonStr = JSONObject.fromObject(map).toString();
		//将json格式的字符串写入到响应中
		//防止中文乱码，设置响应的字符编码
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(jsonStr);
	
	
	}
	
	public int getRows(){
		int count = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?useSSL=true", "root", "root");
			ps = con.prepareStatement("select t.*,q.question_name from tb_user t join tb_question q on t.question_id=q.question_id");
			
			rs= ps.executeQuery();
			while(rs.next()) {
				count++;
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
		}
		return count;
		
	}	
	
}
