package com.productsystem.action;

import com.datacollect.QaInfoDao;
import com.datacollect.VendorDao;
import com.datacollect.VendorScheduleDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.productsystem.model.Schedule;
import com.productsystem.model.Vendor;
import com.productsystem.service.ScheduleManager;
import com.productsystem.service.VendorManager;
import com.productsystem.util.PageBean;
import java.net.URLDecoder;
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

@Component("v")
@Scope("prototype")
public class VendorAction extends ActionSupport
  implements ModelDriven
{
  private VendorManager vendorManager;
  private ScheduleManager scheduleManager;
  private List<Vendor> vendors;
  private Vendor vendor = new Vendor();
  private int totalSize = 0;
  private int pageSize = 10;
  private int totalPage = 0;
  private int page = 1;

  public String login() throws Exception {
	  
    if(this.vendorManager.exists(this.vendor)) {
	      ServletActionContext.getRequest().setAttribute("vendorname", this.vendor.getVendor_name());
	      ServletActionContext.getRequest().setAttribute("vendorid", this.vendor.getVendorid());
	      ServletActionContext.getRequest().setAttribute("vendor_name", this.vendor.getVendor_name());
	      ActionContext ctx = ActionContext.getContext();
	      ctx.getSession().put("vendorid", this.vendor.getVendorid());
	      ctx.getSession().put("vendor_name", this.vendor.getVendor_name());
	      return "success";
    } else {
    	return "fail";
    }
  }

  public String addVendor() throws Exception {
    Schedule schedule = new Schedule();
    schedule.setVendorid(this.vendor.getVendorid());
    String dalitycapacity = this.vendor.getDailycapacity();
    String vendorname = this.vendor.getVendor_name();
    if (!(this.vendor.getVendor_field_other().equals("")))
      this.vendor.setVendor_field(this.vendor.getVendor_field() + "," + 
        this.vendor.getVendor_field_other());

    if (!(this.vendor.getVendor_cat_other().equals("")))
      this.vendor.setVendor_cat(this.vendor.getVendor_cat() + "," + 
        this.vendor.getVendor_cat_other());

    this.vendor.setVendorpassword(vendorname);
    this.vendor.setYxbz("Y");
    this.vendorManager.saveOrUpdateVendor(this.vendor);

    Date b = new Date();
    SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");

    Calendar c = Calendar.getInstance();
    String st = f.format(c.getTime());

    c.add(2, 3);
    String h = f.format(c.getTime());

    Date dBegin = f.parse(st);
    Date dEnd = f.parse(h);
    List listDate = getDatesBetweenTwoDate(dBegin, dEnd);
    for (int i = 0; i < listDate.size(); ++i) {
      Schedule schedule2 = new Schedule();
      schedule2.setVendorid(schedule.getVendorid());
      schedule2.setVendordate(f.format((Date)listDate.get(i)));
      schedule2.setAvailable("Available");
      schedule2.setVendorname(vendorname);
      schedule2.setBookedcapacity("0");
      schedule2.setSparecapacity(dalitycapacity);
      schedule2.setCapacity(dalitycapacity);
      schedule2.setYxbz("Y");
      schedule2.setMrbz("Y");
      this.scheduleManager.save(schedule2);
    }
    return "ADD_SUCCESS";
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

  public String browse() throws Exception {
    this.totalSize = this.vendorManager.countVendor();
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.vendors = this.vendorManager.browseVendor
      (this.page, this.pageSize);
    for (int i = 0; i < this.vendors.size(); ++i) {
      String languagepair = "";
      String fg = "";
      if (((Vendor)this.vendors.get(i)).getLanguagebegin() != null) {
        String[] languagebegin = ((Vendor)this.vendors.get(i)).getLanguagebegin
          ().split(",");
        String[] languageend = ((Vendor)this.vendors.get(i)).getLanguageend
          ().split(",");
        if (languagebegin.length > 0)
          for (int j = 0; j < languagebegin.length; ++j) {
            if (j >= 1)
              fg = " , ";

            languagepair = languagepair + fg + languagebegin[j] + 
              " to " + languageend[j];
          }

        ((Vendor)this.vendors.get(i)).setLanguagebegin(languagepair);
      }
    }
    for (int j = 0; j < this.vendors.size(); ++j) {
      String vendorid = ((Vendor)this.vendors.get(j)).getVendorid();
      QaInfoDao qainfodao = new QaInfoDao();
      String averagescore = qainfodao.VendorAvergeScore(vendorid);
      ((Vendor)this.vendors.get(j)).setAveragescore(averagescore);
    }
    PageBean pageBean = new PageBean();
    pageBean.setList(this.vendors);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();
    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.vendors);
    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public String selectVendor() throws Exception {
	//¼ì²é²úÄÜ
	  	  
    String chinesename = this.vendor.getChinese_name();
    chinesename = URLDecoder.decode(chinesename, "utf-8");
    this.vendor.setChinese_name(chinesename);

    String vendorid_cs = this.vendor.getVendorid();
    String vendorname_cs = this.vendor.getVendor_name();

    this.totalSize = this.vendorManager.countSelectVendor(this.vendor);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.vendors = this.vendorManager.selectVendor(this.page, 
      this.pageSize, this.vendor);
    for (int i = 0; i < this.vendors.size(); ++i) {
      String languagepair = "";
      String fg = "";
      if (((Vendor)this.vendors.get(i)).getLanguagebegin() != null) {
        String[] languagebegin = ((Vendor)this.vendors.get(i)).getLanguagebegin
          ().split(",");
        String[] languageend = ((Vendor)this.vendors.get(i)).getLanguageend
          ().split(",");
        if (languagebegin.length > 0)
          for (int j = 0; j < languagebegin.length; ++j) {
            if (j >= 1)
              fg = " , ";

            languagepair = languagepair + fg + languagebegin[j] + 
              " to " + languageend[j];
          }

        ((Vendor)this.vendors.get(i)).setLanguagebegin(languagepair);
      }
    }
    for (int j = 0; j < this.vendors.size(); ++j) {
      String vendorid = ((Vendor)this.vendors.get(j)).getVendorid();
      QaInfoDao qainfodao = new QaInfoDao();
      String averagescore = qainfodao.VendorAvergeScore(vendorid);
      ((Vendor)this.vendors.get(j)).setAveragescore(averagescore);

      ((Vendor)this.vendors.get(j)).setRemark1(vendorid_cs);
      ((Vendor)this.vendors.get(j)).setRemark2(vendorname_cs);
      ((Vendor)this.vendors.get(j)).setRemark3(chinesename);
    }
    PageBean pageBean = new PageBean();
    pageBean.setList(this.vendors);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.vendors);

    ServletActionContext.getRequest().setAttribute("averagescore", 
      this.vendor.getAveragescore());
    ServletActionContext.getRequest().setAttribute("remark1", 
      this.vendor.getRemark());
    ServletActionContext.getRequest().setAttribute("remark2", 
      this.vendor.getRemark());

    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));
    ServletActionContext.getRequest().setAttribute("vendorsize", 
      Integer.valueOf(this.vendors.size()));
    return "success";
  }

  public String selectVendoroprtion() throws Exception {
    String vendorid_cs = this.vendor.getVendorid();
    String vendorname_cs = this.vendor.getVendor_name();

    this.totalSize = this.vendorManager.countSelectVendor(this.vendor);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.vendors = this.vendorManager.selectVendor(this.page, 
      this.pageSize, this.vendor);
    for (int i = 0; i < this.vendors.size(); ++i) {
      String languagepair = "";
      String fg = "";
      if (((Vendor)this.vendors.get(i)).getLanguagebegin() != null) {
        String[] languagebegin = ((Vendor)this.vendors.get(i)).getLanguagebegin
          ().split(",");
        String[] languageend = ((Vendor)this.vendors.get(i)).getLanguageend
          ().split(",");
        if (languagebegin.length > 0)
          for (int j = 0; j < languagebegin.length; ++j) {
            if (j >= 1)
              fg = " , ";

            languagepair = languagepair + fg + languagebegin[j] + 
              " to " + languageend[j];
          }

        ((Vendor)this.vendors.get(i)).setLanguagebegin(languagepair);
      }
    }
    for (int j = 0; j < this.vendors.size(); ++j) {
      String vendorid = ((Vendor)this.vendors.get(j)).getVendorid();
      QaInfoDao qainfodao = new QaInfoDao();
      String averagescore = qainfodao.VendorAvergeScore(vendorid);
      ((Vendor)this.vendors.get(j)).setAveragescore(averagescore);
      ((Vendor)this.vendors.get(j)).setRemark1(vendorid_cs);
      ((Vendor)this.vendors.get(j)).setRemark2(vendorname_cs);
    }
    PageBean pageBean = new PageBean();
    pageBean.setList(this.vendors);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.vendors);

    ServletActionContext.getRequest().setAttribute("averagescore", 
      this.vendor.getAveragescore());
    ServletActionContext.getRequest().setAttribute("remark1", 
      this.vendor.getRemark());
    ServletActionContext.getRequest().setAttribute("remark2", 
      this.vendor.getRemark());

    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));
    ServletActionContext.getRequest().setAttribute("vendorsize", 
      Integer.valueOf(this.vendors.size()));
    return "success";
  }

  public String selectVendorSchedule() throws Exception {
    this.totalSize = this.vendorManager.countVendorSchedule(this.vendor);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.vendors = this.vendorManager.selectVendorSchedule(this.page, 
      this.pageSize, this.vendor);

    PageBean pageBean = new PageBean();
    pageBean.setList(this.vendors);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.vendors);
    ServletActionContext.getRequest().setAttribute("averagescore", 
      this.vendor.getAveragescore());
    ServletActionContext.getRequest().setAttribute("remark1", 
      this.vendor.getRemark());
    ServletActionContext.getRequest().setAttribute("remark2", 
      this.vendor.getRemark());

    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public String selectVendorCapacity() throws Exception {
    ActionContext ctx = ActionContext.getContext();
    if (this.vendor.getYxbz().equals("1")) {
      ctx.getSession().put("vendorname_vendor", 
        this.vendor.getVendor_name());
      ctx.getSession().put("vendorid_vendor", this.vendor.getVendorid());
      ctx.getSession().put("remark1_vendor", this.vendor.getRemark1());
      ctx.getSession().put("remark2_vendor", this.vendor.getRemark2());
      ctx.getSession().put("languagebegin_vendor", 
        this.vendor.getLanguagebegin());
      ctx.getSession().put("languageend_vendor", 
        this.vendor.getLanguageend());
      ctx.getSession().put("averagescore_vendor", 
        this.vendor.getAveragescore());
      ctx.getSession().put("rate_vendor", this.vendor.getRate());
      ctx.getSession().put("vendor_field_vendor", 
        this.vendor.getVendor_field());
      ctx.getSession().put("vendor_cat_vendor", 
        this.vendor.getVendor_cat());
    } else {
      String vendorname_vendor = ctx.getSession().get
        ("vendorname_vendor").toString();
      String vendorid_vendor = ctx.getSession().get("vendorid_vendor").toString
        ();
      String remark1_vendor = ctx.getSession().get("remark1_vendor").toString
        ();
      String remark2_vendor = ctx.getSession().get("remark2_vendor").toString
        ();
      String languagebegin_vendor = ctx.getSession().get
        ("languagebegin_vendor").toString();
      String languageend_vendor = ctx.getSession().get
        ("languageend_vendor").toString();
      String averagescore_vendor = ctx.getSession().get
        ("averagescore_vendor").toString();
      String rate_vendor = ctx.getSession().get("rate_vendor").toString();
      String vendor_field_vendor = ctx.getSession().get
        ("vendor_field_vendor").toString();
      String vendor_cat_vendor = ctx.getSession().get
        ("vendor_cat_vendor").toString();

      this.vendor.setVendor_name(vendorname_vendor);
      this.vendor.setVendorid(vendorid_vendor);
      this.vendor.setRemark1(remark1_vendor);
      this.vendor.setRemark2(remark2_vendor);
      this.vendor.setLanguagebegin(languagebegin_vendor);
      this.vendor.setLanguageend(languageend_vendor);
      this.vendor.setRate(rate_vendor);
      this.vendor.setVendor_field(vendor_field_vendor);
      this.vendor.setVendor_cat(vendor_cat_vendor);
      this.vendor.setAveragescore(averagescore_vendor);
    }
    this.totalSize = this.vendorManager.countVendorCapacity(this.vendor);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.vendors = this.vendorManager.selectVendorCapacity(this.page, 
      this.pageSize, this.vendor);

    PageBean pageBean = new PageBean();
    pageBean.setList(this.vendors);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();
    for (int j = 0; j < this.vendors.size(); ++j) {
      String vendorid = ((Vendor)this.vendors.get(j)).getVendorid();
      QaInfoDao qainfodao = new QaInfoDao();
      String averagescore = qainfodao.VendorAvergeScore(vendorid);
      ((Vendor)this.vendors.get(j)).setAveragescore(averagescore);

      VendorDao vendordao = new VendorDao();
      String dailycapacity = vendordao.getSpareCapacity(vendorid, 
        this.vendor.getRemark1(), this.vendor.getRemark2());
      ((Vendor)this.vendors.get(j)).setDailycapacity(dailycapacity);
    }
    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.vendors);
    ServletActionContext.getRequest().setAttribute("vendors", this.vendors);
    ServletActionContext.getRequest().setAttribute("startdate", 
      this.vendor.getRemark1());
    ServletActionContext.getRequest().setAttribute("enddate", 
      this.vendor.getRemark2());
    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public String list() throws Exception {
    this.vendors = this.vendorManager.browseVendor();
    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.vendors);
    return "success";
  }

  public String loadVendor() throws Exception {
    String remark1 = this.vendor.getRemark1();
    String remark2 = this.vendor.getRemark2();
    String remark3 = this.vendor.getRemark3();

    this.vendor = this.vendorManager.loadVendor(Integer.valueOf(this.vendor.getId
      ()));

    ActionContext.getContext().put("vendorinfo", this.vendor);
    ServletActionContext.getRequest().setAttribute("id", 
      Integer.valueOf(this.vendor.getId()));
    ServletActionContext.getRequest().setAttribute("vendorid", 
      this.vendor.getVendorid());
    ServletActionContext.getRequest().setAttribute("remark1", remark1);
    ServletActionContext.getRequest().setAttribute("remark2", remark2);
    ServletActionContext.getRequest().setAttribute("remark3", remark3);

    String vendor_email = this.vendor.getVendor_email();
    if (vendor_email == null)
      vendor_email = "";

    ServletActionContext.getRequest().setAttribute("vendor_email", 
      vendor_email);

    String vendorpassword = this.vendor.getVendorpassword();
    if (vendorpassword == null)
      vendorpassword = "";

    ServletActionContext.getRequest().setAttribute("vendorpassword", 
      vendorpassword);

    String vendor_name = this.vendor.getVendor_name();
    if (vendor_name == null)
      vendor_name = "";

    ServletActionContext.getRequest().setAttribute("vendor_name", 
      vendor_name);

    String vendor_qq = this.vendor.getVendor_qq();
    if (vendor_qq == null)
      vendor_qq = "";

    ServletActionContext.getRequest().setAttribute("vendor_qq", vendor_qq);

    String vendor_tel = this.vendor.getVendor_tel();
    if (vendor_tel == null)
      vendor_tel = "";

    ServletActionContext.getRequest().setAttribute
      ("vendor_tel", vendor_tel);

    String monthly_order_max = this.vendor.getMonthly_order_max();
    if (monthly_order_max == null)
      monthly_order_max = "";

    ServletActionContext.getRequest().setAttribute("monthly_order_max", 
      monthly_order_max);

    String monthly_order_min = this.vendor.getMonthly_order_min();
    if (monthly_order_min == null)
      monthly_order_min = "";

    ServletActionContext.getRequest().setAttribute("monthly_order_min", 
      monthly_order_min);

    String averagescore = this.vendor.getAveragescore();
    if (averagescore == null)
      averagescore = "";

    ServletActionContext.getRequest().setAttribute("averagescore", 
      averagescore);

    String qualified_date = this.vendor.getQualified_date();
    if (qualified_date == null)
      qualified_date = "";

    ServletActionContext.getRequest().setAttribute("qualified_date", 
      qualified_date);

    String chinese_name = this.vendor.getChinese_name();
    if (chinese_name == null)
      chinese_name = "";

    ServletActionContext.getRequest().setAttribute("chinese_name", 
      chinese_name);

    String vendor_comment = this.vendor.getVendor_comment();
    if (vendor_comment == null)
      vendor_comment = "";

    ServletActionContext.getRequest().setAttribute("vendor_comment", 
      vendor_comment);
    String vendor_field = this.vendor.getVendor_field();
    if (vendor_field == null)
      vendor_field = "";

    ServletActionContext.getRequest().setAttribute("vendor_field", 
      vendor_field);
    String vendor_cat = this.vendor.getVendor_cat();
    if (vendor_cat == null)
      vendor_cat = "";

    ServletActionContext.getRequest().setAttribute
      ("vendor_cat", vendor_cat);

    String fuzzy_84 = this.vendor.getFuzzy_84();
    if (fuzzy_84 == null)
      fuzzy_84 = "";

    ServletActionContext.getRequest().setAttribute("fuzzy_84", fuzzy_84);
    String fuzzy_85 = this.vendor.getFuzzy_85();
    if (fuzzy_85 == null)
      fuzzy_85 = "";

    ServletActionContext.getRequest().setAttribute("fuzzy_85", fuzzy_85);
    String fuzzy_99 = this.vendor.getFuzzy_99();
    if (fuzzy_99 == null)
      fuzzy_99 = "";

    ServletActionContext.getRequest().setAttribute("fuzzy_99", fuzzy_99);
    String fuzzy_100 = this.vendor.getFuzzy_100();
    if (fuzzy_100 == null)
      fuzzy_100 = "";

    ServletActionContext.getRequest().setAttribute("fuzzy_100", fuzzy_100);

    String grade = this.vendor.getGrade();
    if (grade == null)
      grade = "";

    ServletActionContext.getRequest().setAttribute("grade", grade);

    String rate = this.vendor.getRate();
    if (rate == null)
      rate = "";

    ServletActionContext.getRequest().setAttribute("rate", rate);

    String languagebegin = this.vendor.getLanguagebegin();
    if (languagebegin == null)
      languagebegin = "";

    ServletActionContext.getRequest().setAttribute("languagebegin", 
      languagebegin);

    String languageend = this.vendor.getLanguageend();
    if (languageend == null)
      languageend = "";

    ServletActionContext.getRequest().setAttribute("languageend", 
      languageend);

    String newword = this.vendor.getNewword();
    if (newword == null)
      newword = "";

    ServletActionContext.getRequest().setAttribute("newword", newword);

    String review = this.vendor.getReview();
    if (review == null)
      review = "";

    ServletActionContext.getRequest().setAttribute("review", review);

    String postediting = this.vendor.getPostediting();
    if (postediting == null)
      postediting = "";

    ServletActionContext.getRequest().setAttribute("postediting", 
      postediting);

    String hourlyrate = this.vendor.getHourlyrate();
    if (hourlyrate == null)
      hourlyrate = "";

    ServletActionContext.getRequest().setAttribute
      ("hourlyrate", hourlyrate);

    String dalitycapacity = this.vendor.getDailycapacity();
    if (dalitycapacity == null)
      dalitycapacity = "";

    ServletActionContext.getRequest().setAttribute("dalitycapacity", 
      dalitycapacity);

    String vendor_field_other = this.vendor.getVendor_field_other();
    if (vendor_field_other == null)
      vendor_field_other = "";

    ServletActionContext.getRequest().setAttribute("vendor_field_other", 
      vendor_field_other);

    String vendor_cat_other = this.vendor.getVendor_cat_other();
    if (vendor_cat_other == null)
      vendor_cat_other = "";

    ServletActionContext.getRequest().setAttribute("vendor_cat_other", 
      vendor_cat_other);

    String vendortype = this.vendor.getVendortype();
    if (vendortype == null)
      vendortype = "";

    ServletActionContext.getRequest().setAttribute
      ("vendortype", vendortype);
    return "success";
  }

  public String deleteVendor() throws Exception {
    String currentpage = "";
    if (this.vendor.getId() != 0) {
      currentpage = this.vendor.getRemark1();
      VendorScheduleDao VendorScheduleDao = new VendorScheduleDao();
      VendorScheduleDao.deleteScheduleByVendor(this.vendor.getVendorid());
      this.vendorManager.deleteVendor
        (Integer.valueOf(this.vendor.getId()));

      this.totalSize = this.vendorManager.countVendor();
      this.totalPage = PageBean.countTotalPage(this.pageSize, 
        this.totalSize);
      if (currentpage != null)
        this.page = Integer.parseInt(currentpage);

      this.page = PageBean.countCurrentPage(this.page);
      this.vendors = this.vendorManager.browseVendor(this.page, 
        this.pageSize);
      for (int i = 0; i < this.vendors.size(); ++i) {
        String languagepair = "";
        String fg = "";
        if (((Vendor)this.vendors.get(i)).getLanguagebegin() != null) {
          String[] languagebegin = ((Vendor)this.vendors.get(i)).getLanguagebegin
            ().split(",");
          String[] languageend = ((Vendor)this.vendors.get(i)).getLanguageend
            ().split(",");
          if (languagebegin.length > 0)
            for (int j = 0; j < languagebegin.length; ++j) {
              if (j >= 1)
                fg = " , ";

              languagepair = languagepair + fg + languagebegin[j] + 
                " to " + languageend[j];
            }

          ((Vendor)this.vendors.get(i)).setLanguagebegin
            (languagepair);
        }
      }
      for (int j = 0; j < this.vendors.size(); ++j) {
        String vendorid = ((Vendor)this.vendors.get(j)).getVendorid();
        QaInfoDao qainfodao = new QaInfoDao();
        String averagescore = qainfodao.VendorAvergeScore(vendorid);
        ((Vendor)this.vendors.get(j)).setAveragescore(averagescore);
      }
      PageBean pageBean = new PageBean();
      pageBean.setList(this.vendors);
      pageBean.setTotalSize(this.totalSize);
      pageBean.setPageSize(this.pageSize);
      pageBean.setTotalPage(this.totalPage);
      pageBean.setCurrentPage(this.page);
      pageBean.init();
      Map request = (Map)ActionContext.getContext().get("request");
      request.put("list", this.vendors);
      ServletActionContext.getRequest().setAttribute
        ("pageBean", pageBean);
      ServletActionContext.getRequest().setAttribute("currentpage", 
        Integer.valueOf(pageBean.getCurrentPage()));
      return "success";
    }
    return "fail";
  }

  public String updateVendor() throws Exception {
    String currentpage = "";
    Vendor vendor_new = new Vendor();
    vendor_new.setVendorid(this.vendor.getRemark1());
    vendor_new.setVendor_name(this.vendor.getRemark2());
    vendor_new.setChinese_name("");
    if (this.vendor.getId() != 0) {
      if (!(this.vendor.getVendor_field_other().equals("")))
        this.vendor.setVendor_field(this.vendor.getVendor_field() + "," + 
          this.vendor.getVendor_field_other());

      if (!(this.vendor.getVendor_cat_other().equals("")))
        this.vendor.setVendor_cat(this.vendor.getVendor_cat() + "," + 
          this.vendor.getVendor_cat_other());

      this.vendor.setYxbz("Y");
      this.vendorManager.updateVendor(this.vendor);
      VendorDao vendordao = new VendorDao();
      vendordao.updateVendorDalicityCapacity(this.vendor.getVendorid(), 
        this.vendor.getDailycapacity());
      currentpage = this.vendor.getRemark3();

      this.totalSize = this.vendorManager.countSelectVendor(vendor_new);
      this.totalPage = PageBean.countTotalPage(this.pageSize, 
        this.totalSize);
      if (currentpage != null)
        this.page = Integer.parseInt(currentpage);

      this.page = PageBean.countCurrentPage(this.page);
      this.vendors = this.vendorManager.selectVendor(this.page, 
        this.pageSize, vendor_new);
      for (int i = 0; i < this.vendors.size(); ++i) {
        String languagepair = "";
        String fg = "";
        if (((Vendor)this.vendors.get(i)).getLanguagebegin() != null) {
          String[] languagebegin = ((Vendor)this.vendors.get(i)).getLanguagebegin
            ().split(",");
          String[] languageend = ((Vendor)this.vendors.get(i)).getLanguageend
            ().split(",");
          if (languagebegin.length > 0)
            for (int j = 0; j < languagebegin.length; ++j) {
              if (j >= 1)
                fg = " , ";

              languagepair = languagepair + fg + languagebegin[j] + 
                " to " + languageend[j];
            }

          ((Vendor)this.vendors.get(i)).setLanguagebegin
            (languagepair);
        }
      }
      for (int j = 0; j < this.vendors.size(); ++j) {
        String vendorid = ((Vendor)this.vendors.get(j)).getVendorid();
        QaInfoDao qainfodao = new QaInfoDao();
        String averagescore = qainfodao.VendorAvergeScore(vendorid);
        ((Vendor)this.vendors.get(j)).setAveragescore(averagescore);
      }
      PageBean pageBean = new PageBean();
      pageBean.setList(this.vendors);
      pageBean.setTotalSize(this.totalSize);
      pageBean.setPageSize(this.pageSize);
      pageBean.setTotalPage(this.totalPage);
      pageBean.setCurrentPage(this.page);
      pageBean.init();
      Map request = (Map)ActionContext.getContext().get("request");
      request.put("list", this.vendors);
      ServletActionContext.getRequest().setAttribute
        ("pageBean", pageBean);
      ServletActionContext.getRequest().setAttribute("currentpage", 
        Integer.valueOf(pageBean.getCurrentPage()));
      return "success";
    }
    return "fail";
  }

  public Object getModel() {
    return this.vendor;
  }

  public int getPage() {
    return this.page;
  }

  public void setPage(int page) {
    this.page = page;
  }

  public VendorManager getVendorManager() {
    return this.vendorManager;
  }

  @Resource
  public void setVendorManager(VendorManager vendorManager) {
    this.vendorManager = vendorManager;
  }

  public List<Vendor> getVendors() {
    return this.vendors;
  }

  public void setVendors(List<Vendor> vendors) {
    this.vendors = vendors;
  }

  public Vendor getVendor() {
    return this.vendor;
  }

  public void setVendor(Vendor vendor) {
    this.vendor = vendor;
  }

  public ScheduleManager getScheduleManager() {
    return this.scheduleManager;
  }

  @Resource
  public void setScheduleManager(ScheduleManager scheduleManager) {
    this.scheduleManager = scheduleManager;
  }
}