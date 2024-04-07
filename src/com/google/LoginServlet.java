/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.google;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String uname = request.getParameter("userid");
			System.out.println(uname);
			String pass = request.getParameter("pass");
			System.out.println(pass);
			HttpSession session = request.getSession(true);
			session.setAttribute("user", uname);
			ResultSet rt = Dbconn.getConnection().createStatement()
					.executeQuery("select * from user where username='" + uname + "'");
			if (rt.next()) {
				String p = rt.getString("password");
				String activate = rt.getString("accept");
				String mail = rt.getString("email");
				String name = rt.getString("username");
				if (pass.equalsIgnoreCase(p)) {
					if (activate.equalsIgnoreCase("yes")) {
						HttpSession user = request.getSession(true);
						user.setAttribute("name", name);
						user.setAttribute("username", uname);
						user.setAttribute("mail", mail);
						response.sendRedirect("UserMain.jsp");
					} else {
						response.sendRedirect("NotActivated.jsp");
					}
				} else {
					response.sendRedirect("IncorrectPassword.jsp");
				}
			} else {
				response.sendRedirect("IncorrectUsername.jsp");
			}
		} catch (Exception e) {
			out.println(e);
		} finally {
			out.close();
		}
	}
}
