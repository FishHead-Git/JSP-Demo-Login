package news;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddManager
 */
@WebServlet("/AddManager")
public class AddManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("managerID");
		String Name = request.getParameter("name");
		String realname = request.getParameter("realname");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		String mark = request.getParameter("mark");
		System.out.println(Arrays.toString(new String[] {id, Name, realname, password, mark}));
		if(password.equals(confirm)) {
			String sql = "insert into tb_manager (id, name, realname, password, mark, issuedate) values ("+id+",'"+Name+"','"+realname+"','"+password+"','"+mark+"', now())";
			DBconn con = new DBconn();
			con.executeUpdate(sql);
			System.out.println("insert success: "+id);
			con.close();
		}
		response.sendRedirect("news/manager/updateManagerRight.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
