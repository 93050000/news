package edu.gdkm.service;

import edu.gdkm.po.Admin;

import java.util.List;
public interface AdminService {

	   List<Admin> queryAllAdmin();
	   Admin findAdmin(String account,String passwoed);
	   //修改状态
		int adminInformation(Admin admin);
	int addAdmin(Admin admin);


	int deleteByPrimaryKey(Integer adminId);


	int insert(Admin record);

	int insertSelective(Admin record);


	Admin selectByPrimaryKey(Integer adminId);


	int updateByPrimaryKeySelective(Admin record);


	int updateByPrimaryKey(Admin record);
	/*
	 * 根据  登录账号 和登录状态来选择查询
	 * */
	List<Admin> findAcctionAdmin(Admin admin);

	int countNews();

	List<Admin> queryAllAdminOver(int start, int end);

	Admin selectByAccount(String account);
}
