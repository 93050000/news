package edu.gdkm.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import edu.gdkm.po.Guest;
import edu.gdkm.service.AdminService;
import edu.gdkm.service.GuestSerive;
import edu.gdkm.service.NewsColumnService;
import edu.gdkm.service.NewsService;
import edu.gdkm.util.JsonUtile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Controller
@RequestMapping("/admin")
public class GuestController {

    public NewsService newsService;
    private AdminService adminService;
    public GuestSerive guestSerive;
    public NewsColumnService newsColumnService;

    @Autowired
    @Qualifier("AdminServiceImpl")
    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }
    @Autowired
    public void setNewsColumnService(NewsColumnService newsColumnService) {
        this.newsColumnService = newsColumnService;
    }
    @Autowired
    @Qualifier("GuestSeriveImpl")
    public void setGuestSerive(GuestSerive guestSerive) {
        this.guestSerive = guestSerive;
    }
    @Autowired
    @Qualifier("NewsServiceImpl")
    public void setNewsService(NewsService newsService) {
        //新闻管理类
        this.newsService = newsService;
    }

    /*留言管理*/
    @GetMapping("/message/list")
    public String MessageList(Model model){
        return "NewsS/guestsMain";
    }
    @PostMapping("/message/list")
    @ResponseBody
    public String MessageList() throws JsonProcessingException {
        List<Guest> guests = guestSerive.selectGuest();
        return JsonUtile.getJSON(guests);
    }
    @PostMapping("/message/listx")
    @ResponseBody
    public String MessageXqing(@RequestParam("id") int guestId) throws JsonProcessingException {
        Guest guest = guestSerive.selectByPrimaryKey(guestId);
        //来到这里代表已经看过了
        guest.setNewstatus("0");
        guestSerive.updateByPrimaryKey(guest);
        return JsonUtile.getJSON(guestSerive.selectGuest());
    }

    @GetMapping("/message/listx")
    @ResponseBody
    public String  GuestlistStart(@RequestParam("start") int start) throws JsonProcessingException {
        List<Guest> gs=  guestSerive.selectByStat(start);
        return JsonUtile.getJSON(gs);
    }
}
