package edu.gdkm.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import edu.gdkm.po.Newscolumn;
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

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class NewsColumnController {
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










    /*栏目管理*/
    @GetMapping("/newsColumn/list")
    public String NewColumnlist(Model model){
        List<Newscolumn> newscolumns = newsColumnService.querAllNewsColum();
        model.addAttribute("newsColumList",newscolumns);
        return "NewsS/NewColum";
    }

    @PostMapping("/news/newsColum")
    @ResponseBody
    public String newsColum() throws JsonProcessingException {
        List<Newscolumn> newscolumns = newsColumnService.querAllNewsColum();
        return JsonUtile.getJSON(newscolumns);
    }
    //分类查询栏目
    @GetMapping("news/newsColum")
    public String newsColum(Newscolumn newscolumn,Model model){
        List<Newscolumn> lis= this.newsColumnService.selectByPrimary((Newscolumn) JsonUtile.getObjet(newscolumn));
        model.addAttribute("newsColumList",lis);
        return "NewsS/NewColum";
    }
    @GetMapping("news/updNewsColum")
    @ResponseBody
    public String updNewsColum(@RequestParam("newsColumnId") int newsColumnId) throws JsonProcessingException {
        /*返回要修改新闻栏目的id所有信息*/
        Newscolumn newscolumn = newsColumnService.queryNewsColumn(newsColumnId);
        return JsonUtile.getJSON(newscolumn);
    }
    @PostMapping("news/updNewsColum")
    public String updNewsColum(Newscolumn newscolumn, HttpSession session){
        /*修改新闻栏目*/
        newscolumn = (Newscolumn)JsonUtile.getObjet(newscolumn);
        boolean nullTrue = JsonUtile.getNullTrue(newscolumn);
        if(nullTrue==true){
            session.setAttribute("error","修改栏目信息失败！");
            return "redirect:/admin/newsColumn/list";
        }
        int i = newsColumnService.updateByPrimaryKeySelective(newscolumn);
        session.setAttribute("error","修改栏目信息成功！");
        return "redirect:/admin/newsColumn/list";
    }
    /*添加一个栏目*/
    @PostMapping("/admin/addNewsColumn")
    public String addNewsColumn(Newscolumn newscolumn,HttpSession session){
        newscolumn= (Newscolumn) JsonUtile.getObjet(newscolumn);
        boolean nullTrue = JsonUtile.getNullTrue(newscolumn);
        if(nullTrue==true){
            session.setAttribute("error","添加失败!");
            return "redirect:/admin/newsColumn/list";}
        Newscolumn newscolumn1 = newsColumnService.querCount(newscolumn);
        if(newscolumn1!=null){
            /*说明已经有了*/
            session.setAttribute("error","添加失败已经存在该栏目了!");
            return "redirect:/admin/newsColumn/list";
        }
        int i = newsColumnService.addNewColunm(newscolumn);
        if(i>0)
            session.setAttribute("error","添加成功!");
        else
            session.setAttribute("error","添加失败!");
        return "redirect:/admin/newsColumn/list";
    }
    /*删除一个栏目*/
    @PostMapping("/news/deleteNewsColum")
    public String deleteNewsColum(@RequestParam("newsColumnId") int newsColumnId,HttpSession session){
        int i = newsColumnService.deleteByPrimaryKey(newsColumnId);
        if(i<1){session.setAttribute("error","删除栏目失败！");}
        else{session.setAttribute("error","删除栏目成功!");}
        return "redirect:/admin/newsColumn/list";
    }

}
