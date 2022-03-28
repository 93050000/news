package edu.gdkm.service.impl;

import edu.gdkm.dao.GuestDao;
import edu.gdkm.po.Guest;
import edu.gdkm.service.GuestSerive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
@Component("GuestSeriveImpl")
public class GuestSeriveImpl implements GuestSerive {
    public GuestDao guestDao;
    @Autowired
    public void setGuestDao(GuestDao guestDao) {
        this.guestDao = guestDao;
    }

    public int deleteByPrimaryKey(Integer guestId) {
        return this.guestDao.deleteByPrimaryKey(guestId);
    }

    public int insert(Guest record) {
        return this.guestDao.insert(record);
    }

    public int insertSelective(Guest record) {
        return this.guestDao.insertSelective(record);
    }

    public Guest selectByPrimaryKey(Integer guestId) {
        return this.guestDao.selectByPrimaryKey(guestId);
    }

    public int updateByPrimaryKeySelective(Guest record) {
        return this.guestDao.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKeyWithBLOBs(Guest record) {
        return this.guestDao.updateByPrimaryKeyWithBLOBs(record);
    }

    public int updateByPrimaryKey(Guest record) {
        return this.guestDao.updateByPrimaryKey(record);
    }

    public List<Guest> selectGuest() {
        return this.guestDao.selectGuest();
    }

    public List<Guest> selectByStat(int start) {
        return this.guestDao.selectByStat(start);
    }
}
