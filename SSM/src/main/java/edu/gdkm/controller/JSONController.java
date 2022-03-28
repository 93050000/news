package edu.gdkm.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import edu.gdkm.po.Guest;
import edu.gdkm.po.News;
import edu.gdkm.po.Newscolumn;
import edu.gdkm.service.AdminService;
import edu.gdkm.service.GuestSerive;
import edu.gdkm.service.NewsColumnService;
import edu.gdkm.service.NewsService;
import edu.gdkm.util.JsonUtile;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
@RequestMapping("/qian")
public class JSONController {
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



    /*前端实现接口区域 start*/
    /*新闻分栏李彪查询*/
    @RequestMapping("/news/Column")
    public String newsList() throws JsonProcessingException {
        Map<String,Object> map=new HashMap<String, Object>();
       List<Newscolumn> newslist =newsColumnService.queryTrue();
        if(newslist==null){
            map.put("start","500");
            map.put("error","还没有新闻栏目");
            return JsonUtile.getJSON(map);
        }
        map.put("start","200");
        /*新闻所有列表  状态正常的*/
        map.put("Columlist",newslist);
        return JsonUtile.getJSON(map);

    }
    /*新闻分栏查询*/
    /*新闻分栏列表下的新闻获取*/
    @RequestMapping("/news/list")
    public String newsList(@RequestParam("newsColumnId") Integer newsColumnId) throws JsonProcessingException {
        /*获取分类信息*/
        Newscolumn newscolumn = newsColumnService.queryNewsColumn(newsColumnId);
        /*判断新闻栏目是否是禁用的*/
        if(newscolumn==null||newscolumn.getStatus().equals("0")){
            Map<String,Object> map=new HashMap<String, Object>();
            map.put("start","500");
            map.put("error","该栏目已经被禁用或者不存在!");
            return JsonUtile.getJSON(map);
            }
        News news=new News();
        news.setNewsColumnId(newsColumnId);
        /*根据栏目id获取新闻*/
        List<News> newslist=newsService.queryNewsOne(news);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("start","200");
        map.put("newslist",newslist);
        String json = JsonUtile.getJSON(map);
        return json;
    }
    /*单个新闻获取 根据id start*/
    @RequestMapping("/news/one")
    public String newsOne(Integer newsId) throws JsonProcessingException {
        Map<String,Object> map=new HashMap<String, Object>();
        News news = newsService.queryNewsById(newsId);
        if(news==null){
            map.put("start","500");
            map.put("error","该新闻不存在!");
            return JsonUtile.getJSON(map);
        }
        Newscolumn newscolumn = newsColumnService.queryNewsColumn(news.getNewsColumnId());
        if(newscolumn.getStatus().equals("0")){
            map.put("start","500");
            map.put("error","该新闻所在栏目已经被禁止访问!");
            return JsonUtile.getJSON(map);
        }
        news.setNum(news.getNum()+1);
        //增加点击量
        newsService.updNews(news);
        /*能到这里说明没有问题可以返沪数据了*/
        map.put("start","200");
        map.put("news",news);
        return JsonUtile.getJSON(map);
    }
    /*单个新闻获取 根据id end*/
    /*新闻前四获取 start*/
    @RequestMapping("/news/qianshi")
    public String newsQian() throws JsonProcessingException {
        Map<String,Object> map=new HashMap<String, Object>();
        List<News> news=newsService.queryNewsByColumStartAll();
        if(news==null){

            map.put("start","500");
            map.put("error","新闻为空");
            return JsonUtile.getJSON(map);
        }

        map.put("start","200");
        map.put("newsQian",news);
        return JsonUtile.getJSON(map);
    }
//    四到八个
    @RequestMapping("/news/qiansha")
    public String newsQian2() throws JsonProcessingException {
        Map<String,Object> map=new HashMap<String, Object>();
        List<News> news=newsService.queryNewsByColumStartAll2();
        if(news==null){

            map.put("start","500");
            map.put("error","新闻为空");
            return JsonUtile.getJSON(map);
        }

        map.put("start","200");
        map.put("newsQian",news);
        return JsonUtile.getJSON(map);
    }

//    根据栏目id获取
    @RequestMapping("/news/qianByCid1")
    public String newsByCid() throws JsonProcessingException {
        Map<String,Object> map=new HashMap<String, Object>();
        List<News> news=newsService.queryNewsByColumId1();
        System.out.println(news);
        if(news==null){

            map.put("start","500");
            map.put("error","新闻为空");
            return JsonUtile.getJSON(map);
        }

        map.put("start","200");
        map.put("newsQian",news);
        return JsonUtile.getJSON(map);
    }
    //    根据栏目id获取
    @RequestMapping("/news/qianByCid2")
    public String newsByCid2() throws JsonProcessingException {
        Map<String,Object> map=new HashMap<String, Object>();
        List<News> news=newsService.queryNewsByColumId2();
        if(news==null){

            map.put("start","500");
            map.put("error","新闻为空");
            return JsonUtile.getJSON(map);
        }

        map.put("start","200");
        map.put("newsQian",news);
        return JsonUtile.getJSON(map);
    }
    //    根据栏目id获取
    @RequestMapping("/news/qianByCid3")
    public String newsByCid3() throws JsonProcessingException {
        Map<String,Object> map=new HashMap<String, Object>();
        List<News> news=newsService.queryNewsByColumId3();
        if(news==null){

            map.put("start","500");
            map.put("error","新闻为空");
            return JsonUtile.getJSON(map);
        }

        map.put("start","200");
        map.put("newsQian",news);
        return JsonUtile.getJSON(map);
    }
    /*留言管理 start*/
    /*留言查询*/
    @RequestMapping("/guest/guestlist")
    public String guestList() throws JsonProcessingException {
        Map<String,Object> map=new HashMap<String, Object>();
        List<Guest> guests = guestSerive.selectGuest();
        if(guests==null){
            map.put("start","500");
            map.put("error","暂无留言!");
            return JsonUtile.getJSON(map);
        }
        map.put("start","200");
        map.put("guests",guests);
        return JsonUtile.getJSON(map);
    }
    /*留言添加*/
    @RequestMapping("/guest/addguest")
    public String addguest(Guest guest) throws JsonProcessingException {
        guest=(Guest)JsonUtile.getObjet(guest);
        Map<String,Object> map=new HashMap<String, Object>();
        boolean nullTrue = JsonUtile.getNullTrue(guest);
        if(nullTrue==true){
            map.put("start","500");
            map.put("error","上传失败！请正确填写信息!");
            return JsonUtile.getJSON(map);
        }
        /*代表新消息未读*/
        guest.setNewstatus("1");
        int insert = guestSerive.insert(guest);
        if(insert<1){
            map.put("start","500");
            map.put("error","上传失败！数据库内部奔溃!");
            return JsonUtile.getJSON(map);
        }
        map.put("start","200");
        map.put("error","上传成功!");
        return JsonUtile.getJSON(map);
    }

    /*留言管理 end*/



























    /*前端实现接口区域 end*/



}
