package edu.gdkm.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import edu.gdkm.po.Admin;
import edu.gdkm.po.News;
import edu.gdkm.service.NewsService;
import edu.gdkm.util.JsonUtile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;
import java.util.List;
@Controller
@RequestMapping("/admin")
public class NewsController {
    public NewsService newsService;
    @Autowired
    @Qualifier("NewsServiceImpl")
    public void setNewsService(NewsService newsService) {
        //新闻管理类
        this.newsService = newsService;
    }

    /*
    *
    * 新闻管理区域
    *
    *
    * */

    @GetMapping("/news/list/{start}")
    public String newsList(@PathVariable int start, Model model)
    {
        System.out.println("你好我建立了");
        int i = this.newsService.countNews();
        int ye=0,end=4;
        if(i%end==0){ye=i/end;}
        else{ye=(i/end)+1;}
        if(start>ye-1){
            start=ye-1;
        }

        if(start<0){
            start=0;
        }
        List<News> news = this.newsService.queryAllNewsOver(start*end, end);
        model.addAttribute("newList",news);
        model.addAttribute("yes",(Object)ye);

        return "NewsS/newsmain";
    }
    /*添加新闻*/
    @PostMapping("/news/addNews")
    public String addNews(News news,@RequestParam("picFile") MultipartFile picFile,
                          @RequestParam("appendixFile") MultipartFile appendixFile,
                          @RequestParam("videoFile") MultipartFile videoFile,
                          HttpServletRequest request,
                          HttpSession session
    ) throws IOException {
        // 获取文件上传到具体文件夹的绝对路径
        Admin admin =(Admin) session.getAttribute("ADMIN_SESSION");
        news.setAccount(admin.getAccount());
        news.setCreateTime(JsonUtile.getDate());
        news.setNum(0);
        String picPath = request.getSession().getServletContext().getRealPath("upload/pic");
        String appendixPath =request.getSession().getServletContext().getRealPath("upload/appendix");
        String viodePath =request.getSession().getServletContext().getRealPath("upload/viode");
        // 获取上传的文件名
        session.setAttribute("error","上传失败");
        String picfileName = picFile.getOriginalFilename();
        String appendixFilename = appendixFile.getOriginalFilename();
        String videoFilename = videoFile.getOriginalFilename();
        if(!picfileName.equals("")){
            picfileName = UUID.randomUUID().toString() +"_"+ picfileName;
            news.setPic("upload/pic/"+picfileName);
            File uploadpicFile = new File(picPath, picfileName);
            if (!uploadpicFile.exists()) {
                uploadpicFile.mkdirs();
            }
            picFile.transferTo(uploadpicFile);
        }
        //为了确保上传文件的重名问题，对文件名进行处理
        if(!appendixFilename.equals("")){
            appendixFilename = UUID.randomUUID().toString() +"_"+ appendixFilename;
            news.setAppendix("upload/appendix/"+appendixFilename);
            File appendixFiles = new File(appendixPath, appendixFilename);
            if (!appendixFiles.exists()) {
                appendixFiles.mkdirs();
            }
            appendixFile.transferTo(appendixFiles);
        }
        if(!videoFilename.equals("")) {
            videoFilename = UUID.randomUUID().toString() +"_"+ videoFilename;
            // 根据路径构建文件对象
            news.setVideo("upload/viode/"+videoFilename);
            // 在构建过程中一定要注意路径问题
            File videoFiles = new File(viodePath, videoFilename);
            if (!videoFiles.exists()) {
                videoFiles.mkdirs();
            }
            // 判断指定文件夹uploadfiles是否存在，不存在就创建
            // 上传文件
            videoFile.transferTo(videoFiles);
        }
        newsService.addNews(news);
        System.out.println(news);
        int i = newsService.countNews();
        if(i%6!=0){i/=6;i+=1;}
        else{i/=6;}
        session.setAttribute("error","上传成功");
        return "redirect:/admin/news/list/"+i;
    }
/*修改新闻*/
    @PostMapping("/news/updNews")
    public String updNews(
            News news,@RequestParam("picFile") MultipartFile picFile,
            @RequestParam("appendixFile") MultipartFile appendixFile,
            @RequestParam("videoFile") MultipartFile videoFile,
            HttpServletRequest request,
            HttpSession session
    ) throws IOException {
         news =(News) JsonUtile.getObjet(news);

        // 获取文件上传到具体文件夹的绝对路径
        Admin admin =(Admin) session.getAttribute("ADMIN_SESSION");
        news.setAccount(admin.getAccount());//设置当前修改人的名字
        news.setCreateTime(JsonUtile.getDate());//设置当前修改的时间
        String picPath = request.getSession().getServletContext().getRealPath("upload/pic");
        String appendixPath =request.getSession().getServletContext().getRealPath("upload/appendix");
        String viodePath =request.getSession().getServletContext().getRealPath("upload/viode");
        // 获取上传的文件名
        //获取当前数据库的
        News news1 = newsService.selectByPrimaryKey(news.getNewsId());
        String picfileName = picFile.getOriginalFilename();
        String appendixFilename = appendixFile.getOriginalFilename();
        String videoFilename = videoFile.getOriginalFilename();
        session.setAttribute("error","修改失败");
        if(!picfileName.equals("")){
            /*为空的时候不创建图片*/
            picfileName = UUID.randomUUID().toString() +"_"+ picfileName;
            news.setPic("upload/pic/"+picfileName);
            File uploadpicFile = new File(picPath, picfileName);
            if (!uploadpicFile.exists()) {
                uploadpicFile.mkdirs();
            }
            picFile.transferTo(uploadpicFile);
        }
        //为了确保上传文件的重名问题，对文件名进行处理
        if(!appendixFilename.equals("")){
            /*为空的时候不创建文件*/
            appendixFilename = UUID.randomUUID().toString() +"_"+ appendixFilename;
            news.setAppendix("upload/appendix/"+appendixFilename);
            File appendixFiles = new File(appendixPath, appendixFilename);
            if (!appendixFiles.exists()) {
                appendixFiles.mkdirs();
            }
            appendixFile.transferTo(appendixFiles);
        }
        if(!videoFilename.equals("")) {
            /*为空的时候不创建视频*/
            videoFilename = UUID.randomUUID().toString() +"_"+ videoFilename;
            // 根据路径构建文件对象
            news.setVideo("upload/viode/"+videoFilename);
            // 在构建过程中一定要注意路径问题
            File videoFiles = new File(viodePath, videoFilename);
            if (!videoFiles.exists()) {
                videoFiles.mkdirs();
            }
            // 判断指定文件夹uploadfiles是否存在，不存在就创建
            // 上传文件
            videoFile.transferTo(videoFiles);
        }
        news.setNum(news1.getNum());
        newsService.updNews(news);
        session.setAttribute("error","修改成功");
        return "redirect:/admin/news/list/0";
    }
/*删除新闻 通过 id*/
    @PostMapping("/news/DelNews")
    public String delNews(@RequestParam("newsColumId") int newsColumId, HttpSession session){
        int i = newsService.delNewsById(newsColumId);
        session.setAttribute("error","删除成功!");
        return "redirect:/admin/news/list/0";
    }
    /*查询新闻通过id*/
    @GetMapping("/news/queryNewsByid")
    @ResponseBody
    public String queryNewsByid(@RequestParam("newsid") int newsid) throws JsonProcessingException {
        News news = newsService.selectByPrimaryKey(newsid);
        return  JsonUtile.getJSON(news);
    }





    /*
     * 新闻分类列表查询
     * */
@GetMapping("/news/lists")
public String lists(){
    return "redirect:/admin/news/list/0";
}
    @PostMapping("/news/lists")
    public String lists(News news, Model model){
        //新闻查询

        news =(News) JsonUtile.getObjet(news);
        System.out.println("新闻"+news);
        boolean nullTrue = JsonUtile.getNullTrue(news);
        if(nullTrue==true){
            /*为空*/
            return "redirect:/admin/news/list/0";
        }
        List<News> news1 = newsService.queryNewsList(news);
        model.addAttribute("newList",news1);
        return "NewsS/newsmain";
    }





}
