package edu.gdkm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import edu.gdkm.dao.AdminDao;
import edu.gdkm.po.Admin;
import edu.gdkm.service.AdminService;

import java.util.List;

@Component("AdminServiceImpl")
public class AdminServiceImpl implements AdminService {
//	@Autowired
//    @Qualifier("adminDao") //注入AdminDao接口
	private AdminDao adminDao;
	@Autowired
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	public List<Admin> queryAllAdmin() {
		System.out.println("我来写作业了");
		System.out.println("这是adminDao"+adminDao);
		return adminDao.queryAllAdmin();
	}

	public Admin findAdmin(String account, String passwoed) {
		return adminDao.findAdmin(account,passwoed);
	}
	//修改用户信息
	public int adminInformation(Admin admin) {
		return adminDao.adminInformation(admin);
	}

	public int addAdmin(Admin admin) {
		return adminDao.addAdmin(admin);
	}

	public int deleteByPrimaryKey(Integer adminId) {
		return this.adminDao.deleteByPrimaryKey(adminId);
	}

	public int insert(Admin record) {
		return this.adminDao.insert(record);
	}

	public int insertSelective(Admin record) {
		return this.adminDao.insertSelective(record);
	}

	public Admin selectByPrimaryKey(Integer adminId) {
		return this.adminDao.selectByPrimaryKey(adminId);
	}

	public int updateByPrimaryKeySelective(Admin record) {
		return this.adminDao.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Admin record) {
		return this.adminDao.updateByPrimaryKey(record);
	}

	public List<Admin> findAcctionAdmin(Admin admin) {
		return this.adminDao.findAcctionAdmin(admin);
	}

	public int countNews() {
		return this.adminDao.countNews();
	}

	public List<Admin> queryAllAdminOver(int start, int end) {
		return this.adminDao.queryAllAdminOver(start,end);
	}

    public Admin selectByAccount(String account) {
        return this.adminDao.selectByAccount(account);
    }


}
