package servlet;

import com.datacollect.VendorDao;
import com.productsystem.model.CostCode;
import com.productsystem.model.User;
import com.productsystem.model.Vendor;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LeadServlet extends HttpServlet
{
	
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
	    request.setCharacterEncoding("utf-8");
	    String text = request.getParameter("text");
	    String[] para = text.split(",");
	    List leadall = new ArrayList();
	    List list = new ArrayList();
	    System.out.println(text);
	    VendorDao vendordao = new VendorDao();
	    List users = null;
	    	    
	    users = vendordao.findAllLead(para[0]);
	    
	    
	    for (int i = 0; i < users.size(); ++i) {
	      String username =((User)users.get(i)).getUsername();
	      leadall.add(username);
	    }
	
	    
	    request.setAttribute("lead", leadall);
	    request.getRequestDispatcher("/leadxml.jsp").forward(request, response);
	  }
	
	  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGet(request, response);
	  }
}