package com.productsystem.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Schedule
{
  private int id;
  private String vendorid;
  private String vendordate;
  private String available;
  private String nd;
  private String yf;
  private String rz;
  private String capacity;
  private String enddate;
  private String startdate;
  private String remark1;
  private String remark2;
  private String sparecapacity;
  private String bookedcapacity;
  private String yxbz;
  private String dailycapacity;
  private String vendorname;
  private String mrbz;

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

  public String getVendorid()
  {
    return this.vendorid;
  }

  public String getNd()
  {
    return this.nd;
  }

  public void setNd(String nd)
  {
    this.nd = nd;
  }

  public String getYf()
  {
    return this.yf;
  }

  public void setYf(String yf)
  {
    this.yf = yf;
  }

  public String getRz()
  {
    return this.rz;
  }

  public void setRz(String rz)
  {
    this.rz = rz;
  }

  public void setVendorid(String vendorid)
  {
    this.vendorid = vendorid;
  }

  public String getVendordate()
  {
    return this.vendordate;
  }

  public void setVendordate(String vendordate)
  {
    this.vendordate = vendordate;
  }

  public String getAvailable()
  {
    return this.available;
  }

  public void setAvailable(String available)
  {
    this.available = available;
  }

  public String getCapacity()
  {
    return this.capacity;
  }

  public void setCapacity(String capacity)
  {
    this.capacity = capacity;
  }

  public String getEnddate()
  {
    return this.enddate;
  }

  public void setEnddate(String enddate)
  {
    this.enddate = enddate;
  }

  public String getStartdate()
  {
    return this.startdate;
  }

  public void setStartdate(String startdate)
  {
    this.startdate = startdate;
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

  public String getSparecapacity()
  {
    return this.sparecapacity;
  }

  public void setSparecapacity(String sparecapacity)
  {
    this.sparecapacity = sparecapacity;
  }

  public String getBookedcapacity()
  {
    return this.bookedcapacity;
  }

  public void setBookedcapacity(String bookedcapacity)
  {
    this.bookedcapacity = bookedcapacity;
  }

  public String getYxbz()
  {
    return this.yxbz;
  }

  public void setYxbz(String yxbz)
  {
    this.yxbz = yxbz;
  }

  public String getVendorname()
  {
    return this.vendorname;
  }

  public void setVendorname(String vendorname)
  {
    this.vendorname = vendorname;
  }

  public String getMrbz()
  {
    return this.mrbz;
  }

  public void setMrbz(String mrbz)
  {
    this.mrbz = mrbz;
  }

  public String getDailycapacity()
  {
    return this.dailycapacity;
  }

  public void setDailycapacity(String dailycapacity)
  {
    this.dailycapacity = dailycapacity;
  }
}