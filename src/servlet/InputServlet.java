package servlet;

import com.datacollect.VendorDao;
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

public class InputServlet extends HttpServlet
{
  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    request.setCharacterEncoding("utf-8");
    String text = request.getParameter("text");
    String[] para = text.split(",");
    List word = new ArrayList();
    List list = new ArrayList();
    
    System.out.println(text);
    VendorDao vendordao = new VendorDao();
    List vendors = null;
    if (para[1].equals("External") || para[1].equals("choose")){
      vendors = vendordao.FindVendor(para[0]);
    }else if (para[1].equals("Internal")) {
      vendors = vendordao.findTranslator(para[0]);
    }else if(para[1].equals("vendorname")) {
    	 vendors = vendordao.FindVendor(para[0]);
    }	
    
    
    for (int i = 0; i < vendors.size(); ++i) {
	      String vendorname =((Vendor)vendors.get(i)).getVendor_name();
	      word.add(vendorname);
    }

    
    request.setAttribute("word", word);
    request.getRequestDispatcher("/wordxml.jsp").forward(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}