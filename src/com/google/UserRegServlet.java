/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.google;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

/**
 *
 * @author Praveen
 */
@WebServlet(name = "UserRegServlet", urlPatterns = { "/UserRegServlet" })
public class UserRegServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {

			ArrayList list = new ArrayList();
			ServletContext context = getServletContext();
			String dirName = context.getRealPath("Gallery/");
			String paramname = null;
			String file = null;
			String a = null, b = null, c = null, d = null, image = null;
			String ee[] = null;
			String checkBok = " ";
			int ff = 0;
			String bin = "";
			String uname = null;
			String pass = null;
			String email = null;
			String mno = null;
			String dateOfBirth = null;
			String addr = null;
			String gender = null;
			String pincode = null;
			String location = null;

			FileInputStream fs = null;
			File file1 = null;

			MultipartRequest multi = new MultipartRequest(request, dirName, 10 * 1024 * 1024); // 10MB
			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) {
				paramname = (String) params.nextElement();
				if (paramname.equalsIgnoreCase("userid")) {
					uname = multi.getParameter(paramname);
				}
				if (paramname.equalsIgnoreCase("pass")) {
					pass = multi.getParameter(paramname);
				}
				if (paramname.equalsIgnoreCase("email")) {
					email = multi.getParameter(paramname);
				}
				if (paramname.equalsIgnoreCase("mobile")) {
					mno = multi.getParameter(paramname);
				}
				if (paramname.equalsIgnoreCase("address")) {
					addr = multi.getParameter(paramname);
				}
				if (paramname.equalsIgnoreCase("dob")) {
					dateOfBirth = multi.getParameter(paramname);
				}
				if (paramname.equalsIgnoreCase("gender")) {
					gender = multi.getParameter(paramname);
				}
				if (paramname.equalsIgnoreCase("pincode")) {
					pincode = multi.getParameter(paramname);
				}
				if (paramname.equalsIgnoreCase("location")) {
					location = multi.getParameter(paramname);
				}

				if (paramname.equalsIgnoreCase("pic")) {
					image = multi.getParameter(paramname);
				}

			}

			int f = 0;
			Enumeration files = multi.getFileNames();
			while (files.hasMoreElements()) {
				paramname = (String) files.nextElement();
				if (paramname.equals("d1")) {
					paramname = null;
				}

				if (paramname != null) {
					f = 1;
					image = multi.getFilesystemName(paramname);
					String fPath = context.getRealPath("Gallery\\" + image);
					file1 = new File(fPath);
					fs = new FileInputStream(file1);
					list.add(fs);

					String ss = fPath;
					FileInputStream fis = new FileInputStream(ss);
					StringBuffer sb1 = new StringBuffer();
					int i = 0;
					while ((i = fis.read()) != -1) {
						if (i != -1) {
							// System.out.println(i);
							String hex = Integer.toHexString(i);
							// session.put("hex",hex);
							sb1.append(hex);
							// sb1.append(",");

							String binFragment = "";
							int iHex;

							for (int i1 = 0; i1 < hex.length(); i1++) {
								iHex = Integer.parseInt("" + hex.charAt(i1), 16);
								binFragment = Integer.toBinaryString(iHex);

								while (binFragment.length() < 4) {
									binFragment = "0" + binFragment;
								}
								bin += binFragment;
								// System.out.print(bin);
							}
						}
					}
				}
			}
			FileInputStream fs1 = null;
			// name=dirName+"\\Gallery\\"+image;
			int lyke = 0;
			// String as="0";
			// image = image.replace(".", "_b.");

			PreparedStatement ps = Dbconn.getConnection().prepareStatement(
					"insert into user(username,password,email,mobile,address,dob,gender,pincode,status,secretkey,image,accept) values(?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, uname);
			ps.setString(2, pass);
			ps.setString(3, email);
			ps.setString(4, mno);
			ps.setString(5, addr);
			ps.setString(6, dateOfBirth);
			ps.setString(7, gender);
			ps.setString(8, pincode);
			ps.setString(9, "waiting");
			ps.setString(10, "SecretKey");
			ps.setBinaryStream(11, (InputStream) fs, (int) (file1.length()));
			ps.setString(12, "No");
			if (f == 0)
				ps.setObject(10, null);
			else if (f == 12) {
				fs1 = (FileInputStream) list.get(0);
				ps.setBinaryStream(10, fs1, fs1.available());
			}

			int x = ps.executeUpdate();
			if (x > 0) {
				String[] mm = new String[] { email };
				new MailUtil().sendMail(mm, mm, "Registration",
						"your account registered .Use this mailid for any future references...");

				response.sendRedirect("UserRegSucess.jsp");
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	}
}
