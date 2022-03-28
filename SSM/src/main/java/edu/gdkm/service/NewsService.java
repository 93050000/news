package edu.gdkm.service;

import edu.gdkm.po.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsService {
    //获取所有新闻
    List<News> queryAllNews();
    //获取单个新闻
    News queryNewsById(Integer newsId);
    //删除一个新闻
    int delNewsById(Integer newsId);
    //修该一个新闻
    int updNews(News news);
    //添加新闻
    int addNews(News news);
    /*分页*/
    List<News> queryAllNewsOver(int start, int end);
    /*查询总个数*/
    int countNews();
    //模糊查询
    List<News> queryNewsFuzzy(String name);
    /*根据条件查询  多选一*/
    List<News> queryNewsOne(News news);
    /*根据条件  组合查询 多查询*/
    List<News> queryNewsList(News news);

    //继承
    int deleteByPrimaryKey(Integer newsId);


    int insert(News record);

    int insertSelective(News record);


    News selectByPrimaryKey(Integer newsId);


    int updateByPrimaryKeySelective(News record);


    int updateByPrimaryKeyWithBLOBs(News record);


    int updateByPrimaryKey(News record);

    List<News> queryNewsColumnById(Integer newsColumnId);

    List<News> queryNewsByColumStartAll();
    List<News> queryNewsByColumStartAll2();
    List<News> queryNewsByColumId1();
    List<News> queryNewsByColumId2();
    List<News> queryNewsByColumId3();
}
