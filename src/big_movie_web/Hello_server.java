package big_movie_web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Hello_server
 */
public class Hello_server extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public static final String HTML_START = "<html><body>";
    public static final String HTML_END = "</body></html>";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hello_server() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		java.util.Date date = new java.util.Date();
		out.println(HTML_START + "<h2>Hi There!</h2><br/><h3>Date="+date+"</h3>"+HTML_END);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
