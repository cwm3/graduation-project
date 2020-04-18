package com.datacollect;

import com.productsystem.model.CostCode;
import com.productsystem.model.Qa;
import com.productsystem.model.User;
import com.productsystem.model.Vendor;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class VendorDao extends BaseDao
{
  Connection conn = null;
  ResultSet rs = null;
  PreparedStatement pstmt = null;
  List cities = new ArrayList();

  public List FindVendor(String vendorname)
  {
    Vendor vendor = null;
    List list = new ArrayList();

    StringBuffer hql = new StringBuffer();
    hql.append("select * from vendor  where  vendor_name like '%" + vendorname + "%'");
    hql.append(" order by vendorid desc ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        vendor = new Vendor();
        vendor.setVendorid(this.rs.getString("vendorid"));
        vendor.setVendor_name(this.rs.getString("vendor_name"));
        vendor.setChinese_name(this.rs.getString("chinese_name"));
        vendor.setVendor_cat(this.rs.getString("vendor_cat"));
        vendor.setVendor_field(this.rs.getString("vendor_field"));
        vendor.setVendor_tel(this.rs.getString("vendor_tel"));
        vendor.setAveragescore(this.rs.getString("averagescore"));
        vendor.setVendor_email(this.rs.getString("vendor_email"));
        list.add(vendor);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }

  public List findTranslator(String vendorname)
  {
    Vendor vendor = null;
    List list = new ArrayList();

    StringBuffer hql = new StringBuffer();
    hql.append("select translatorname from translator  where  translatorname  like '%" + vendorname + "%'");
    hql.append(" order by translatorname desc ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        vendor = new Vendor();
        vendor.setVendor_name(this.rs.getString("translatorname"));
        list.add(vendor);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }
  
  public List findAllClient(String client)
  {
	CostCode costcode = null;
    List list = new ArrayList();

    StringBuffer hql = new StringBuffer();
    hql.append("select distinct(clientname) clientname   from costcode  where  clientname like '%" + client + "%'");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
    	costcode = new CostCode();
    	costcode.setClientname(this.rs.getString("clientname"));
        list.add(costcode);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); }
      finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }
  
  public List findAllCostCode(String costcode)
  {
	CostCode newcostcode = null;
    List list = new ArrayList();

    StringBuffer hql = new StringBuffer();
    hql.append("select distinct(costcode) costcode   from costcode  where  costcode like '%" + costcode + "%'");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
    	  newcostcode = new CostCode();
    	  newcostcode.setClientname(this.rs.getString("costcode"));
          list.add(newcostcode);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); }
      finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }
  
  
  
   
  
  public List findAllLead(String lead)
  {
	User user = null;
    List list = new ArrayList();

    StringBuffer hql = new StringBuffer();
    hql.append("select  distinct(lead) lead   from  costcode  where  lead like '%" + lead + "%' and  yxbz = 'Y' order by lead ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
    	  user = new User();
    	  user.setUsername(this.rs.getString("lead"));
        list.add(user);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); }
      finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }
  
  

  public List FindClient(String client)
  {
    Vendor vendor = null;
    List list = new ArrayList();

    StringBuffer hql = new StringBuffer();
    hql.append("select client  from client  where  client like '%" + client + "%'");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        vendor = new Vendor();
        vendor.setVendor_name(this.rs.getString("client"));
        list.add(vendor);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }

  public List findLead(String lead)
  {
    Vendor vendor = null;
    List list = new ArrayList();
    String getlead = "";
    StringBuffer hql = new StringBuffer();
    if ((lead == null) || (lead.equals("")))
      hql.append("select distinct(lead) lead   from costcode  where  yxbz = 'Y' order by lead  ");
    else
      hql.append("select distinct(lead) lead   from costcode  where  lead like '%" + lead + "%' and yxbz = 'Y'  order by lead  ");

    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        getlead = this.rs.getString("lead");
        if ((getlead != null) && (!(getlead.equals(""))))
          list.add(getlead);
      }

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }

  public List FindProject(String status, String username, String datedate)
  {
    StringBuffer hql = new StringBuffer();
    hql.append("select systemcode from project where 1 = 1 ");
    if (!(username.equals("admin")))
      hql.append("and lead = '" + username + "'");

    if (!(datedate.equals("")))
      hql.append("and dropdate = '" + datedate + "'");

    if (!(status.equals("")))
      hql.append("and status = '" + status + "'");

    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        this.cities.add(this.rs.getString(1));

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return this.cities;
  }

  public List FindByKeyWordAndNumber(String vendorid, String vendorname, String chinesename)
  {
    Vendor vendor = null;
    List list = new ArrayList();

    StringBuffer hql = new StringBuffer();
    hql.append("select * from vendor  where id > 0 ");
    if (!(vendorid.equals("")))
      hql.append(" and vendorid like '%" + vendorid + "%' ");

    if (!(vendorname.equals("")))
      hql.append(" and vendorname like '%" + vendorname + "%' ");

    if (!(chinesename.equals("")))
      hql.append(" and chinesename like '%" + chinesename + "%' ");

    hql.append(" order by vendorid desc ");
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        vendor = new Vendor();
        vendor.setVendorid(this.rs.getString("vendorid"));
        vendor.setVendor_name(this.rs.getString("vendorname"));
        vendor.setChinese_name(this.rs.getString("chinesename"));
        vendor.setVendor_cat(this.rs.getString("cat"));
        vendor.setVendor_field(this.rs.getString("field"));
        vendor.setVendor_tel(this.rs.getString("tel"));
        vendor.setAveragescore(this.rs.getString("averagescore"));
        vendor.setVendor_email(this.rs.getString("email"));
        list.add(vendor);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }

  public List FindBy(String vendorid, String vendorname, String filed, String cat, String startdate, String enddate)
  {
    Vendor vendor = null;
    List list = new ArrayList();

    StringBuffer hql = new StringBuffer();
    hql.append("select a.vendorid,a.vendorname,b.capacity,b.vendordate from vendor a ,schedule b where a.id > 0 and a.vendorid = b.vendorid ");
    if (!(vendorname.equals("")))
      hql.append(" and a.vendorname like '%" + vendorname + "%' ");

    if (!(vendorid.equals("")))
      hql.append(" and a.vendorid = '" + vendorid + "' ");

    if (!(filed.equals("")))
      hql.append(" and a.field like '%" + filed + "%' ");

    if (!(cat.equals("")))
      hql.append(" and a.cat like '%" + cat + "%' ");

    hql.append(" and b.vendordate between '" + startdate + "' and '" + enddate + "' order by vendorid,vendordate  ");
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        vendor = new Vendor();
        vendor.setVendorid(this.rs.getString("vendorid"));
        vendor.setVendor_name(this.rs.getString("vendorname"));
        vendor.setRemark(this.rs.getString("capacity"));
        vendor.setRemark(this.rs.getString("vendordate"));
        list.add(vendor);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }

  public List FindVendorIdandName(String vendorid, String vendorname, String filed, String cat, String startdate, String enddate)
  {
    Vendor vendor = null;
    List list = new ArrayList();

    StringBuffer hql = new StringBuffer();
    hql.append("select distinct distinct a.vendorid,a.vendorname from vendor a ,schedule b where a.id > 0 and a.vendorid = b.vendorid ");
    if (!(vendorname.equals("")))
      hql.append(" and a.vendorname like '%" + vendorname + "%' ");

    if (!(vendorid.equals("")))
      hql.append(" and a.vendorid = '" + vendorid + "' ");

    if (!(filed.equals("")))
      hql.append(" and a.field like '%" + filed + "%' ");

    if (!(cat.equals("")))
      hql.append(" and a.cat like '%" + cat + "%' ");

    hql.append(" and b.vendordate between '" + startdate + "' and '" + enddate + "' order by vendordate  ");
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        vendor = new Vendor();
        vendor.setVendorid(this.rs.getString("vendorid"));
        vendor.setVendor_name(this.rs.getString("vendorname"));
        list.add(vendor);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }

  public Boolean FindVendorByName(String vendorid)
  {
    StringBuffer hql = new StringBuffer();
    hql.append("select * from vendor  where  vendorid = '" + vendorid + "'");
    System.out.println(hql.toString());
    try
    {
      Boolean localBoolean;
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      return Boolean.valueOf(this.rs.next());
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      closeAll(this.conn, this.pstmt, this.rs);
    }
    return Boolean.valueOf(false);
  }

  public Boolean FindUserByName(String username)
  {
    StringBuffer hql = new StringBuffer();
    hql.append("select * from user  where  username = '" + username + "'");
    try
    {
      Boolean localBoolean;
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      return Boolean.valueOf(this.rs.next());
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      closeAll(this.conn, this.pstmt, this.rs);
    }
    return Boolean.valueOf(false);
  }

  public String getVendorId(String vendorname)
  {
    StringBuffer hql = new StringBuffer();
    String vendorid = "notfound";
    hql.append("select vendorid from vendor  where  vendor_name = '" + vendorname + "' ");
    System.out.println("select vendorid from vendor  where  vendor_name = '" + vendorname + "' ");
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        vendorid = this.rs.getString("vendorid");

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return vendorid;
  }

  public String FindDalityCapacityByVendorName(String vendorid)
  {
    String dalitycapacity = "";
    StringBuffer hql = new StringBuffer();
    String sql = "select dailycapacity from vendor  where yxbz='Y' and vendorid = '" + vendorid + "' ";
    hql.append(sql);
    System.out.println(sql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        if ((this.rs.getString("dailycapacity") == null) || (this.rs.getString("dailycapacity") == "") || (this.rs.getString("dailycapacity").equals("")))
          dalitycapacity = "0";

        dalitycapacity = this.rs.getString("dailycapacity");
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return dalitycapacity;
  }

  public Vendor selectVendorByName(String vendor_name)
  {
    Vendor vendor = null;
    StringBuffer hql = new StringBuffer();
    hql.append("select *  from vendor  where  vendor_name = '" + vendor_name + "' ");
    System.out.println(hql.toString());
    try
    {
      Vendor localVendor1;
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next()) {
      vendor = new Vendor();
      vendor.setVendorid(this.rs.getString("vendorid"));
      vendor.setVendor_name(this.rs.getString("vendor_name"));
      if (this.rs.getString("vendorid") == null)
        vendor.setVendorid("nofound");
      else
        vendor.setNewword(this.rs.getString("newword"));

      if (this.rs.getString("newword") == null)
        vendor.setNewword("0");
      else
        vendor.setNewword(this.rs.getString("newword"));

      return vendor;
    }
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      closeAll(this.conn, this.pstmt, this.rs); } label285: closeAll(this.conn, this.pstmt, this.rs);

    closeAll(this.conn, this.pstmt, this.rs);

    return null;
  }

  public List FindVendorName(String Languagebegin, String Languageend, String vendorid, String averagescore, String rate, String field, String cat)
  {
    String[] str;
    StringBuffer hql = new StringBuffer();
    hql.append("select vendor_name from vendor b where 1 = 1 ");
    if (!(vendorid.equals("")))
      hql.append(" and b.vendorid = '" + vendorid + "'");

    if (!(Languagebegin.equals("")))
      hql.append(" and b.Languagebegin like '%" + Languagebegin + "%'");

    if (!(Languageend.equals("")))
      hql.append(" and b.Languageend like '%" + Languageend + "%'");

    if (!(averagescore.equals("")))
      hql.append(" and b.vendorid in ( select vendorid from (SELECT a.vendorid,AVG(a.sdlqualityindicator) sdlqualityindicator FROM qa a group by a.vendorid) e  where e.sdlqualityindicator > " + averagescore + ")");

    if (!(rate.equals("")))
      hql.append(" and b.newword < " + rate);

    String fg = "";
    if (!(field.equals("")))
    {
      str = field.split(",");
      hql.append(" and ( ");
      for (int i = 0; i < str.length; ++i)
      {
        if (i > 0)
          fg = " or ";

        hql.append(fg + " b.vendor_field  like  '%" + str[i] + "%'");
      }
      hql.append(" ) ");
    }
    fg = "";
    if (!(cat.equals("")))
    {
      str = cat.split(",");
      hql.append(" and ( ");
      for (int i = 0; i < str.length; ++i)
      {
        if (i > 0)
          fg = " or ";

        hql.append(fg + " b.vendor_cat  like  '%" + str[i] + "%'");
      }
      hql.append(" ) ");
    }
    hql.append(" order by b.vendor_name ");

    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        this.cities.add(this.rs.getString(1));

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return this.cities;
  }

  public void updateVendorDalicityCapacity(String vendorid, String dailycapacity)
    throws Exception
  {
    StringBuffer hql = new StringBuffer();
    System.out.println("update schedule a set a.capacity = '" + dailycapacity + "',a.sparecapacity = " + dailycapacity + "-a.bookedcapacity  where a.vendorid = '" + vendorid + "' and mrbz = 'Y' ");
    hql.append("update schedule a set a.capacity = '" + dailycapacity + "',a.sparecapacity = " + dailycapacity + "-a.bookedcapacity  where a.vendorid = '" + vendorid + "' and mrbz = 'Y' ");
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      int i = this.pstmt.executeUpdate();
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
  }

  public void deleteDistrution(String systemcode)
    throws Exception
  {
    StringBuffer hql = new StringBuffer();
    String sql = "update distribution a set a.yxbz = 'N' where a.systemcode = '" + systemcode + "'";
    System.out.println(sql);
    hql.append(sql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      int i = this.pstmt.executeUpdate();
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
  }

  public String checkUserName(String username, String password)
    throws Exception
  {
    String ifcz = "bcs";
    String sql = "select username from user a where a.username='" + username + "' and a.password = '" + password + "'";
    System.out.println(sql);
    this.conn = getConn();
    this.pstmt = this.conn.prepareStatement(sql);
    this.pstmt.execute();
    this.rs = this.pstmt.executeQuery();
    if (this.rs.next())
    {
      ifcz = "cz";
      return ifcz;
    }
    return ifcz;
  }

  public String checkVendorName(String vendorid, String vendorpassword)
    throws Exception
  {
    String ifcz = "bcs";
    String sql = "select vendorid from vendor a where a.vendorid='" + vendorid + "' and a.vendorpassword = '" + vendorpassword + "'";
    System.out.println(sql);
    this.conn = getConn();
    this.pstmt = this.conn.prepareStatement(sql);
    this.pstmt.execute();
    this.rs = this.pstmt.executeQuery();
    if (this.rs.next())
    {
      ifcz = "cz";
      return ifcz;
    }
    return ifcz;
  }

  public String updateVendorPassword(String vendorid, String vendorpassword, String newpassword)
    throws Exception
  {
    StringBuffer hql = new StringBuffer();
    String sql = "update vendor a set a.vendorpassword ='" + newpassword + "' where a.vendorpassword = '" + vendorpassword + "' and a.vendorid='" + vendorid + "'";
    System.out.println(sql);
    hql.append(sql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      int i = this.pstmt.executeUpdate();
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return "updatesuccess";
  }

  public String updateUserPassword(String username, String password, String newpassword)
    throws Exception
  {
    StringBuffer hql = new StringBuffer();
    String sql = "update user a set a.password ='" + newpassword + "' where a.username = '" + username + "' and a.password='" + password + "'";
    System.out.println(sql);
    hql.append(sql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      int i = this.pstmt.executeUpdate();
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return "updatesuccess";
  }

  public String fintdCostCode(String costcode)
  {
    String clientname = "bucunzai2017";
    StringBuffer hql = new StringBuffer();
    hql.append("select clientname  from costcode  where  costcode = '" + costcode + "'");
    System.out.println(hql.toString());
    try
    {
      String str1;
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        clientname = this.rs.getString("clientname");

      return clientname;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      closeAll(this.conn, this.pstmt, this.rs);
    }
    return "bucunzai2017";
  }

  public String fintdTranslator(String translatorname)
  {
    String translator = "bucunzai2017";
    StringBuffer hql = new StringBuffer();
    hql.append("select translatorname  from translator  where  translatorname = '" + translatorname + "'");
    System.out.println(hql.toString());
    try
    {
      String str1;
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        translator = this.rs.getString("translatorname");

      return translator;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      closeAll(this.conn, this.pstmt, this.rs);
    }
    return "bucunzai2017";
  }

  public String getSpareCapacity(String vendorid, String startdate, String enddate)
  {
    StringBuffer hql = new StringBuffer();
    String sparecapacity = "";
    hql.append("select group_concat(C.sparecapacity) sparecapacity  from ( select sparecapacity   from schedule   where  vendorid = '" + vendorid + "' and  vendordate >= '" + startdate + "' and  vendordate <= '" + enddate + "'   order by vendordate ) C  ");
    System.out.println(hql.toString());
    try
    {
      String str1;
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        sparecapacity = this.rs.getString("sparecapacity");

      return sparecapacity;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      closeAll(this.conn, this.pstmt, this.rs);
    }
    return "";
  }

  public String getAvgScore(String vendorid) throws ParseException
  {
    StringBuffer hql = new StringBuffer();
    Calendar cal = Calendar.getInstance();
    String startdate = (cal.get(1) - 1 + cal.get(2) + 1) + "-01";
    String enddate = (cal.get(1) + cal.get(2) + 1) + "-01";
    String lastyear = cal.get(1) - 1+"";
    String month = cal.get(2) + 1+"";;

    if (cal.get(2) + 1 < 10)
      month = "0" + month;

    String currentyear = cal.get(1)+"";;

    List listmonth = new ArrayList();
    Date d1 = new SimpleDateFormat("yyyy-MM").parse(lastyear + "-" + month);
    Date d2 = new SimpleDateFormat("yyyy-MM").parse(currentyear + "-" + month);
    Calendar dd = Calendar.getInstance();
    dd.setTime(d1);
    while (dd.getTime().before(d2)) {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
      String str = sdf.format(dd.getTime());
      listmonth.add(str);
      dd.add(2, 1);
    }
    String avgscore = "";
    List list = new ArrayList();
    Qa qa = null;
    hql.append("select DATE_FORMAT(qadate,'%y%m') months,AVG(sdlqualityindicator) sdlqualityindicator from qa where vendorid = '" + vendorid + "' and  vendordate >= '" + startdate + "' and  vendordate < '" + enddate + "'  group by months");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next()) {
        qa = new Qa();
        qa.setQadate(this.rs.getString("months"));
        qa.setSdlqualityindicator(this.rs.getString("sdlqualityindicator"));
        list.add(qa);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }

    Qa qa_new = new Qa();
    List list_qa = null;
    String avgscore00 = "0"; String avgscore01 = "0"; String avgscore02 = "0"; String avgscore03 = "0"; String avgscore04 = "0"; String avgscore05 = "0"; String avgscore06 = "0"; String avgscore07 = "0";
    String avgscore08 = "0"; String avgscore09 = "0"; String avgscore10 = "0"; String avgscore11 = "0";
    for (int i = 0; i < list.size(); ++i) {
      qa_new = (Qa)list.get(i);
      if (qa_new.equals(listmonth.get(0)))
      {
        avgscore00 = qa_new.getSdlqualityindicator();
      }
      if (qa_new.equals(listmonth.get(1)))
      {
        avgscore01 = qa_new.getSdlqualityindicator();
      }
      if (qa_new.equals(listmonth.get(2)))
      {
        avgscore02 = qa_new.getSdlqualityindicator();
      }
      if (qa_new.equals(listmonth.get(3)))
      {
        avgscore03 = qa_new.getSdlqualityindicator();
      }

      if (qa_new.equals(listmonth.get(4)))
      {
        avgscore04 = qa_new.getSdlqualityindicator();
      }

      if (qa_new.equals(listmonth.get(5)))
      {
        avgscore05 = qa_new.getSdlqualityindicator();
      }

      if (qa_new.equals(listmonth.get(6)))
      {
        avgscore06 = qa_new.getSdlqualityindicator();
      }
      if (qa_new.equals(listmonth.get(7)))
      {
        avgscore07 = qa_new.getSdlqualityindicator();
      }

      if (qa_new.equals(listmonth.get(10)))
      {
        avgscore10 = qa_new.getSdlqualityindicator();
      }

      if (qa_new.equals(listmonth.get(11)))
      {
        avgscore11 = qa_new.getSdlqualityindicator();
      }

    }

    return avgscore00 + "," + avgscore01 + "," + avgscore02 + "," + avgscore03 + "," + avgscore04 + "," + avgscore05 + 
      "," + avgscore06 + "," + avgscore07 + "," + avgscore08 + "," + avgscore09 + "," + avgscore10 + "," + avgscore11;
  }
}