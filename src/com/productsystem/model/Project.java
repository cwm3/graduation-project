package com.productsystem.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Project
{
  private int id;
  private String lead;
  private String lmorgl;
  private String costcode;
  private String imtquality;
  private String comment;
  private String Status;
  private String dropname;
  private String systemcode;
  private String systemnumber;
  private String potype;
  private String dropdate;
  private String client;
  private String deadline;
  private String hourlywork;
  private String postediting;
  private String rate1;
  private String rate2;
  private String rate3;
  private String rate4;
  private String receivedpovalue;
  private String totalwords;
  private String imtchampion;
  private String newwords;
  private String lrrq;
  private String yxbz;
  private String languagebegin;
  private String languageend;
  private String remark1;
  private String remark2;
  private String remark3;
  private String remark4;
  private String remark5;
  private String userposition;
  private String remark6;

  @Id
  @GeneratedValue
  public int getId()
  {
    return this.id;
  }

  public void setId(int id)
  {
    this.id = id;
  }

  public String getLead()
  {
    return this.lead;
  }

  public void setLead(String lead)
  {
    this.lead = lead;
  }

  public String getLmorgl()
  {
    return this.lmorgl;
  }

  public void setLmorgl(String lmorgl)
  {
    this.lmorgl = lmorgl;
  }

  public String getStatus()
  {
    return this.Status;
  }

  public String getComment()
  {
    return this.comment;
  }

  public void setComment(String comment)
  {
    this.comment = comment;
  }

  public void setStatus(String status)
  {
    this.Status = status;
  }

  public String getDropname()
  {
    return this.dropname;
  }

  public void setDropname(String dropname)
  {
    this.dropname = dropname;
  }

  public String getSystemcode()
  {
    return this.systemcode;
  }

  public void setSystemcode(String systemcode)
  {
    this.systemcode = systemcode;
  }

  public String getDropdate()
  {
    return this.dropdate;
  }

  public void setDropdate(String dropdate)
  {
    this.dropdate = dropdate;
  }

  public String getDeadline()
  {
    return this.deadline;
  }

  public void setDeadline(String deadline)
  {
    this.deadline = deadline;
  }

  public String getHourlywork()
  {
    return this.hourlywork;
  }

  public void setHourlywork(String hourlywork)
  {
    this.hourlywork = hourlywork;
  }

  public String getPostediting()
  {
    return this.postediting;
  }

  public void setPostediting(String postediting)
  {
    this.postediting = postediting;
  }

  public String getRate1()
  {
    return this.rate1;
  }

  public void setRate1(String rate1)
  {
    this.rate1 = rate1;
  }

  public String getRate2()
  {
    return this.rate2;
  }

  public void setRate2(String rate2)
  {
    this.rate2 = rate2;
  }

  public String getReceivedpovalue()
  {
    return this.receivedpovalue;
  }

  public void setReceivedpovalue(String receivedpovalue)
  {
    this.receivedpovalue = receivedpovalue;
  }

  public String getTotalwords()
  {
    return this.totalwords;
  }

  public void setTotalwords(String totalwords)
  {
    this.totalwords = totalwords;
  }

  public String getImtchampion()
  {
    return this.imtchampion;
  }

  public void setImtchampion(String imtchampion)
  {
    this.imtchampion = imtchampion;
  }

  public String getNewwords()
  {
    return this.newwords;
  }

  public void setNewwords(String newwords)
  {
    this.newwords = newwords;
  }

  public String getSystemnumber()
  {
    return this.systemnumber;
  }

  public void setSystemnumber(String systemnumber)
  {
    this.systemnumber = systemnumber;
  }

  public String getClient()
  {
    return this.client;
  }

  public void setClient(String client)
  {
    this.client = client;
  }

  public String getImtquality()
  {
    return this.imtquality;
  }

  public void setImtquality(String imtquality)
  {
    this.imtquality = imtquality;
  }

  public String getCostcode()
  {
    return this.costcode;
  }

  public void setCostcode(String costcode)
  {
    this.costcode = costcode;
  }

  public String getLrrq()
  {
    return this.lrrq;
  }

  public void setLrrq(String lrrq)
  {
    this.lrrq = lrrq;
  }

  public String getYxbz()
  {
    return this.yxbz;
  }

  public void setYxbz(String yxbz)
  {
    this.yxbz = yxbz;
  }

  public String getLanguagebegin()
  {
    return this.languagebegin;
  }

  public void setLanguagebegin(String languagebegin)
  {
    this.languagebegin = languagebegin;
  }

  public String getLanguageend()
  {
    return this.languageend;
  }

  public void setLanguageend(String languageend)
  {
    this.languageend = languageend;
  }

  public String getRemark1()
  {
    return this.remark1;
  }

  public void setRemark1(String remark1)
  {
    this.remark1 = remark1;
  }

  public String getRemark2()
  {
    return this.remark2;
  }

  public void setRemark2(String remark2)
  {
    this.remark2 = remark2;
  }

  public String getRemark3()
  {
    return this.remark3;
  }

  public void setRemark3(String remark3)
  {
    this.remark3 = remark3;
  }

  public String getRate3()
  {
    return this.rate3;
  }

  public void setRate3(String rate3)
  {
    this.rate3 = rate3;
  }

  public String getRate4()
  {
    return this.rate4;
  }

  public void setRate4(String rate4)
  {
    this.rate4 = rate4;
  }

  public String getRemark4()
  {
    return this.remark4;
  }

  public void setRemark4(String remark4)
  {
    this.remark4 = remark4;
  }

  public String getRemark5()
  {
    return this.remark5;
  }

  public void setRemark5(String remark5)
  {
    this.remark5 = remark5;
  }

  public String getPotype()
  {
    return this.potype;
  }

  public void setPotype(String potype)
  {
    this.potype = potype;
  }

  public String getRemark6()
  {
    return this.remark6;
  }

  public void setRemark6(String remark6)
  {
    this.remark6 = remark6;
  }

  public String getUserposition()
  {
    return this.userposition;
  }

  public void setUserposition(String userposition)
  {
    this.userposition = userposition;
  }
}