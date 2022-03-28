package edu.gdkm.mapper;

import edu.gdkm.po.Newscolumn;

public interface NewscolumnMapper {

    int deleteByPrimaryKey(Integer newsColumnId);


    int insert(Newscolumn record);

    int insertSelective(Newscolumn record);

    Newscolumn selectByPrimaryKey(Integer newsColumnId);

    int updateByPrimaryKeySelective(Newscolumn record);


    int updateByPrimaryKey(Newscolumn record);
}