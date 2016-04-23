import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.*;
import javax.servlet.*;
import java.util.Random;
import javax.servlet.http.*;
import java.util.*;
import beans.UserBean;

@SuppressWarnings("unchecked")
public class LogOutServlet extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
	
	 response.setContentType("text/html");
	PrintWriter out = response.getWriter();
    String docType =
      "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
      "Transitional//EN\">\n";
	out.println(docType +"<HTML>\n");
    
	request.getSession().invalidate();
  request.getRequestDispatcher("/signin.jsp").forward(request, response);
	out.println("<font color='RED'><h3>Logout SuccessFully.... Click Below if you want to Continue Shopping.. </h3></font>");
	out.println("<a href= 'index.jsp'> Contiue Shopping </a>");

  }

  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
