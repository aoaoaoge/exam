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

import com.pan.exam.entity.Admin;

import net.sf.json.JSONObject;
@WebServlet("/addAdmin")
public class AddAdmin extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String adminName  = req.getParameter("adminname");
		String adminPassword = req.getParameter("adminpassword");
	
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?useSSL=true", "root", "root");
			ps = con.prepareStatement("select * from tb_admin where admin_name=?");
			ps.setString(1, adminName);
			rs = ps.executeQuery();
			if(rs.next()||adminName.equals("")) {
				req.setAttribute("tjsb", "添加失败，该用户名已存在");
				req.getRequestDispatcher("jsp/admin/add-admin.jsp").forward(req, resp);
				System.out.println("tjsb");
			}else {
				addAdmin(adminName, adminPassword);
				req.setAttribute("tjcg", "添加成功，请尽快补全资料");
				req.getRequestDispatcher("jsp/admin/add-admin.jsp").forward(req, resp);
				System.out.println("tjcg");
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
	
	public void addAdmin(String name,String password) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?useSSL=true", "root", "root");
			ps = con.prepareStatement("insert into tb_admin(admin_name,admin_password) value (?,?)");
			ps.setString(1, name);
			ps.setString(2, password);
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
