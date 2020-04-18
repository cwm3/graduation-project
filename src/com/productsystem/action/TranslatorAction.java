package com.productsystem.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.productsystem.model.Translator;
import com.productsystem.service.TranslatorManager;
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

@Component("f")
@Scope("prototype")
public class TranslatorAction extends ActionSupport
  implements ModelDriven
{
  private TranslatorManager translatorManager;
  private List<Translator> translators;
  private Translator translator = new Translator();
  private String vendorid;
  private int totalSize = 0;
  private int pageSize = 15;
  private int totalPage = 0;
  private int page = 1;

  public String addTranslator()
    throws Exception
  {
    this.translator.setYxbz("Y");
    this.translatorManager.saveOrUpdateTranslator(this.translator);
    return "success";
  }

  public String browse() throws Exception {
    ActionContext ctx = ActionContext.getContext();

    if (ctx.getSession().get("username") == null)
      return "fail";

    if (this.translator.getYxbz().equals("1")) {
      ctx.getSession().put("translatorname_tr", this.translator.getTranslatorname());
      ctx.getSession().put("officee_tr", this.translator.getOffice());
    }
    else {
      this.translator.setTranslatorname(ctx.getSession().get("translatorname_tr").toString());
      this.translator.setOffice(ctx.getSession().get("officee_tr").toString());
    }
    this.totalSize = this.translatorManager.countTranslator(this.translator);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
        ("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.translators = this.translatorManager.browse(this.page, this.pageSize, 
      this.translator);

    PageBean pageBean = new PageBean();
    pageBean.setList(this.translators);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);

    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.translators);
    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", 
      Integer.valueOf(pageBean.getCurrentPage()));
    ServletActionContext.getRequest().setAttribute("translatorsize", 
      Integer.valueOf(this.translators.size()));
    return "success";
  }

  public String list() throws Exception {
    this.translators = this.translatorManager.browseTranslator();
    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.translators);
    return "success";
  }

  public String loadTranslator() throws Exception {
    this.translator = this.translatorManager.loadTranslator(
      Integer.valueOf(this.translator.getTranslatorid()));
    ServletActionContext.getRequest().setAttribute("translator", 
      this.translator);
    return "success";
  }

  public String deleteTranslator() throws Exception {
    if (this.translator.getTranslatorid() != 0) {
      this.translatorManager.deleteTranslator(Integer.valueOf(this.translator.getTranslatorid()));
      this.totalSize = this.translatorManager.countTranslator();
      this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
      if (ServletActionContext.getRequest().getParameter("page") != null)
        this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));

      this.page = PageBean.countCurrentPage(this.page);
      this.translators = this.translatorManager.browse(this.page, this.pageSize);

      PageBean pageBean = new PageBean();
      pageBean.setList(this.translators);
      pageBean.setTotalSize(this.totalSize);
      pageBean.setPageSize(this.pageSize);
      pageBean.setTotalPage(this.totalPage);
      pageBean.setCurrentPage(this.page);

      pageBean.init();

      Map request = (Map)ActionContext.getContext().get("request");
      request.put("list", this.translators);
      ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
      ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
      ServletActionContext.getRequest().setAttribute("translatorsize", Integer.valueOf(this.translators.size()));
      return "success";
    }
    return "fail";
  }

  public String updateTranslator() throws Exception {
    if (this.translator.getTranslatorid() != 0) {
      this.translator.setYxbz("Y");
      this.translatorManager.updateTranslator(this.translator);
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
    this.translators = this.translatorManager.listTranslatorByTiaoJian(this.translator);
    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.translators);
    return "success";
  }

  public Object getModel() {
    return this.translator;
  }

  public int getPage() {
    return this.page;
  }

  public void setPage(int page) {
    this.page = page;
  }

  public TranslatorManager getTranslatorManager() {
    return this.translatorManager;
  }

  @Resource
  public void setTranslatorManager(TranslatorManager translatorManager) {
    this.translatorManager = translatorManager;
  }

  public List<Translator> getTranslators() {
    return this.translators;
  }

  public void setTranslators(List<Translator> translators) {
    this.translators = translators;
  }

  public Translator getTranslator() {
    return this.translator;
  }

  public void setTranslator(Translator translator) {
    this.translator = translator;
  }

  public String getVendorid() {
    return this.vendorid;
  }

  public void setVendorid(String vendorid) {
    this.vendorid = vendorid;
  }
}