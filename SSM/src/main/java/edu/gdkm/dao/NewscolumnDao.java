package edu.gdkm.dao;

import edu.gdkm.mapper.NewscolumnMapper;
import edu.gdkm.po.Newscolumn;
import org.apache.ibatis.annotations.Param;

import java.util.List;
public interface NewscolumnDao extends NewscolumnMapper {
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
    Newscolumn queryFre(@Param("columnCode") String columnCode,@Param("columnName") String columnName);
    //根据条件查询栏目
    List<Newscolumn> selectByPrimary(Newscolumn newscolumn);

    Newscolumn querCount(Newscolumn newscolumn);
/*给前端的  只能查询没有被禁用的*/
    List<Newscolumn> queryTrue();
}
