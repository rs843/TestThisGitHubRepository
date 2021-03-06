package servlet;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;

/**
 * Servlet Filter implementation class Test
 */
@WebFilter(filterName = "authorityFilter", urlPatterns = { "*.jsp" })
public class AuthorityFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public AuthorityFilter() {
		// TODO Auto-generated constructor stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("filtered");
		// initial settings

		final String loginPage = "/login.jsp";
		final String registerPage = "/register.jsp";

		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(true);
		// get the page which the user request for
		String requestPath = req.getServletPath();
		// if the user did not login and request path is neither login nor
		// register,dispatch to login page
		User user;
		user = (User) session.getAttribute("user");
		if (user == null && !requestPath.endsWith(loginPage) && !requestPath.endsWith(registerPage)) {
			// check cookie,if have,return user,if no,sendredirect
			user = CookieOperation.check(req);
			if (user == null) {
				HttpServletResponse resp = (HttpServletResponse) response;
				resp.sendRedirect("login.jsp");
			}else{
				session.setAttribute("user", user);
				chain.doFilter(request, response);
			}
		} else {
			chain.doFilter(request, response);
		}

	}

}
