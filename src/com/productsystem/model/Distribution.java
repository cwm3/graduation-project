package com.productsystem.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Distribution
{
  private int id;
  private String systemcode;
  private String worktype;
  private String hourlywork;
  private String newwords;
  private String postediting;
  private String rate1;
  private String rate2;
  private String rate3;
  private String rate4;
  private String totalwords;
  private String projectvalue;
  private String resource;
  private String dropname;
  private String comments;
  private String outsourcedponumber;
  private String Startdate;
  private String Enddate;
  private String yxbz;
  private String vendorid;
  private String systemid;
  private String lead;
  private String vendorname;
  private String coorespondingwords;
  private String pzxh;
  private String systemcodeall;
  private String remark1;
  private String remark2;
  private String remark3;
  private String remark4;
  private String status;
  private String ho;

  public String getHo()
  {
    return this.ho;
  }

  public void setHo(String ho) {
    this.ho = ho;
  }

  public String getStatus() {
    return this.status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public String getRemark1() {
    return this.remark1;
  }

  public void setRemark1(String remark1) {
    this.remark1 = remark1;
  }

  public String getRemark2() {
    return this.remark2;
  }

  public void setRemark2(String remark2) {
    this.remark2 = remark2;
  }

  public String getRemark3() {
    return this.remark3;
  }

  public void setRemark3(String remark3) {
    this.remark3 = remark3;
  }

  public String getRemark4() {
    return this.remark4;
  }

  public void setRemark4(String remark4) {
    this.remark4 = remark4;
  }

  public String getSystemcodeall() {
    return this.systemcodeall;
  }

  public void setSystemcodeall(String systemcodeall) {
    this.systemcodeall = systemcodeall;
  }

  public String getResource() {
    return this.resource;
  }

  public void setResource(String resource) {
    this.resource = resource;
  }

  public String getDropname() {
    return this.dropname;
  }

  public void setDropname(String dropname) {
    this.dropname = dropname;
  }

  public String getComments() {
    return this.comments;
  }

  public void setComments(String comments) {
    this.comments = comments;
  }

  public String getRate3() {
    return this.rate3;
  }

  public void setRate3(String rate3) {
    this.rate3 = rate3;
  }

  public String getRate4() {
    return this.rate4;
  }

  public void setRate4(String rate4) {
    this.rate4 = rate4;
  }

  public String getSystemid() {
    return this.systemid;
  }

  public void setSystemid(String systemid) {
    this.systemid = systemid;
  }

  @Id
  @GeneratedValue
  public int getId() {
    return this.id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getSystemcode() {
    return this.systemcode;
  }

  public void setSystemcode(String systemcode) {
    this.systemcode = systemcode;
  }

  public String getVendorid() {
    return this.vendorid;
  }

  public void setVendorid(String vendorid) {
    this.vendorid = vendorid;
  }

  public String getHourlywork() {
    return this.hourlywork;
  }

  public void setHourlywork(String hourlywork) {
    this.hourlywork = hourlywork;
  }

  public String getPostediting() {
    return this.postediting;
  }

  public void setPostediting(String postediting) {
    this.postediting = postediting;
  }

  public String getRate1() {
    return this.rate1;
  }

  public void setRate1(String rate1) {
    this.rate1 = rate1;
  }

  public String getRate2() {
    return this.rate2;
  }

  public String getNewwords() {
    return this.newwords;
  }

  public void setNewwords(String newwords) {
    this.newwords = newwords;
  }

  public void setRate2(String rate2) {
    this.rate2 = rate2;
  }

  public String getTotalwords() {
    return this.totalwords;
  }

  public void setTotalwords(String totalwords) {
    this.totalwords = totalwords;
  }

  public String getProjectvalue() {
    return this.projectvalue;
  }

  public void setProjectvalue(String projectvalue) {
    this.projectvalue = projectvalue;
  }

  public String getOutsourcedponumber() {
    return this.outsourcedponumber;
  }

  public void setOutsourcedponumber(String outsourcedponumber) {
    this.outsourcedponumber = outsourcedponumber;
  }

  public String getStartdate() {
    return this.Startdate;
  }

  public void setStartdate(String startdate) {
    this.Startdate = startdate;
  }

  public String getEnddate() {
    return this.Enddate;
  }

  public void setEnddate(String enddate) {
    this.Enddate = enddate;
  }

  public String getYxbz() {
    return this.yxbz;
  }

  public void setYxbz(String yxbz) {
    this.yxbz = yxbz;
  }

  public String getWorktype() {
    return this.worktype;
  }

  public void setWorktype(String worktype) {
    this.worktype = worktype;
  }

  public String getLead() {
    return this.lead;
  }

  public void setLead(String lead) {
    this.lead = lead;
  }

  public String getVendorname() {
    return this.vendorname;
  }

  public void setVendorname(String vendorname) {
    this.vendorname = vendorname;
  }

  public String getCoorespondingwords() {
    return this.coorespondingwords;
  }

  public void setCoorespondingwords(String coorespondingwords) {
    this.coorespondingwords = coorespondingwords;
  }

  public String getPzxh() {
    return this.pzxh;
  }

  public void setPzxh(String pzxh) {
    this.pzxh = pzxh;
  }
}