package com.productsystem.dao;

import com.productsystem.model.Translator;
import java.io.Serializable;
import java.util.List;

public abstract interface TranslatorDao
{
  public abstract Object loadById(Class paramClass, Serializable paramSerializable);

  public abstract void deleteById(Class paramClass, Serializable paramSerializable);

  public abstract void saveOrUpdate(Object paramObject);

  public abstract void save(Translator paramTranslator);

  public abstract void updateTranslator(Translator paramTranslator);

  public abstract int countQuery(String paramString);

  public abstract List listAll(int paramInt1, int paramInt2, Translator paramTranslator);

  public abstract List listAll(String paramString);

  public abstract int countAll(Translator paramTranslator);

  public abstract int countAll();

  public abstract List listAll(int paramInt1, int paramInt2);

  public abstract List<Translator> listTranslatorByTiaoJian(Translator paramTranslator);
}