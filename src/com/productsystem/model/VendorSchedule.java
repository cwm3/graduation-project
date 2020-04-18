package com.productsystem.model;

public class VendorSchedule
{
  private String vendorid;
  private String vendorname;
  private String averagescores;
  private String sparecapacity;

  public String getAveragescores()
  {
    return this.averagescores;
  }

  public void setAveragescores(String averagescores)
  {
    this.averagescores = averagescores;
  }

  public String getVendorid()
  {
    return this.vendorid;
  }

  public void setVendorid(String vendorid)
  {
    this.vendorid = vendorid;
  }

  public String getVendorname()
  {
    return this.vendorname;
  }

  public void setVendorname(String vendorname)
  {
    this.vendorname = vendorname;
  }

  public String getSparecapacity()
  {
    return this.sparecapacity;
  }

  public void setSparecapacity(String sparecapacity)
  {
    this.sparecapacity = sparecapacity;
  }
}