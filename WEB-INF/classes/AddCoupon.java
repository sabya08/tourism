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


public class AddCoupon extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MongoClient mongo;
	
	public void init() throws ServletException{
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		try{
			//Boolean isUser=false;
			HttpSession s=request.getSession();
			//Get the values from the form
			String couponCode = request.getParameter("couponCode");
			String discount = request.getParameter("discount");

			DB db = mongo.getDB("Elextore");
				
			// If the collection does not exists, MongoDB will create it for you
			Map<String, Object> commandArguments = new BasicDBObject();
			DBCollection couponCodes = db.getCollection("couponCodes");
			commandArguments.put("couponCode", couponCode);
			commandArguments.put("discount", discount);
			
			BasicDBObject doc = new BasicDBObject(commandArguments);
			couponCodes.insert(doc);
		//	Object id = (Object)doc.get( "_id" );
    		//s.setAttribute("role","customer");
			 System.out.println("user inserted successfully");
			// s.setAttribute("success","Coupon Added Successfully!");
			request.getRequestDispatcher("/addCoupon.jsp?success=Coupon Added Successfully..!").forward(request, response);
					
			
		} catch (MongoException e) {
			e.printStackTrace();
		}
	}
	
	public void destroy()	{
      // do nothing.
	}
	
}