package edu.gdkm.mapper;

import edu.gdkm.po.Guest;

public interface GuestMapper {

    int deleteByPrimaryKey(Integer guestId);


    int insert(Guest record);


    int insertSelective(Guest record);

    Guest selectByPrimaryKey(Integer guestId);


    int updateByPrimaryKeySelective(Guest record);

    int updateByPrimaryKeyWithBLOBs(Guest record);

    int updateByPrimaryKey(Guest record);
}