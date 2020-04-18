package com.datacollect;

import com.productsystem.model.Fileway;
import com.productsystem.model.ProjectExcle;
import com.productsystem.model.Qa;
import com.productsystem.model.Schedule;
import com.productsystem.model.Vendor;
import com.productsystem.model.VendorSchedule;
import com.productsystem.model.Vendor_Distribution_Mx;
import com.productsystem.service.ScheduleManager;

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
import java.util.UUID;

import javax.annotation.Resource;

public class VendorScheduleDao extends BaseDao
{
  Connection conn = null;
  ResultSet rs = null;
  PreparedStatement pstmt = null;
  Connection conn2 = null;
  PreparedStatement pstmt2 = null;
  ResultSet rs2 = null;


  
  public Schedule getSchedule() throws Exception {
	String hql = "";
	Schedule schedule = new Schedule();
		try {
			this.conn = getConn();
			this.pstmt = this.conn.prepareStatement(hql.toString());
			this.rs = this.pstmt.executeQuery();
			while (this.rs.next()) {
				String vendordate = this.rs.getString("vendordate");
				schedule.setVendordate(vendordate);
			}
		} catch (Exception e) {
			e.printStackTrace();
			closeAll(this.conn, this.pstmt, this.rs);
		} finally {
			closeAll(this.conn, this.pstmt, this.rs);
		}
		    return schedule;
	}
  
  
  

  public List FindByTiaojJian(String Languagebegin, String Languageend, String vendorid, String vendorname, String averagescore, String rate, String startdate, String enddate, String field, String cat) throws ParseException{
    String[] str;
    int i;
    VendorSchedule vendorschedule = null;
    List list = new ArrayList();

    SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
    Date dBegin = f.parse(startdate);
    Date dEnd = f.parse(enddate);
    List listDate = getDatesBetweenTwoDate(dBegin, dEnd);
    int sizwz = listDate.size();
    StringBuffer hql = new StringBuffer();
    hql.append("select b.vendorid,FORMAT((SELECT AVG(c.sdlqualityindicator) FROM qa c where c.vendorid = a.vendorid and c.qadate BETWEEN   SUBDATE(CURDATE(),INTERVAL 6 month)  AND  CURDATE()),1) sdlqualityindicator,b.vendor_name,group_concat(a.sparecapacity order by a.vendordate) sparecapacity from (select vendorid,sparecapacity,vendordate,vendorname from schedule a  where   a.yxbz='Y' ");
    hql.append(" and  a.vendordate >= '" + startdate + "' and  a.vendordate <= '" + enddate + "' and  EXISTS ( select 1  from schedule  sc where   sc.vendordate >= '" + startdate + "' and sc.vendordate <= '" + enddate + "' and sc.sparecapacity > 0  and a.vendorid = sc.vendorid ) order by vendordate ) a  , vendor b where a.vendorid =  b.vendorid  ");
    if (!(vendorid.equals("")))
      hql.append(" and b.vendorid = '" + vendorid + "'");

    String[] vendorall = vendorname.split(",");
    String vend_name = "";
    if (vendorall.length == 1)
      vend_name = "'" + vendorall[0] + "'";
    else
      for (int j = 0; j < vendorall.length; ++j)
      {
        if (j == 0)
          vend_name = "'" + vendorall[0] + "'";

        vend_name = vend_name + ",'" + vendorall[j] + "'";
      }

    if ((((vend_name.equals("")) ? 0 : 1) & ((vend_name.equals("''")) ? 0 : 1)) != 0)
      hql.append(" and b.vendor_name in (" + vend_name + ")");

    if (!(Languagebegin.equals("")))
      hql.append(" and b.Languagebegin like '%" + Languagebegin + "%'");

    if (!(Languageend.equals("")))
      hql.append(" and b.Languageend like '%" + Languageend + "%'");

    if (!(averagescore.equals("")))
      hql.append(" and b.vendorid in ( select vendorid from (SELECT a.vendorid,AVG(a.sdlqualityindicator) sdlqualityindicator FROM qa a  where a.qadate BETWEEN  SUBDATE(CURDATE(),INTERVAL 6 month)  AND  CURDATE() group by a.vendorid) e  where e.sdlqualityindicator > " + averagescore + ")");

    if (!(rate.equals("")))
      hql.append(" and b.newword < " + rate);

    String fg = "";
    if (!(field.equals("")))
    {
      str = field.split(",");
      hql.append(" and ( ");
      for (i = 0; i < str.length; ++i)
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
      for (i = 0; i < str.length; ++i)
      {
        if (i > 0)
          fg = " or ";

        hql.append(fg + " b.vendor_cat  like  '%" + str[i] + "%'");
      }
      hql.append(" ) ");
    }
    hql.append(" group by b.vendorid,b.vendor_name ");
    hql.append(" order by b.vendor_name ");

    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        vendorschedule = new VendorSchedule();
        vendorschedule.setVendorid(this.rs.getString("vendorid"));
        vendorschedule.setVendorname(this.rs.getString("vendor_name"));
        String averagescores = this.rs.getString("sdlqualityindicator");
        if (averagescores == null)
          averagescores = "";

        vendorschedule.setAveragescores(averagescores);
        String[] sparecapacity = this.rs.getString("sparecapacity").split(",");
        String[] sparecapacity_all = new String[listDate.size()];
        for (int j = 0; j < sparecapacity_all.length; ++j)
          if (j + 1 <= sparecapacity.length)
            sparecapacity_all[j] = sparecapacity[j];
          else
            sparecapacity_all[j] = "aaa";


        String sparecapacity_text = "";
        for (int j = 0; j < sparecapacity_all.length; ++j)
          if (j == 0)
            sparecapacity_text = sparecapacity_all[0];
          else
            sparecapacity_text = sparecapacity_text + "," + sparecapacity_all[j];


        vendorschedule.setSparecapacity(sparecapacity_text);
        list.add(vendorschedule);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }

