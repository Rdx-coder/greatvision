

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WithdrawShowDelete
 */
@WebServlet("/WithdrawShowDelete")
public class WithdrawShowDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String account_no=request.getParameter("account_no");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/indore","root","123456");
			String qr="delete from withdraw where account_no=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, account_no );
			int i=ps.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("WithdrawShow");
			if(i>0)
			{
				rd.include(request, response);
				out.println("Withraw deleted sucessfully");
			}
			else
			{
				rd.include(request, response);
				out.println("withdraw not deleted");
			}
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e);
		}

	}

}
