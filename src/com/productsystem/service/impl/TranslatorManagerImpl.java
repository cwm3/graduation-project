package com.productsystem.service.impl;

import com.productsystem.dao.TranslatorDao;
import com.productsystem.model.Translator;
import com.productsystem.service.TranslatorManager;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("translatorManager")
public class TranslatorManagerImpl
  implements TranslatorManager
{
  @Autowired
  private TranslatorDao translatorDao;

  public void add(Translator translator)
    throws Exception
  {
    this.translatorDao.saveOrUpdate(translator);
  }

  public void updateTranslator(Translator translator) {
    this.translatorDao.updateTranslator(translator);
  }

  public int countTranslator(Translator translator) {
    return this.translatorDao.countAll(translator);
  }

  public int countTranslator() {
    return this.translatorDao.countAll();
  }

  public List<Translator> browse(int pageNo, int pageSize) {
    return this.translatorDao.listAll(pageNo, pageSize);
  }

  public List<Translator> browseTranslator() {
    return this.translatorDao.listAll("Translator");
  }

  public boolean deleteTranslator(Integer id) {
    boolean status = false;
    try {
      this.translatorDao.deleteById(Translator.class, id);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public Translator loadTranslator(Integer id) {
    return ((Translator)this.translatorDao.loadById(Translator.class, id));
  }

  public boolean saveOrUpdateTranslator(Translator translator) {
    boolean status = false;
    try {
      this.translatorDao.saveOrUpdate(translator);
      status = true;
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return status;
  }

  public TranslatorDao getTranslatorDao() {
    return this.translatorDao;
  }

  @Resource
  public void setTranslatorDao(TranslatorDao translatorDao) {
    this.translatorDao = translatorDao;
  }

  public void save(Translator translator) {
    this.translatorDao.save(translator);
  }

  public List<Translator> listTranslatorByTiaoJian(Translator translator) {
    return this.translatorDao.listTranslatorByTiaoJian(translator);
  }

  public List<Translator> browse(int pageNo, int pageSize, Translator Translator) {
    return this.translatorDao.listAll(pageNo, pageSize, Translator);
  }
}