  public List loadProjectExcel(String client, String costcode, String dropdate, String deadline, String lead, String remark2, String status, String yxbz, String potype, String userposition){
    VendorSchedule vendorschedule = null;
    List list = new ArrayList();
    StringBuffer hql = new StringBuffer();
    hql.append(" select a.lead lead_project,a.client client_project,a.comment comment_project,a.costcode costcode_project,a.deadline deadline_project,a.dropdate dropdate_project,a.dropname dropname_project,a.hourlywork hourlywork_project,a.imtchampion imtchampion_project,a.imtquality imtquality_project ,a.languagebegin languagebegin_project,a.Languageend Languageend_project,a.lmorgl lmorgl_project,a.newwords newwords_project,a.postediting postediting_project,a.rate1 rate1_project,a.rate2 rate2_project,a.rate3 rate3_project,a.rate4 rate4_project,a.receivedpovalue receivedpovalue_project,a.Status Status_project,a.systemcode systemcode_project,a.totalwords totalwords_project,b.vendorid,b.vendorname,b.systemcode,b.hourlywork,b.lead,b.newwords,b.postediting,b.projectvalue,b.rate1,b.rate2,b.rate3,b.rate4,b.startdate,b.enddate,b.outsourcedponumber,b.totalwords,b.worktype,b.coorespondingwords,b.status from project a left join Distribution b on  a.systemcode = b.systemcode  where 1=1 ");

    if (!(remark2.equals("")))
    {
      hql.append(" and a.lead like  '%" + remark2 + "%' ");
    }
    else if ((!(userposition.equals("departmentmanager"))) && (!(lead.equals("admin"))))
    {
      if ((userposition.equals("lead")) || (userposition.equals("lm/gl")))
        hql.append(" and a.lead = '" + lead + "' ");
      else
        hql.append(" and ( a.lead = '" + lead + "' or  a.lmorgl = '" + lead + "' ) ");
    }

    if (!(costcode.equals("")))
      hql.append(" and a.costcode like  '%" + costcode + "%'");

    if (!(dropdate.equals("")))
      hql.append(" and a.dropdate='" + dropdate + "'");

    if (!(deadline.equals("")))
      hql.append(" and a.deadline='" + deadline + "'");

    if (!(client.equals(""))) {
      hql.append(" and a.client like '%" + client + "%'");
    }

    if (!(status.equals(""))) {
      hql.append(" and a.status  in   ('" + status.replace(",", "','") + "')");
    }

    if (yxbz.equals("N"))
      hql.append(" and ( a.receivedpovalue is null  or  a.receivedpovalue ='' )");
    else if (yxbz.equals("Y")) {
      hql.append(" and a.receivedpovalue is not null  and a.receivedpovalue != '' ");
    }

    if (!(potype.equals(""))) {
      hql.append(" and a.potype = '" + potype + "'");
    }

    hql.append(" order by b.systemcode ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        ProjectExcle projectexcle = new ProjectExcle();

        projectexcle.setLead_project(this.rs.getString("lead_project"));
        projectexcle.setLmorgl_project(this.rs.getString("lmorgl_project"));
        projectexcle.setCostcode_project(this.rs.getString("costcode_project"));

        projectexcle.setImtchampion_project(this.rs.getString("imtchampion_project"));
        projectexcle.setImtquality_project(this.rs.getString("imtquality_project"));
        projectexcle.setComment_project(this.rs.getString("comment_project"));

        projectexcle.setStatus_project(this.rs.getString("status_project"));
        projectexcle.setDropname_project(this.rs.getString("dropname_project"));
        projectexcle.setSystemcode_project(this.rs.getString("systemcode_project"));
        projectexcle.setDropdate_project(this.rs.getString("dropdate_project"));
        projectexcle.setClient_project(this.rs.getString("client_project"));
        projectexcle.setDeadline_project(this.rs.getString("deadline_project"));
        projectexcle.setHourlywork_project(this.rs.getString("hourlywork_project"));
        projectexcle.setPostediting_project(this.rs.getString("postediting_project"));
        projectexcle.setnewwords_project(this.rs.getString("newwords_project"));
        projectexcle.setRate1_project(this.rs.getString("rate1_project"));
        projectexcle.setRate2_project(this.rs.getString("rate2_project"));
        projectexcle.setRate3_project(this.rs.getString("rate3_project"));
        projectexcle.setRate4_project(this.rs.getString("rate4_project"));
        projectexcle.setReceivedpovalue_project(this.rs.getString("receivedpovalue_project"));
        projectexcle.setTotalwords_project(this.rs.getString("totalwords_project"));
        projectexcle.setLanguagebegin_project(this.rs.getString("languagebegin_project"));
        projectexcle.setLanguageend_project(this.rs.getString("Languageend_project"));

        projectexcle.setVendorid(this.rs.getString("vendorid"));
        projectexcle.setVendorname(this.rs.getString("vendorname"));
        projectexcle.setSystemcode(this.rs.getString("systemcode"));
        projectexcle.setHourlywork(this.rs.getString("hourlywork"));
        projectexcle.setLead(this.rs.getString("lead"));
        projectexcle.setNewnew(this.rs.getString("newwords"));
        projectexcle.setSystemcode(this.rs.getString("systemcode"));
        projectexcle.setPostediting(this.rs.getString("postediting"));
        projectexcle.setProjectvalue(this.rs.getString("projectvalue"));
        projectexcle.setRate1(this.rs.getString("rate1"));
        projectexcle.setRate2(this.rs.getString("rate2"));
        projectexcle.setRate3(this.rs.getString("rate3"));
        projectexcle.setRate4(this.rs.getString("rate4"));
        projectexcle.setStartdate(this.rs.getString("startdate"));
        projectexcle.setEnddate(this.rs.getString("enddate"));
        projectexcle.setCoorespondingwords(this.rs.getString("coorespondingwords"));
        projectexcle.setOutsourcedponumber(this.rs.getString("outsourcedponumber"));
        projectexcle.setTotalwords(this.rs.getString("totalwords"));
        projectexcle.setWorktype(this.rs.getString("worktype"));
        projectexcle.setStatus(this.rs.getString("status"));
        list.add(projectexcle);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }

  public List loadQaExcel(String vendorname, String lead, String deadline, String sector, String evaluatorname, String translationtype, String sourcelanguage, String targetlanguage, String clientname, String startdate, String enddate, String lmorgl)
  {
    VendorSchedule vendorschedule = null;
    List list = new ArrayList();

    StringBuffer hql = new StringBuffer();
    hql.append("select *  from qa a  where 1 = 1 and vendorname is not null  ");
    if (!(vendorname.equals("")))
      hql.append(" and a.vendorname = '" + vendorname + "'");

    if (!(clientname.equals("")))
      hql.append(" and a.clientname = '" + clientname + "'");

    if (!(lead.equals("")))
      hql.append(" and a.lead = '" + lead + "'");

    if (!(lmorgl.equals("")))
      hql.append(" and a.lmorgl = '" + lmorgl + "'");

    if (!(evaluatorname.equals("")))
      hql.append(" and a.evaluatorname = '" + evaluatorname + "'");

    if (!(startdate.equals("")))
      hql.append(" and a.qadate >= '" + startdate + "'");

    if (!(enddate.equals("")))
      hql.append(" and a.qadate  <= '" + enddate + "'");

    if (!(sector.equals("")))
      hql.append(" and a.sector  = '" + sector + "'");

    if (!(translationtype.equals("")))
      hql.append(" and a.translationtype='" + translationtype + "'");

    if (!(targetlanguage.equals("")))
      hql.append(" and a.targetlanguage = '" + targetlanguage + "'");

    if (!(sourcelanguage.equals("")))
      hql.append(" and a.sourcelanguage = '" + sourcelanguage + "'");

    hql.append(" order by a.qadate ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        Qa qa = new Qa();
        qa.setSdlnetworkoffice(this.rs.getString("sdlnetworkoffice"));
        qa.setVendorname(this.rs.getString("vendorname"));
        qa.setLead(this.rs.getString("lead"));
        qa.setLmorgl(this.rs.getString("lmorgl"));
        qa.setLead(this.rs.getString("lead"));
        qa.setQadate(this.rs.getString("qadate"));
        qa.setClientname(this.rs.getString("clientname"));
        qa.setSdlcostcode(this.rs.getString("sdlcostcode"));
        qa.setSector(this.rs.getString("sector"));
        qa.setTranslationtype(this.rs.getString("translationtype"));
        qa.setTranslatorname(this.rs.getString("translatorname"));
        qa.setReviewername(this.rs.getString("reviewername"));
        qa.setEvaluatorname(this.rs.getString("evaluatorname"));
        qa.setWordcount(this.rs.getString("wordcount"));
        qa.setSdlqualityindicator_show(this.rs.getString("sdlqualityindicator_show"));
        qa.setSdlqualityindicator(this.rs.getString("sdlqualityindicator"));
        qa.setScore(this.rs.getString("score"));
        qa.setTargetlanguage(this.rs.getString("targetlanguage"));
        qa.setSourcelanguage(this.rs.getString("sourcelanguage"));
        qa.setFilefilename(this.rs.getString("filefilename"));

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

  public String checksparecapacity(String vendorid, String startdate, String enddate)
  {
    StringBuffer hql = new StringBuffer();
    StringBuffer hql_mx = new StringBuffer();

    String sparecapacity = "0";
    hql.append("select sum(a.sparecapacity) sparecapacity from schedule a,vendor b where a.vendorid = b.vendorid and a.vendorid = '" + vendorid + "' and a.yxbz= 'Y' and a.sparecapacity > 0  and  a.vendordate >=date'" + startdate + "' and a.vendordate <=date'" + enddate + "'");
    System.out.println("select sum(a.sparecapacity) sparecapacity from schedule a,vendor b where a.vendorid = b.vendorid and a.vendorid = '" + vendorid + "' and a.sparecapacity > 0  and  a.vendordate >=date'" + startdate + "' and a.vendordate <=date'" + enddate + "'");
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        sparecapacity = this.rs.getString("sparecapacity");

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return sparecapacity;
  }

  public String checksparecapacitybyupdate(String vendorid, String startdate, String enddate, String pzxh)
  {
    StringBuffer hql = new StringBuffer();
    StringBuffer hql_mx = new StringBuffer();

    String sparecapacity = "0";
    float capacity = 0F;
    hql.append("select sum(a.sparecapacity) sparecapacity from schedule a,vendor b where a.vendorid = b.vendorid and a.vendorid = '" + vendorid + "' and a.yxbz= 'Y' and a.sparecapacity > 0  and  a.vendordate >=date'" + startdate + "' and a.vendordate <=date'" + enddate + "'");
    System.out.println("select sum(a.sparecapacity) sparecapacity from schedule a,vendor b where a.vendorid = b.vendorid and a.vendorid = '" + vendorid + "' and a.sparecapacity > 0  and  a.vendordate >=date'" + startdate + "' and a.vendordate <=date'" + enddate + "'");
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        sparecapacity = this.rs.getString("sparecapacity");

      if (sparecapacity == null)
        sparecapacity = "0";

      String sparecapacity_mx = checkSpareCapactiy(pzxh, startdate, enddate);
      capacity = Float.parseFloat(sparecapacity) + Float.parseFloat(sparecapacity_mx);
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return String.valueOf(capacity);
  }

  public String checkSpareCapactiy(String pzxh, String startdate, String enddate)
    throws Exception
  {
    String bookedcapactiy = "0";
    String sql = "select sum(a.bookedcapactiy) bookedcapactiy  from vendor_distribution_mx a where a.pzxh  = '" + pzxh + "' and a.yxbz = 'Y' and  a.vendordate >=date'" + startdate + "' and a.vendordate <=date'" + enddate + "'";
    System.out.println(sql);
    this.conn = getConn();
    this.pstmt = this.conn.prepareStatement(sql);
    this.pstmt.execute();
    this.rs = this.pstmt.executeQuery();
    while (this.rs.next())
      bookedcapactiy = this.rs.getString("bookedcapactiy");

    return bookedcapactiy;
  }

  public void updateCapacitybydistribution(String vendorid, String vendorname, String capacity, String startdate, String enddate, String systemcode, String pzxh, String lead, String worktype, String hourlywork, String totalwords, String projectvalue, String outsourcedponumber)
    throws Exception
  {
    String capacity_zs = capacity;
    StringBuffer hql_select = new StringBuffer();

    String sparecapacity = "";
    String vendordate = "";
    String sql = " select a.sparecapacity,a.vendordate from schedule a where a.yxbz = 'Y' and  a.vendorid = '" + vendorid + "' and  vendordate >=date'" + startdate + "' and vendordate <=date'" + enddate + "' order by a.vendordate ";
    System.out.println(sql);
    hql_select.append(sql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql_select.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        sparecapacity = this.rs.getString("sparecapacity");
        vendordate = this.rs.getString("vendordate");
        if ((Float.parseFloat(sparecapacity) > 0F) || (vendordate.equals(enddate)))
          updateVendorCapacity(vendorid, vendorname, sparecapacity, vendordate, capacity_zs, systemcode, pzxh, lead, worktype, hourlywork, totalwords, enddate, projectvalue, outsourcedponumber);
        else
          sparecapacity = "0";

        float capacity_sy = 0F;
        if (Float.parseFloat(capacity_zs) >= Float.parseFloat(sparecapacity))
        {
          capacity_sy = Float.parseFloat(capacity_zs) - Float.parseFloat(sparecapacity);
          capacity_zs = String.valueOf(capacity_sy);
        }
        else
        {
          capacity_zs = "0";
        }
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
  }

  public void updateVendorCapacity(String vendorid, String vendorname, String sparecapacity, String vendordate, String capacity, String systemcode, String pzxh, String lead, String worktype, String hourlywork, String totalwords, String enddate, String projectvalue, String outsourcedponumber)
    throws Exception
  {
    String hql = "";
    if ((((Float.parseFloat(capacity) >= Float.parseFloat(sparecapacity)) ? 1 : 0) & ((Float.parseFloat(sparecapacity) > 0F) ? 1 : 0) & ((vendordate.equals(enddate)) ? 0 : 1)) != 0)
    {
      hql = "update schedule a set a.bookedcapacity = a.capacity,a.sparecapacity = '0'  where a.vendorid = '" + vendorid + "' and  vendordate =date'" + vendordate + "'";
      addVendorDistributionMx(vendorid, vendorname, systemcode, vendordate, sparecapacity, pzxh, lead, worktype, hourlywork, totalwords, projectvalue, outsourcedponumber);
    }
    else if ((((Float.parseFloat(sparecapacity) <= 0F) ? 1 : 0) & ((vendordate.equals(enddate)) ? 0 : 1)) != 0)
    {
      hql = "update schedule  set yxbz = 'Y'  where vendorid = 'aaaaaaaaaaaa' ";
    }
    else
    {
      hql = "update schedule a set a.bookedcapacity= a.bookedcapacity + " + capacity + ",a.sparecapacity = a.sparecapacity - " + capacity + " where a.vendorid = '" + vendorid + "' and  vendordate =date'" + vendordate + "' and yxbz = 'Y' ";
      addVendorDistributionMx(vendorid, vendorname, systemcode, vendordate, capacity, pzxh, lead, worktype, hourlywork, totalwords, projectvalue, outsourcedponumber);
    }
    this.conn = getConn();
    System.out.println(hql);
    this.pstmt = this.conn.prepareStatement(hql);
    this.pstmt.executeUpdate();
  }

  public void addVendorDistributionMx(String vendorid, String vendorname, String systemcode, String vendordate, String bookedcapacity, String pzxh, String lead, String worktype, String hourlywork, String totalwords, String projectvalue, String outsourcedponumber)
    throws Exception
  {
    StringBuffer hql = new StringBuffer();
    if (!(bookedcapacity.equals("0")))
    {
      String sql = "insert into vendor_distribution_mx(id,vendorid,vendorname,systemcode,vendordate,bookedcapactiy,yxbz,pzxh,lead, worktype,hourlywork,totalwords,projectvalue,outsourcedponumber) values (2016000,'" + vendorid + "','" + vendorname + "','" + systemcode + "', '" + vendordate + "','" + bookedcapacity + "','Y','" + pzxh + "','" + lead + "','" + worktype + "', '" + hourlywork + "','" + totalwords + "', '" + projectvalue + "','" + outsourcedponumber + "')";
      System.out.println(sql);
      hql.append(sql);
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.pstmt.execute();
    }
  }

  public static List<Date> getDatesBetweenTwoDate(Date beginDate, Date endDate)
  {
    List lDate = new ArrayList();
    lDate.add(beginDate);
    Calendar cal = Calendar.getInstance();

    cal.setTime(beginDate);
    boolean bContinue = true;
    while (bContinue)
    {
      cal.add(5, 1);
      if (!(endDate.after(cal.getTime())))
        break;

      lDate.add(cal.getTime());
    }
    lDate.add(endDate);
    return lDate;
  }

  public String strDataFormat(String date)
  {
    String[] dataStr = date.split(",");
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < dataStr.length; ++i)
    {
      sb.append("'");
      sb.append(dataStr[i].trim());
      sb.append("',");
    }
    return sb.toString().substring(0, sb.toString().length() - 1);
  }

  public List selectbookedcapacitybyvendordate(String vendorid, String vendordate)
  {
    Vendor_Distribution_Mx vendor_distribution_mx = null;
    List list = new ArrayList();
    StringBuffer hql = new StringBuffer();
    hql.append("select *  from vendor_distribution_mx  where  vendorid = '" + vendorid + "' and vendordate = '" + vendordate + "' and yxbz = 'Y' and bookedcapactiy > 0 order by systemcode");
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        vendor_distribution_mx = new Vendor_Distribution_Mx();
        vendor_distribution_mx.setVendorid(this.rs.getString("vendorid"));
        vendor_distribution_mx.setBookedcapactiy(this.rs.getString("bookedcapactiy"));
        vendor_distribution_mx.setSystemcode(this.rs.getString("systemcode"));
        vendor_distribution_mx.setVendordate(this.rs.getString("vendordate"));
        vendor_distribution_mx.setLead(this.rs.getString("lead"));
        vendor_distribution_mx.setWorktype(this.rs.getString("worktype"));
        vendor_distribution_mx.setTotalwords(this.rs.getString("totalwords"));
        vendor_distribution_mx.setOutsourcedponumber(this.rs.getString("outsourcedponumber"));
        vendor_distribution_mx.setProjectvalue(this.rs.getString("projectvalue"));
        vendor_distribution_mx.setHourlywork(this.rs.getString("hourlywork"));
        list.add(vendor_distribution_mx);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }

  public void addfileWay(String filename, String filename_new, String ftpway)
    throws Exception
  {
    StringBuffer hql = new StringBuffer();

    UUID ranId = UUID.randomUUID();

    String sql = "insert into fileway(id,filename,filename_new,ftpway,yxbz) values (2016000,'" + filename + "','" + filename_new + "', '" + ftpway + "','Y')";
    System.out.println(sql);
    hql.append(sql);
    this.conn = getConn();
    this.pstmt = this.conn.prepareStatement(hql.toString());
    this.pstmt.execute();
  }

  public List Listfilename()
  {
    Fileway fileway = null;
    List list = new ArrayList();
    StringBuffer hql = new StringBuffer();
    hql.append("select *  from fileway ");
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        fileway = new Fileway();
        fileway.setFilename(this.rs.getString("filename"));
        fileway.setFilename_new(this.rs.getString("filename_new"));
        fileway.setFtpway(this.rs.getString("ftpway"));
        list.add(fileway);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }

  public void backVendorCapacity(String pzxh, String systemcode)
    throws Exception
  {
    Vendor_Distribution_Mx vendor_distribution_mx = null;
    String hql = "";
    hql = "select vendorid,vendordate,bookedcapactiy from vendor_distribution_mx a  where a.pzxh = '" + pzxh + "' and a.systemcode ='" + systemcode + "'";
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        String vendorid = this.rs.getString("vendorid");
        String vendordate = this.rs.getString("vendordate");
        String bookedcapactiy = this.rs.getString("bookedcapactiy");
        getBackVendorCapacity(vendorid, bookedcapactiy, vendordate);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
  }

  public void deleteVendor_distribution_mx(String pzxh, String systemcode)
    throws Exception
  {
    Vendor_Distribution_Mx vendor_distribution_mx = null;
    String hql = "";
    hql = "delete  from vendor_distribution_mx  where pzxh = '" + pzxh + "' and systemcode ='" + systemcode + "'";
    System.out.println(hql);
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

  public void getBackVendorCapacity(String vendorid, String bookedcapactiy, String vendordate)
    throws Exception
  {
    String hql = "";
    hql = "update schedule a set a.bookedcapacity = a.bookedcapacity-" + bookedcapactiy + ",a.sparecapacity =sparecapacity+" + bookedcapactiy + "  where a.vendorid = '" + vendorid + "' and  vendordate =date'" + vendordate + "' and yxbz='Y' ";
    this.conn = getConn();
    this.pstmt = this.conn.prepareStatement(hql);
    this.pstmt.executeUpdate();
  }

  public void rollbackcapactiy(String vendorid, String pzxh)
    throws Exception
  {
    String hql = "";
    hql = "select vendordate,bookedcapactiy from vendor_distribution_mx  where pzxh = '" + pzxh + "' and yxbz = 'Y' ";
    System.out.println(hql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        String vendordate = this.rs.getString("vendordate");
        String bookedcapactiy = this.rs.getString("bookedcapactiy");
        upateVendorcapactiy(vendorid, bookedcapactiy, vendordate);
      }
      deletevendor_distribution_mx(pzxh);
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
  }

  public void upateVendorcapactiy(String vendorid, String bookedcapactiy, String vendordate)
    throws Exception
  {
    String hql = "";
    hql = "update schedule a set a.bookedcapacity = a.bookedcapacity-" + bookedcapactiy + ",a.sparecapacity =sparecapacity+" + bookedcapactiy + "  where a.vendorid = '" + vendorid + "' and  vendordate =date'" + vendordate + "' and yxbz='Y' ";
    this.conn = getConn();
    this.pstmt = this.conn.prepareStatement(hql);
    this.pstmt.executeUpdate();
  }

  public void deletevendor_distribution_mx(String pzxh)
    throws Exception
  {
    String hql = "";
    hql = " delete from vendor_distribution_mx where pzxh='" + pzxh + "'";
    System.out.println(hql);
    this.conn = getConn();
    this.pstmt = this.conn.prepareStatement(hql);
    this.pstmt.executeUpdate();
  }

  public void deleteScheduleByVendor(String vendorid)
    throws Exception
  {
    String hql = "";
    hql = "delete from schedule  where vendorid = '" + vendorid + "'";
    System.out.println(hql);
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

  public void rollbackcapactiybyproject(String systemcode)
    throws Exception
  {
    String hql = "";
    hql = "select vendordate,bookedcapactiy,vendorid from vendor_distribution_mx  where systemcode = '" + systemcode + "'";
    System.out.println(hql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        String vendordate = this.rs.getString("vendordate");
        String bookedcapactiy = this.rs.getString("bookedcapactiy");
        String vendorid = this.rs.getString("vendorid");
        upateVendorcapactiy(vendorid, bookedcapactiy, vendordate);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
  }

  public void upatecapactiybyproject(String vendorid, String bookedcapactiy, String vendordate)
    throws Exception
  {
    String hql = "";
    hql = "update schedule a set a.bookedcapacity = a.bookedcapacity-" + bookedcapactiy + ",a.sparecapacity =sparecapacity+" + bookedcapactiy + "  where a.vendorid = '" + vendorid + "' and  vendordate =date'" + vendordate + "' and yxbz='Y' ";
    this.conn = getConn();
    this.pstmt = this.conn.prepareStatement(hql);
    this.pstmt.executeUpdate();
  }

  public Schedule getSchedule(String vendorid) throws Exception
  {
    String hql = "";
    Schedule schedule = new Schedule();
    hql = "select max(vendordate) vendordate from schedule   where vendorid = '" + vendorid + "' ";
    System.out.println(hql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        String vendordate = this.rs.getString("vendordate");
        schedule.setVendordate(vendordate);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return schedule;
  }

  public String getDailyCapacity(String vendorid)
    throws Exception
  {
    String hql = "";
    String dailycapacity = "";
    hql = "select  dailycapacity from vendor   where vendorid = '" + vendorid + "' ";
    System.out.println(hql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        dailycapacity = this.rs.getString("dailycapacity");

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return dailycapacity;
  }

  public void updateSchedule(String vendorid, String startdate, String enddate, String capacity)
    throws Exception
  {
    String hql = "";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date dBegin = sdf.parse(startdate);
    Date dEnd = sdf.parse(enddate);
    List listDate = getDatesBetweenTwoDate(dBegin, dEnd);
    try
    {
      for (int i = 0; i < listDate.size(); ++i)
      {
        hql = "update schedule a set a.capacity = '" + capacity + "',a.sparecapacity=" + capacity + "-a.bookedcapacity,a.mrbz='N'  where a.vendorid = '" + vendorid + "' and  a.vendordate=date'" + sdf.format((Date)listDate.get(i)) + "' ";
        System.out.println(hql);
        this.conn = getConn();
        this.pstmt = this.conn.prepareStatement(hql);
        this.pstmt.executeUpdate();
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
  }

  public void updateMuchSchedule(String vendorid, String updatedate, String capacity)
    throws Exception
  {
    String hql = "";
    String[] datedate = updatedate.split(",");
    try
    {
      for (int i = 0; i < datedate.length; ++i)
      {
        hql = "update schedule a set a.capacity = '" + capacity + "',a.sparecapacity=" + capacity + "-a.bookedcapacity,a.mrbz='N'  where a.vendorid = '" + vendorid + "' and  a.vendordate=date'" + datedate[i] + "' ";
        System.out.println(hql);
        this.conn = getConn();
        this.pstmt = this.conn.prepareStatement(hql);
        this.pstmt.executeUpdate();
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
  }

  public void updatecapacity(String vendorid, String vendordate, String available, String capacity)
    throws Exception
  {
    String hql = "";
    try
    {
      hql = "update schedule a set a.capacity = '" + capacity + "',a.sparecapacity=" + capacity + "-a.bookedcapacity,a.available ='" + available + "',a.mrbz='N'  where a.vendorid = '" + vendorid + "' and  a.vendordate=date'" + vendordate + "' ";
      System.out.println(hql);
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql);
      this.pstmt.executeUpdate();
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
  }

  public List listLatmonthSchedule(String vendorid)
  {
    List list = new ArrayList();
    StringBuffer hql = new StringBuffer();
    hql.append("select *  from schedule as a where a.vendorid = '" + vendorid + "'  and a.yxbz= 'Y'  and   DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= date(a.vendordate)  and a.vendordate < CURDATE()  order by a.vendordate ");
    System.out.println(hql.toString());
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
      {
        Schedule schedule = new Schedule();
        schedule.setVendordate(this.rs.getString("vendordate"));
        schedule.setBookedcapacity(this.rs.getString("bookedcapacity"));
        schedule.setCapacity(this.rs.getString("capacity"));
        schedule.setVendorid(this.rs.getString("vendorid"));
        schedule.setSparecapacity(this.rs.getString("sparecapacity"));
        schedule.setAvailable(this.rs.getString("available"));
        list.add(schedule);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return list;
  }

  public String getMaxBookedCapacity(String updatedate, String vendorid)
    throws Exception
  {
    String hql = "";
    String bookedcapacity = "";
    hql = "select  max(bookedcapacity) bookedcapacity  from schedule  where vendorid = '" + vendorid + "' and vendordate in ('" + updatedate.replace(",", "','") + "')";
    System.out.println(hql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        bookedcapacity = this.rs.getString("bookedcapacity");

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return bookedcapacity;
  }

  public String getMaxLineBookedCapacity(String startdate, String enddate, String vendorid)
    throws Exception
  {
    String hql = "";
    String bookedcapacity = "";
    hql = "select  max(bookedcapacity+0) bookedcapacity  from schedule  where vendorid = '" + vendorid + "' and vendordate between '" + startdate + "' and '" + enddate + "'";
    System.out.println(hql);
    try
    {
      this.conn = getConn();
      this.pstmt = this.conn.prepareStatement(hql.toString());
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next())
        bookedcapacity = this.rs.getString("bookedcapacity");

    }
    catch (Exception e)
    {
      e.printStackTrace();

      closeAll(this.conn, this.pstmt, this.rs); } finally { closeAll(this.conn, this.pstmt, this.rs);
    }
    return bookedcapacity;
  }
  
  
    public void  deleteSchedule(String projectid) throws Exception {
    	String systemcode=getSystemCode(projectid);
    	if(!systemcode.equals("")) {
    		String hql = "delete from distribution  where systemcode = '"+ systemcode+ "'";
    		System.out.println(hql);
    		try {
    			  this.conn = getConn();
    		      this.pstmt = this.conn.prepareStatement(hql.toString());
    		      int i = this.pstmt.executeUpdate();
    		} catch (Exception e) {
    			e.printStackTrace();
    			closeAll(this.conn, this.pstmt, this.rs);
    		} finally {
    			closeAll(this.conn, this.pstmt, this.rs);
    		}
    	}
		
	}
    
    public String getSystemCode(String id) throws Exception {
		String systemcode = "";
		String hql = "select systemcode  from project  where id = "+ id;
		System.out.println(hql);
		try {
			this.conn = getConn();
			this.pstmt = this.conn.prepareStatement(hql.toString());
			this.rs = this.pstmt.executeQuery();
			while (this.rs.next()){
				systemcode = this.rs.getString("systemcode");
			}

		} catch (Exception e) {
			e.printStackTrace();
			closeAll(this.conn, this.pstmt, this.rs);
		} finally {
			closeAll(this.conn, this.pstmt, this.rs);
		}
		return systemcode;
	}
    
    
    public String  fullCapacity() throws Exception {
  		List<Vendor> vendors = getAllVendors();
  		for(int i=0;i<vendors.size();i++) {
  			String vendorid = vendors.get(i).getVendorid();
  			String vendorname = vendors.get(i).getVendor_name();
  			String dailycapacity = vendors.get(i).getDailycapacity();
  			Schedule schedule = getSchedule(vendorid);
  			Date dBegin;
  			Date b = new Date();
  		    SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
            if (schedule.getVendordate() != null) {
  		        dBegin = f.parse(schedule.getVendordate());
  		      } else {
  		        dBegin = f.parse("2017-01-01");
  		      }
  		      Calendar c = Calendar.getInstance();
  		      String st = f.format(c.getTime());
  		      c.add(2, 3);
  		      String h = f.format(c.getTime());

  		      Date dEnd = f.parse(h);
  		      List listDate = getDatesBetweenTwoDate(dBegin, dEnd);
  		      int sizwz = listDate.size();
  		      if (!(h.equals(schedule.getVendordate())))
  		        for (int j = 0; j < listDate.size(); ++j) {
  		          Schedule schedule2 = new Schedule();
  		          schedule2.setVendorid(vendorid);
  		          schedule2.setVendordate(f.format((Date)listDate.get(j)));
  		          schedule2.setAvailable("Available");
  		          schedule2.setVendorname(vendorname);
  		          schedule2.setBookedcapacity("0");
  		          schedule2.setSparecapacity(dailycapacity);
  		          schedule2.setCapacity(dailycapacity);
  		          schedule2.setDailycapacity(dailycapacity);
  		          schedule2.setYxbz("Y");
  		          schedule2.setMrbz("Y");
  		          saveSchedule(schedule2);
  		        }
  		}
  	    	return "success";
  	}
    
    public void saveSchedule(Schedule schedule) throws Exception
    	  {
    	      String sql = "insert into schedule(vendorid,vendordate,available,nd,yf,rz,capacity,startdate,enddate,remark1,remark2,bookedcapacity,"
    	                   +"sparecapacity,yxbz,dailycapacity,vendorname,mrbz) value ('"+schedule.getVendorid()+"','"+schedule.getVendordate()+"','"+schedule.getAvailable()+
    	    		  "','','','','"+schedule.getCapacity()+"','','','','','0','"+schedule.getDailycapacity()
    	    		  +"','Y','"+schedule.getDailycapacity()+"','"+schedule.getVendorname()+"','Y')";
    	      System.out.println(sql);
    	      try {
    	      this.conn = getConn();
    	      this.pstmt = this.conn.prepareStatement(sql);
    	      this.pstmt.execute();
    	    } catch (Exception e) {
    			e.printStackTrace();
    			closeAll(this.conn, this.pstmt, this.rs);
    		} finally {
    			closeAll(this.conn, this.pstmt, this.rs);
    		}
    	  }
    
    
    
    public List getAllVendors() {
		Vendor vendor = null;
		List list = new ArrayList();
		try {
			this.conn = getConn();
			this.pstmt = this.conn.prepareStatement("select * from vendor ");
			this.rs = this.pstmt.executeQuery();
			while (this.rs.next()) {
				vendor = new Vendor();
				vendor.setVendorid(this.rs.getString("vendorid"));
				vendor.setVendor_name(this.rs.getString("vendor_name"));
				vendor.setDailycapacity(this.rs.getString("dailycapacity"));
				list.add(vendor);
			}
		} catch (Exception e) {
			e.printStackTrace();
			closeAll(this.conn, this.pstmt, this.rs);
		} finally {
			closeAll(this.conn, this.pstmt, this.rs);
		}
		return list;
    }
      
}