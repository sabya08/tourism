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


public class AddProductsServlet extends HttpServlet {
    MongoClient mongoClient;

    public void init() throws ServletException{
        // Connect to Mongo DB
        mongoClient = new MongoClient("52.11.50.218", 27017);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        DB db = mongoClient.getDB("Elextore");
        String buttonValue = request.getParameter("addUpdateButton");
        if (buttonValue != null && buttonValue.equals("Add Product")) {
            String productName = request.getParameter("name");
            Double productPrice = Double.parseDouble(request.getParameter("price"));
            String retailer = request.getParameter("retailer");
            String category = request.getParameter("categorylist");
            String productDescription = request.getParameter("description");
            boolean rebateValue = request.getParameter("rebate") != null;
            boolean onsaleValue = request.getParameter("onsale") != null;

            // If the collection does not exists, MongoDB will create it for you
            Map<String, Object> commandArguments = new BasicDBObject();
            DBCollection productDB = db.getCollection("products");
            commandArguments.put("name", productName);
            commandArguments.put("retailerName", retailer);
            commandArguments.put("category", category);
            commandArguments.put("price", productPrice);
            commandArguments.put("description", productDescription);
            commandArguments.put("rebate", rebateValue);
            commandArguments.put("isOnSale", onsaleValue);
            commandArguments.put("isActive", true);
            BasicDBObject doc = new BasicDBObject(commandArguments);
            productDB.insert(doc);
            response.sendRedirect("/elextore/addProductsManager.jsp?success=Product Added Successfully..!");
        }
        else if(op != null && op.equals("delete"))
        {
            String productID = request.getParameter("productId");
            ObjectId objid =new ObjectId(productID);
            DBCollection products = db.getCollection("products");
            BasicDBObject newDocument = new BasicDBObject();
            newDocument.append("$set", new BasicDBObject().append("isActive", false));
            BasicDBObject searchQuery = new BasicDBObject().append("_id", objid);
            products.update(searchQuery, newDocument);
          //  request.getRequestDispatcher("/addProductsManager.jsp?success=Product Deleted Successfully..!").forward(request, response);
            response.sendRedirect("/elextore/addProductsManager.jsp?success=Product Deleted Successfully..!");
        }
        else if(buttonValue != null && buttonValue.equals("Update Product")){
            String productId = request.getParameter("productId");
            ObjectId objid =new ObjectId(productId);
            String productName = request.getParameter("name");
//            Double productPrice = Double.parseDouble(request.getParameter("price"));
            String productPrice = request.getParameter("price");
            String retailer = request.getParameter("retailer");
            String category = request.getParameter("categorylist");
            String productDescription = request.getParameter("description");
            boolean rebateValue = request.getParameter("rebate") != null;
            boolean onsaleValue = request.getParameter("onsale") != null;
            DBCollection updatePoducts = db.getCollection("products");
            BasicDBObject newDocument = new BasicDBObject();
            newDocument.append("$set", new BasicDBObject().append("name", productName));
            newDocument.append("$set", new BasicDBObject().append("retailerName", retailer));
           // newDocument.append("$set", new BasicDBObject().append("price", productPrice));
            newDocument.append("$set", new BasicDBObject().append("category", category));
            newDocument.append("$set", new BasicDBObject().append("description", productDescription));
            newDocument.append("$set", new BasicDBObject().append("isOnSale", onsaleValue));
            newDocument.append("$set", new BasicDBObject().append("rebate", rebateValue));
            BasicDBObject updateQuery = new BasicDBObject().append("_id", objid);
            updatePoducts.update(updateQuery, newDocument);
            request.getRequestDispatcher("/addProductsManager.jsp?success=Product Updated Successfully..!").forward(request, response);
        }

    }
}