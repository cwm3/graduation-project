package com.struts2.filedownload;

import com.opensymphony.xwork2.ActionSupport;
import java.io.InputStream;
import javax.servlet.ServletContext;
import org.apache.struts2.ServletActionContext;

public class FileDownload extends ActionSupport
{
  private String ftpfileName;
  private String fileName;

  public String getFtpfileName()
  {
    return this.ftpfileName;
  }

  public void setFtpfileName(String ftpfileName) {
    this.ftpfileName = ftpfileName;
  }

  public String getFileName() {
    return this.fileName;
  }

  public void setFileName(String fileName) {
    this.fileName = fileName;
  }

  public InputStream getDownloadFile() throws Exception {
    if ((((this.ftpfileName.equals("")) ? 0 : 1) & ((this.ftpfileName.equals("qamoban20161009")) ? 0 : 1)) != 0) {
      this.ftpfileName = "upload/" + this.ftpfileName;
      return ServletActionContext.getServletContext().getResourceAsStream(this.ftpfileName);
    }
    return null;
  }

  public String execute() throws Exception {
    return "success";
  }
}