package com.productsystem.dao;

import com.productsystem.model.Qa;
import java.io.Serializable;
import java.util.List;

public abstract interface QaDao
{
  public abstract Object loadById(Class paramClass, Serializable paramSerializable);

  public abstract void deleteById(Class paramClass, Serializable paramSerializable);

  public abstract void saveOrUpdate(Object paramObject);

  public abstract void save(Qa paramQa);

  public abstract void updateQa(Qa paramQa);

  public abstract int countQuery(String paramString);

  public abstract List listAll(Qa paramQa, int paramInt1, int paramInt2);

  public abstract List listAll(String paramString);

  public abstract int countAll(Qa paramQa);

  public abstract int coutVendorQa(Qa paramQa);

  public abstract List listVendorQa(int paramInt1, int paramInt2, Qa paramQa);

  public abstract int countVendorqaByVendorId(Qa paramQa);

  public abstract List loadvendorqaByVendorId(int paramInt1, int paramInt2, Qa paramQa);

  public abstract int countQaByTiaojian(Qa paramQa);

  public abstract List loadQaByTiaojian(int paramInt1, int paramInt2, Qa paramQa);
}