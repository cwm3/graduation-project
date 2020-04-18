package com.productsystem.action;

import com.datacollect.DistributionDao;
import com.datacollect.VendorDao;
import com.datacollect.VendorScheduleDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.productsystem.model.Project;
import com.productsystem.service.ProjectManager;
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

@Component("t")
@Scope("prototype")
public class ProjectAction extends ActionSupport
  implements ModelDriven
{
  private ProjectManager projectManager;
  private List<Project> projects;
  private Project project = new Project();
  private String vendorid;
  private int totalSize = 0;
  private int pageSize = 15;
  private int totalPage = 0;
  private int page = 1;

  public String addProject()
    throws Exception
  {
    this.project.setYxbz("Y");
    Date now_date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String lrrq = sdf.format(now_date);
    this.project.setLrrq(lrrq);
    this.projectManager.saveOrUpdateProject(this.project);
    return "success";
  }

  public String browse() throws Exception {
    ActionContext ctx = ActionContext.getContext();
    if (ctx.getSession().get("username") == null)
      return "fail";

    String department = ctx.getSession().get("department").toString();
    String userposition = ctx.getSession().get("userposition").toString();
    this.project.setUserposition(userposition);

    if (this.project.getRemark1().equals("1")) {
      ctx.getSession().put("costcode_po", this.project.getCostcode());
      ctx.getSession().put("dropdate_po", this.project.getDropdate());
      ctx.getSession().put("deadline_po", this.project.getDeadline());
      ctx.getSession().put("lead_qa", this.project.getLead());
      ctx.getSession().put("client_qa", this.project.getClient());
      ctx.getSession().put("status_qa", this.project.getStatus());
      ctx.getSession().put("yxbz_qa", this.project.getYxbz());
      ctx.getSession().put("potype_qa", this.project.getPotype());
      ctx.getSession().put("remark2_qa", this.project.getRemark2());
    }
    else
    {
      String costcode = ctx.getSession().get("costcode_po").toString();
      String dropdate = ctx.getSession().get("dropdate_po").toString();
      String deadline = ctx.getSession().get("deadline_po").toString();
      String lead = ctx.getSession().get("lead_qa").toString();
      String client = ctx.getSession().get("client_qa").toString();
      String status = ctx.getSession().get("status_qa").toString();
      String yxbz = ctx.getSession().get("yxbz_qa").toString();
      String potype = ctx.getSession().get("potype_qa").toString();
      String remark2 = ctx.getSession().get("remark2_qa").toString();
      this.project.setCostcode(costcode);
      this.project.setDropdate(dropdate);
      this.project.setDeadline(deadline);
      this.project.setLead(lead);
      this.project.setClient(client);
      this.project.setUserposition(userposition);
      this.project.setStatus(status);
      this.project.setYxbz(yxbz);
      this.project.setPotype(potype);
      this.project.setRemark2(remark2);
    }

    this.totalSize = this.projectManager.countProject(this.project);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.projects = this.projectManager.browseProject(this.page, this.pageSize, this.project);

    for (int i = 0; i < this.projects.size(); ++i) {
      String languagepair = "";
      String fg = "";
      if (((Project)this.projects.get(i)).getLanguagebegin() != null) {
        String[] languagebegin = ((Project)this.projects.get(i)).getLanguagebegin().split(",");
        String[] languageend = ((Project)this.projects.get(i)).getLanguageend().split(",");
        if (languagebegin.length > 0)
          for (int j = 0; j < languagebegin.length; ++j) {
            if (j >= 1)
              fg = " , ";

            languagepair = languagepair + fg + languagebegin[j] + " to " + languageend[j];
          }

        ((Project)this.projects.get(i)).setLanguagebegin(languagepair);
      }
    }

    for (int i = 0; i < this.projects.size(); ++i)
      if (((Project)this.projects.get(i)).getSystemcode() != null) {
        DistributionDao distributiondao = new DistributionDao();
        String distributionstatus = distributiondao.getDistributionStatus(((Project)this.projects.get(i)).getSystemcode());
        ((Project)this.projects.get(i)).setRemark6(distributionstatus);
      }


    PageBean pageBean = new PageBean();
    pageBean.setList(this.projects);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);

    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.projects);
    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
    ServletActionContext.getRequest().setAttribute("projectsize", Integer.valueOf(this.projects.size()));
    return "success";
  }

  public String list() throws Exception {
    this.projects = this.projectManager.browseProject();
    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.projects);
    return "success";
  }

  public String loadProject() throws Exception {
    this.project = this.projectManager.loadProject(Integer.valueOf(this.project.getId()));
    ServletActionContext.getRequest().setAttribute("project", this.project);
    return "success";
  }

  public String deleteProject() throws Exception {
    
    ActionContext ctx = ActionContext.getContext();
    if (ctx.getSession().get("username") == null)
      return "fail";
    String department = ctx.getSession().get("department").toString();
    String userposition = ctx.getSession().get("userposition").toString();
    
    String costcode = ctx.getSession().get("costcode_po").toString();
    String dropdate = ctx.getSession().get("dropdate_po").toString();
    String deadline = ctx.getSession().get("deadline_po").toString();
    String lead = ctx.getSession().get("lead_qa").toString();
    String client = ctx.getSession().get("client_qa").toString();

    String status = ctx.getSession().get("status_qa").toString();
    String yxbz = ctx.getSession().get("yxbz_qa").toString();
    String potype = ctx.getSession().get("potype_qa").toString();
    String remark2 = ctx.getSession().get("remark2_qa").toString();
        
        this.project.setCostcode(costcode);
        this.project.setDropdate(dropdate);
        this.project.setDeadline(deadline);
        this.project.setLead(lead);
        this.project.setClient(client);
        this.project.setUserposition(userposition);
        this.project.setStatus(status);
        this.project.setYxbz(yxbz);
        this.project.setPotype(potype);
        this.project.setRemark2(remark2);
        
      if(this.project.getId()!=0) {
    	  
      VendorScheduleDao  vendorscheduledao =  new VendorScheduleDao();
      vendorscheduledao.deleteSchedule(this.project.getId()+"");
      this.projectManager.deleteProject(Integer.valueOf(this.project.getId()));

      this.totalSize = this.projectManager.countProject(this.project);
      this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
      if (ServletActionContext.getRequest().getParameter("page") != null)
        this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));

      this.page = PageBean.countCurrentPage(this.page);
      this.projects = this.projectManager.browseProject(this.page, this.pageSize, this.project);
      
      for (int i = 0; i < this.projects.size(); ++i) {
        String languagepair = "";
        String fg = "";
        if (((Project)this.projects.get(i)).getLanguagebegin() != null) {
          String[] languagebegin = ((Project)this.projects.get(i)).getLanguagebegin
            ().split(",");
          String[] languageend = ((Project)this.projects.get(i)).getLanguageend
            ().split(",");
          if (languagebegin.length > 0)
            for (int j = 0; j < languagebegin.length; ++j) {
              if (j >= 1)
                fg = " , ";

              languagepair = languagepair + fg + languagebegin[j] + 
                " to " + languageend[j];
            }

          ((Project)this.projects.get(i)).setLanguagebegin(languagepair);
        }
      }
      
      for (int i = 0; i < this.projects.size(); ++i)
          if (((Project)this.projects.get(i)).getSystemcode() != null) {
            DistributionDao distributiondao = new DistributionDao();
            String distributionstatus = distributiondao.getDistributionStatus(((Project)this.projects.get(i)).getSystemcode());
            ((Project)this.projects.get(i)).setRemark6(distributionstatus);
          }
      
      PageBean pageBean = new PageBean();
      pageBean.setList(this.projects);
      pageBean.setTotalSize(this.totalSize);
      pageBean.setPageSize(this.pageSize);
      pageBean.setTotalPage(this.totalPage);
      pageBean.setCurrentPage(this.page);

      pageBean.init();

      Map request = (Map)ActionContext.getContext().get("request");
      request.put("list", this.projects);
      ServletActionContext.getRequest().setAttribute("projectsize", Integer.valueOf(this.projects.size()));
      ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
      ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
      return "success";
    }
    return "fail";
  }

  public String updateProject() throws Exception {
    if (this.project.getId() != 0) {
      this.project.setYxbz("Y");
      this.projectManager.updateProject(this.project);
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
    this.projects = this.projectManager.listProjectByTiaoJian(this.project);
    for (int i = 0; i < this.projects.size(); ++i)
      if (((Project)this.projects.get(i)).getSystemcode() != null) {
        DistributionDao distributiondao = new DistributionDao();
        String distributionstatus = distributiondao.getDistributionStatus(((Project)this.projects.get(i)).getSystemcode());
        ((Project)this.projects.get(i)).setRemark6(distributionstatus);
      }

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.projects);
    return "success";
  }

  public Object getModel() {
    return this.project;
  }

  public int getPage() {
    return this.page;
  }

  public void setPage(int page) {
    this.page = page;
  }

  public ProjectManager getProjectManager() {
    return this.projectManager;
  }

  @Resource
  public void setProjectManager(ProjectManager projectManager) {
    this.projectManager = projectManager;
  }

  public List<Project> getProjects() {
    return this.projects;
  }

  public void setProjects(List<Project> projects) {
    this.projects = projects;
  }

  public Project getProject() {
    return this.project;
  }

  public void setProject(Project project) {
    this.project = project;
  }

  public String getVendorid() {
    return this.vendorid;
  }

  public void setVendorid(String vendorid) {
    this.vendorid = vendorid;
  }
}