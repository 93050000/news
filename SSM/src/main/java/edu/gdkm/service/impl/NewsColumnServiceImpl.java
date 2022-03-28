package edu.gdkm.service.impl;

import edu.gdkm.dao.NewscolumnDao;
import edu.gdkm.po.News;
import edu.gdkm.po.Newscolumn;
import edu.gdkm.service.NewsColumnService;
import edu.gdkm.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
/*新闻分类*/
@Component("NewsColumnServiceImpl")
public class NewsColumnServiceImpl implements NewsColumnService {

    public NewscolumnDao newscolumnDao;
    @Autowired
    public void setNewscolumnDao(NewscolumnDao newscolumnDao) {
        this.newscolumnDao = newscolumnDao;
    }

    public List<Newscolumn> querAllNewsColum() {
        return this.newscolumnDao.querAllNewsColum();
    }

    public Newscolumn queryNewsColumn(Integer newsColumnId) {
        return this.newscolumnDao.queryNewsColumn(newsColumnId);
    }

    public int delNewColunm(Integer newsColumnId) {
        return this.newscolumnDao.delNewColunm(newsColumnId);
    }

    public int addNewColunm(Newscolumn newscolumn) {
        return this.newscolumnDao.addNewColunm(newscolumn);
    }

    public int updNewColunm(Newscolumn newscolumn) {
        return this.newscolumnDao.updNewColunm(newscolumn);
    }

    public Newscolumn queryFre(String columnCode, String columnName) {
        return this.newscolumnDao.queryFre(columnCode,columnName);
    }

    public int deleteByPrimaryKey(Integer newsColumnId) {
        return this.newscolumnDao.deleteByPrimaryKey(newsColumnId);
    }

    public int insert(Newscolumn record) {
        return this.newscolumnDao.insert(record);
    }

    public int insertSelective(Newscolumn record) {
        return this.newscolumnDao.insertSelective(record);
    }

    public Newscolumn selectByPrimaryKey(Integer newsColumnId) {
        return this.newscolumnDao.selectByPrimaryKey(newsColumnId);
    }

    public int updateByPrimaryKeySelective(Newscolumn record) {
        return this.newscolumnDao.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Newscolumn record) {
        return this.newscolumnDao.updateByPrimaryKey(record);
    }

    public List<Newscolumn> selectByPrimary(Newscolumn newscolumn) {
        return this.newscolumnDao.selectByPrimary(newscolumn);
    }

    public Newscolumn querCount(Newscolumn newscolumn) {
        return this.newscolumnDao.querCount(newscolumn);
    }

    public List<Newscolumn> queryTrue() {
        return this.newscolumnDao.queryTrue();
    }
}
