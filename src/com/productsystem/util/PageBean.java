package com.productsystem.util;

import java.util.List;

public class PageBean
{
  private List list;
  private int totalSize;
  private int pageSize;
  private int totalPage;
  private int currentPage;
  private boolean isFirstPage;
  private boolean isLastPage;

  public List getList()
  {
    return this.list;
  }

  public void setList(List list) {
    this.list = list;
  }

  public int getTotalSize() {
    return this.totalSize;
  }

  public void setTotalSize(int totalSize) {
    this.totalSize = totalSize;
  }

  public int getTotalPage() {
    return this.totalPage;
  }

  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }

  public int getCurrentPage() {
    return this.currentPage;
  }

  public void setCurrentPage(int currentPage) {
    this.currentPage = currentPage;
  }

  public int getPageSize() {
    return this.pageSize;
  }

  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  public boolean isFirstPage() {
    return (this.currentPage == 1);
  }

  public boolean isLastPage() {
    return (this.currentPage == this.totalPage);
  }

  public void init() {
    this.isFirstPage = isFirstPage();
    this.isLastPage = isLastPage();
  }

  public static int countTotalPage(int pageSize, int totalSize) {
    int totalPage = (totalSize % pageSize == 0) ? totalSize / pageSize : 
      totalSize / pageSize + 1;
    return totalPage;
  }

  public static int countCurrentPage(int page) {
    return ((page == 0) ? 1 : page);
  }

  public static int countOffset(int pageSize, int currentPage) {
    return (pageSize * (currentPage - 1));
  }
}