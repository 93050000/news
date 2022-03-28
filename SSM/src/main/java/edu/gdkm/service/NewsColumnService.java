package edu.gdkm.service;

import edu.gdkm.po.Newscolumn;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsColumnService {
    //查询所有分类
    public List<Newscolumn> querAllNewsColum();
    //按id查询分类
    Newscolumn queryNewsColumn(Integer newsColumnId);
    //按id删除分类
    int delNewColunm(Integer newsColumnId);
    //添加分类
    int addNewColunm(Newscolumn newscolumn);
    //修改分类
    int updNewColunm(Newscolumn newscolumn);

    //按需求查询分类  查询自由
    Newscolumn queryFre(String columnCode,String columnName);





    int deleteByPrimaryKey(Integer newsColumnId);


    int insert(Newscolumn record);

    int insertSelective(Newscolumn record);

    Newscolumn selectByPrimaryKey(Integer newsColumnId);

    int updateByPrimaryKeySelective(Newscolumn record);


    int updateByPrimaryKey(Newscolumn record);

    List<Newscolumn> selectByPrimary(Newscolumn newscolumn);

    Newscolumn querCount(Newscolumn newscolumn);

    List<Newscolumn> queryTrue();
}
