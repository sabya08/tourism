
import java.util.HashMap;
import java.util.ArrayList;
import beans.*;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
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

public class ComposerData {
    
//    private HashMap composers = new HashMap();
    private HashMap<String,ArrayList<Product>> composers = new HashMap<String,ArrayList<Product>>();
    ArrayList<Product> productList = new ArrayList<Product>();
    public HashMap<String,ArrayList<Product>> getComposers() {

        for(Product product : productList)
        {
            if(composers.containsKey(product.getManufacturer()))
            {
                ArrayList<Product> products = composers.get(product.getManufacturer());
                products.add(product);
            }
            else
            {
                ArrayList<Product> newproducts = new ArrayList<Product>();
                newproducts.add(product);
                composers.put(product.getManufacturer(),newproducts);
            }
        }
        return composers;
    }

    MongoClient mongoClient;

    public ComposerData() {

        mongoClient = new MongoClient("localhost", 27017);
        DB db = mongoClient.getDB("Elextore");
        DBCollection coll = db.getCollection("products");
        DBCursor cursor = coll.find();
//        ArrayList<Product> productList = new ArrayList<Product>();

        while (cursor.hasNext()) {

            DBObject obj = cursor.next();
            String productId = obj.get("_id").toString();
            String productName = (String)obj.get("name");
            String productMaufacturer = (String)obj.get("manufacturer");
            String productRetailer = (String)obj.get("retailerName");
            String category = (String)obj.get("category");

            String description = (String)obj.get("description");
            Boolean isOnSale = (Boolean)obj.get("isOnSale");
            Boolean isActive = (Boolean)obj.get("isActive");
            String rebate = "yes";
            Product product = new Product(productId,productName,productMaufacturer,0.0,category,"",description,rebate,isActive,isOnSale);
            productList.add(product);

        }
//        composers.put(productManufacturer, productList);
        
    }

}
