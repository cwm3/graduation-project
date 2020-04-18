package com.productsystem.dao;

import com.productsystem.model.Distribution;
import java.io.Serializable;
import java.util.List;

public abstract interface DistributionDao
{
  public abstract Object loadById(Class paramClass, Serializable paramSerializable);

  public abstract void deleteById(Class paramClass, Serializable paramSerializable);

  public abstract void saveOrUpdate(Distribution paramDistribution);

  public abstract void save(Distribution paramDistribution);

  public abstract void updateDistribution(Distribution paramDistribution);

  public abstract int countQuery(String paramString);

  public abstract List listAll(String paramString, int paramInt1, int paramInt2);

  public abstract List listSelectDistribution(int paramInt1, int paramInt2, Distribution paramDistribution);

  public abstract List listAll(String paramString);

  public abstract List<Distribution> listDistributionByTiaoJian(String paramString1, String paramString2, String paramString3);

  public abstract List listAll(Distribution paramDistribution);

  public abstract int countAll(String paramString);

  public abstract int coutSelectDistribution(Distribution paramDistribution);

  public abstract int coutDistributionSchedule(Distribution paramDistribution);

  public abstract List listDistributionSchedule(int paramInt1, int paramInt2, Distribution paramDistribution);

  public abstract int countSelectDistributionbysystemcode(Distribution paramDistribution);

  public abstract List ListDistributionbysystemcode(int paramInt1, int paramInt2, Distribution paramDistribution);
}