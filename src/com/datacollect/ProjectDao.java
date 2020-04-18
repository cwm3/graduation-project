package com.datacollect;

import com.productsystem.model.Project;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProjectDao extends BaseDao
{
  Connection conn = null;
  ResultSet rs = null;
  PreparedStatement pstmt = null;
  List cities = new ArrayList();

  public String getSystemNumber()
  {
    StringBuffer hql = new StringBuffer();
    String systemnumber = "notfound";
    hql.append(" select  max(a.systemnumber) systemnumber from project a where lrrq = CURDATE()  ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        systemnumber = this.rs.getString("systemnumber");

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    if (systemnumber == null)
      systemnumber = "0";

    return systemnumber;
  }

  public Project loadprojectinfo(String systemcode, String workstyle)
  {
    Project project = new Project();
    StringBuffer hql = new StringBuffer();
    String hourlywork = "0";
    String newwords = "0";
    String postediting = "0";
    String rate1 = "0";
    String rate2 = "0";
    String rate3 = "0";
    String rate4 = "0";

    String hourlywork_distri = "0";
    String newwords_distri = "0";
    String postediting_distri = "0";
    String rate1_distri = "0";
    String rate2_distri = "0";
    String rate3_distri = "0";
    String rate4_distri = "0";
    if (systemcode.equals("")){
      systemcode = "''";
    }
    String sfyqbwf = "";
    String[] systemcode_all = systemcode.replace("'", "").split(",");
    
    for (int i = 0; i < systemcode_all.length; ++i)
    {
      String systemcodecoed = systemcode_all[i];
      if (!(workstyle.equals("hourlywork")))
        sfyqbwf = checkSystemCode(systemcodecoed, workstyle);

      if (sfyqbwf.equals("Y"))
      {
        project.setYxbz("YWF");
        project.setSystemcode(systemcodecoed);
        return project;
      }
    }
    
    String projectdate = getProjectDate(systemcode_all[0]);
    if(!projectdate.equals(",")){
    	String projectdateall[]=projectdate.split(",");
    	project.setDropdate(projectdateall[0]);
    	project.setDeadline(projectdateall[1]);
    }
    
    
    hql.append(" select b.hourlywork,c.hourlywork_distri,b.newwords,c.newwords_distri,c.postediting_distri,b.postediting ,c.rate1_distri,b.rate1,c.rate2_distri,b.rate2,c.rate3_distri,b.rate3 ,c.rate4_distri,b.rate4  from  ( SELECT  sum(a.hourlywork) hourlywork, sum(a.newwords) newwords,sum(a.postediting) postediting,sum(a.rate1) rate1,sum(rate2) rate2,sum(rate3) rate3,sum(rate4) rate4 FROM project A WHERE a.systemcode in (" + systemcode + ") and A.yxbz='Y' ) B ,( SELECT sum(a.hourlywork) hourlywork_distri,  sum(a.newwords) newwords_distri ,sum(a.postediting) postediting_distri,sum(a.rate1) rate1_distri ,sum(a.rate2) rate2_distri ,sum(a.rate3) rate3_distri ,sum(a.rate4) rate4_distri FROM Distribution a WHERE a.worktype = '" + workstyle + "' and  A.yxbz='Y' and a.systemcode in (" + systemcode + ")) C");

    System.out.println(hql.toString());
    try
    {
      Project localProject1;
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      if (!(this.rs.next()))

      project = new Project();
      project.setSystemcode(systemcode);
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

      if ((this.rs.getString("hourlywork_distri") == null) || (this.rs.getString("hourlywork_distri").equals("")))
        hourlywork_distri = "0";
      else
        hourlywork_distri = this.rs.getString("hourlywork_distri");

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

      if ((this.rs.getString("hourlywork") == null) || (this.rs.getString("hourlywork").equals("")))
        hourlywork = "0";
      else
        hourlywork = this.rs.getString("hourlywork");

      project.setHourlywork(Float.parseFloat(hourlywork) - Float.parseFloat(hourlywork_distri)+"");
      project.setNewwords(Float.parseFloat(newwords) - Float.parseFloat(newwords_distri)+"");
      project.setPostediting(Float.parseFloat(postediting) - Float.parseFloat(postediting_distri)+"");
      project.setRate1(Float.parseFloat(rate1) - Float.parseFloat(rate1_distri)+"");
      project.setRate2(Float.parseFloat(rate2) - Float.parseFloat(rate2_distri)+"");
      project.setRate3(Float.parseFloat(rate3) - Float.parseFloat(rate3_distri)+"");
      project.setRate4(Float.parseFloat(rate4) - Float.parseFloat(rate4_distri)+"");

      project.setSystemcode(systemcode);
      project.setYxbz("WWF");
      return project;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      closeAll(this.conn, this.pstmt, this.rs); } label1308: closeAll(this.conn, this.pstmt, this.rs);

    closeAll(this.conn, this.pstmt, this.rs);

    return null;
  }
  
  
  public String getProjectDate(String systemcode)
  {
    StringBuffer hql = new StringBuffer();
    String dropdate = "";
    String deadline = "";
    String sql = "select dropdate,deadline from project  where  systemcode = '" + systemcode + "' ";
    hql.append(sql);
    System.out.println(sql);
		try {
			this.conn = getConn();
			this.pstmt = this.conn.prepareStatement(hql.toString());
			this.rs = this.pstmt.executeQuery();
			while (this.rs.next()){
				dropdate = this.rs.getString("dropdate");
			    deadline = this.rs.getString("deadline");
			}
			    return dropdate+","+deadline;
		} catch (Exception e) {
			e.printStackTrace();

			closeAll(this.conn, this.pstmt, this.rs);
		} finally {
			closeAll(this.conn, this.pstmt, this.rs);
		}
		return "";
  }
  
  
  
  

  public String checkSystemCode(String systemcode, String workstyle)
  {
    String sfqbwf = "";
    Project project = null;
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
    StringBuffer hql = new StringBuffer();
    hql.append(" select b.newwords,c.newwords_distri,c.postediting_distri,b.postediting ,c.rate1_distri,b.rate1,c.rate2_distri,b.rate2,c.rate3_distri,b.rate3 ,c.rate4_distri,b.rate4  from  ( SELECT sum(a.newwords) newwords,sum(a.postediting) postediting,sum(a.rate1) rate1,sum(rate2) rate2,sum(rate3) rate3,sum(rate4) rate4 FROM project A WHERE a.systemcode = '" + systemcode + "' and A.yxbz='Y' ) B ,(select sum(a.newwords) newwords_distri ,sum(a.postediting) postediting_distri,sum(a.rate1) rate1_distri ,sum(a.rate2) rate2_distri ,sum(a.rate3) rate3_distri ,sum(a.rate4) rate4_distri FROM Distribution a WHERE a.worktype = '" + workstyle + "' and  A.yxbz='Y' and a.systemcode = '" + systemcode + "') C");
    System.out.println(hql.toString());
    try
    {
      String str1;
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();

      project = new Project();
      if (!(this.rs.next()))
         
      project.setSystemcode(systemcode);
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

      Float newwords_sy = Float.valueOf(Float.parseFloat(newwords) - Float.parseFloat(newwords_distri));
      Float postediting_sy = Float.valueOf(Float.parseFloat(postediting) - Float.parseFloat(postediting_distri));
      Float rate1_sy = Float.valueOf(Float.parseFloat(rate1) - Float.parseFloat(rate1_distri));
      Float rate2_sy = Float.valueOf(Float.parseFloat(rate2) - Float.parseFloat(rate2_distri));
      Float rate3_sy = Float.valueOf(Float.parseFloat(rate3) - Float.parseFloat(rate3_distri));
      Float rate4_sy = Float.valueOf(Float.parseFloat(rate4) - Float.parseFloat(rate4_distri));
      if ((((newwords_sy.floatValue() == 0F) ? 1 : 0) & ((postediting_sy.floatValue() == 0F) ? 1 : 0) & ((rate1_sy.floatValue() == 0F) ? 1 : 0) & ((rate2_sy.floatValue() == 0F) ? 1 : 0) & ((rate3_sy.floatValue() == 0F) ? 1 : 0) & ((rate4_sy.floatValue() == 0F) ? 1 : 0)) != 0)
        sfqbwf = "Y";
      else
        sfqbwf = "N";

      return sfqbwf;
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      closeAll(this.conn, this.pstmt, this.rs); } label1093: closeAll(this.conn, this.pstmt, this.rs);

    closeAll(this.conn, this.pstmt, this.rs);

    return sfqbwf;
  }

  public String checkProject(String systemcode)
  {
    StringBuffer hql = new StringBuffer();
    String distri = "0";
    String totalwords = "0";
    String sysl = "1";

    String hourlywork = "0";

    hql.append(" select sum(C.totalwords) distri,sum(C.hourlywork) distri_hourlywork,b.totalwords, b.hourlywork from  ( SELECT * FROM project A WHERE A.systemcode='" + systemcode + "' and A.yxbz='Y' ) B ");
    hql.append(" left join ( select * from distribution a where a.yxbz='y' ) c  on  b.systemcode = c.systemcode ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        distri = this.rs.getString("distri");
        totalwords = this.rs.getString("totalwords");
        hourlywork = this.rs.getString("hourlywork");
        if ((hourlywork == null) || (hourlywork.equals("")))
          hourlywork = "0";

        if ((distri == null) || (distri.equals("")))
          distri = "0";

        if ((totalwords == null) || (totalwords.equals("")))
          totalwords = "0";
      }

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    if (Float.parseFloat(hourlywork) < 0.000000099999999999999995D)
      if (Float.parseFloat(distri) < Float.parseFloat(totalwords) * 2F)
        sysl = "1";
      else
        sysl = "0";


    return sysl;
  }

  public String checkprojectdistribution(String systemcode)
  {
    StringBuffer hql = new StringBuffer();
    String sfwf = "mwf";
    hql.append(" select 1  from distribution a  where a.systemcode='" + systemcode + "' and A.yxbz='Y' ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      if (this.rs.next())
         sfwf = "ywf";
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return sfwf;
  }

  public String dropName(String systemcode)
  {
    StringBuffer hql = new StringBuffer();
    String dropname = "";
    hql.append(" select dropname  from project a  where a.systemcode='" + systemcode + "' and a.yxbz='Y' ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        dropname = this.rs.getString("dropname");

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return dropname;
  }
}