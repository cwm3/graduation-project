package com.productsystem.service;

import com.productsystem.model.Distribution;
import java.util.List;

public abstract interface DistributionManager
{
  public abstract void add(Distribution paramDistribution) throws Exception;

  public abstract void updateDistribution(Distribution paramDistribution);

  public abstract Distribution loadDistribution(Integer paramInteger);

  public abstract boolean deleteDistribution(Integer paramInteger);

  public abstract boolean saveOrUpdateDistribution(Distribution paramDistribution);

  public abstract int countDistribution();

  public abstract int countSelectDistribution(Distribution paramDistribution);

  public abstract int countDistributionSchedule(Distribution paramDistribution);

  public abstract List<Distribution> browseDistribution(int paramInt1, int paramInt2);

  public abstract List<Distribution> selectDistribution(int paramInt1, int paramInt2, Distribution paramDistribution);

  public abstract List<Distribution> selectDistributionSchedule(int paramInt1, int paramInt2, Distribution paramDistribution);

  public abstract List<Distribution> browseDistribution();

  public abstract List<Distribution> listDistributionByTiaoJian(String paramString1, String paramString2, String paramString3);

  public abstract int countSelectDistributionbysystemcode(Distribution paramDistribution);

  public abstract List<Distribution> ListDistributionbysystemcode(int paramInt1, int paramInt2, Distribution paramDistribution);
}