package com.productsystem.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class CostCode
{
  private int id;
  private String costcode;
  private String clientname;
  private String lead;
  private String datedate;
  private String vendor_field;
  private String yxbz;

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

  public String getCostcode()
  {
    return this.costcode;
  }

  public void setCostcode(String costcode)
  {
    this.costcode = costcode;
  }

  public String getClientname()
  {
    return this.clientname;
  }

  public void setClientname(String clientname)
  {
    this.clientname = clientname;
  }

  public String getLead()
  {
    return this.lead;
  }

  public void setLead(String lead)
  {
    this.lead = lead;
  }

  public String getDatedate()
  {
    return this.datedate;
  }

  public void setDatedate(String datedate)
  {
    this.datedate = datedate;
  }

  public String getVendor_field()
  {
    return this.vendor_field;
  }

  public void setVendor_field(String vendor_field)
  {
    this.vendor_field = vendor_field;
  }

  public String getYxbz()
  {
    return this.yxbz;
  }

  public void setYxbz(String yxbz)
  {
    this.yxbz = yxbz;
  }
}