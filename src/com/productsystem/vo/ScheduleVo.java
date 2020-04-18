package com.productsystem.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class ScheduleVo
{
  private int id;
  private String vendorid;
  private String vendordate;
  private String available;
  private int nd;
  private int yf;
  private int rz;

  @Id
  @GeneratedValue
  public int getId()
  {
    return this.id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getVendorid() {
    return this.vendorid;
  }

  public void setVendorid(String vendorid) {
    this.vendorid = vendorid;
  }

  public String getVendordate() {
    return this.vendordate;
  }

  public void setVendordate(String vendordate) {
    this.vendordate = vendordate;
  }

  public String getAvailable() {
    return this.available;
  }

  public void setAvailable(String available) {
    this.available = available;
  }

  public int getNd() {
    return this.nd;
  }

  public void setNd(int nd) {
    this.nd = nd;
  }

  public int getYf() {
    return this.yf;
  }

  public void setYf(int yf) {
    this.yf = yf;
  }

  public int getRz() {
    return this.rz;
  }

  public void setRz(int rz) {
    this.rz = rz;
  }
}