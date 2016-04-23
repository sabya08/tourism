package servlets;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Iterator;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
//import com.mongodb.WriteConcert;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.BasicDBList;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;


public class InitServlet extends HttpServlet {
    private static InitServlet instance = null;
    MongoClient mongo = null;
    DB db = null;
    private InitServlet(){
        mongo = new MongoClient("52.11.50.218", 27017);
        db = mongo.getDB("Elextore");
    }

    public static InitServlet getInstance(){
        if(instance == null)
        {
            return new InitServlet();
        }
        else
            return instance;
    }

    public DB getMongoDBObject(){
        return db;
    }


}