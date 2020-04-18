package com.productsystem.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class User
{
  private int id;
  private String username;
  private String password;
  private String password2;
  private String lmorgl;
  private String department;
  private String userposition;
  private String permissionsmodule;
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

  public String getUsername()
  {
    return this.username;
  }

  public void setUsername(String username)
  {
    this.username = username;
  }

  public String getPassword()
  {
    return this.password;
  }

  public void setPassword(String password)
  {
    this.password = password;
  }

  public String getLmorgl()
  {
    return this.lmorgl;
  }

  public void setLmorgl(String lmorgl)
  {
    this.lmorgl = lmorgl;
  }

  public String getUserposition()
  {
    return this.userposition;
  }

  public void setUserposition(String userposition)
  {
    this.userposition = userposition;
  }

  public String getYxbz()
  {
    return this.yxbz;
  }

  public void setYxbz(String yxbz)
  {
    this.yxbz = yxbz;
  }

  public String getPermissionsmodule()
  {
    return this.permissionsmodule;
  }

  public void setPermissionsmodule(String permissionsmodule)
  {
    this.permissionsmodule = permissionsmodule;
  }

  public String getPassword2()
  {
    return this.password2;
  }

  public void setPassword2(String password2)
  {
    this.password2 = password2;
  }

  public String getDepartment()
  {
    return this.department;
  }

  public void setDepartment(String department)
  {
    this.department = department;
  }
}