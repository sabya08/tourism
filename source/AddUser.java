import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.*;
import javax.servlet.*;
import java.util.Random;
import javax.servlet.http.*;
import java.util.*;
//import mybean.UserBean;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;

/** Shows all the parameters sent to the servlet via either
 *  GET or POST. Specially marks parameters that have
 *  no values or multiple values.
 *  <P>
 *  Taken from Core Servlets and JavaServer Pages 2nd Edition
 *  from Prentice Hall and Sun Microsystems Press,
 *  http://www.coreservlets.com/.
 *  &copy; 2003 Marty Hall; may be freely used or adapted.
 */
@SuppressWarnings("unchecked")
public class AddUser extends HttpServlet {
MongoClient mongo;
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);
	}

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
	
	//UserBean usrbean = new UserBean();
	String mess="";
	String fName=request.getParameter("first_name");
	if(fName==null)
	fName="";
	String lName=request.getParameter("last_name");
	if(lName==null)
	lName="";
	
	String password=request.getParameter("password");
	if(password==null)
	password="";
	
	String email=request.getParameter("email");
	if(email==null)
	email="";
	
	// String shippingAddress=request.getParameter("shippingAddress");
	// if(shippingAddress==null)
	// shippingAddress="";
	
	 try
      { System.out.println("user inserted successfully");

			DB db = mongo.getDB("elextore");
				
			// If the collection does not exists, MongoDB will create it for you
			Map<String, Object> commandArguments = new BasicDBObject();
			DBCollection myOrders = db.getCollection("users");
			commandArguments.put("fName", fName);
			commandArguments.put("lName", lName);
    		commandArguments.put("password", password);
    		commandArguments.put("email",email);
    		commandArguments.put("role", "customer");
    		
    		
    		BasicDBObject doc = new BasicDBObject(commandArguments);
			myOrders.insert(doc);

			 HttpSession s=request.getSession();
    		s.setAttribute("email",email);
    		s.setAttribute("role","customer");
			 System.out.println("user inserted successfully");
			//request.getRequestDispatcher("/index.jsp").forward(request, response);


      
	 //  usrbean.setFirstName(fName);
	 //  usrbean.setLastName(lName);
	 //  usrbean.setPassword(password);
	 //  usrbean.setEmail(email);
	 //  usrbean.setShippingAddress(shippingAddress);
	 //  String filePath=request.getServletContext().getRealPath("Data/UserDetails.txt");
	
  //        File userFile= new File(filePath);
		//  if(!userFile.exists()) {
		// 	userFile.createNewFile();
		// 	FileOutputStream fileOut =new FileOutputStream(userFile);
		// 	ObjectOutputStream objout = new ObjectOutputStream(fileOut);
		// 	objout.writeObject(usrbean);
		// 	mess="SUCCESS";
		// 	objout.close();
		// 	fileOut.close();
			
		// } 
		// else
		// {
		// 	FileInputStream fileIn = new FileInputStream(userFile);
		// 	ObjectInputStream objin = new ObjectInputStream(fileIn);
		// 	ArrayList<mybean.UserBean> UserBeans = new ArrayList(); 
		// 	UserBeans.add(usrbean);
		// 	UserBean e=null;
		// 	while(fileIn.available()>0){
		// 		e = (UserBean) objin.readObject();
		// 		UserBeans.add(e);
		// 	}
		// 	objin.close();
		// 	fileIn.close();
		// 	FileOutputStream fileOut =new FileOutputStream(userFile);
		// 	ObjectOutputStream objout = new ObjectOutputStream(fileOut);
		// 	for(int i=0;i<UserBeans.size();i++)
		// 	{
		// 		objout.writeObject(UserBeans.get(i));
		// 	}
		// 	mess="SUCCESS";
		// 	objout.close();
		// 	fileOut.close();
			
			
		// }	
      }catch(IOException i)
      {
         mess="FAIL";
		 i.printStackTrace();
         return;
      }
	  response.setContentType("text/html");
	PrintWriter out = response.getWriter();
    String docType =
      "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
      "Transitional//EN\">\n";
	out.println(docType +"<HTML>\n");
    
	 //  if(mess.equals("SUCCESS")){
		
		// HttpSession session = request.getSession();
		// session.setAttribute("usrbean", usrbean);
		// response.sendRedirect( "/sports4hawks/index.jsp" );
		// //out.println("<font color='RED'><h3>User Added SuccessFully.... Click Below to Continue Shopping.. </h3></font>");
		// //out.println("<a href= '/sports4hawks/index.jsp'> Contiue Shopping </a>");

		// }
		// else{
		// 	//response.sendRedirect( "/sports4hawks/index.jsp?mess=FAIL" );
		// 	out.println("<font color='RED'><h3>Error Occured While Adding User... Please Try Again </h3></font>");
		// }
	
		out.println("</BODY></HTML>");

    
  }

  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
