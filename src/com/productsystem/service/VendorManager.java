package com.productsystem.service;

import com.productsystem.model.Vendor;
import java.util.List;

public abstract interface VendorManager
{
  public abstract boolean exists(Vendor paramVendor)
    throws Exception;

  public abstract void add(Vendor paramVendor)
    throws Exception;

  public abstract void updateVendor(Vendor paramVendor);

  public abstract Vendor loadVendor(Integer paramInteger);

  public abstract boolean deleteVendor(Integer paramInteger);

  public abstract boolean saveOrUpdateVendor(Vendor paramVendor);

  public abstract int countVendor();

  public abstract int countSelectVendor(Vendor paramVendor);

  public abstract int countVendorSchedule(Vendor paramVendor);

  public abstract int countVendorCapacity(Vendor paramVendor);

  public abstract List<Vendor> browseVendor(int paramInt1, int paramInt2);

  public abstract List<Vendor> selectVendor(int paramInt1, int paramInt2, Vendor paramVendor);

  public abstract List<Vendor> selectVendorSchedule(int paramInt1, int paramInt2, Vendor paramVendor);

  public abstract List<Vendor> selectVendorCapacity(int paramInt1, int paramInt2, Vendor paramVendor);

  public abstract List<Vendor> browseVendor();

  public abstract List<Vendor> listVendorByTiaoJian(String paramString1, String paramString2, String paramString3);
}