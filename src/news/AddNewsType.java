package news;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddNewsType
 */
@WebServlet("/AddNewsType")
public class AddNewsType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewsType() {
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
		
		String id = request.getParameter("newsTypeID");
		String newsType = request.getParameter("newsType");
		System.out.println(id+"-"+newsType);
		DBconn con = new DBconn();
		String sql = "select count(Typename) from tb_newstype where TypeName='"+newsType+"'";
		ResultSet rs = con.executeQuery(sql);
		try {
			rs.next();
			if(rs.getInt(1) != 0) {
				System.out.println(rs.getString(1));
				response.sendRedirect("news/manager_news/addNewsTypeFail.jsp");
			}else {
				sql = "insert into tb_newstype (id, typename, datetime) values ("+id+",'"+newsType+"',now())";
				int isSuccess = con.executeUpdate(sql);
				if(isSuccess == 1) {
					response.sendRedirect("news/manager_news/addNewsTypeSuccess.jsp");
				}else {
					System.out.println("≤Â»Î ß∞‹: "+isSuccess);
					response.sendRedirect("news/manager_news/addNewsTypeFail.jsp");
					
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
