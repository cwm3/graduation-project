package com.productsystem.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.productsystem.model.Schedule;
import com.productsystem.service.ScheduleManager;
import com.productsystem.util.PageBean;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("s")
@Scope("prototype")
public class ScheduleAction extends ActionSupport
  implements ModelDriven
{
  private ScheduleManager scheduleManager;
  private List<Schedule> schedules;
  private Schedule schedule = new Schedule();
  private String vendorid;
  private int totalSize = 0;
  private int pageSize = 30;
  private int totalPage = 0;
  private int page = 1;

  public String addSchedule()
    throws Exception
  {
    String vendorid = this.schedule.getVendorid();

    Map session = ActionContext.getContext().getSession();
    session.put("vendorid", vendorid);
    HttpServletRequest request = ServletActionContext.getRequest();
    request.setAttribute("vendorid", vendorid);
    ServletActionContext.getRequest().setAttribute("vendorid", vendorid);

    ActionContext ctx = ActionContext.getContext();
    ctx.getSession().put("vendorid", vendorid);

    String str_startdate = this.schedule.getStartdate();
    String str_enddate = this.schedule.getEnddate();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date dBegin = sdf.parse(this.schedule.getStartdate());
    Date dEnd = sdf.parse(this.schedule.getEnddate());
    int capacity = Integer.parseInt(this.schedule.getCapacity());
    if (str_startdate.equals(str_enddate)) {
      Schedule schedule2 = new Schedule();
      String nd = str_startdate.substring(0, 4);
      String yf = str_startdate.substring(5, 7);
      String rz = str_startdate.substring(8, 10);

      schedule2.setVendorid(this.schedule.getVendorid());
      schedule2.setVendorname(this.schedule.getVendorname());
      schedule2.setVendordate(str_startdate);

      schedule2.setAvailable(this.schedule.getAvailable());
      schedule2.setBookedcapacity("0");
      schedule2.setSparecapacity(String.valueOf(capacity));
      schedule2.setCapacity(String.valueOf(capacity));
      schedule2.setStartdate(this.schedule.getStartdate());
      schedule2.setStartdate(this.schedule.getEnddate());
      schedule2.setNd(nd);
      schedule2.setYf(yf);
      schedule2.setRz(rz);
      schedule2.setYxbz("Y");
      schedule2.setMrbz("N");
      this.scheduleManager.save(schedule2);
    } else {
      List listDate = getDatesBetweenTwoDate(dBegin, dEnd);
      for (int i = 0; i < listDate.size(); ++i) {
        Schedule schedule3 = new Schedule();

        String nd = sdf.format((Date)listDate.get(i)).substring(0, 4);

        String yf = sdf.format((Date)listDate.get(i)).substring(5, 7);
        String rz = sdf.format((Date)listDate.get(i)).substring(8, 10);

        schedule3.setVendorid(this.schedule.getVendorid());
        schedule3.setVendorname(this.schedule.getVendorname());
        schedule3.setVendordate(sdf.format((Date)listDate.get(i)));

        schedule3.setAvailable(this.schedule.getAvailable());
        schedule3.setBookedcapacity("0");
        schedule3.setSparecapacity(String.valueOf(capacity));
        schedule3.setCapacity(String.valueOf(capacity));
        schedule3.setStartdate(this.schedule.getStartdate());
        schedule3.setStartdate(this.schedule.getEnddate());
        schedule3.setNd(nd);
        schedule3.setYf(yf);
        schedule3.setRz(rz);
        schedule3.setYxbz("Y");
        schedule3.setMrbz("N");
        this.scheduleManager.save(schedule3);
      }
    }
    return "success";
  }

  public String browse() throws Exception {
    this.totalSize = this.scheduleManager.countSchedule(this.schedule);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.schedules = this.scheduleManager.browseSchedule(this.page, 
      this.pageSize, this.schedule);
    PageBean pageBean = new PageBean();
    pageBean.setList(this.schedules);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.schedules);
    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public String browseScheduleByTiaoJian() throws Exception {
    ActionContext ctx = ActionContext.getContext();
    if (this.schedule.getYxbz().equals("1")) {
      ctx.getSession().put("vendorname_schedule", 
        this.schedule.getVendorname());
      ctx.getSession().put("vendorid_schedule", 
        this.schedule.getVendorid());
      ctx.getSession().put("dailycapacity_schedule", 
        this.schedule.getDailycapacity());
      ctx.getSession().put
        ("remark1_schedule", this.schedule.getRemark1());
      ctx.getSession().put
        ("remark2_schedule", this.schedule.getRemark2());
      ctx.getSession().put("sparecapacity_schedule", 
        this.schedule.getSparecapacity());
      ctx.getSession().put("startdate_schedule", 
        this.schedule.getStartdate());
      ctx.getSession().put
        ("enddate_schedule", this.schedule.getEnddate());
      ctx.getSession().put("nd_schedule", this.schedule.getNd());
      ctx.getSession().put("yf_schedule", this.schedule.getYf());
      ctx.getSession().put("rz_schedule", this.schedule.getRz());
    } else {
      String vendorname_schedule = ctx.getSession().get
        ("vendorname_schedule").toString();
      String vendorid_schedule = ctx.getSession().get
        ("vendorid_schedule").toString();
      String dailycapacity_schedule = ctx.getSession().get
        ("dailycapacity_schedule").toString();
      String remark1_schedule = ctx.getSession().get("remark1_schedule").toString
        ();
      String remark2_schedule = ctx.getSession().get("remark2_schedule").toString
        ();
      String sparecapacity_schedule = ctx.getSession().get
        ("sparecapacity_schedule").toString();
      String startdate_qa = ctx.getSession().get("startdate_qa").toString
        ();
      String startdate_schedule = ctx.getSession().get
        ("startdate_schedule").toString();
      String enddate_schedule = ctx.getSession().get("enddate_schedule").toString
        ();
      String nd_schedule = ctx.getSession().get("nd_schedule").toString();
      String yf_schedule = ctx.getSession().get("yf_schedule").toString();
      String rz_schedule = ctx.getSession().get("rz_schedule").toString();

      this.schedule.setVendorname(vendorname_schedule);
      this.schedule.setVendorid(vendorid_schedule);
      this.schedule.setDailycapacity(dailycapacity_schedule);
      this.schedule.setRemark1(remark1_schedule);
      this.schedule.setRemark2(remark2_schedule);
      this.schedule.setSparecapacity(sparecapacity_schedule);
      this.schedule.setStartdate(startdate_schedule);
      this.schedule.setEnddate(enddate_schedule);
      this.schedule.setNd(nd_schedule);
      this.schedule.setYf(yf_schedule);
      this.schedule.setRz(rz_schedule);
    }
    this.totalSize = this.scheduleManager.countScheduleByTiaoJian
      (this.schedule);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.schedules = this.scheduleManager.browseScheduleByTiaoJian(
      this.page, this.pageSize, this.schedule);
    PageBean pageBean = new PageBean();
    pageBean.setList(this.schedules);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.schedules);
    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("startdate", 
      this.schedule.getStartdate());
    ServletActionContext.getRequest().setAttribute("enddate", 
      this.schedule.getEnddate());
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public String browseLastMonthSchedule() throws Exception {
    this.totalSize = this.scheduleManager.countLastMonthSchedule
      (this.schedule);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.schedules = this.scheduleManager.browseLastMonthSchedule(
      this.page, this.pageSize, this.schedule);
    PageBean pageBean = new PageBean();
    pageBean.setList(this.schedules);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.schedules);
    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public String selectVendorSchedule() throws Exception {
    this.totalSize = this.scheduleManager.countVendorSchedule
      (this.schedule);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.schedules = this.scheduleManager.selectVendorSchedule(this.page, 
      this.pageSize, this.schedule);

    PageBean pageBean = new PageBean();
    pageBean.setList(this.schedules);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.schedules);

    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public String loadvendorscheduleByVendorId() throws Exception {
    this.totalSize = this.scheduleManager.countVendorscheduleByVendorId
      (this.schedule);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.schedules = this.scheduleManager.loadvendorscheduleByVendorId(
      this.page, this.pageSize, this.schedule);

    PageBean pageBean = new PageBean();
    pageBean.setList(this.schedules);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.schedules);

    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public String list() throws Exception {
    this.schedules = this.scheduleManager.browseSchedule();
    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.schedules);
    return "success";
  }

  public String loadSchedule() throws Exception {
    this.schedule = this.scheduleManager.loadSchedule(
      Integer.valueOf(this.schedule.getId()));
    ActionContext.getContext().put("scheduleinfo", this.schedule);
    ServletActionContext.getRequest().setAttribute("schedule", 
      this.schedule);

    return "success";
  }

  public String deleteSchedule() throws Exception {
    if (this.schedule.getId() != 0) {
      this.scheduleManager.deleteSchedule(Integer.valueOf(this.schedule.getId
        ()));
      return "success";
    }
    return "fail";
  }

  public String updateschedule() throws Exception {
    if (this.schedule.getId() != 0) {
      String capacity = this.schedule.getCapacity();
      String bookedcapacity = this.schedule.getBookedcapacity();
      String sparecapacity = Integer.parseInt(capacity) + Integer.parseInt(bookedcapacity)+"";
      this.schedule.setYxbz("Y");
      this.schedule.setSparecapacity(this.schedule.getCapacity());
      this.schedule.setSparecapacity(sparecapacity);
      this.scheduleManager.updateSchedule(this.schedule);
      return "success";
    }
    return "fail";
  }

  public static List<Date> getDatesBetweenTwoDate(Date beginDate, Date endDate) {
    List lDate = new ArrayList();
    lDate.add(beginDate);
    Calendar cal = Calendar.getInstance();

    cal.setTime(beginDate);
    boolean bContinue = true;
    while (bContinue) {
      cal.add(5, 1);
      if (!(endDate.after(cal.getTime())))
        break;

      lDate.add(cal.getTime());
    }
    lDate.add(endDate);
    return lDate;
  }

  public Object getModel() {
    return this.schedule;
  }

  public int getPage() {
    return this.page;
  }

  public void setPage(int page) {
    this.page = page;
  }

  public ScheduleManager getScheduleManager() {
    return this.scheduleManager;
  }

  @Resource
  public void setScheduleManager(ScheduleManager scheduleManager) {
    this.scheduleManager = scheduleManager;
  }

  public List<Schedule> getSchedules() {
    return this.schedules;
  }

  public void setSchedules(List<Schedule> schedules) {
    this.schedules = schedules;
  }

  public Schedule getSchedule() {
    return this.schedule;
  }

  public void setSchedule(Schedule schedule) {
    this.schedule = schedule;
  }

  public String getVendorid() {
    return this.vendorid;
  }

  public void setVendorid(String vendorid) {
    this.vendorid = vendorid;
  }
}