<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%
    String startdate=request.getParameter("startdate");
    String enddate=request.getParameter("enddate");
    String vendorid=request.getParameter("vendorid");
    

    String DRIVER = "com.mysql.jdbc.Driver";
    String URL      = "jdbc:mysql://localhost:3306/vendorsystem";
    String USER      = "root";
    String PASSWORD="root";
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
    ResultSet rs_update = null;
    List cities = new ArrayList();

    try{
        Class.forName(DRIVER);
    } catch(java.lang.ClassNotFoundException e) {
        e.printStackTrace();
    }

    try {
        conn = DriverManager.getConnection(URL,USER,PASSWORD);
        st=conn.createStatement();
        rs=st.executeQuery(" select vendordate  from schedule where   vendorid='"+vendorid+"' and vendordate >= date'"+startdate+"' and vendordate <= date'"+enddate+"'  ");//sort=id
        while (rs.next())
        {
            cities.add(rs.getString(1));
        }
        
    }  catch (Exception e)  {  
        e.printStackTrace();
    }
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    if(cities.size()>0) {
     out.println("<res>ycz</res>");
    }else {
       out.println("<res>bcz</res>");
       int c =st.executeUpdate(" update schedule a set a.yxbz='N',a.mrbz='N' where  a.mrbz  = 'Y'  and  a.vendorid='"+vendorid+"' and a.vendordate >= date'"+startdate+"' and a.vendordate <= date'"+enddate+"'");//sort=id
       
    }
    
    out.println("</response>");
%>
