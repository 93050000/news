package edu.gdkm.service.impl;

import edu.gdkm.dao.NewsDao;
import edu.gdkm.po.News;
import edu.gdkm.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
@Component("NewsServiceImpl")
public class NewsServiceImpl implements NewsService {
    private NewsDao newsDao;
    @Autowired
    public void setNewsDao(NewsDao newsDao) {
        this.newsDao = newsDao;
    }

    public List<News> queryAllNews() {
        return this.newsDao.queryAllNews();
    }

    public News queryNewsById(Integer newsId) {
        return this.newsDao.queryNewsById(newsId);
    }

    public int delNewsById(Integer newsId) {
        return this.newsDao.delNewsById(newsId);
    }

    public int updNews(News news) {
        return this.newsDao.updNews(news);
    }

    public int addNews(News news) {
        return this.newsDao.addNews(news);
    }

    public List<News> queryAllNewsOver(int start, int end) {
        return this.newsDao.queryAllNewsOver(start,end);
    }

    public int countNews() {
        return this.newsDao.countNews();
    }

    public List<News> queryNewsFuzzy(String name) {
        return this.newsDao.queryNewsFuzzy(name);
    }

    public List<News> queryNewsOne(News news) {
        return this.newsDao.queryNewsOne(news);
    }

    public List<News> queryNewsList(News news) {
        return this.newsDao.queryNewsList(news);
    }

    public int deleteByPrimaryKey(Integer newsId) {
        return this.newsDao.deleteByPrimaryKey(newsId);
    }

    public int insert(News record) {
        return this.newsDao.insert(record);
    }

    public int insertSelective(News record) {
        return this.newsDao.insertSelective(record);
    }

    public News selectByPrimaryKey(Integer newsId) {
        return this.newsDao.selectByPrimaryKey(newsId);
    }

    public int updateByPrimaryKeySelective(News record) {
        return this.newsDao.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKeyWithBLOBs(News record) {
        return this.newsDao.updateByPrimaryKeyWithBLOBs(record);
    }

    public int updateByPrimaryKey(News record) {
        return this.newsDao.updateByPrimaryKey(record);
    }

    public List<News> queryNewsColumnById(Integer newsColumnId) {
        return this.newsDao.queryNewsColumnById(newsColumnId);
    }

    public List<News> queryNewsByColumStartAll() {
        return this.newsDao.queryNewsByColumStartAll();
    }
    public List<News> queryNewsByColumStartAll2() {
        return this.newsDao.queryNewsByColumStartAll2();
    }

    @Override
    public List<News> queryNewsByColumId1() {
        return this.newsDao.queryNewsByColumId1();
    }

    @Override
    public List<News> queryNewsByColumId2() {
        return this.newsDao.queryNewsByColumId2();
    }

    @Override
    public List<News> queryNewsByColumId3() {
        return this.newsDao.queryNewsByColumId3();
    }
}
