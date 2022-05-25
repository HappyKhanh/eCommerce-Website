package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		session.setAttribute("error", "");
		session.setAttribute("user", "");
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		try {
			request.getSession(true).invalidate();
			String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regex = "[a-zA-Z0-9_!@#$%^&*]+";

			String user = request.getParameter("username");
			String password = request.getParameter("password");
			Account acc = new Account();
			acc.setUsr(user);
			acc.setPwd(password);
			HttpSession session = request.getSession(true);
			session.setAttribute("user", user);
			// Validate thong tin user, neu sai format chuyen nguoc lai ve trang dang nhap
			
			if ( !(password.matches(regex)) || !(user.matches(regexMail)) ) {
				session.setAttribute("error", "invalid syntax");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
			
			// Kiem tra thong tin dang nhap co chinh xac voi ContextParam truoc do ko
			if (acc.login()) {
				response.sendRedirect("web/admin/index.jsp");
			} else {
				session.setAttribute("error", "wrong username or password");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}

		} catch (NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
		} catch (Exception ex) {
			response.getWriter().println(ex);
		}
	}

}
