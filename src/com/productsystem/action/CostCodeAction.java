package com.productsystem.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.productsystem.model.CostCode;
import com.productsystem.service.CostCodeManager;
import com.productsystem.util.PageBean;
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

@Component("c")
@Scope("prototype")
public class CostCodeAction extends ActionSupport
  implements ModelDriven
{
  private CostCodeManager costcodeManager;
  private List<CostCode> costcodes;
  private CostCode costcode = new CostCode();
  private String vendorid;
  private int totalSize = 0;
  private int pageSize = 15;
  private int totalPage = 0;
  private int page = 1;

  public String addCostCode()
    throws Exception
  {
    this.costcode.setYxbz("Y");
    this.costcodeManager.saveOrUpdateCostCode(this.costcode);
    return "success";
  }

  public String browse() throws Exception {
    ActionContext ctx = ActionContext.getContext();
    if (this.costcode.getYxbz().equals("1")) {
      ctx.getSession().put("costcode", this.costcode.getCostcode());
      ctx.getSession().put("clientname", this.costcode.getClientname());
      ctx.getSession().put("lead", this.costcode.getLead());
      ctx.getSession().put("datedate", this.costcode.getDatedate());
      ctx.getSession().put("vendor_field", 
        this.costcode.getVendor_field());
    } else {
      String costcode1 = ctx.getSession().get("costcode").toString();
      String clientname = ctx.getSession().get("clientname").toString();
      String lead = ctx.getSession().get("lead").toString();
      String datedate = ctx.getSession().get("datedate").toString();
      String vendor_field = ctx.getSession().get("vendor_field").toString
        ();

      this.costcode.setCostcode(costcode1);
      this.costcode.setClientname(clientname);
      this.costcode.setLead(lead);
      this.costcode.setDatedate(datedate);
      this.costcode.setVendor_field(vendor_field);
    }
    this.totalSize = this.costcodeManager.countCostCode(this.costcode);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.costcodes = this.costcodeManager.browse(this.page, this.pageSize, 
      this.costcode);

    PageBean pageBean = new PageBean();
    pageBean.setList(this.costcodes);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);

    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.costcodes);
    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));
    ServletActionContext.getRequest().setAttribute("costcodesize", 
      Integer.valueOf(this.costcodes.size()));
    return "success";
  }

  public String list() throws Exception {
    this.costcodes = this.costcodeManager.browseCostCode();
    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.costcodes);
    return "success";
  }

  public String loadCostCode() throws Exception {
    this.costcode = this.costcodeManager.loadCostCode(
      Integer.valueOf(this.costcode.getId()));
    ServletActionContext.getRequest().setAttribute("costcode", 
      this.costcode);
    return "success";
  }

  public String deleteCostCode() throws Exception {
    if (this.costcode.getId() != 0) {
      this.costcodeManager.deleteCostCode(Integer.valueOf(this.costcode.getId
        ()));
      this.totalSize = this.costcodeManager.countCostCode();
      this.totalPage = PageBean.countTotalPage(this.pageSize, 
        this.totalSize);
      if (ServletActionContext.getRequest().getParameter("page") != null)
        this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
          ("page"));

      this.page = PageBean.countCurrentPage(this.page);
      this.costcodes = this.costcodeManager.browse(this.page, 
        this.pageSize);

      PageBean pageBean = new PageBean();
      pageBean.setList(this.costcodes);
      pageBean.setTotalSize(this.totalSize);
      pageBean.setPageSize(this.pageSize);
      pageBean.setTotalPage(this.totalPage);
      pageBean.setCurrentPage(this.page);

      pageBean.init();

      Map request = (Map)ActionContext.getContext().get("request");
      request.put("list", this.costcodes);
      ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
      ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
      ServletActionContext.getRequest().setAttribute("costcodesize", 
        Integer.valueOf(this.costcodes.size()));
      return "success";
    }
    return "fail";
  }

  public String updateCostCode() throws Exception {
    if (this.costcode.getId() != 0) {
      this.costcode.setYxbz("Y");
      this.costcodeManager.updateCostCode(this.costcode);
      return "update_success";
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

  public String loadProjecBySystemCode() throws Exception {
    this.costcodes = this.costcodeManager.listCostCodeByTiaoJian
      (this.costcode);
    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.costcodes);
    return "success";
  }

  public Object getModel() {
    return this.costcode;
  }

  public int getPage() {
    return this.page;
  }

  public void setPage(int page) {
    this.page = page;
  }

  public CostCodeManager getCostCodeManager() {
    return this.costcodeManager;
  }

  @Resource
  public void setCostCodeManager(CostCodeManager costcodeManager) {
    this.costcodeManager = costcodeManager;
  }

  public List<CostCode> getCostCodes() {
    return this.costcodes;
  }

  public void setCostCodes(List<CostCode> costcodes) {
    this.costcodes = costcodes;
  }

  public CostCode getCostCode() {
    return this.costcode;
  }

  public void setCostCode(CostCode costcode) {
    this.costcode = costcode;
  }

  public String getVendorid() {
    return this.vendorid;
  }

  public void setVendorid(String vendorid) {
    this.vendorid = vendorid;
  }
}