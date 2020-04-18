package com.productsystem.service;

import com.productsystem.model.Qa;
import java.util.List;

public abstract interface QaManager
{
  public abstract void add(Qa paramQa)
    throws Exception;

  public abstract void updateQa(Qa paramQa);

  public abstract Qa loadQa(Integer paramInteger);

  public abstract boolean deleteQa(Integer paramInteger);

  public abstract boolean saveOrUpdateQa(Qa paramQa);

  public abstract void save(Qa paramQa);

  public abstract int countQa(Qa paramQa);

  public abstract int countVendorQa(Qa paramQa);

  public abstract List<Qa> selectVendorQa(int paramInt1, int paramInt2, Qa paramQa);

  public abstract List<Qa> browseQa(int paramInt1, int paramInt2, Qa paramQa);

  public abstract List<Qa> browseQa();

  public abstract int countVendorqaByVendorId(Qa paramQa);

  public abstract List<Qa> loadvendorqaByVendorId(int paramInt1, int paramInt2, Qa paramQa);

  public abstract int countQaByTiaojian(Qa paramQa);

  public abstract List<Qa> loadQaByTiaojian(int paramInt1, int paramInt2, Qa paramQa);
}