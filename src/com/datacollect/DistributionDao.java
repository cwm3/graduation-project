package com.datacollect;

import com.productsystem.model.Distribution;
import com.productsystem.model.Project;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DistributionDao extends BaseDao
{
  Connection conn = null;
  ResultSet rs = null;
  PreparedStatement pstmt = null;
  
  
  public String checkifqbwf(String systemcode)
  {
    StringBuffer hql = new StringBuffer();
    String work1 = "";
    String work2 = "";
    hql.append(" select  ifnull(b.hourlywork,0)-ifnull(c.hourlywork_distri,0) work1, 2*ifnull(b.newwords,0)-ifnull(c.newwords_distri,0)+2*ifnull(b.postediting,0)-ifnull(c.postediting_distri,0)+2*ifnull(b.rate1,0)-ifnull(c.rate1_distri,0)+2*ifnull(b.rate2,0)-ifnull(c.rate2_distri,0)+2*ifnull(b.rate3,0)-ifnull(c.rate3_distri,0) work2  from  ( select  sum(a.hourlywork) hourlywork, sum(a.newwords) newwords,sum(a.postediting) postediting,sum(a.rate1) rate1,sum(rate2) rate2,sum(rate3) rate3 from project a where a.systemcode = '"+ systemcode
			+ "' and a.yxbz='Y' ) b ,( select sum(a.hourlywork) hourlywork_distri,  sum(a.newwords) newwords_distri ,sum(a.postediting) postediting_distri,sum(a.rate1) rate1_distri ,sum(a.rate2) rate2_distri ,sum(a.rate3) rate3_distri  from distribution a where   a.yxbz='Y' and a.systemcode ='"+ systemcode + "') c");
	System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
       
        if ((this.rs.getString("work1") != null) & (! this.rs.getString("work1").equals(""))) {
        	work1 =this.rs.getString("work1");
        } 
        
        if ((this.rs.getString("work2") != null) & (! this.rs.getString("work2").equals(""))) {
        	work2 =this.rs.getString("work2");
       } 
      }
    
      if(Float.valueOf(work2)>0){
          return "wqbwf";
      }
           
      if(Float.valueOf(work1)>0){
          return "wqbwf";
      }
   
      
      return "yqbwf";

    }
    catch (Exception e)
    {
        e.printStackTrace();
        closeAll(this.conn, this.pstmt, this.rs);
      } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
       return "yqbwf";
  }
  
  public String checkifqbwfbyrew(String systemcode)
  {
    StringBuffer hql = new StringBuffer();
    String work = "";
    hql.append(" select ifnull(a.rate4,0)-ifnull(sum(b.rate4),0) work from project a,distribution b  ");
    hql.append(" where a.systemcode = b.systemcode and b.worktype = 'review' ");
    hql.append(" and a.systemcode ='"+ systemcode + "' ");
	System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
       
        if ((this.rs.getString("work") != null) & (! this.rs.getString("work").equals(""))) {
        	work =this.rs.getString("work");
        } 
      }
    
      if(Float.valueOf(work)>0){
          return "wqbwf";
      }
      return "yqbwf";
    }
    catch (Exception e)
    {
        e.printStackTrace();
        closeAll(this.conn, this.pstmt, this.rs);
      } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
       return "yqbwf";
  }
  
  
  
  

  public Project FindProject(String systemcode, String worktype)
  {
    Project project_all = FindProjectCapacity(systemcode);
    Project project_distribution = FindProjectDistribution(systemcode, worktype);
    Project project_sy = new Project();
    if (Float.parseFloat(project_all.getHourlywork()) <= Float.parseFloat(project_distribution.getHourlywork())) {
      project_sy.setHourlywork("0");
    }
    else {
      project_sy.setHourlywork(Float.parseFloat(project_all.getHourlywork()) - Float.parseFloat(project_distribution.getHourlywork())+"");
      project_sy.setNewwords(Float.parseFloat(project_all.getNewwords()) - Float.parseFloat(project_distribution.getNewwords())+"");
      project_sy.setPostediting(Float.parseFloat(project_all.getPostediting()) - Float.parseFloat(project_distribution.getPostediting())+"");
      project_sy.setRate1(Float.parseFloat(project_all.getRate1()) - Float.parseFloat(project_distribution.getRate1())+"");
      project_sy.setRate2(Float.parseFloat(project_all.getRate2()) - Float.parseFloat(project_distribution.getRate2())+"");
      project_sy.setRate3(Float.parseFloat(project_all.getRate3()) - Float.parseFloat(project_distribution.getRate3())+"");
      project_sy.setRate4(Float.parseFloat(project_all.getRate4()) - Float.parseFloat(project_distribution.getRate4())+"");
      project_sy.setTotalwords(Float.parseFloat(project_all.getTotalwords()) - Float.parseFloat(project_distribution.getTotalwords())+"");
    }
    return project_sy;
  }

  public Project FindProjectCapacity(String systemcode)
  {
    StringBuffer hql = new StringBuffer();
    Project project = null;
    hql.append(" select *  from project a where a.systemcode =" + systemcode + " and a.yxbz='Y'");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        project = new Project();
        String rate1 = "";
        String rate2 = "";
        String rate3 = "";
        String rate4 = "";
        String newwords = "";
        String postediting = "";
        String totalwords = "";
        String hourlywork = "";
        if ((this.rs.getString("rate1") == null) || (this.rs.getString("rate1").equals("")))
          rate1 = "0";
        else
          rate1 = this.rs.getString("rate1");

        project.setRate1(rate1);
        if ((this.rs.getString("rate2") == null) || (this.rs.getString("rate2").equals("")))
          rate2 = "0";
        else
          rate2 = this.rs.getString("rate2");

        project.setRate2(rate2);
        if ((this.rs.getString("rate3") == null) || (this.rs.getString("rate3").equals("")))
          rate3 = "0";
        else
          rate3 = this.rs.getString("rate3");

        project.setRate3(rate3);
        if ((this.rs.getString("rate4") == null) || (this.rs.getString("rate4").equals("")))
          rate4 = "0";
        else
          rate4 = this.rs.getString("rate4");

        project.setRate4(rate4);
        if ((this.rs.getString("newwords") == null) || (this.rs.getString("newwords").equals("")))
          newwords = "0";
        else
          newwords = this.rs.getString("newwords");

        project.setNewwords(newwords);
        if ((this.rs.getString("postediting") == null) || (this.rs.getString("postediting").equals("")))
          postediting = "0";
        else
          postediting = this.rs.getString("postediting");

        project.setPostediting(postediting);
        if ((this.rs.getString("hourlywork") == null) || (this.rs.getString("hourlywork").equals("")))
          hourlywork = "0";
        else
          hourlywork = this.rs.getString("hourlywork");

        project.setHourlywork(hourlywork);
        if ((this.rs.getString("totalwords") == null) || (this.rs.getString("totalwords").equals("")))
          totalwords = "0";
        else
          totalwords = this.rs.getString("totalwords");

        project.setTotalwords(totalwords);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return project;
  }

  public Project FindProjectDistribution(String systemcode, String worktype)
  {
    StringBuffer hql = new StringBuffer();
    Project project = new Project();
    project.setRate1("0");
    project.setRate2("0");
    project.setRate3("0");
    project.setRate4("0");
    project.setNewwords("0");
    project.setPostediting("0");
    project.setHourlywork("0");
    project.setTotalwords("0");
    hql.append("SELECT sum(a.hourlywork) hourlywork,  sum(a.newwords) newwords ,sum(a.postediting) postediting,sum(a.rate1) rate1 ,sum(a.rate2) rate2 ,sum(a.rate3) rate3 ,sum(a.rate4) rate4,sum(a.totalwords) totalwords FROM Distribution a WHERE a.worktype = '" + worktype + "' and  A.yxbz='Y' and a.systemcode = " + systemcode);
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        String rate1 = "";
        String rate2 = "";
        String rate3 = "";
        String rate4 = "";
        String newwords = "";
        String postediting = "";
        String totalwords = "";
        String hourlywork = "";
        if ((this.rs.getString("rate1") == null) || (this.rs.getString("rate1").equals("")))
          rate1 = "0";
        else
          rate1 = this.rs.getString("rate1");

        project.setRate1(rate1);
        if ((this.rs.getString("rate2") == null) || (this.rs.getString("rate2").equals("")))
          rate2 = "0";
        else
          rate2 = this.rs.getString("rate2");

        project.setRate2(rate2);
        if ((this.rs.getString("rate3") == null) || (this.rs.getString("rate3").equals("")))
          rate3 = "0";
        else
          rate3 = this.rs.getString("rate3");

        project.setRate3(rate3);
        if ((this.rs.getString("rate4") == null) || (this.rs.getString("rate4").equals("")))
          rate4 = "0";
        else
          rate4 = this.rs.getString("rate4");

        project.setRate4(rate4);
        if ((this.rs.getString("newwords") == null) || (this.rs.getString("newwords").equals("")))
          newwords = "0";
        else
          newwords = this.rs.getString("newwords");

        project.setNewwords(newwords);
        if ((this.rs.getString("postediting") == null) || (this.rs.getString("postediting").equals("")))
          postediting = "0";
        else
          postediting = this.rs.getString("postediting");

        project.setPostediting(postediting);
        if ((this.rs.getString("hourlywork") == null) || (this.rs.getString("hourlywork").equals("")))
          hourlywork = "0";
        else
          hourlywork = this.rs.getString("hourlywork");

        project.setHourlywork(hourlywork);
        if ((this.rs.getString("totalwords") == null) || (this.rs.getString("totalwords").equals("")))
          totalwords = "0";
        else
          totalwords = this.rs.getString("totalwords");

        project.setTotalwords(totalwords);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return project;
  }

  public void updateDistributionStatus(String id, String status, String systemcode) throws Exception {
    StringBuffer hql = new StringBuffer();
    hql.append("update distribution a set a.status = '" + status + "'  where a.id = " + id);
    System.out.println(hql.toString());
    try {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      int i = this.pstmt.executeUpdate();
      changePorjectStatus(systemcode);
    } catch (Exception e) {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs);

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
  }

  public void updateDistributionHo(String id, String ho) throws Exception {
    int i;
    StringBuffer hql = new StringBuffer();
    hql.append("update distribution a set a.ho = '" + ho + "'  where a.id = " + id);
    System.out.println(hql.toString());
    try {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      i = this.pstmt.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
      closeAll(this.conn, this.pstmt, this.rs);
       } finally { 
    	   closeAll(this.conn, this.pstmt, this.rs);
    }
  }

  public void changePorjectStatus(String systemcode) throws Exception
  {
    String sfwf = checkifqbwf(systemcode);//检测是否全部外发
    String ifwf_rew = checkifqbwfbyrew(systemcode);//检测rate4全部外发
    String sfqbjg=getAllDistributionStatus(systemcode);//外发的作业status 是否全部为 close
    
    if (sfwf.equals("yqbwf") & ifwf_rew.equals("yqbwf") & sfqbjg.equals("yqbjs")) {
      int i;
      StringBuffer hql = new StringBuffer();
      hql.append("update project a set a.status = 'close'  where a.systemcode = '" + systemcode + "'");
      System.out.println(hql.toString());
      try
      {
        this.conn = getConn();
        this.pstmt = this.conn.prepareStatement(hql.toString());
        i = this.pstmt.executeUpdate();
      }
      catch (Exception e)
      {
        e.printStackTrace();
      }
    }
  }
  

  public String getAllDistributionStatus(String systemcode) throws Exception {
    StringBuffer hql = new StringBuffer();
    hql.append(" select  *  from distribution a where  a.status = 'in process' and a.systemcode = '" + systemcode + "'");
    System.out.println(hql.toString());
    try
    {
      Boolean localBoolean;
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next()) {
          return "wqbjs";
      }

    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      closeAll(this.conn, this.pstmt, this.rs);
    }
    return "yqbjs";
  }
  

 

  public void updateDistribution(Distribution distribution) throws Exception
  {
    int i=0;
    StringBuffer hql = new StringBuffer();
    hql.append("update distribution a set a.projectvalue = '" + distribution.getProjectvalue() + "',a.dropname = '" + distribution.getDropname() + "',a.outsourcedponumber = '" + distribution.getOutsourcedponumber() + "' where a.pzxh = '" + distribution.getPzxh() + "'");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      i = this.pstmt.executeUpdate();
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); 
      
       } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
  }

  public String getDistributionStatus(String systemcode) throws Exception {
	  
    String ifwf = checkifqbwf(systemcode);
    if (ifwf.equals("wqbwf")) {
          return "wqbwf_red";
    }
    String ifwf_rew = checkifqbwfbyrew(systemcode);
    
    if (ifwf_rew.equals("wqbwf")) {
        return "wqbwf_red";
    }
    
    if (getDistributionN(systemcode)) {
           return "qbwf_yellow";
    }

    if (getDistributionY(systemcode)) {
         return "qbwf_green";
    }

       return "qbwf_nocolor";
  }

  public Boolean getDistributionN(String systemcode)
    throws Exception
  {
    StringBuffer hql = new StringBuffer();
    hql.append(" select ho  from distribution a where  a.ho = 'N' and a.systemcode = '" + systemcode + "'");
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

  public Boolean getDistributionY(String systemcode) throws Exception
  {
    StringBuffer hql = new StringBuffer();
    hql.append(" select ho  from distribution a where  a.ho = 'Y' and status = 'in process' and a.systemcode = '" + systemcode + "'");
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

  public Distribution getSyzy(String systemcode, String worktype) {
    StringBuffer hql = new StringBuffer();
    Distribution distribution = null;
    String newwords = "0";
    String postediting = "0";
    String rate1 = "0";
    String rate2 = "0";
    String rate3 = "0";
    String rate4 = "0";

    String newwords_distri = "0";
    String postediting_distri = "0";
    String rate1_distri = "0";
    String rate2_distri = "0";
    String rate3_distri = "0";
    String rate4_distri = "0";
    hql.append(" select b.newwords,c.newwords_distri,c.postediting_distri,b.postediting ,c.rate1_distri,b.rate1,c.rate2_distri,b.rate2,c.rate3_distri,b.rate3 ,c.rate4_distri,b.rate4  from  ( SELECT  sum(a.hourlywork) hourlywork, sum(a.newwords) newwords,sum(a.postediting) postediting,sum(a.rate1) rate1,sum(rate2) rate2,sum(rate3) rate3,sum(rate4) rate4 FROM project A WHERE a.systemcode in ('" + systemcode + "')  and A.yxbz='Y' ) B ,( SELECT sum(a.hourlywork) hourlywork_distri,  sum(a.newwords) newwords_distri ,sum(a.postediting) postediting_distri,sum(a.rate1) rate1_distri ,sum(a.rate2) rate2_distri ,sum(a.rate3) rate3_distri ,sum(a.rate4) rate4_distri FROM Distribution a WHERE A.yxbz='Y' and a.systemcode in ('" + systemcode + "') and a.worktype ='" + worktype + "' ) C");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        distribution = new Distribution();
        if ((this.rs.getString("newwords_distri") == null) || (this.rs.getString("newwords_distri").equals("")))
          newwords_distri = "0";
        else
          newwords_distri = this.rs.getString("newwords_distri");

        if ((this.rs.getString("postediting_distri") == null) || (this.rs.getString("postediting_distri").equals("")))
          postediting_distri = "0";
        else
          postediting_distri = this.rs.getString("postediting_distri");

        if ((this.rs.getString("rate1_distri") == null) || (this.rs.getString("rate1_distri").equals("")))
          rate1_distri = "0";
        else
          rate1_distri = this.rs.getString("rate1_distri");

        if ((this.rs.getString("rate2_distri") == null) || (this.rs.getString("rate2_distri").equals("")))
          rate2_distri = "0";
        else
          rate2_distri = this.rs.getString("rate2_distri");

        if ((this.rs.getString("rate3_distri") == null) || (this.rs.getString("rate3_distri").equals("")))
          rate3_distri = "0";
        else
          rate3_distri = this.rs.getString("rate3_distri");

        if ((this.rs.getString("rate4_distri") == null) || (this.rs.getString("rate4_distri").equals("")))
          rate4_distri = "0";
        else
          rate4_distri = this.rs.getString("rate4_distri");

        if ((this.rs.getString("newwords") == null) || (this.rs.getString("newwords").equals("")))
          newwords = "0";
        else
          newwords = this.rs.getString("newwords");

        if ((this.rs.getString("postediting") == null) || (this.rs.getString("postediting").equals("")))
          postediting = "0";
        else
          postediting = this.rs.getString("postediting");

        if ((this.rs.getString("rate1") == null) || (this.rs.getString("rate1").equals("")))
          rate1 = "0";
        else
          rate1 = this.rs.getString("rate1");

        if ((this.rs.getString("rate2") == null) || (this.rs.getString("rate2").equals("")))
          rate2 = "0";
        else
          rate2 = this.rs.getString("rate2");

        if ((this.rs.getString("rate3") == null) || (this.rs.getString("rate3").equals("")))
          rate3 = "0";
        else
          rate3 = this.rs.getString("rate3");

        if ((this.rs.getString("rate4") == null) || (this.rs.getString("rate4").equals("")))
          rate4 = "0";
        else
          rate4 = this.rs.getString("rate4");

        distribution.setNewwords(Float.parseFloat(newwords) - Float.parseFloat(newwords_distri)+"");
        distribution.setPostediting(Float.parseFloat(postediting) - Float.parseFloat(postediting_distri)+"");
        distribution.setRate1(Float.parseFloat(rate1) - Float.parseFloat(rate1_distri)+"");
        distribution.setRate2(Float.parseFloat(rate2) - Float.parseFloat(rate2_distri)+"");
        distribution.setRate3(Float.parseFloat(rate3) - Float.parseFloat(rate3_distri)+"");
        distribution.setRate4(Float.parseFloat(rate4) - Float.parseFloat(rate4_distri)+"");
      }
    }
    catch (Exception e)
    {
        e.printStackTrace();
        closeAll(this.conn, this.pstmt, this.rs); 
       } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return distribution;
  }
  

}