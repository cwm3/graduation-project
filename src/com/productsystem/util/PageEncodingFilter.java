package com.productsystem.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class PageEncodingFilter
  implements Filter
{
  private String encoding = "UTF-8";
  protected FilterConfig filterConfig;

  public void init(FilterConfig filterConfig)
    throws ServletException
  {
    this.filterConfig = filterConfig;
    if (filterConfig.getInitParameter("encoding") != null)
      this.encoding = filterConfig.getInitParameter("encoding");
  }

  public void doFilter(ServletRequest srequset, ServletResponse sresponse, FilterChain filterChain)
    throws IOException, ServletException
  {
    HttpServletRequest request = (HttpServletRequest)srequset;
    request.setCharacterEncoding(this.encoding);
    filterChain.doFilter(srequset, sresponse);
  }

  public void destroy() {
    this.encoding = null;
  }
}