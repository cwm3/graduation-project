package com.productsystem.action;

import com.datacollect.QaInfoDao;
import com.datacollect.TestRead;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.productsystem.model.Qa;
import com.productsystem.service.QaManager;
import com.productsystem.util.PageBean;
import java.io.File;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("q")
@Scope("prototype")
public class QaAction extends ActionSupport
  implements ModelDriven
{
  private QaManager qaManager;
  private List<Qa> qas;
  private Qa qa = new Qa();
  private List<String> listvendor = new ArrayList();
  private List<String> listlead = new ArrayList();
  private int totalSize = 0;
  private int pageSize = 15;
  private int totalPage = 0;
  private int page = 1;
  private File upload;
  private String uploadContentType;
  private String uploadFileName;

  public File getUpload()
  {
    return this.upload;
  }

  public void setUpload(File upload) {
    this.upload = upload;
  }

  public String getUploadContentType() {
    return this.uploadContentType;
  }

  public void setUploadContentType(String uploadContentType) {
    this.uploadContentType = uploadContentType;
  }

  public String getUploadFileName() {
    return this.uploadFileName;
  }

  public void setUploadFileName(String uploadFileName) {
    this.uploadFileName = uploadFileName;
  }

  public Map<String, Object> getRequest() {
    return ((Map)ActionContext.getContext().get("request"));
  }

  public Map<String, Object> getSession() {
    return ActionContext.getContext().getSession();
  }

  public Map<String, Object> getAppliction() {
    return ActionContext.getContext().getApplication();
  }

  public HttpServletResponse getRespone() {
    HttpServletResponse response = ServletActionContext.getResponse();
    response.setContentType("text/html");
    response.setContentType("UTF-8");
    return response;
  }

  public String initQa() throws Exception {
    QaInfoDao qainfodao = new QaInfoDao();
    List list = qainfodao.loadVendorName();
    for (int i = 0; i < list.size(); ++i)
      this.listvendor.add(list.get(i).toString());

    return "success";
  }

  public String addQa() throws Exception {
    this.qa.setYxbz("Y");
    String vendorname = this.qa.getWord();
    this.qa.setVendorname(vendorname);
    this.qaManager.saveOrUpdateQa(this.qa);
    return "success";
  }

  public String addOnlyQa() throws Exception {
    this.qa.setYxbz("Y");
    String vendorname = this.qa.getWord();
    this.qa.setVendorname(vendorname);
    this.qaManager.saveOrUpdateQa(this.qa);
    return "update_success";
  }

  public String browse() throws Exception {
	  ActionContext ctx = ActionContext.getContext();
	  if (this.qa.getRemark1().equals("1")) {
	      ctx.getSession().put("vendorname_qa1", this.qa.getVendorname());
	      ctx.getSession().put("sdlcostcode_qa1", this.qa.getSdlcostcode()); 
	      ctx.getSession().put("clientname_qa1", this.qa.getClientname()); 
	      ctx.getSession().put("qadate_qa1", this.qa.getQadate()); 
	      ctx.getSession().put("yxbz_qa1", this.qa.getYxbz()); 
	  }else {
		  String vendorname_qa = ctx.getSession().get("vendorname_qa1").toString();
	      String sdlcostcode_qa = ctx.getSession().get("sdlcostcode_qa1").toString();
	      String qadate_qa = ctx.getSession().get("qadate_qa1").toString();
	      String yxbz_qa = ctx.getSession().get("yxbz_qa1").toString();
	      String clientname_qa = ctx.getSession().get("clientname_qa1").toString();

	      this.qa.setVendorname(vendorname_qa);
	      this.qa.setSdlcostcode(sdlcostcode_qa);
	      this.qa.setClientname(clientname_qa);
	      this.qa.setQadate(qadate_qa);
	      this.qa.setYxbz(yxbz_qa);
	  }
	      
     this.totalSize = this.qaManager.countQa(this.qa);
     this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
     if(ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.qas = this.qaManager.browseQa(this.page, this.pageSize, this.qa);
    PageBean pageBean = new PageBean();
    pageBean.setList(this.qas);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
 
    request.put("list", this.qas);
    ServletActionContext.getRequest().setAttribute("qasize", Integer.valueOf(this.qas.size()));
    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public String selectVendorQa() throws Exception {
    this.totalSize = this.qaManager.countVendorQa(this.qa);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.qas = this.qaManager.selectVendorQa(this.page, this.pageSize, this.qa);

    PageBean pageBean = new PageBean();
    pageBean.setList(this.qas);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.qas);
    ServletActionContext.getRequest().setAttribute("qasize", Integer.valueOf(this.qas.size()));
    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
    ServletActionContext.getRequest().setAttribute("qasize", Integer.valueOf(this.qas.size()));

    return "success";
  }

  public String loadQaByTiaojian() throws Exception {
    ActionContext ctx = ActionContext.getContext();
    if (this.qa.getRemark1().equals("1")) {
      ctx.getSession().put("vendorname_qa", this.qa.getVendorname());
      ctx.getSession().put("clientname_qa", this.qa.getClientname());
      ctx.getSession().put("sdlcostcode_qa", this.qa.getSdlcostcode());
      ctx.getSession().put("lmorgl_qa", this.qa.getLmorgl());
      ctx.getSession().put("lead_qa", this.qa.getLead());
      ctx.getSession().put("evaluatorname_qa", this.qa.getEvaluatorname());
      ctx.getSession().put("startdate_qa", this.qa.getStartdate());
      ctx.getSession().put("enddate_qa", this.qa.getEnddate());
      ctx.getSession().put("sector_qa", this.qa.getSector());
      ctx.getSession().put("translationtype_qa", this.qa.getTranslationtype());
      ctx.getSession().put("targetlanguage_qa", this.qa.getTargetlanguage());
      ctx.getSession().put("sourcelanguage_qa", this.qa.getSourcelanguage());
    } else {
      String vendorname_qa = ctx.getSession().get("vendorname_qa").toString();
      String clientname_qa = ctx.getSession().get("clientname_qa").toString();
      String sdlcostcode_qa = ctx.getSession().get("sdlcostcode_qa").toString();
      String lmorgl_qa = ctx.getSession().get("lmorgl_qa").toString();
      String lead_qa = ctx.getSession().get("lead_qa").toString();
      String evaluatorname_qa = ctx.getSession().get("evaluatorname_qa").toString();
      String startdate_qa = ctx.getSession().get("startdate_qa").toString();
      String enddate_qa = ctx.getSession().get("enddate_qa").toString();
      String sector_qa = ctx.getSession().get("sector_qa").toString();
      String translationtype_qa = ctx.getSession().get("translationtype_qa").toString();
      String targetlanguage_qa = ctx.getSession().get("targetlanguage_qa").toString();
      String sourcelanguage_qa = ctx.getSession().get("sourcelanguage_qa").toString();

      this.qa.setVendorname(vendorname_qa);
      this.qa.setClientname(clientname_qa);
      this.qa.setLead(lead_qa);
      this.qa.setSdlcostcode(sdlcostcode_qa);
      this.qa.setLmorgl(lmorgl_qa);
      this.qa.setEvaluatorname(evaluatorname_qa);
      this.qa.setStartdate(startdate_qa);
      this.qa.setEnddate(enddate_qa);
      this.qa.setSector(sector_qa);
      this.qa.setTranslationtype(translationtype_qa);
      this.qa.setTargetlanguage(targetlanguage_qa);
      this.qa.setSourcelanguage(sourcelanguage_qa);
    }
    this.totalSize = this.qaManager.countQaByTiaojian(this.qa);
    this.totalPage = PageBean.countTotalPage(this.pageSize, this.totalSize);
    if (ServletActionContext.getRequest().getParameter("page") != null)
      this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));

    this.page = PageBean.countCurrentPage(this.page);
    this.qas = this.qaManager.loadQaByTiaojian(this.page, this.pageSize, this.qa);

    PageBean pageBean = new PageBean();
    pageBean.setList(this.qas);
    pageBean.setTotalSize(this.totalSize);
    pageBean.setPageSize(this.pageSize);
    pageBean.setTotalPage(this.totalPage);
    pageBean.setCurrentPage(this.page);
    pageBean.init();

    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.qas);

    ServletActionContext.getRequest().setAttribute("qasize", Integer.valueOf(this.qas.size()));
    ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
    ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
    return "success";
  }

  public String list() throws Exception {
    this.qas = this.qaManager.browseQa();
    Map request = (Map)ActionContext.getContext().get("request");
    request.put("list", this.qas);
    return "success";
  }

  public String loadQa() throws Exception {
    this.qa = this.qaManager.loadQa(Integer.valueOf(this.qa.getId()));
    String name = this.qa.getVendorname();
    if (this.qa.getVendorname() == null)
      this.qa.setVendorname("");

    ServletActionContext.getRequest().setAttribute("qaid", Integer.valueOf(this.qa.getId()));

    return "success";
  }

  public String deleteQa() throws Exception {
    if (this.qa.getId() != 0) {
      String sdlcostcode = this.qa.getSdlcostcode();
      String vendorname = this.qa.getVendorname();
      String qadate = this.qa.getQadate();
      String clentname = this.qa.getClientname();
      String yxbz = this.qa.getYxbz();


      this.qaManager.deleteQa(Integer.valueOf(this.qa.getId()));
      if (sdlcostcode == null){
    	  sdlcostcode = "";
      }  

      if (vendorname == null) {
          vendorname = "";
      }

      if(qadate == null){
          qadate = "";    	  
      }

      if(clentname == null){
          clentname = "";
      }
      
      if(yxbz == null) {
    	  yxbz="";
      }

      this.qa.setSdlcostcode(sdlcostcode);
      this.qa.setVendorname(vendorname);
      this.qa.setLead(qadate);
      this.qa.setClientname(clentname);
      this.qa.setYxbz(yxbz);
      
      this.totalSize = this.qaManager.countQa(this.qa);
      this.totalPage = PageBean.countTotalPage(this.pageSize, 
        this.totalSize);
      if (ServletActionContext.getRequest().getParameter("page") != null)
        this.page = Integer.parseInt(ServletActionContext.getRequest().getParameter
          ("page"));

      this.page = PageBean.countCurrentPage(this.page);
      this.qas = this.qaManager.browseQa(this.page, this.pageSize, 
        this.qa);

      PageBean pageBean = new PageBean();
      pageBean.setList(this.qas);
      pageBean.setTotalSize(this.totalSize);
      pageBean.setPageSize(this.pageSize);
      pageBean.setTotalPage(this.totalPage);
      pageBean.setCurrentPage(this.page);
      pageBean.init();
      for (int i = 0; i < this.qas.size(); ++i) {
        ((Qa)this.qas.get(i)).setRemark1(sdlcostcode);
        ((Qa)this.qas.get(i)).setRemark2(vendorname);
        ((Qa)this.qas.get(i)).setRemark3(qadate);
        ((Qa)this.qas.get(i)).setRemark4(clentname);
      }
      Map request = (Map)ActionContext.getContext().get("request");
      request.put("list", this.qas);
      ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
      ServletActionContext.getRequest().setAttribute("currentpage", Integer.valueOf(pageBean.getCurrentPage()));
      ServletActionContext.getRequest().setAttribute("qasize", Integer.valueOf(this.qas.size()));

      return "success";
    }
    return "fail";
  }

  public String updateQq() throws Exception {
    if (this.qa.getId() != 0) {
      this.qa.setYxbz("Y");
      String ss = this.qa.getFilefilename();
      if (this.qa.getFilefilename().equals("null"))
        this.qa.setFilefilename("");

      if (this.qa.getFtpfilename().equals("null"))
        this.qa.setFtpfilename("");

      this.qaManager.updateQa(this.qa);
      return "update_success";
    }
    return "fail";
  }

  public Object getModel() {
    return this.qa;
  }

  public int getPage() {
    return this.page;
  }

  public void setPage(int page) {
    this.page = page;
  }

  public QaManager getQaManager() {
    return this.qaManager;
  }

  @Resource
  public void setQaManager(QaManager qaManager) {
    this.qaManager = qaManager;
  }

  public List<Qa> getQas() {
    return this.qas;
  }

  public void setQas(List<Qa> qas) {
    this.qas = qas;
  }

  public Qa getQa() {
    return this.qa;
  }

  public void setQa(Qa qa) {
    this.qa = qa;
  }

  public List<String> getListvendor() {
    return this.listvendor;
  }

  public void setListvendor(List<String> listvendor) {
    this.listvendor = listvendor;
  }

  public List<String> getListlead() {
    return this.listlead;
  }

  public void setListlead(List<String> listlead) {
    this.listlead = listlead;
  }

  public String fileUp() throws Exception {
    UUID ranId = UUID.randomUUID();
    String filenameid = ranId.toString().replace("-", "");
    String filename_all = ranId + ".xlsx";
    String path = ServletActionContext.getRequest().getRealPath("/upload//" + filename_all);
    File file = new File(path);
    FileUtils.copyFile(getUpload(), file);
    System.out.println("-----------------------------------------");
    System.out.println("上传成功");
    System.out.println(getUploadFileName());
    System.out.println("-----------------------------------------");

    byte[] buffer = new byte[500];

    Qa qa_import = new Qa();
    TestRead testread = new TestRead();
    qa_import = testread.read(path, filename_all, getUploadFileName());
    ServletActionContext.getRequest().setAttribute("qa", qa_import);
    return "success";
  }
}