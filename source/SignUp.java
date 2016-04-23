package tourism;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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


public class SignUp extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	UserBean userbean;
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s=request.getSession();
		try{
			Boolean isUserExist=false;
			//Get the values from the form
			String fName = request.getParameter("fName");
			String lName = request.getParameter("lName");
			String email = request.getParameter("email");
			//String uname = request.getParameter("uname");
			String password = request.getParameter("password");

			DB db = mongo.getDB("Elextore");
				
			// If the collection does not exists, MongoDB will create it for you
			Map<String, Object> commandArguments = new BasicDBObject();
			DBCollection usersdb = db.getCollection("users");
			commandArguments.put("fName", fName);
			commandArguments.put("lName", lName);
			commandArguments.put("email",email);
    		commandArguments.put("password", password);
    		commandArguments.put("role", "customer");
    		
    		BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("email", email);
    		DBCursor cursor = usersdb.find(whereQuery);
			while(cursor.hasNext()) {
				isUserExist=true;
				 cursor.next();
	    		}
    		if(isUserExist==false)
    		{
    			BasicDBObject doc = new BasicDBObject(commandArguments);
			usersdb.insert(doc);
			Object id = (Object)doc.get( "_id" );

			userbean=new UserBean();
			userbean.setId(id.toString());
			userbean.setFirstName(fName);
			userbean.setLastName(lName);
			userbean.setEmail(email);
			userbean.setPassword(password);
			userbean.setRole("customer");


			
    		s.setAttribute("userbean",userbean);
    		//s.setAttribute("role","customer");
			 System.out.println("user inserted successfully");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
    		}
    		else{
    			s.setAttribute("error","Email already Exists !");
					request.getRequestDispatcher("/signup.jsp").forward(request, response);
    		}
    		
	
			
			
		} catch (MongoException e) {
			e.printStackTrace();
		}
	}
	
	public void destroy()	{
      // do nothing.
	}
	
}