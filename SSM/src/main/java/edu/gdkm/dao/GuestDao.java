package edu.gdkm.dao;

import edu.gdkm.mapper.GuestMapper;
import edu.gdkm.po.Guest;
import org.apache.ibatis.annotations.Param;

import java.util.List;
public interface GuestDao extends GuestMapper {

    //根据id删除
    int deleteByPrimaryKey(Integer guestId);
    //添加
    int insert(Guest record);
    //添加
    int insertSelective(Guest record);
    //查询 根据id
    Guest selectByPrimaryKey(Integer guestId);
    //修改
    int updateByPrimaryKeySelective(Guest record);
    //修改
    int updateByPrimaryKeyWithBLOBs(Guest record);
    //修改
    int updateByPrimaryKey(Guest record);
    List<Guest> selectGuest();
    List<Guest> selectByStat(@Param("start") int start);
}