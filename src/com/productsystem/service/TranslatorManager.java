package com.productsystem.service;

import com.productsystem.model.Translator;
import java.util.List;

public abstract interface TranslatorManager
{
  public abstract void add(Translator paramTranslator) throws Exception;

  public abstract void updateTranslator(Translator paramTranslator);

  public abstract Translator loadTranslator(Integer paramInteger);

  public abstract boolean deleteTranslator(Integer paramInteger);

  public abstract boolean saveOrUpdateTranslator(Translator paramTranslator);

  public abstract void save(Translator paramTranslator);

  public abstract int countTranslator(Translator paramTranslator);

  public abstract int countTranslator();

  public abstract List<Translator> browse(int paramInt1, int paramInt2);

  public abstract List<Translator> browse(int paramInt1, int paramInt2, Translator paramTranslator);

  public abstract List<Translator> browseTranslator();

  public abstract List<Translator> listTranslatorByTiaoJian(Translator paramTranslator);
}