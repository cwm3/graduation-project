package com.productsystem.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Vendor
{
  private int id;
  private String vendorid;
  private String vendor_name;
  private String chinese_name;
  private String vendor_field;
  private String vendor_email;
  private String vendor_tel;
  private String vendor_cat;
  private String averagescore;
  private String vendor_qq;
  private String qualified_date;
  private String monthly_order_min;
  private String monthly_order_max;
  private String vendor_comment;
  private String remark;
  private String vendor_field_other;
  private String vendor_cat_other;
  private String grade;
  private String rate;
  private String newword;
  private String dailycapacity;
  private String vendortype;
  private String vendorpassword;
  private String review;
  private String fuzzy_84;
  private String fuzzy_85;
  private String fuzzy_99;
  private String fuzzy_100;
  private String postediting;
  private String hourlyrate;
  private String languagebegin;
  private String languageend;
  private String yxbz;
  private String remark1;
  private String remark2;
  private String remark3;

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

  public void setVendorid(String vendorid)
  {
    this.vendorid = vendorid;
  }

  public String getVendor_name()
  {
    return this.vendor_name;
  }

  public void setVendor_name(String vendor_name)
  {
    this.vendor_name = vendor_name;
  }

  public String getVendor_field_other()
  {
    return this.vendor_field_other;
  }

  public void setVendor_field_other(String vendor_field_other)
  {
    this.vendor_field_other = vendor_field_other;
  }

  public String getVendor_cat_other()
  {
    return this.vendor_cat_other;
  }

  public void setVendor_cat_other(String vendor_cat_other)
  {
    this.vendor_cat_other = vendor_cat_other;
  }

  public String getChinese_name()
  {
    return this.chinese_name;
  }

  public void setChinese_name(String chinese_name)
  {
    this.chinese_name = chinese_name;
  }

  public String getVendor_field()
  {
    return this.vendor_field;
  }

  public void setVendor_field(String vendor_field)
  {
    this.vendor_field = vendor_field;
  }

  public String getVendor_email()
  {
    return this.vendor_email;
  }

  public void setVendor_email(String vendor_email)
  {
    this.vendor_email = vendor_email;
  }

  public String getVendor_tel()
  {
    return this.vendor_tel;
  }

  public void setVendor_tel(String vendor_tel)
  {
    this.vendor_tel = vendor_tel;
  }

  public String getVendor_cat()
  {
    return this.vendor_cat;
  }

  public void setVendor_cat(String vendor_cat)
  {
    this.vendor_cat = vendor_cat;
  }

  public String getAveragescore()
  {
    return this.averagescore;
  }

  public void setAveragescore(String averagescore)
  {
    this.averagescore = averagescore;
  }

  public String getVendor_qq()
  {
    return this.vendor_qq;
  }

  public void setVendor_qq(String vendor_qq)
  {
    this.vendor_qq = vendor_qq;
  }

  public String getQualified_date()
  {
    return this.qualified_date;
  }

  public void setQualified_date(String qualified_date)
  {
    this.qualified_date = qualified_date;
  }

  public String getMonthly_order_min()
  {
    return this.monthly_order_min;
  }

  public void setMonthly_order_min(String monthly_order_min)
  {
    this.monthly_order_min = monthly_order_min;
  }

  public String getMonthly_order_max()
  {
    return this.monthly_order_max;
  }

  public void setMonthly_order_max(String monthly_order_max)
  {
    this.monthly_order_max = monthly_order_max;
  }

  public String getRemark()
  {
    return this.remark;
  }

  public void setRemark(String remark)
  {
    this.remark = remark;
  }

  public String getVendor_comment()
  {
    return this.vendor_comment;
  }

  public void setVendor_comment(String vendor_comment)
  {
    this.vendor_comment = vendor_comment;
  }

  public String getYxbz()
  {
    return this.yxbz;
  }

  public void setYxbz(String yxbz)
  {
    this.yxbz = yxbz;
  }

  public String getRate()
  {
    return this.rate;
  }

  public void setRate(String rate)
  {
    this.rate = rate;
  }

  public String getGrade()
  {
    return this.grade;
  }

  public void setGrade(String grade)
  {
    this.grade = grade;
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

  public String getNewword()
  {
    return this.newword;
  }

  public void setNewword(String newword)
  {
    this.newword = newword;
  }

  public String getReview()
  {
    return this.review;
  }

  public void setReview(String review)
  {
    this.review = review;
  }

  public String getFuzzy_84()
  {
    return this.fuzzy_84;
  }

  public void setFuzzy_84(String fuzzy_84)
  {
    this.fuzzy_84 = fuzzy_84;
  }

  public String getFuzzy_85()
  {
    return this.fuzzy_85;
  }

  public void setFuzzy_85(String fuzzy_85)
  {
    this.fuzzy_85 = fuzzy_85;
  }

  public String getFuzzy_99()
  {
    return this.fuzzy_99;
  }

  public void setFuzzy_99(String fuzzy_99)
  {
    this.fuzzy_99 = fuzzy_99;
  }

  public String getFuzzy_100()
  {
    return this.fuzzy_100;
  }

  public void setFuzzy_100(String fuzzy_100)
  {
    this.fuzzy_100 = fuzzy_100;
  }

  public String getPostediting()
  {
    return this.postediting;
  }

  public void setPostediting(String postediting)
  {
    this.postediting = postediting;
  }

  public String getHourlyrate()
  {
    return this.hourlyrate;
  }

  public void setHourlyrate(String hourlyrate)
  {
    this.hourlyrate = hourlyrate;
  }

  public String getDailycapacity()
  {
    return this.dailycapacity;
  }

  public void setDailycapacity(String dailycapacity)
  {
    this.dailycapacity = dailycapacity;
  }

  public String getVendortype()
  {
    return this.vendortype;
  }

  public void setVendortype(String vendortype)
  {
    this.vendortype = vendortype;
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

  public String getVendorpassword()
  {
    return this.vendorpassword;
  }

  public void setVendorpassword(String vendorpassword)
  {
    this.vendorpassword = vendorpassword;
  }
}