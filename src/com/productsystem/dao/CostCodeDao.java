package com.productsystem.dao;

import com.productsystem.model.CostCode;
import java.io.Serializable;
import java.util.List;

public abstract interface CostCodeDao
{
  public abstract Object loadById(Class paramClass, Serializable paramSerializable);

  public abstract void deleteById(Class paramClass, Serializable paramSerializable);

  public abstract void saveOrUpdate(Object paramObject);

  public abstract void save(CostCode paramCostCode);

  public abstract void updateCostCode(CostCode paramCostCode);

  public abstract int countQuery(String paramString);

  public abstract List listAll(int paramInt1, int paramInt2, CostCode paramCostCode);

  public abstract List listAll(String paramString);

  public abstract int countAll(CostCode paramCostCode);

  public abstract int countAll();

  public abstract List listAll(int paramInt1, int paramInt2);

  public abstract List<CostCode> listCostCodeByTiaoJian(CostCode paramCostCode);
}