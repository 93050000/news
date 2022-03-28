package edu.gdkm.service.impl;

import edu.gdkm.dao.GuanDao;
import edu.gdkm.po.Guan;
import edu.gdkm.service.GuanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.util.List;
@Component("GuanServiceImpl")
public class GuanServiceImpl implements GuanService {
    private GuanDao guanDao;
    @Autowired
    public void setGuanDao(GuanDao guanDao) {
        this.guanDao = guanDao;
    }


    public List<Guan> queryAllGuan() {
        return guanDao.queryAllGuan();
    }

    public int delGuanById(Integer guanId) {
        return guanDao.delGuanById(guanId);
    }

    public Guan queryGuan(Integer guanId) {
        return guanDao.queryGuan(guanId);
    }

    public int updGuan(Guan guan) {
        return guanDao.updGuan(guan);
    }

    public int addGuan(Guan guan) {
        return guanDao.addGuan(guan);
    }

    public Guan findGuan(String guanAccount) {
        return guanDao.findGuan(guanAccount);
    }
}
