package edu.gdkm.dao;

import edu.gdkm.mapper.NewsMapper;
import edu.gdkm.po.News;
import org.apache.ibatis.annotations.Param;


import java.util.List;
public interface NewsDao extends NewsMapper {
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
    List<News> queryAllNewsOver(@Param("start") int start, @Param("end") int end);
    /*查询总个数*/
    int countNews();
    List<News> queryNewsFuzzy(@Param("name") String name);
    /*根据条件查询  多选一*/
    List<News> queryNewsOne(News news);

    /*根据条件  组合查询 多查询*/
    List<News> queryNewsList(News news);

    /*根据类别查询*/
    List<News> queryNewsColumnById(Integer newsColumnId);

    List<News> queryNewsByColumStartAll();
    List<News> queryNewsByColumStartAll2();
    List<News> queryNewsByColumId1();
    List<News> queryNewsByColumId2();
    List<News> queryNewsByColumId3();
}
