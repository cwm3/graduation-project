package com.productsystem.service;

import com.productsystem.model.CostCode;
import java.util.List;

public abstract interface CostCodeManager
{
  public abstract void add(CostCode paramCostCode)
    throws Exception;

  public abstract void updateCostCode(CostCode paramCostCode);

  public abstract CostCode loadCostCode(Integer paramInteger);

  public abstract boolean deleteCostCode(Integer paramInteger);

  public abstract boolean saveOrUpdateCostCode(CostCode paramCostCode);

  public abstract void save(CostCode paramCostCode);

  public abstract int countCostCode(CostCode paramCostCode);

  public abstract int countCostCode();

  public abstract List<CostCode> browse(int paramInt1, int paramInt2);

  public abstract List<CostCode> browse(int paramInt1, int paramInt2, CostCode paramCostCode);

  public abstract List<CostCode> browseCostCode();

  public abstract List<CostCode> listCostCodeByTiaoJian(CostCode paramCostCode);
}