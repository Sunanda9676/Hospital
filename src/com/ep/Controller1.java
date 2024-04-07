package com.ep;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.google.gson.Gson;
@WebServlet("/SearchController1")
public class Controller1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("application/json");
		try {
			String from = request.getParameter("term");
			System.out.println(" Data from ajax call " + from);

			DataDao1 dataDao= new DataDao1();
			ArrayList<String> list = dataDao.getItems(from);

			String searchList = new Gson().toJson(list);
			response.getWriter().write(searchList);
			list.clear();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
