package edu.gdkm.mapper;

import edu.gdkm.po.Admin;

public interface AdminMapper {

    int deleteByPrimaryKey(Integer adminId);


    int insert(Admin record);

    int insertSelective(Admin record);


    Admin selectByPrimaryKey(Integer adminId);


    int updateByPrimaryKeySelective(Admin record);


    int updateByPrimaryKey(Admin record);

}