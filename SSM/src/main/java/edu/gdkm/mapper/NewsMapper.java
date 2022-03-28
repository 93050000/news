package edu.gdkm.mapper;

import edu.gdkm.po.News;

public interface NewsMapper {

    int deleteByPrimaryKey(Integer newsId);


    int insert(News record);

    int insertSelective(News record);


    News selectByPrimaryKey(Integer newsId);


    int updateByPrimaryKeySelective(News record);


    int updateByPrimaryKeyWithBLOBs(News record);


    int updateByPrimaryKey(News record);
}