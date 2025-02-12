package com.productsystem.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil
{
  private static SessionFactory sf = new AnnotationConfiguration().configure().buildSessionFactory();

  public static SessionFactory getSessionFactory()
  {
    return sf;
  }
}