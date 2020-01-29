package news;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddNews
 */
@WebServlet("/AddNews")
public class AddNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNews() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String newsID = request.getParameter("newsID");
		String newstype = request.getParameter("newstype");
		String title = request.getParameter("title");
		String stylename = request.getParameter("stylename");
		String content = request.getParameter("content");
		
//		System.out.println(newsID+" : "+title+" : "+content+" : "+newstype+" : "+stylename);
		DBconn con = new DBconn();
		String sql = "insert into tb_News (id, Title, content, Type, Style, IssDate) values ("+
		newsID+", '"+title+"','"+content+"','"+newstype+"','"+stylename+"', now())";
		con.executeUpdate(sql);
		response.sendRedirect("news/manager_news/newsSelect.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
