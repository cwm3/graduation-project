package com.productsystem.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.productsystem.model.User;
import com.productsystem.service.UserManager;
import com.productsystem.util.PageBean;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("u")
@Scope("prototype")
public class UserAction extends ActionSupport
  implements ModelDriven
{
  private UserManager userManager;
  private List<User> users;
  private User user = new User();
  private int totalSize = 0;
  private int pageSize = 10;
  private int totalPage = 0;
  private int page = 1;

  public String register()
    throws Exception
  {
    if (this.userManager.exists(this.user))
      return "fail";

    this.userManager.saveOrUpdateUser(this.user);
    return "success";
  }

  public String login() throws Exception {
    if (this.userManager.exists(this.user)) {
      User user_new = this.userManager.loadUserByName(this.user.getUsername());
      ServletActionContext.getRequest().setAttribute("username", user_new.getUsername());
      ServletActionContext.getRequest().setAttribute("department", user_new.getDepartment());
      ServletActionContext.getRequest().setAttribute("lmorgl", user_new.getLmorgl());
      ServletActionContext.getRequest().setAttribute("permissionsmodule", user_new.getPermissionsmodule());
      ServletActionContext.getRequest().setAttribute("userposition", user_new.getUserposition());
      ActionContext ctx = ActionContext.getContext();
      ctx.getSession().put("username", user_new.getUsername());
      ctx.getSession().put("permissionsmodule", user_new.getPermissionsmodule());
      ctx.getSession().put("lmorgl", user_new.getLmorgl());
      ctx.getSession().put("userposition", user_new.getUserposition());
      if (user_new.getDepartment() == null)
        ctx.getSession().put("department", "11");
      else
        ctx.getSession().put("department", user_new.getDepartment());

      return "success";
    }
    return "fail";
  }

  public String addUser() throws Exception {
    this.user.setYxbz("Y");
    this.userManager.saveOrUpdateUser(this.user);
    return "ADD_SUCCESS";
  }

  public String browse() throws Exception {
    ActionContext ctx = ActionContext.getContext();
    if (ctx.getSession().get("username") == null)
      return "fail";

    String username = ctx.getSession().get("username").toString();

    this.user.setUsername(username);

    this.totalSize = this.userManager.countUser(this.user);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.users = this.userManager.browseUser(this.page, this.pageSize, 
      this.user);
    PageBean pageBean = new PageBean();
    pageBean.setList(this.users);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.users);

    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));

    return "success";
  }

  public String list() throws Exception {
    this.users = this.userManager.browseUser();
    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.users);
    return "success";
  }

  public String loadUser() throws Exception {
    this.user = this.userManager.loadUser(Integer.valueOf(this.user.getId()));
    ActionContext.getContext().put("userinfo", this.user);

    String username = this.user.getUsername();
    if (username == null)
      username = "";

    ServletActionContext.getRequest().setAttribute("id", 
      Integer.valueOf(this.user.getId()));
    ServletActionContext.getRequest().setAttribute("username", username);

    String password = this.user.getPassword();
    if (password == null)
      password = "";

    ServletActionContext.getRequest().setAttribute("password", password);

    String lmorgl = this.user.getLmorgl();
    if (lmorgl == null)
      lmorgl = "";

    ServletActionContext.getRequest().setAttribute("lmorgl", lmorgl);

    String userposition = this.user.getUserposition();
    if (userposition == null)
      userposition = "";

    ServletActionContext.getRequest().setAttribute("userposition", 
      userposition);

    String permissionsmodule = this.user.getPermissionsmodule();
    if (permissionsmodule == null)
      permissionsmodule = "";

    ServletActionContext.getRequest().setAttribute("permissionsmodule", 
      permissionsmodule);

    String department = this.user.getDepartment();
    if (department == null)
      department = "";

    ServletActionContext.getRequest().setAttribute
      ("department", department);

    return "success";
  }

  public User loadUserByName() throws Exception {
    this.user = this.userManager.loadUserByName(this.user.getUsername());
    return this.user;
  }

  public String deleteUser() throws Exception {
    if (this.user.getId() != 0) {
      this.userManager.deleteUser(Integer.valueOf(this.user.getId()));
      return "success";
    }
    return "fail";
  }

  public String updateuser() throws Exception {
    if (this.user.getId() != 0) {
      this.user.setYxbz("Y");
      this.userManager.updateUser(this.user);
      return "success";
    }
    return "fail";
  }

  public Object getModel() {
    return this.user;
  }

  public int getPage() {
    return this.page;
  }

  public void setPage(int page) {
    this.page = page;
  }

  public UserManager getUserManager() {
    return this.userManager;
  }

  @Resource
  public void setUserManager(UserManager userManager) {
    this.userManager = userManager;
  }

  public List<User> getUsers() {
    return this.users;
  }

  public void setUsers(List<User> users) {
    this.users = users;
  }

  public User getUser() {
    return this.user;
  }

  public void setUser(User user) {
    this.user = user;
  }
}