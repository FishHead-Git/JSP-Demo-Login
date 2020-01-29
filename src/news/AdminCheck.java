package news;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminCheck
 */
@WebServlet("/AdminCheck")
public class AdminCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=GBK");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		DBconn con = new DBconn();
		StrConvert str = new StrConvert();
		out.println("<html>");
		out.println("<head><title>后台登录验证</title></head>");
		out.println("<body bgcolor=\"#ffffff\">");
		String name = str.chStr(request.getParameter("managerName"));
		String password = str.chStr(request.getParameter("managerPassWord"));
		ResultSet rs = con.executeQuery("select * from tb_manager where Name='"+name+"' and Password='"+password+"'");
		try {
			if(rs.next()) {
				session.setAttribute("admin_name",	name);
				session.setAttribute("admin_password", password);
				String mark = rs.getString("mark");
				session.setAttribute("mark", mark);
				response.sendRedirect("news/manager/managerCheckSuccess.jsp");
			}else {
				response.sendRedirect("news/manager/managerCheckFail.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		out.println("");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
