package com.productsystem.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class TranslatorName
{
  private int translatorid;
  private String translatorname;
  private String office;
  private String comment;
  private String lrrq;
  private String yxbz;

  @Id
  @GeneratedValue
  public int getTranslatorid()
  {
    return this.translatorid;
  }

  public void setTranslatorid(int translatorid) {
    this.translatorid = translatorid;
  }

  public String getTranslatorname() {
    return this.translatorname;
  }

  public void setTranslatorname(String translatorname) {
    this.translatorname = translatorname;
  }

  public String getOffice() {
    return this.office;
  }

  public void setOffice(String office) {
    this.office = office;
  }

  public String getComment() {
    return this.comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

  public String getYxbz() {
    return this.yxbz;
  }

  public void setYxbz(String yxbz) {
    this.yxbz = yxbz; }

  public String getLrrq() {
    return this.lrrq;
  }

  public void setLrrq(String lrrq) {
    this.lrrq = lrrq;
  }
}