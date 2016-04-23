package servlets;

import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.*;
import javax.servlet.*;
import java.util.Random;
import javax.servlet.http.*;
import java.util.*;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;
import org.bson.types.ObjectId;
import servlets.*;
import beans.*;


public class SubmitReview extends HttpServlet {
    MongoClient mongoClient;

    public void init() throws ServletException{
        // Connect to Mongo DB
        mongoClient = new MongoClient("52.11.50.218", 27017);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DB db = mongoClient.getDB("Elextore");
        String review = request.getParameter("reviewText");
        String rating = request.getParameter("rating");
        UserBean userBean = (UserBean)session.getAttribute("userbean");
        String productId = (String) request.getParameter("productId");
        String productName = (String) request.getParameter("productName");

        Map<String, Object> commandArguments = new BasicDBObject();
        DBCollection productDB = db.getCollection("reviews");
        commandArguments.put("productName", productName);
        commandArguments.put("productId", productId);
        commandArguments.put("review", review);
        commandArguments.put("rating", rating);
        commandArguments.put("useremail", userBean.getEmail());
        commandArguments.put("userfname", userBean.getFirstName());
        BasicDBObject doc = new BasicDBObject(commandArguments);
        productDB.insert(doc);
        request.getRequestDispatcher("/productDetails.jsp?success=Review submitted Successfully..!").forward(request, response);
    }
}