package com.productsystem.action;

import com.datacollect.DistributionDao;
import com.datacollect.VendorDao;
import com.datacollect.VendorScheduleDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.productsystem.model.Distribution;
import com.productsystem.model.Project;
import com.productsystem.service.DistributionManager;
import com.productsystem.util.PageBean;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;

@Scope("prototype")
public class DistributionAction extends ActionSupport
  implements ModelDriven
{
  private DistributionManager distributionManager;
  private List<Distribution> distributions;
  private String systemcode;
  private Distribution distribution = new Distribution();
  private int totalSize = 0;
  private int pageSize = 12;
  private int totalPage = 0;
  private int page = 1;

  public String getSystemcode()
  {
    return this.systemcode;
  }

  public void setSystemcode(String systemcode) {
    this.systemcode = systemcode;
  }

  public String addOneExternalDistribution()
    throws Exception
  {
    String systemcodeall = this.distribution.getSystemcodeall();
    systemcodeall = systemcodeall.replace("'", "");
    UUID ranId = UUID.randomUUID();
    String pzxh = ranId.toString().replace("-", "");
    String vendorid = this.distribution.getVendorid();
    String vendorname = this.distribution.getVendorname();

    String startdate = this.distribution.getStartdate();
    String enddate = this.distribution.getEnddate();
    String worktype = this.distribution.getWorktype();
    String totalwords = this.distribution.getTotalwords();
    String coorespondingwords = this.distribution.getCoorespondingwords();
    String outsourcedponumber = this.distribution.getOutsourcedponumber();
    String projectvalue = this.distribution.getProjectvalue();
    String hourlywork = this.distribution.getHourlywork();
    if ((hourlywork == null) || (hourlywork.equals("")))
      hourlywork = "0";

    String lead = this.distribution.getLead();
    this.distribution.setYxbz("Y");
    this.distribution.setPzxh(pzxh);
    this.distribution.setStatus("in process");
    VendorScheduleDao vendorschedule = new VendorScheduleDao();
    vendorschedule.updateCapacitybydistribution(vendorid, vendorname, coorespondingwords, startdate, enddate, systemcodeall, pzxh, 
      lead, worktype, hourlywork, totalwords, projectvalue, outsourcedponumber);
    this.distribution.setSystemcode(systemcodeall);
    this.distributionManager.saveOrUpdateDistribution(this.distribution);
    this.distribution.setSystemcode(this.distribution.getSystemcodeall());
    return showDistribution(this.distribution);
  }

  public String addOneInternalDistribution() throws Exception {
    String systemcodeall = this.distribution.getSystemcodeall();
    UUID ranId = UUID.randomUUID();
    String pzxh = ranId.toString().replace("-", "");
    this.distribution.setYxbz("Y");
    this.distribution.setPzxh(pzxh);
    this.distribution.setStatus("in process");
    this.distribution.setSystemcode(systemcodeall.replace("'", ""));
    this.distributionManager.saveOrUpdateDistribution(this.distribution);

    this.distribution.setSystemcode(systemcodeall);
    return showDistribution(this.distribution);
  }

  public String addMuchInternalDistribution() throws Exception {
    String systemcodeall = this.distribution.getSystemcodeall();
    UUID ranId = UUID.randomUUID();
    String pzxh = ranId.toString().replace("-", "");
    DistributionDao distributiondao = new DistributionDao();
    Project project = new Project();
    String commments = this.distribution.getComments();
    String coorespondingwords = this.distribution.getCoorespondingwords();
    String dropname = this.distribution.getDropname();
    String enddate = this.distribution.getEnddate();
    String startdate = this.distribution.getStartdate();
    String lead = this.distribution.getLead();
    String outsourcedponumber = this.distribution.getOutsourcedponumber();
    String projectvalue = this.distribution.getProjectvalue();
    String worktype = this.distribution.getWorktype();
    String resource = this.distribution.getResource();
    String ho = this.distribution.getHo();

    String[] systemcode = systemcodeall.split(",");
    for (int i = 0; i < systemcode.length; ++i) {
      Distribution distribution_add = new Distribution();
      project = distributiondao.FindProject(systemcode[i], worktype);

      distribution_add.setPzxh(pzxh);
      distribution_add.setYxbz("Y");
      distribution_add.setSystemcode(systemcode[i].replace("'", ""));
      distribution_add.setHourlywork(project.getHourlywork());
      distribution_add.setPostediting(project.getPostediting());
      distribution_add.setNewwords(project.getNewwords());
      distribution_add.setRate1(project.getRate1());
      distribution_add.setRate2(project.getRate2());
      distribution_add.setRate3(project.getRate3());
      distribution_add.setRate4(project.getRate4());
      distribution_add.setTotalwords(project.getTotalwords());
      distribution_add.setComments(commments);
      distribution_add.setResource(resource);
      distribution_add.setCoorespondingwords(coorespondingwords);
      distribution_add.setDropname(dropname);
      distribution_add.setEnddate(enddate);
      distribution_add.setStartdate(startdate);
      distribution_add.setLead(lead);
      distribution_add.setOutsourcedponumber(outsourcedponumber);
      distribution_add.setProjectvalue(projectvalue);
      distribution_add.setWorktype(worktype);
      distribution_add.setStatus("in process");
      distribution_add.setHo(ho);
      this.distributionManager.saveOrUpdateDistribution(distribution_add);
    }
    this.distribution.setSystemcode(systemcodeall);
    return showDistribution(this.distribution);
  }

  public String addMuchExternalDistribution() throws Exception {
    String systemcodeall = this.distribution.getSystemcodeall();
    UUID ranId = UUID.randomUUID();
    String pzxh = ranId.toString().replace("-", "");
    DistributionDao distributiondao = new DistributionDao();
    Project project = new Project();
    String commments = this.distribution.getComments();
    String dropname = this.distribution.getDropname();
    String enddate = this.distribution.getEnddate();
    String startdate = this.distribution.getStartdate();
    String lead = this.distribution.getLead();
    String vendorid = this.distribution.getVendorid();
    String vendorname = this.distribution.getVendorname();
    String coorespondingwords = "";
    String outsourcedponumber = this.distribution.getOutsourcedponumber();
    String projectvalue = this.distribution.getProjectvalue();
    String worktype = this.distribution.getWorktype();
    String resource = this.distribution.getResource();
    String ho = this.distribution.getHo();

    String[] systemcode = systemcodeall.split(",");
    for (int i = 0; i < systemcode.length; ++i) {
      Distribution distribution_add = new Distribution();
      project = distributiondao.FindProject(systemcode[i], worktype);
      distribution_add.setPzxh(pzxh);
      distribution_add.setYxbz("Y");
      distribution_add.setSystemcode(systemcode[i].replace("'", ""));
      distribution_add.setVendorid(vendorid);
      distribution_add.setVendorname(vendorname);
      distribution_add.setHourlywork(project.getHourlywork());
      distribution_add.setPostediting(project.getPostediting());
      distribution_add.setNewwords(project.getNewwords());
      distribution_add.setRate1(project.getRate1());
      distribution_add.setRate2(project.getRate2());
      distribution_add.setRate3(project.getRate3());
      distribution_add.setRate4(project.getRate4());
      distribution_add.setTotalwords(project.getTotalwords());
      distribution_add.setComments(commments);
      distribution_add.setResource(resource);
      distribution_add.setHo(ho);

      String totalwords = project.getTotalwords();
      if (worktype.equals("translation"))
        coorespondingwords = totalwords;

      if (worktype.equals("review"))
        coorespondingwords = Float.parseFloat(totalwords) / 3.0F+"";

      if (worktype.equals("hourlywork")) {
        VendorDao vendordao = new VendorDao();
        String hourcalute = vendordao.FindDalityCapacityByVendorName(vendorid);
        coorespondingwords = Float.parseFloat(project.getHourlywork()) * Float.parseFloat(hourcalute) / 8.0F +"";
      }
      String hourlywork = project.getHourlywork();
      if ((hourlywork == null) || (hourlywork.equals("")))
        hourlywork = "0";

      distribution_add.setCoorespondingwords(coorespondingwords);
      distribution_add.setDropname(dropname);
      distribution_add.setEnddate(enddate);
      distribution_add.setStartdate(startdate);
      distribution_add.setLead(lead);
      distribution_add.setOutsourcedponumber(outsourcedponumber);
      distribution_add.setProjectvalue(projectvalue);
      distribution_add.setWorktype(worktype);
      distribution_add.setStatus("in process");

      this.distributionManager.saveOrUpdateDistribution(distribution_add);
      VendorScheduleDao vendorschedule = new VendorScheduleDao();
      vendorschedule.updateCapacitybydistribution(vendorid, vendorname, coorespondingwords, startdate, enddate, 
        systemcode[i].replace("'", ""), pzxh, lead, worktype, hourlywork, project.getTotalwords(), projectvalue, outsourcedponumber);
    }
    this.distribution.setSystemcode(systemcodeall);
    return showDistribution(this.distribution);
  }

  public String showDistribution(Distribution distribution) throws Exception {
    this.totalSize = this.distributionManager.countSelectDistribution(distribution);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.distributions = this.distributionManager.selectDistribution(this.page, this.pageSize, distribution);
    for (int i = 0; i < this.distributions.size(); ++i) {
      String systemcode = ((Distribution)this.distributions.get(i)).getSystemcode().replace("'", "");
      ((Distribution)this.distributions.get(i)).setSystemcode(systemcode);
    }
    PageBean pageBean = new PageBean();
    pageBean.setList(this.distributions);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.distributions);

    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public String selectDistribution() throws Exception
  {
    ActionContext ctx = ActionContext.getContext();
    if (ctx.getSession().get("username") == null) {
      return "fail";
    }

    if (this.distribution.getRemark1().equals("1")) {
      ctx.getSession().put("vendorname_dis", this.distribution.getVendorname());
      ctx.getSession().put("costcode_dis", this.distribution.getSystemcode());
      ctx.getSession().put("comments_dis", this.distribution.getComments());
      ctx.getSession().put("resource_qa", this.distribution.getResource());
      ctx.getSession().put("outsourcedponumber_qa", this.distribution.getOutsourcedponumber());
      ctx.getSession().put("ho_qa", this.distribution.getHo());
    } else {
      this.distribution.setVendorname(ctx.getSession().get("vendorname_dis").toString());
      this.distribution.setSystemcode(ctx.getSession().get("costcode_dis").toString());
      this.distribution.setComments(ctx.getSession().get("comments_dis").toString());
      this.distribution.setResource(ctx.getSession().get("resource_qa").toString());
      this.distribution.setOutsourcedponumber(ctx.getSession().get("outsourcedponumber_qa").toString());
      this.distribution.setHo(ctx.getSession().get("ho_qa").toString());
    }
    if ((ctx.getSession().get("userposition") == null) || (ctx.getSession().get("userposition").toString().equals("")))
      this.distribution.setRemark3("");
    else {
      this.distribution.setRemark3(ctx.getSession().get("userposition").toString());
    }

    this.distribution.setRemark4(ctx.getSession().get("username").toString());

    this.totalSize = this.distributionManager.countDistributionSchedule(this.distribution);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.distributions = this.distributionManager.selectDistributionSchedule(this.page, this.pageSize, this.distribution);
    for (int j = 0; j < this.distributions.size(); ++j) {
      String systemcodeall = ((Distribution)this.distributions.get(j)).getSystemcode();
      if (systemcodeall.length() > 3)
        systemcodeall = systemcodeall.substring(0, 3);

      ((Distribution)this.distributions.get(j)).setSystemcodeall(systemcodeall);
    }
    PageBean pageBean = new PageBean();
    pageBean.setList(this.distributions);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.distributions);

    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public void selectDistributionbytiaojian(Distribution distribution) throws Exception {
    this.totalSize = this.distributionManager.countDistributionSchedule(distribution);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.distributions = this.distributionManager.selectDistributionSchedule(this.page, this.pageSize, distribution);
    for (int j = 0; j < this.distributions.size(); ++j) {
      String systemcode = ((Distribution)this.distributions.get(j)).getSystemcode();
      systemcode = systemcode.substring(0, 3);
      ((Distribution)this.distributions.get(j)).setSystemcode(systemcode);
    }
    PageBean pageBean = new PageBean();
    pageBean.setList(this.distributions);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.distributions);

    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
  }

  public String selectDistributionBySystemcode() throws Exception {
    String systemcode = this.distribution.getSystemcode();
    String remark1 = this.distribution.getRemark1();

    this.totalSize = this.distributionManager.countSelectDistributionbysystemcode(this.distribution);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.distributions = this.distributionManager.ListDistributionbysystemcode(this.page, this.pageSize, this.distribution);
    for (int j = 0; j < this.distributions.size(); ++j) {
      ((Distribution)this.distributions.get(j)).setRemark1(remark1);
      if ((((Distribution)this.distributions.get(j)).getHo() != null) && (((Distribution)this.distributions.get(j)).getHo().indexOf("N") != -1))
        ((Distribution)this.distributions.get(j)).setRemark3("111");
      else if ((((Distribution)this.distributions.get(j)).getHo() != null) && (((Distribution)this.distributions.get(j)).getHo().indexOf("Y") != -1))
        ((Distribution)this.distributions.get(j)).setRemark3("222");
    }

    PageBean pageBean = new PageBean();
    pageBean.setList(this.distributions);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.distributions);
    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
    ServletActionContext.getRequest().setAttribute("systemcode", systemcode);
    return "success";
  }

  public String selectDistributionSchedule() throws Exception {
    this.totalSize = this.distributionManager.countDistributionSchedule(this.distribution);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.distributions = this.distributionManager.selectDistributionSchedule(this.page, this.pageSize, this.distribution);

    PageBean pageBean = new PageBean();
    pageBean.setList(this.distributions);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.distributions);

    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public String list() throws Exception {
    this.distributions = this.distributionManager.browseDistribution();
    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.distributions);
    return "success";
  }

  public String loadDistribution() throws Exception {
    this.distribution = this.distributionManager.loadDistribution(Integer.valueOf(this.distribution.getId()));
    ServletActionContext.getRequest().setAttribute("distribution", this.distribution);
    return "success";
  }

  public String deleteDistribution() throws Exception {
    if (this.distribution.getId() != 0) {
      Distribution distribution_new = new Distribution();
      distribution_new = this.distributionManager.loadDistribution(Integer.valueOf(this.distribution.getId()));
      String resource = distribution_new.getResource();
      if (resource.equals("External")) {
        VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
        vendorscheduledao.backVendorCapacity(distribution_new.getPzxh(), distribution_new.getSystemcode());
        vendorscheduledao.deleteVendor_distribution_mx(distribution_new.getPzxh(), distribution_new.getSystemcode());
      }
      this.distributionManager.deleteDistribution(Integer.valueOf(distribution_new.getId()));

      return "DELETE_SUCCESS";
    }
    return "fail";
  }

  public String updateDistribution() throws Exception {
    if (this.distribution.getId() != 0) {
      String systemcode = this.distribution.getSystemcode();
      String lead = this.distribution.getLead();
      this.distribution.setYxbz("Y");
      String resource = this.distribution.getResource();
      if (resource.equals("External")) {
        VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
        vendorscheduledao.rollbackcapactiy(this.distribution.getVendorid(), this.distribution.getPzxh());
        vendorscheduledao.updateCapacitybydistribution(this.distribution.getVendorid(), this.distribution.getVendorname(), 
          this.distribution.getCoorespondingwords(), this.distribution.getStartdate(), this.distribution.getEnddate(), this.distribution.getSystemcode(), 
          this.distribution.getPzxh(), this.distribution.getLead(), this.distribution.getWorktype(), this.distribution.getHourlywork(), 
          this.distribution.getTotalwords(), this.distribution.getProjectvalue(), this.distribution.getOutsourcedponumber());
      }
      DistributionDao distributiondao = new DistributionDao();
      distributiondao.updateDistribution(this.distribution);
      this.distributionManager.updateDistribution(this.distribution);
      return "update_success";
    }
    return "fail";
  }

  public Object getModel() {
    return this.distribution;
  }

  public int getPage() {
    return this.page;
  }

  public void setPage(int page) {
    this.page = page;
  }

  public DistributionManager getDistributionManager() {
    return this.distributionManager;
  }

  @Resource
  public void setDistributionManager(DistributionManager distributionManager) {
    this.distributionManager = distributionManager;
  }

  public List<Distribution> getDistributions() {
    return this.distributions;
  }

  public void setDistributions(List<Distribution> distributions) {
    this.distributions = distributions;
  }

  public Distribution getDistribution() {
    return this.distribution;
  }

  public void setDistribution(Distribution distribution) {
    this.distribution = distribution;
  }
}