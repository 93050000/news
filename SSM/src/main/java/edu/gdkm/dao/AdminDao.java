package edu.gdkm.dao;

import edu.gdkm.mapper.AdminMapper;
import org.apache.ibatis.annotations.Param;


import edu.gdkm.po.Admin;

import java.util.List;
public interface AdminDao extends AdminMapper {
	//用户登录验证
//	 Admin findAdmin(@Param("account") String account, @Param("password") String password);
	//查询所有用户
	List<Admin> queryAllAdmin();
	//根据用户名称验证客户
	Admin findAdmin(@Param("account") String account,@Param("password") String passwoed);
	//改变用户信息
	int adminInformation(Admin admin);
	/*
	* 添加用户
	* */
	int addAdmin(Admin admin);

	/*
	* 根据  登录账号 和登录状态来选择查询
	* */
	List<Admin> findAcctionAdmin(Admin admin);
	/*查询有多少用户*/
	int countNews();
/*
* 模糊查询  分页
* */
	List<Admin> queryAllAdminOver(@Param("start") int start, @Param("end") int end);

    Admin selectByAccount(@Param("account") String account);
}
