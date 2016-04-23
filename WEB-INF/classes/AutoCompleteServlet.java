
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.System;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import beans.*;

public class AutoCompleteServlet extends HttpServlet {

    private ServletContext context;
    private ComposerData compData = new ComposerData();
    private HashMap<String,ArrayList<Product>> composers = compData.getComposers();

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        System.out.println("in do get");
        String action = request.getParameter("action");
        String targetId = request.getParameter("id");

        StringBuffer sb = new StringBuffer();

        if (targetId != null) {
            targetId = targetId.trim().toLowerCase();
        } else {
            context.getRequestDispatcher("/error.jsp").forward(request, response);
        }

        boolean namesAdded = false;
        if (action.equals("complete")) {
            System.out.println("In AutoComplete");
            // check if user sent empty string
            if (!targetId.equals("")) {

                Iterator it = composers.keySet().iterator();

                while (it.hasNext()) {
                    String id = (String) it.next();
                    ArrayList<Product> composer = composers.get(id);
                    for (Product product : composer) {
                        if ( // targetId matches first name
                            product.getName().toLowerCase().startsWith(targetId) ||
                            // targetId matches last name
                            product.getCategory().toLowerCase().startsWith(targetId)) {
                            sb.append("<composer>");
                            sb.append("<id>" + product.getId() + "</id>");
                            sb.append("<firstName>" + product.getName() + "</firstName>");
                            sb.append("<lastName>" + product.getCategory() + "</lastName>");
                            sb.append("</composer>");
                            namesAdded = true;
                        }
                    }
                }
            }


            if (namesAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<composers>" + sb.toString() + "</composers>");
            } else {
                //nothing to show
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }

        if (action.equals("lookup")) {

            // put the target composer in the request scope to display
            String targetIdUpperCase = request.getParameter("id");
            String productname = request.getParameter("productName");
            System.out.println("In lookup");
            System.out.println(targetIdUpperCase);
            if (targetIdUpperCase != null) {
                System.out.println("Inside contains inside lookup");
                request.setAttribute("composer", composers.get(targetId));
//                context.getRequestDispatcher("/ProductsDisplay?manufacturer="+targetIdUpperCase).forward(request, response);
                context.getRequestDispatcher("/productDetails.jsp?productId="+targetIdUpperCase).forward(request, response);
//                response.sendRedirect("http://localhost/Assignment1/ProductsDisplay?manufacturer="+targetId);
//                RequestDispatcher dispatcher =
//                        getServletContext().getRequestDispatcher("/Assignment1/ProductsDisplay?manufacturer="+targetIdUpperCase);
//                dispatcher.forward(request, response);
            }
        }
    }
}
