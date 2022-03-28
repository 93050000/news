package edu.gdkm.service;

import edu.gdkm.po.Guan;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GuanService {
    /*查询所有管理员*/
    List<Guan> queryAllGuan();
    /*根据id删除管理员*/
    int delGuanById(Integer guanId);
    /*根据id查询管理员*/
    Guan queryGuan(Integer guanId);
    /*修改管理员信息*/
    int updGuan(Guan guan);
    /*添加管理员*/
    int addGuan(Guan guan);
    /*根据账户密码判断是否正确*/
    Guan findGuan(String  guanAccount);
}
