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

public class CostCodeServlet extends HttpServlet
{
	
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
	    request.setCharacterEncoding("utf-8");
	    String text = request.getParameter("text");
	    String[] para = text.split(",");
	    List costcodeall = new ArrayList();
	    List list = new ArrayList();
	    System.out.println(text);
	    VendorDao vendordao = new VendorDao();
	    	    
	    List costcodes = null;
	    
	    costcodes = vendordao.findAllCostCode(para[0]);
	    
	    
	    for (int i = 0; i < costcodes.size(); ++i) {
	      String costcode =((CostCode)costcodes.get(i)).getClientname();
	      costcodeall.add(costcode);
	    }
	
	    
	    request.setAttribute("costcode", costcodeall);
	    request.getRequestDispatcher("/costcodexml.jsp").forward(request, response);
	  }
	
	  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGet(request, response);
	  }
}