package com.productsystem.dao;

import com.productsystem.model.Vendor;
import java.io.Serializable;
import java.util.List;

public abstract interface VendorDao
{
  public abstract boolean checkVendorExistsWithName(String paramString1, String paramString2);

  public abstract Object loadById(Class paramClass, Serializable paramSerializable);

  public abstract void deleteById(Class paramClass, Serializable paramSerializable);

  public abstract void saveOrUpdate(Vendor paramVendor);

  public abstract void save(Vendor paramVendor);

  public abstract void updateVendor(Vendor paramVendor);

  public abstract int countQuery(String paramString);

  public abstract List listAll(String paramString, int paramInt1, int paramInt2);

  public abstract List listSelectVendor(int paramInt1, int paramInt2, Vendor paramVendor);

  public abstract List listAll(String paramString);

  public abstract List<Vendor> listVendorByTiaoJian(String paramString1, String paramString2, String paramString3);

  public abstract List listAll(Vendor paramVendor);

  public abstract List selectVendorCapacity(int paramInt1, int paramInt2, Vendor paramVendor);

  public abstract int countAll(String paramString);

  public abstract int coutSelectVendor(Vendor paramVendor);

  public abstract int countVendorCapacity(Vendor paramVendor);

  public abstract int coutVendorSchedule(Vendor paramVendor);

  public abstract List listVendorSchedule(int paramInt1, int paramInt2, Vendor paramVendor);
}