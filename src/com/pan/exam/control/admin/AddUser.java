package com.pan.exam.control.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/adduser")
public class AddUser extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String questionid  = req.getParameter("questionname");
		String userName = req.getParameter("username");
		String password  = req.getParameter("password");
		String province = req.getParameter("province");
		String company  = req.getParameter("company");
		String department = req.getParameter("department");
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?useSSL=true", "root", "root");
			ps = con.prepareStatement("select * from tb_user where user_name=?");
			ps.setString(1, userName);
			rs = ps.executeQuery();
			if(rs.next()||userName.equals("")) {
				req.setAttribute("tjsb", "添加失败，该用户名已存在");
				req.getRequestDispatcher("jsp/admin/add-admin.jsp").forward(req, resp);
			}else {
			addUser(questionid, userName,password,province,company,department);
				req.setAttribute("tjcg", "添加成功，请尽快补全资料");
				req.getRequestDispatcher("jsp/admin/user-add.jsp").forward(req, resp);
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
	}
	
	public void addUser(String questionid,String userName,String password,String province,String company,String department) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?useSSL=true", "root", "root");
			ps = con.prepareStatement("insert into tb_user(question_id,user_password,user_name,user_province,user_company,user_department) value (?,?,?,?,?,?)");
			ps.setString(1,questionid);
			ps.setString(2, password);
			ps.setString(3,userName);
			ps.setString(4, province);
			ps.setString(5,company);
			ps.setString(6, department);
			 ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
