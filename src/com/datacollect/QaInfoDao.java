package com.datacollect;

import com.productsystem.model.Qa;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class QaInfoDao extends BaseDao
{
  Connection conn = null;
  ResultSet rs = null;
  PreparedStatement pstmt = null;
  
  public List loadzhexiantu(String vendorname, String clientname, String evaluatorname, String lead, String costcode, String translationtype, String targetlanguage, String sourcelanguage, int startyear, int startmonth, int endyear, int endmonth, String lmorgl,String filed,String method) {
	  System.out.println(method);
	  if(method.equals("Vendor Name")){
		  return  loadqaByMonth(vendorname,clientname,evaluatorname,lead,costcode,translationtype,targetlanguage,sourcelanguage,startyear,startmonth,endyear,endmonth,lmorgl,filed);
	  } else if(method.equals("Client Name")){
		  return  loadqaByClentName(vendorname,clientname,evaluatorname,lead,costcode,translationtype,targetlanguage,sourcelanguage,startyear,startmonth,endyear,endmonth,lmorgl,filed);
	  } else if(method.equals("Lead Name")){
		  return  loadqaByLeadName(vendorname,clientname,evaluatorname,lead,costcode,translationtype,targetlanguage,sourcelanguage,startyear,startmonth,endyear,endmonth,lmorgl,filed);
	  } else if(method.equals("Field")){
		  return  loadqaByField(vendorname,clientname,evaluatorname,lead,costcode,translationtype,targetlanguage,sourcelanguage,startyear,startmonth,endyear,endmonth,lmorgl,filed);
	  } 
	  return null;
  }
  

  public List loadqaByMonth(String vendorname, String clientname, String evaluatorname, String lead, String costcode, String translationtype, String targetlanguage, String sourcelanguage, int startyear, int startmonth, int endyear, int endmonth, String lmorgl,String filed)
  {
    Qa qa = null;
    List list = new ArrayList();
    int j = 0;

    StringBuffer hql = new StringBuffer();
    String starttmonth = "";
    String enddmonth = "";
    if (startmonth < 10) {
      starttmonth = "0" + startmonth;
    }else {
      starttmonth = startmonth+"";
    }
    if (endmonth < 10) {
      enddmonth = "0" + endmonth;
    }else {
      enddmonth = endmonth+"";
    }
    hql.append("select c.vendorid,c.vendorname,group_concat(c.month) month,group_concat(c.score1) score  from (select a.*,DATE_FORMAT(qadate,'%Y-%m') month,AVG(sdlqualityindicator) score1   from qa a  where DATE_FORMAT(qadate,'%Y-%m') >= '" + startyear + "-" + starttmonth + "' and DATE_FORMAT(qadate,'%Y-%m') <= '" + endyear + "-" + enddmonth + "' and yxbz='Y' ");
   
    if (!(lead.equals(""))){
        hql.append(" and  lead = '" + lead + "'");
    }
    
    hql.append(" group by month,vendorid,vendorname order by month) c where 1 = 1 ");
    
    if (!(vendorname.equals("")))
      hql.append(" and c.vendorname = '" + vendorname + "'");

    if (!(clientname.equals("")))
      hql.append(" and c.clientname  like  '%" + clientname + "%'");

    if (!(costcode.equals("")))
      hql.append(" and c.sdlcostcode  like  '%" + costcode + "%'");

    if (!(lead.equals("")))
      hql.append(" and c.lead = '" + lead + "'");

    if (!(evaluatorname.equals("")))
      hql.append(" and c.evaluatorname = '" + evaluatorname + "'");

    if (!(translationtype.equals("")))
      hql.append(" and c.translationtype='" + translationtype + "'");

    if (!(targetlanguage.equals("")))
      hql.append(" and c.targetlanguage = '" + targetlanguage + "'");

    if (!(sourcelanguage.equals("")))
      hql.append(" and c.sourcelanguage = '" + sourcelanguage + "'");

    if (!(lmorgl.equals("")))
      hql.append(" and c.lmorgl = '" + lmorgl + "'");
    
    if (!(filed.equals(""))) {
        hql.append(" and c.sector = '" + filed + "'");
      }
     

    hql.append(" group by c.vendorid,c.vendorname; ");
    
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        qa = new Qa();
        qa.setVendorid(this.rs.getString("vendorid"));
        qa.setVendorname(this.rs.getString("vendorname"));
        String month = this.rs.getString("month");
        String score = this.rs.getString("score");
        String[] month_str = month.split(",");
        String[] score_str = score.split(",");
        DecimalFormat df = new DecimalFormat("0.0");
        for(int i=0;i<score_str.length;i++){
        	
        	double x =  Double.valueOf(score_str[i]).doubleValue();
        	if(x<=0){
        	   x=0;
        	}
        	score_str[i] = df.format(x);       	
        }

        String qascore = "";

        List listmonth = new ArrayList();
        
        int endendmonth = endmonth + 1;

        Date d1 = new SimpleDateFormat("yyyy-MM").parse(startyear + "-" + startmonth);
        Date d2 = new SimpleDateFormat("yyyy-MM").parse(endyear + "-" + endendmonth);
        Calendar dd = Calendar.getInstance();
        dd.setTime(d1);
        while (dd.getTime().before(d2))
        {
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
          String str = sdf.format(dd.getTime());
          listmonth.add(str);
          dd.add(2, 1);
        }
        String[] aveg_aveg = new String[listmonth.size()];
        for (j = 0; j < listmonth.size(); ++j)
          aveg_aveg[j] = "0";

        String avgscore = "";
        for (int h = 0; h < listmonth.size(); ++h)
          for (int i = 0; i < month_str.length; ++i)
            if (month_str[i].equals(listmonth.get(h)))
              aveg_aveg[h] = score_str[i];



        for (int l = 0; l < listmonth.size() - 1; ++l)
          qascore = qascore + aveg_aveg[l] + ",";

        qascore = qascore + aveg_aveg[(listmonth.size() - 1)];
        
        qa.setScore(qascore);
        list.add(qa);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }
  
  
  
  public List loadqaByClentName(String vendorname, String clientname, String evaluatorname, String lead, String costcode, String translationtype, String targetlanguage, String sourcelanguage, int startyear, int startmonth, int endyear, int endmonth, String lmorgl,String filed)
  {
    Qa qa = null;
    List list = new ArrayList();
    int j = 0;

    StringBuffer hql = new StringBuffer();
    String starttmonth = "";
    int enddmonth = 0;
    String startdate="";
    String enddate="";

    if (startmonth < 10) {
        starttmonth = "0" + startmonth;
      }else {
        starttmonth = startmonth+"";
      }
      
      startdate=startyear+"-"+starttmonth+"-01";

      
      if(endmonth < 9) {
    	  
            enddate=endyear+"-0"+endmonth+1+"-01";

      }else {
          if(endmonth==12){
             enddate=endyear+1+"-01-01";
        }else {
        	enddmonth=endmonth+1;
            enddate=endyear+"-"+enddmonth+"-01";
        }
       }

    hql.append("select a.clientname,a.sdlcostcode,group_concat(a.month) month,group_concat(a.score1) score  from ( select b.clientname,substring(b.sdlcostcode,1,3) sdlcostcode ,DATE_FORMAT(b.qadate,'%Y-%m') month,AVG(b.sdlqualityindicator) score1 from  (select c.* from qa c where 1 = 1 and c.clientname != ''  ");
    if (!(vendorname.equals("")))
      hql.append(" and c.vendorname = '" + vendorname + "'");

    if (!(clientname.equals("")))
      hql.append(" and c.clientname  like  '%" + clientname + "%'");

    if (!(costcode.equals("")))
      hql.append(" and c.sdlcostcode  like  '%" + costcode + "%'");

    if (!(lead.equals("")))
      hql.append(" and c.lead = '" + lead + "'");

    if (!(evaluatorname.equals("")))
      hql.append(" and c.evaluatorname = '" + evaluatorname + "'");

    if (!(translationtype.equals("")))
      hql.append(" and c.translationtype='" + translationtype + "'");

    if (!(targetlanguage.equals("")))
      hql.append(" and c.targetlanguage = '" + targetlanguage + "'");

    if (!(sourcelanguage.equals(""))) {
      hql.append(" and c.sourcelanguage = '" + sourcelanguage + "'");
    }
    if (!(lmorgl.equals(""))) {
       hql.append(" and c.lmorgl = '" + lmorgl + "'");
     }
    
    if (!(filed.equals(""))) {
        hql.append(" and c.sector = '" + filed + "'");
     }
     
    hql.append(" and c.qadate >= '" + startdate + "'");

    hql.append(" and c.qadate < '" + enddate + "'");
    
    hql.append(" ) b group by month,clientname,sdlcostcode order by month ");
    
    hql.append(" ) a  ");
    
    hql.append("  where  a.month != null or a.month != ''   group by a.sdlcostcode ");
    
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        qa = new Qa();
        if(this.rs.getString("month") !=null &  this.rs.getString("score") !=null ) {
        	 qa.setClientname(this.rs.getString("clientname"));
             qa.setSdlcostcode(this.rs.getString("sdlcostcode"));
             String month = this.rs.getString("month");
             String score = this.rs.getString("score");

             String[] month_str = month.split(",");
             String[] score_str = score.split(",");
             DecimalFormat df = new DecimalFormat("0.0");
             for(int i=0;i<score_str.length;i++){
             	
             	double x =  Double.valueOf(score_str[i]).doubleValue();
             	if(x<=0){
             	   x=0;
             	}
             	score_str[i] = df.format(x);       	
             }
             
             String qascore = "";

             List listmonth = new ArrayList();
             int endendmonth = endmonth + 1;

             Date d1 = new SimpleDateFormat("yyyy-MM").parse(startyear + "-" + startmonth);
             Date d2 = new SimpleDateFormat("yyyy-MM").parse(endyear + "-" + endendmonth);
             Calendar dd = Calendar.getInstance();
             dd.setTime(d1);
             while (dd.getTime().before(d2))
             {
               SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
               String str = sdf.format(dd.getTime());
               listmonth.add(str);
               dd.add(2, 1);
             }
             String[] aveg_aveg = new String[listmonth.size()];
             for (j = 0; j < listmonth.size(); ++j)
               aveg_aveg[j] = "0";

             String avgscore = "";
             for (int h = 0; h < listmonth.size(); ++h)
               for (int i = 0; i < month_str.length; ++i)
                 if (month_str[i].equals(listmonth.get(h)))
                   aveg_aveg[h] = score_str[i];

             for (int l = 0; l < listmonth.size() - 1; ++l)
               qascore = qascore + aveg_aveg[l] + ",";

             qascore = qascore + aveg_aveg[(listmonth.size() - 1)];
             qa.setScore(qascore);
             list.add(qa);
           }
        	
        }
       
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    
    return list;
  }
  
  
  public List loadqaByLeadName(String vendorname, String clientname, String evaluatorname, String lead, String costcode, String translationtype, String targetlanguage, String sourcelanguage, int startyear, int startmonth, int endyear, int endmonth, String lmorgl,String filed)
  {
    Qa qa = null;
    List list = new ArrayList();
    int j = 0;

    StringBuffer hql = new StringBuffer();
    String starttmonth = "";
    int enddmonth = 0;
    String startdate="";
    String enddate="";

    if (startmonth < 10) {
        starttmonth = "0" + startmonth;
      }else {
        starttmonth = startmonth+"";
      }
      
      startdate=startyear+"-"+starttmonth+"-01";

      
      if(endmonth < 9) {
      	    enddmonth=endmonth+1;
            enddate=endyear+"-0"+enddmonth+"-01";

      }else {
          if(endmonth==12){
             enddate=endyear+1+"-01-01";
        }else {
        	enddmonth=endmonth+1;
            enddate=endyear+"-"+enddmonth+"-01";
        }
       }
    hql.append("select a.lead,a.lmorgl,group_concat(a.month) month,group_concat(a.score1) score  from ( select b.lead,b.lmorgl,DATE_FORMAT(b.qadate,'%Y-%m') month,AVG(b.sdlqualityindicator) score1 from  (select c.* from qa c where 1 = 1 and  c.lead !=c.lmorgl ");
    if (!(vendorname.equals("")))
      hql.append(" and c.vendorname = '" + vendorname + "'");

    if (!(clientname.equals("")))
      hql.append(" and c.clientname  like  '%" + clientname + "%'");

    if (!(costcode.equals("")))
      hql.append(" and c.sdlcostcode  like  '%" + costcode + "%'");

    if (!(lead.equals("")))
      hql.append(" and c.lead = '" + lead + "'");

    if (!(evaluatorname.equals("")))
      hql.append(" and c.evaluatorname = '" + evaluatorname + "'");

    if (!(translationtype.equals("")))
      hql.append(" and c.translationtype='" + translationtype + "'");

    if (!(targetlanguage.equals("")))
      hql.append(" and c.targetlanguage = '" + targetlanguage + "'");

    if (!(sourcelanguage.equals(""))) {
      hql.append(" and c.sourcelanguage = '" + sourcelanguage + "'");
    }
    if (!(lmorgl.equals(""))) {
       hql.append(" and c.lmorgl = '" + lmorgl + "'");
     }
    
    if (!(filed.equals(""))) {
        hql.append(" and c.sector = '" + filed + "'");
    }
    
    hql.append(" and c.qadate >= '" + startdate + "'");

    hql.append(" and c.qadate < '" + enddate + "'");

     
    hql.append(" ) b group by month,lead,lmorgl order by month ");
    
    hql.append(" ) a  ");
    
    hql.append("  group by a.lead,a.lmorgl ");
    
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        qa = new Qa();
        if(this.rs.getString("month") !=null &  this.rs.getString("score") !=null ) {
        	 qa.setLead(this.rs.getString("lead"));
             qa.setLmorgl(this.rs.getString("lmorgl"));
             String month = this.rs.getString("month");
             String score = this.rs.getString("score");
             

             String[] month_str = month.split(",");
             String[] score_str = score.split(",");
             DecimalFormat df = new DecimalFormat("0.0");
             for(int i=0;i<score_str.length;i++){
             	
             	double x =  Double.valueOf(score_str[i]).doubleValue();
             	if(x<=0){
             	   x=0;
             	}
             	score_str[i] = df.format(x);       	
             }
             
             
             
             
             String qascore = "";

             List listmonth = new ArrayList();
             int endendmonth = endmonth + 1;

             Date d1 = new SimpleDateFormat("yyyy-MM").parse(startyear + "-" + startmonth);
             Date d2 = new SimpleDateFormat("yyyy-MM").parse(endyear + "-" + endendmonth);
             Calendar dd = Calendar.getInstance();
             dd.setTime(d1);
             while (dd.getTime().before(d2))
             {
               SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
               String str = sdf.format(dd.getTime());
               listmonth.add(str);
               dd.add(2, 1);
             }
             String[] aveg_aveg = new String[listmonth.size()];
             for (j = 0; j < listmonth.size(); ++j)
               aveg_aveg[j] = "0";

             String avgscore = "";
             for (int h = 0; h < listmonth.size(); ++h)
               for (int i = 0; i < month_str.length; ++i)
                 if (month_str[i].equals(listmonth.get(h)))
                   aveg_aveg[h] = score_str[i];

             for (int l = 0; l < listmonth.size() - 1; ++l)
               qascore = qascore + aveg_aveg[l] + ",";

             qascore = qascore + aveg_aveg[(listmonth.size() - 1)];
             qa.setScore(qascore);
             list.add(qa);
           }
        	
        }
       
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    
    return list;
  }
  
  public List loadqaByField(String vendorname, String clientname, String evaluatorname, String lead, String costcode, String translationtype, String targetlanguage, String sourcelanguage, int startyear, int startmonth, int endyear, int endmonth, String lmorgl,String filed)
  {
    Qa qa = null;
    List list = new ArrayList();
    int j = 0;

    StringBuffer hql = new StringBuffer();
    String starttmonth = "";
    int enddmonth = 0;
    String startdate="";
    String enddate="";

    if (startmonth < 10) {
        starttmonth = "0" + startmonth;
      }else {
        starttmonth = startmonth+"";
      }
      
      startdate=startyear+"-"+starttmonth+"-01";

      
      if(endmonth < 9) {
    	  
            enddate=endyear+"-0"+endmonth+1+"-01";

      }else {
          if(endmonth==12){
             enddate=endyear+1+"-01-01";
        }else {
        	enddmonth=endmonth+1;
            enddate=endyear+"-"+enddmonth+"-01";
        }
       }
      
    hql.append("select a.sector,group_concat(a.month) month,group_concat(a.score1) score  from ( select b.sector,DATE_FORMAT(b.qadate,'%Y-%m') month,AVG(b.sdlqualityindicator) score1 from  (select c.* from qa c where 1 = 1  ");
    
    if (!(vendorname.equals("")))
      hql.append(" and c.vendorname = '" + vendorname + "'");

    if (!(clientname.equals("")))
      hql.append(" and c.clientname  like  '%" + clientname + "%'");

    if (!(costcode.equals("")))
      hql.append(" and c.sdlcostcode  like  '%" + costcode + "%'");

    if (!(lead.equals("")))
      hql.append(" and c.lead = '" + lead + "'");

    if (!(evaluatorname.equals("")))
      hql.append(" and c.evaluatorname = '" + evaluatorname + "'");

    if (!(translationtype.equals("")))
      hql.append(" and c.translationtype='" + translationtype + "'");

    if (!(targetlanguage.equals("")))
      hql.append(" and c.targetlanguage = '" + targetlanguage + "'");

    if (!(sourcelanguage.equals(""))) {
      hql.append(" and c.sourcelanguage = '" + sourcelanguage + "'");
    }
    if (!(lmorgl.equals(""))) {
       hql.append(" and c.lmorgl = '" + lmorgl + "'");
     }
    
    if (!(filed.equals(""))) {
        hql.append(" and c.sector = '" + filed + "'");
      }
    
    hql.append(" and c.qadate >= '" + startdate + "'");

    hql.append(" and c.qadate < '" + enddate + "'");

     
    hql.append(" ) b group by month,sector order by month ");
    
    hql.append(" ) a  ");
    
    hql.append("  group by a.sector ");
    
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        qa = new Qa();
        if(this.rs.getString("month") !=null &  this.rs.getString("score") !=null ) {
        	 qa.setSector(this.rs.getString("sector"));
             String month = this.rs.getString("month");
             String score = this.rs.getString("score");

             String[] month_str = month.split(",");
             String[] score_str = score.split(",");
             DecimalFormat df = new DecimalFormat("0.0");
             for(int i=0;i<score_str.length;i++){
             	
             	double x =  Double.valueOf(score_str[i]).doubleValue();
             	if(x<=0){
             	   x=0;
             	}
             	score_str[i] = df.format(x);       	
             }
             
             
             String qascore = "";

             List listmonth = new ArrayList();
             int endendmonth = endmonth + 1;

             Date d1 = new SimpleDateFormat("yyyy-MM").parse(startyear + "-" + startmonth);
             Date d2 = new SimpleDateFormat("yyyy-MM").parse(endyear + "-" + endendmonth);
             Calendar dd = Calendar.getInstance();
             dd.setTime(d1);
             while (dd.getTime().before(d2))
             {
               SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
               String str = sdf.format(dd.getTime());
               listmonth.add(str);
               dd.add(2, 1);
             }
             String[] aveg_aveg = new String[listmonth.size()];
             for (j = 0; j < listmonth.size(); ++j)
               aveg_aveg[j] = "0";

             String avgscore = "";
             for (int h = 0; h < listmonth.size(); ++h)
               for (int i = 0; i < month_str.length; ++i)
                 if (month_str[i].equals(listmonth.get(h)))
                   aveg_aveg[h] = score_str[i];

             for (int l = 0; l < listmonth.size() - 1; ++l)
               qascore = qascore + aveg_aveg[l] + ",";

             qascore = qascore + aveg_aveg[(listmonth.size() - 1)];
             qa.setScore(qascore);
             list.add(qa);
           }
        	
        }
       
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    
    return list;
  }
  
  
  

  public List loadVendorName() {
    List list = new ArrayList();
    StringBuffer hql = new StringBuffer();
    hql.append("select vendor_name from vendor where yxbz='Y' ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next()) {
        list.add(this.rs.getString("vendor_name"));
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }

  public String VendorAvergeScore(String vendorid)
  {
    String avergescore = "0";
    StringBuffer hql = new StringBuffer();
    hql.append("SELECT FORMAT(AVG(aa.sdlqualityindicator),1) sdlqualityindicator FROM qa aa where aa.vendorid ='" + vendorid + "' and aa.yxbz='Y' and aa.qadate BETWEEN   SUBDATE(CURDATE(),INTERVAL 6  month)  AND  CURDATE() ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        avergescore = this.rs.getString("sdlqualityindicator");
        if (avergescore == null)
          avergescore = "";
      }

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return avergescore;
  }

  public Qa listQaEvaluation(String vendorid, String month)
  {
    Qa qa = null;
    List list = new ArrayList();
    StringBuffer hql = new StringBuffer();
    hql.append(" Select DATE_FORMAT(qadate,'%Y-%m') month,sum(wrongminor) wrongminor,sum(wrongweighted) wrongweighted,sum(wrongserious) wrongserious,sum(wrongpoints) wrongpoints,sum(wrongcategory) wrongcategory ");
    hql.append(" ,sum(structuralnminor) structuralnminor,sum(structuralweighted) structuralweighted,sum(structuralserious) structuralserious,sum(structuralpoints) structuralpoints,sum(structuralcategory) structuralcategory ");

    hql.append(" ,sum(omissionminor) omissionminor,sum(omissionweighted) omissionweighted,sum(omissionserious) omissionserious,sum(omissionpoints) omissionpoints,sum(omissioncategory) omissioncategory ");

    hql.append(" ,sum(misspellingminor) misspellingminor,sum(misspellingweighted) misspellingweighted,sum(misspellingserious) misspellingserious,sum(misspellingpoints) misspellingpoints,sum(misspellingcategory) misspellingcategory ");
    hql.append(" ,sum(punctuationminor) punctuationminor,sum(punctuationweighted) punctuationweighted,sum(punctuationserious) punctuationserious,sum(punctuationpoints) punctuationpoints,sum(punctuationcategory) punctuationcategory ");
    hql.append(" ,sum(styleminor) styleminor,sum(styleweighted) styleweighted,sum(styleserious) styleserious,sum(stylepoints) stylepoints,sum(stylecategory) stylecategory ");
    hql.append(" ,sum(miscellaneousminor) miscellaneousminor,sum(miscellaneousweighted) miscellaneousweighted,sum(miscellaneousserious) miscellaneousserious,sum(miscellaneouspoints) miscellaneouspoints,sum(miscellaneouscategory) miscellaneouscategory ");
    hql.append(" ,sum(meaningminor) meaningminor,sum(meaningweighted) meaningweighted,sum(meaningserious) meaningserious,sum(meaningpoints) meaningpoints,sum(meaningcategory) meaningcategory ");
    hql.append(" ,sum(misspellingcategory) misspellingcategory,sum(misspellingminor) misspellingminor,sum(misspellingpoints) misspellingpoints,sum(misspellingserious) misspellingserious,sum(misspellingweighted) misspellingweighted ");

    hql.append(" from qa   where DATE_FORMAT(qadate,'%Y-%m')='" + month + "'  and vendorid='" + vendorid + "' group by MONTH ");
    hql.append(" order by month ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        qa = new Qa();

        qa.setWrongminor(this.rs.getString("wrongminor"));
        qa.setWrongweighted(this.rs.getString("wrongweighted"));
        qa.setWrongcategory(this.rs.getString("wrongcategory"));
        qa.setWrongpoints(this.rs.getString("wrongpoints"));
        qa.setWrongserious(this.rs.getString("wrongserious"));

        qa.setStructuralcategory(this.rs.getString("structuralcategory"));
        qa.setStructuralnminor(this.rs.getString("structuralnminor"));
        qa.setStructuralserious(this.rs.getString("structuralserious"));
        qa.setStructuralweighted(this.rs.getString("structuralweighted"));
        qa.setStructuralpoints(this.rs.getString("structuralpoints"));

        qa.setOmissioncategory(this.rs.getString("omissioncategory"));
        qa.setOmissionminor(this.rs.getString("omissionminor"));
        qa.setOmissionpoints(this.rs.getString("omissionpoints"));
        qa.setOmissionserious(this.rs.getString("omissionserious"));
        qa.setOmissionweighted(this.rs.getString("omissionweighted"));

        qa.setMisspellingcategory(this.rs.getString("misspellingcategory"));
        qa.setMisspellingminor(this.rs.getString("misspellingminor"));
        qa.setMisspellingpoints(this.rs.getString("misspellingpoints"));
        qa.setMisspellingserious(this.rs.getString("misspellingserious"));
        qa.setMisspellingweighted(this.rs.getString("misspellingweighted"));

        qa.setMiscellaneouscategory(this.rs.getString("miscellaneouscategory"));
        qa.setMiscellaneousminor(this.rs.getString("miscellaneousminor"));
        qa.setMiscellaneouspoints(this.rs.getString("miscellaneouspoints"));
        qa.setMiscellaneousserious(this.rs.getString("miscellaneousserious"));
        qa.setMiscellaneousweighted(this.rs.getString("miscellaneousweighted"));

        qa.setMeaningcategory(this.rs.getString("meaningcategory"));
        qa.setMeaningminor(this.rs.getString("meaningminor"));
        qa.setMeaningpoints(this.rs.getString("meaningpoints"));
        qa.setMeaningserious(this.rs.getString("meaningserious"));
        qa.setMeaningweighted(this.rs.getString("meaningweighted"));

        qa.setPunctuationcategory(this.rs.getString("punctuationcategory"));
        qa.setPunctuationminor(this.rs.getString("punctuationminor"));
        qa.setPunctuationpoints(this.rs.getString("punctuationpoints"));
        qa.setPunctuationserious(this.rs.getString("punctuationserious"));
        qa.setPunctuationweighted(this.rs.getString("punctuationweighted"));

        qa.setStylecategory(this.rs.getString("stylecategory"));
        qa.setStyleminor(this.rs.getString("styleminor"));
        qa.setStylepoints(this.rs.getString("stylepoints"));
        qa.setStyleserious(this.rs.getString("styleserious"));
        qa.setStyleweighted(this.rs.getString("styleweighted"));

        qa.setMeaningcategory(this.rs.getString("meaningcategory"));
        qa.setMeaningminor(this.rs.getString("meaningminor"));
        qa.setMeaningpoints(this.rs.getString("meaningpoints"));
        qa.setMeaningserious(this.rs.getString("meaningserious"));
        qa.setMeaningweighted(this.rs.getString("meaningweighted"));
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return qa;
  }
  
  
  public Qa listQaClientName(String startdate, String enddate, String vendorid, String clientname, String lead, String field)
  {
    Qa qa = null;
    List list = new ArrayList();
    StringBuffer hql = new StringBuffer();
    if(clientname!=null) {
    	clientname=clientname.replace("20180101", "&");
    }    
    
    hql.append(" Select sum(wrongminor) wrongminor,sum(wrongweighted) wrongweighted,sum(wrongserious) wrongserious,sum(wrongpoints) wrongpoints,sum(wrongcategory) wrongcategory,sum(wrongcritical) wrongcritical ");
    hql.append(" ,sum(structuralnminor) structuralnminor,sum(structuralweighted) structuralweighted,sum(structuralserious) structuralserious,sum(structuralpoints) structuralpoints,sum(structuralcategory) structuralcategory,sum(structuralcategory) structuralcritical "); 
    hql.append(" ,sum(omissionminor) omissionminor,sum(omissionweighted) omissionweighted,sum(omissionserious) omissionserious,sum(omissionpoints) omissionpoints,sum(omissioncategory) omissioncategory,sum(omissioncritical) omissioncritical ");

    hql.append(" ,sum(misspellingminor) misspellingminor,sum(misspellingweighted) misspellingweighted,sum(misspellingserious) misspellingserious,sum(misspellingpoints) misspellingpoints,sum(misspellingcategory) misspellingcategory,sum(miscellaneouscritical) miscellaneouscritical ");
    hql.append(" ,sum(punctuationminor) punctuationminor,sum(punctuationweighted) punctuationweighted,sum(punctuationserious) punctuationserious,sum(punctuationpoints) punctuationpoints,sum(punctuationcategory) punctuationcategory ,sum(punctuationcategory) punctuationcategory ,sum(punctuationcritical) punctuationcritical "); 
    hql.append(" ,sum(styleminor) styleminor,sum(styleweighted) styleweighted,sum(styleserious) styleserious,sum(stylepoints) stylepoints,sum(stylecategory) stylecategory,sum(stylecritical) stylecritical "); 
    hql.append(" ,sum(miscellaneousminor) miscellaneousminor,sum(miscellaneousweighted) miscellaneousweighted,sum(miscellaneousserious) miscellaneousserious,sum(miscellaneouspoints) miscellaneouspoints,sum(miscellaneouscategory) miscellaneouscategory,sum(miscellaneouscritical) miscellaneouscritical ");
    hql.append(" ,sum(meaningminor) meaningminor,sum(meaningweighted) meaningweighted,sum(meaningserious) meaningserious,sum(meaningpoints) meaningpoints,sum(meaningcategory) meaningcategory,sum(meaningcategory) meaningcategory,sum(meaningcritical) meaningcritical ");
    hql.append(" ,sum(misspellingcategory) misspellingcategory,sum(misspellingminor) misspellingminor,sum(misspellingpoints) misspellingpoints,sum(misspellingserious) misspellingserious,sum(misspellingweighted) misspellingweighted,sum(misspellingcritical) misspellingcritical  ");

    hql.append(" from qa   where qadate >='" + startdate + "'  and qadate < '" + enddate + "' ");
    
    if(!vendorid.equals("")) {
        hql.append(" and vendorid ='"+vendorid+"'");    	
    }
    
    if(!clientname.equals("")) {
        hql.append(" and clientname ='"+clientname+"'");    	
    }
    
    if(!lead.equals("")) {
        hql.append(" and lead ='"+lead+"'");    	
    }
    
    if(!field.equals("")) {
        hql.append(" and sector ='"+field+"'");    	
    }

    
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        qa = new Qa();

        qa.setWrongminor(this.rs.getString("wrongminor"));
        qa.setWrongweighted(this.rs.getString("wrongweighted"));
        qa.setWrongcategory(this.rs.getString("wrongcategory"));
        qa.setWrongpoints(this.rs.getString("wrongpoints"));
        if(this.rs.getString("wrongcritical")==null){
        	 qa.setWrongcritical("0");
        }else{
            qa.setWrongcritical(this.rs.getString("wrongcritical"));
        }
        qa.setWrongserious(this.rs.getString("wrongserious"));
        
        

        qa.setStructuralcategory(this.rs.getString("structuralcategory"));
        qa.setStructuralnminor(this.rs.getString("structuralnminor"));
        qa.setStructuralserious(this.rs.getString("structuralserious"));
        qa.setStructuralweighted(this.rs.getString("structuralweighted"));
        qa.setStructuralpoints(this.rs.getString("structuralpoints"));
        if(this.rs.getString("structuralcritical")==null){
       	 qa.setStructuralcritical("0");
       }else{
           qa.setStructuralcritical(this.rs.getString("structuralcritical"));
       }
        
        

        qa.setOmissioncategory(this.rs.getString("omissioncategory"));
        qa.setOmissionminor(this.rs.getString("omissionminor"));
        qa.setOmissionpoints(this.rs.getString("omissionpoints"));
        qa.setOmissionserious(this.rs.getString("omissionserious"));
        qa.setOmissionweighted(this.rs.getString("omissionweighted"));
        qa.setOmissioncritical(this.rs.getString("omissioncritical"));
        if(this.rs.getString("omissioncritical")==null){
          	 qa.setOmissioncritical("0");
          }else{
              qa.setOmissioncritical(this.rs.getString("omissioncritical"));
          }
           

        qa.setMisspellingcategory(this.rs.getString("misspellingcategory"));
        qa.setMisspellingminor(this.rs.getString("misspellingminor"));
        qa.setMisspellingpoints(this.rs.getString("misspellingpoints"));
        qa.setMisspellingserious(this.rs.getString("misspellingserious"));
        qa.setMisspellingweighted(this.rs.getString("misspellingweighted"));
        if(this.rs.getString("misspellingcritical")==null){
         	 qa.setMisspellingcritical("0");
         }else{
             qa.setMisspellingcritical(this.rs.getString("misspellingcritical"));
         }
          
        
        

        qa.setMiscellaneouscategory(this.rs.getString("miscellaneouscategory"));
        qa.setMiscellaneousminor(this.rs.getString("miscellaneousminor"));
        qa.setMiscellaneouspoints(this.rs.getString("miscellaneouspoints"));
        qa.setMiscellaneousserious(this.rs.getString("miscellaneousserious"));
        qa.setMiscellaneousweighted(this.rs.getString("miscellaneousweighted"));

        if(this.rs.getString("miscellaneouscritical")==null){
        	 qa.setMiscellaneouscritical("0");
        }else{
            qa.setMiscellaneouscritical(this.rs.getString("miscellaneouscritical"));
        }
         
        

        qa.setMeaningcategory(this.rs.getString("meaningcategory"));
        qa.setMeaningminor(this.rs.getString("meaningminor"));
        qa.setMeaningpoints(this.rs.getString("meaningpoints"));
        qa.setMeaningserious(this.rs.getString("meaningserious"));
        qa.setMeaningweighted(this.rs.getString("meaningweighted"));

        
        if(this.rs.getString("meaningcritical")==null){
       	 qa.setMeaningcritical("0");
       }else{
           qa.setMeaningcritical(this.rs.getString("meaningcritical"));
       }
        
       
        

        qa.setPunctuationcategory(this.rs.getString("punctuationcategory"));
        qa.setPunctuationminor(this.rs.getString("punctuationminor"));
        qa.setPunctuationpoints(this.rs.getString("punctuationpoints"));
        qa.setPunctuationserious(this.rs.getString("punctuationserious"));
        qa.setPunctuationweighted(this.rs.getString("punctuationweighted"));

        if(this.rs.getString("punctuationcritical")==null){
          	 qa.setPunctuationcritical("0");
         }else{
              qa.setPunctuationcritical(this.rs.getString("punctuationcritical"));
        }
           
        
        qa.setStylecategory(this.rs.getString("stylecategory"));
        qa.setStyleminor(this.rs.getString("styleminor"));
        qa.setStylepoints(this.rs.getString("stylepoints"));
        qa.setStyleserious(this.rs.getString("styleserious"));
        qa.setStyleweighted(this.rs.getString("styleweighted"));

        
        if(this.rs.getString("stylecritical")==null){
         	 qa.setStylecritical("0");
        }else{
             qa.setStylecritical(this.rs.getString("stylecritical"));
       }
          
      
        qa.setMeaningcategory(this.rs.getString("meaningcategory"));
        qa.setMeaningminor(this.rs.getString("meaningminor"));
        qa.setMeaningpoints(this.rs.getString("meaningpoints"));
        qa.setMeaningserious(this.rs.getString("meaningserious"));

        if(this.rs.getString("meaningweighted")==null){
        	 qa.setMeaningweighted("0");
       }else{
            qa.setMeaningweighted(this.rs.getString("meaningweighted"));
       }
         
        
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return qa;
  }

  

  public String caluteClientName(String costcode)
  {
    StringBuffer hql = new StringBuffer();
    String clientname = "notfound";
    String sql = "select clientname from costcode  where  costcode = '" + costcode + "' ";
    hql.append(sql);
    System.out.println(sql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        clientname = this.rs.getString("clientname");

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return clientname;
  }
  
  public String checkFile(String filename)
  {
    StringBuffer hql = new StringBuffer();
    String filefilename = "false";
    String sql = "select filefilename from qa  where  filefilename = '" + filename + "' ";
    hql.append(sql);
    System.out.println(sql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
    	  filefilename ="true";
    }
    catch (Exception e)
    {
      e.printStackTrace();
      closeAll(this.conn, this.pstmt, this.rs); } 
       finally { 
    	   closeAll(this.conn, this.pstmt, this.rs);
    }
    return filefilename;
  }
  
  
  
  

  public String caluteSdlbusinessunit(String code_sdlbusinessunit)
  {
    StringBuffer hql = new StringBuffer();
    String sdlbusinessunit = "notfound";
    String sql = "select sdlbusinessunit from dm_sdlbusinessunit  where  sdlbusinessunitpex = '" + code_sdlbusinessunit + "' ";
    hql.append(sql);
    System.out.println(sql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        sdlbusinessunit = this.rs.getString("sdlbusinessunit");

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return sdlbusinessunit;
  }
}