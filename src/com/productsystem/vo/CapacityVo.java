package com.productsystem.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class CapacityVo
{
  private int id;
  private String vendorid;
  private String Languagebegin;
  private String Languageend;
  private String vendor_field;
  private String vendor_cat;
  private String vendorname;
  private String chinesename;
  private String averagescore;
  private String startdate;
  private String enddate;
  private String rate;

  @Id
  @GeneratedValue
  public int getId()
  {
    return this.id;
  }

  public String getLanguagebegin() {
    return this.Languagebegin;
  }

  public void setLanguagebegin(String languagebegin) {
    this.Languagebegin = languagebegin;
  }

  public String getLanguageend() {
    return this.Languageend;
  }

  public void setLanguageend(String languageend) {
    this.Languageend = languageend;
  }

  public String getVendor_field() {
    return this.vendor_field;
  }

  public void setVendor_field(String vendor_field) {
    this.vendor_field = vendor_field;
  }

  public String getVendor_cat() {
    return this.vendor_cat;
  }

  public void setVendor_cat(String vendor_cat) {
    this.vendor_cat = vendor_cat;
  }

  public String getVendorname() {
    return this.vendorname;
  }

  public void setVendorname(String vendorname) {
    this.vendorname = vendorname;
  }

  public String getChinesename() {
    return this.chinesename;
  }

  public void setChinesename(String chinesename) {
    this.chinesename = chinesename;
  }

  public String getAveragescore() {
    return this.averagescore;
  }

  public void setAveragescore(String averagescore) {
    this.averagescore = averagescore;
  }

  public String getStartdate() {
    return this.startdate;
  }

  public void setStartdate(String startdate) {
    this.startdate = startdate;
  }

  public String getEnddate() {
    return this.enddate;
  }

  public void setEnddate(String enddate) {
    this.enddate = enddate;
  }

  public String getRate() {
    return this.rate;
  }

  public void setRate(String rate) {
    this.rate = rate;
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
}