package com.productsystem.model;

public class Vendor_Distribution_Mx
{
  private int id;
  private String vendorid;
  private String vendorname;
  private String systemcode;
  private String vendordate;
  private String bookedcapactiy;
  private String yxbz;
  private String systemid;
  private String lead;
  private String worktype;
  private String totalwords;
  private String outsourcedponumber;
  private String projectvalue;
  private String hourlywork;

  public String getLead()
  {
    return this.lead;
  }

  public String getHourlywork()
  {
    return this.hourlywork;
  }

  public void setHourlywork(String hourlywork)
  {
    this.hourlywork = hourlywork;
  }

  public String getOutsourcedponumber()
  {
    return this.outsourcedponumber;
  }

  public void setOutsourcedponumber(String outsourcedponumber)
  {
    this.outsourcedponumber = outsourcedponumber;
  }

  public String getProjectvalue()
  {
    return this.projectvalue;
  }

  public void setProjectvalue(String projectvalue)
  {
    this.projectvalue = projectvalue;
  }

  public void setLead(String lead)
  {
    this.lead = lead;
  }

  public String getWorktype()
  {
    return this.worktype;
  }

  public void setWorktype(String worktype)
  {
    this.worktype = worktype;
  }

  public String getTotalwords()
  {
    return this.totalwords;
  }

  public void setTotalwords(String totalwords)
  {
    this.totalwords = totalwords;
  }

  public String getSystemid()
  {
    return this.systemid;
  }

  public void setSystemid(String systemid)
  {
    this.systemid = systemid;
  }

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

  public void setVendorid(String vendorid)
  {
    this.vendorid = vendorid;
  }

  public String getSystemcode()
  {
    return this.systemcode;
  }

  public void setSystemcode(String systemcode)
  {
    this.systemcode = systemcode;
  }

  public String getVendordate()
  {
    return this.vendordate;
  }

  public void setVendordate(String vendordate)
  {
    this.vendordate = vendordate;
  }

  public String getBookedcapactiy()
  {
    return this.bookedcapactiy;
  }

  public void setBookedcapactiy(String bookedcapactiy)
  {
    this.bookedcapactiy = bookedcapactiy;
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
}