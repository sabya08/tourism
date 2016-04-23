import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;
import com.mongodb.Block;
import com.mongodb.client.FindIterable;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.Date;
import beans.UserBean;


public class SignIn extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	UserBean userbean;
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("52.11.50.218", 27017);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		try{
			Boolean isUser=false;
			HttpSession s=request.getSession();
			//Get the values from the form
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			DB db = mongo.getDB("Elextore");
			DBCollection collection = db.getCollection("users");
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("email", email);
			//BasicDBObject whereQuery1 = new BasicDBObject();
			whereQuery.put("password", password);
			DBCursor cursor = collection.find(whereQuery);
			while(cursor.hasNext()) {
				isUser=true;
	    		BasicDBObject obj = (BasicDBObject) cursor.next();	

    			userbean=new UserBean();
				userbean.setId(obj.get("_id").toString());
				userbean.setFirstName(obj.get("fName").toString());
				userbean.setLastName(obj.get("lName").toString());
				userbean.setEmail(obj.get("email").toString());
				userbean.setRole(obj.get("role").toString());
				//userbean.setPassword(password);
    			
    			s.setAttribute("userbean",userbean);
    			//s.setAttribute("role",obj.get("role").toString());
			 	//System.out.println("user logged in successfully");
				if(email.equals("storemanager@elextore.com"))
				{
					request.getRequestDispatcher("/storeManager.jsp").forward(request, response);
				}
				else {
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}
				}
				
				if(isUser==false)
				{
					s.setAttribute("error","Invalid username/Password !");
					request.getRequestDispatcher("/signin.jsp").forward(request, response);
				}
			
			//out.println("Invalid Username/password");
					
			
		} catch (MongoException e) {
			e.printStackTrace();
		}
	}
	
	public void destroy()	{
      // do nothing.
	}
	
}