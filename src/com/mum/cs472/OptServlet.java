package com.mum.cs472;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OptServlet
 */
@WebServlet(name = "MyOptServlet", urlPatterns = { "/MyOptServlet" })
public class OptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OptServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String age = request.getParameter("age");
		System.out.println(age);
		if (MyTools.isNumeric(age)) {
			int a = Integer.parseInt(age);
			if (a > 4 && a < 99) {
				System.out.println("varify succ");
				request.setAttribute("msg", "varify succ");
			} else {
				System.out.println("varify range fail");
			}
		} else {
			System.out.println("This is not a number");
		}
	}

}
