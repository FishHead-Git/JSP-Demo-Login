package news;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminCheckPassword
 */
@WebServlet("/AdminCheckPassword")
public class AdminCheckPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCheckPassword() {
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
		
		DBconn con = new DBconn();
		StrConvert str = new StrConvert();
		HttpSession session = request.getSession();
		String id = str.chStr(request.getParameter("managerID"));
		String adminpassword = (String)session.getAttribute("admin_password");
		String password = str.chStr(request.getParameter("oldpassword"));
		String newpassword = str.chStr(request.getParameter("newpassword"));
		if(adminpassword.equals(password)) {
			String sql = "update tb_manager set Password='"+newpassword+"' where ID='"+id+"'";
			con.executeUpdate(sql);
			session.setAttribute("admin_password", newpassword);
			response.sendRedirect("news/manager/adminSelect.jsp");
		}else {
			response.sendRedirect("news/manager/adminChangerPasswordWrong.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
