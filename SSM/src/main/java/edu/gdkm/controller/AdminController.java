package edu.gdkm.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.mysql.cj.Session;
import com.sun.org.apache.bcel.internal.generic.ACONST_NULL;
import edu.gdkm.po.*;
import edu.gdkm.service.AdminService;
import edu.gdkm.service.GuestSerive;
import edu.gdkm.service.NewsColumnService;
import edu.gdkm.service.NewsService;
import edu.gdkm.util.JsonUtile;
import org.junit.Test;
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
import java.util.List;
import java.util.UUID;

@Controller
//跨域运行注解
@RequestMapping("/admin")
public class AdminController {

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
@RequestMapping("/admin")
public String admin(){
    return "redirect:/admin/toAdminIndex";
}
    @GetMapping("/login")
    public String login(){
//        List<Admin> admins = this.adminService.queryAllAdmin();
        return "logins";
    }
    @RequestMapping("/toAdminIndex")
    public String toAdminIndex(){
        return "admin/main";
    }
    @PostMapping("/login")
    public String login(@RequestParam("account") String account, @RequestParam("password") String password, Model model, HttpSession session){

        Admin admin = this.adminService.findAdmin(account, password);
        if(admin==null){
            model.addAttribute("msg","账号密码错误!");
            return "logins";
        }else{
            if(admin.getStatus().equals("0")){
                model.addAttribute("msg","你的账户已经被冻结!");
                return "logins";
            }
            session.setAttribute("ADMIN_SESSION",admin);
            return "redirect:/admin/toAdminIndex";
        }
    }
    /*用户退出*/
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("ADMIN_SESSION");
        return "logins";
    }
    /*用户信息*/
    @GetMapping("/admin/toAdminInfo")
    public String toAdminInfo(){
        return "admin/adminInfo";
    }
    /*用户修改根据id*/
    @PostMapping("/admin/updAdmin")
    public String updAdmin(Admin admin, HttpSession session){
        int i = adminService.updateByPrimaryKeySelective(admin);
        Admin admin1=(Admin)session.getAttribute("ADMIN_SESSION");

        if(admin.getAdminId()==admin1.getAdminId()){
            if(admin.getPassword()!=null&&(!admin.getPassword().equals(admin1.getPassword()))){
                session.setAttribute("error","密码错误！");
                return "redirect:/admin/admin/toAdminInfo";
            }
            session.removeAttribute("ADMIN_SESSION");
            admin=adminService.selectByPrimaryKey(admin.getAdminId());
            session.setAttribute("ADMIN_SESSION",admin);
            session.setAttribute("error","修改成功");
            System.out.println("已经设置了"+session.getAttribute("ADMIN_SESSION"));

            return "redirect:/admin/admin/toAdminInfo";
        }
        session.setAttribute("error","修改成功");
    return "redirect:/admin/admin/list/0";
    }
    @PostMapping("/admin/updAdminPssword")
    /*修改密码*/
    public String updAdminPssword(Admin admin,@RequestParam("oldPassword") String oldPassword,Model model,HttpSession session){
        Admin admin1 = adminService.selectByPrimaryKey(admin.getAdminId());
        if(!admin1.getPassword().equals(oldPassword)){
            /*密码错误不允许修改*/
            session.setAttribute("error","密码错误！不允许修改");
            return "redirect:/admin/admin/list/0";
        }
        admin=(Admin)JsonUtile.getObjet(admin);
        System.out.println(admin);
        System.out.println("当时我是拒绝的");
        int i = adminService.updateByPrimaryKeySelective(admin);
        session.setAttribute("error","修改成功！");
        return "redirect:/admin/admin/list/0";
    }

    /*去往用户列表*/
    @GetMapping("/admin/list/{start}")
    public String adminList(@PathVariable int start,Model model){

//        List<Admin> admins = adminService.queryAllAdmin();
//        model.addAttribute("admins",admins);
        int i = this.adminService.countNews();
        int ye=0,end=6;
        if(i%end==0){ye=i/end;}
        else{ye=(i/end)+1;}
        if(start>ye-1){
            start=ye-1;
        }

        if(start<0){
            start=0;
        }
        //用户列表
        List<Admin> admins = this.adminService.queryAllAdminOver(start*end, end);
        System.out.println(admins);
        model.addAttribute("admins",admins);
        model.addAttribute("yes",(Object)ye);


//        System.out.println(admins);
        return "admin/admin";
    }
    @GetMapping("/admin/list")
    public String adminList(){
        return "redirect:/admin/admin/list/0";
    }
    /*按条件查询*/
    @PostMapping("/admin/list")
    public String adminList(Admin admin,Model model){
        //用户列表
         admin = (Admin) JsonUtile.getObjet(admin);
        boolean nullTrue = JsonUtile.getNullTrue(admin);
        if(nullTrue==true){
           /*说明没有传递任何值*/

            return "redirect:/admin/admin/list/0";
        }
        System.out.println(admin);
        List<Admin> acctionAdmin = adminService.findAcctionAdmin(admin);
        model.addAttribute("admins",acctionAdmin);
        return "admin/admin";
    }

    @PostMapping("/admin/addAdmin")
    public String addAdmin(Admin admin,Model model,HttpSession session){
        Admin admin1=adminService.selectByAccount(admin.getAccount());
        if(admin1!=null){
            session.setAttribute("error","添加失败!已有该用户！");
            return "redirect:/admin/admin/list/0";
        }
        int i = adminService.addAdmin(admin);
        //添加成功后跳转到用户管理页
        session.setAttribute("error","添加用户成功!");
        return "redirect:/admin/admin/list/0";
    }
    @GetMapping("/admin/updQueI")
    @ResponseBody
    public String updQueI(Integer id) throws JsonProcessingException {
        Admin admin = this.adminService.selectByPrimaryKey(id);
        return JsonUtile.getJSON(admin);
    }
    /*修改一个admin*/
    @PostMapping("/admin/updQueI")
    public String updQueI(Admin admin,HttpSession session){
        System.out.println(admin);
        Admin admin2=(Admin)session.getAttribute("ADMIN_SESSION");
        Admin admin1 = adminService.selectByPrimaryKey(admin.getAdminId());
        if(!admin.getPassword().equals(admin1.getPassword())){
            System.out.println(admin2.getAccount()+"想修改"+admin.getAccount()+"的信息，但是密码错误！");
            session.setAttribute("error","密码错误");
            return "redirect:/admin/admin/list/0";
        }

        this.adminService.updateByPrimaryKeySelective((Admin)JsonUtile.getObjet(admin));
        if(admin.getAdminId()==admin2.getAdminId()){
            /*如果修改了当前登录的密码，就会退出登录！*/

            session.removeAttribute("ADMIN_SESSION");
            admin=adminService.selectByPrimaryKey(admin.getAdminId());
            session.setAttribute("ADMIN_SESSION",admin);
            System.out.println("已经设置了"+session.getAttribute("ADMIN_SESSION"));

        }
        session.setAttribute("error","修改成功");
        return "redirect:/admin/admin/list/0";
    }
    @PostMapping("/admin/deleteAdminById")
    public String deleteAdminById(@RequestParam("id") int id,HttpSession session){
        this.adminService.deleteByPrimaryKey(id);
        session.setAttribute("error","删除成功!");
        return "redirect:/admin/admin/list/0";
    }


















//
//    /*
//    *
//    * 新闻管理区域
//    *
//    *
//    * */
//
//    @GetMapping("/news/list/{start}")
//    public String newsList(@PathVariable int start, Model model)
//    {
//        System.out.println("你好我建立了");
//        int i = this.newsService.countNews();
//        int ye=0,end=4;
//        if(i%end==0){ye=i/end;}
//        else{ye=(i/end)+1;}
//        if(start>ye-1){
//            start=ye-1;
//        }
//
//        if(start<0){
//            start=0;
//        }
//        List<News> news = this.newsService.queryAllNewsOver(start*end, end);
//        model.addAttribute("newList",news);
//        model.addAttribute("yes",(Object)ye);
//
//        return "NewsS/newsmain";
//    }
//    /*添加新闻*/
//    @PostMapping("/news/addNews")
//    public String addNews(News news,@RequestParam("picFile") MultipartFile picFile,
//                          @RequestParam("appendixFile") MultipartFile appendixFile,
//                          @RequestParam("videoFile") MultipartFile videoFile,
//                          HttpServletRequest request,
//                          HttpSession session
//    ) throws IOException {
//        // 获取文件上传到具体文件夹的绝对路径
//        Admin admin =(Admin) session.getAttribute("ADMIN_SESSION");
//        news.setAccount(admin.getAccount());
//        news.setCreateTime(JsonUtile.getDate());
//        news.setNum(0);
//        String picPath = request.getSession().getServletContext().getRealPath("upload/pic");
//        String appendixPath =request.getSession().getServletContext().getRealPath("upload/appendix");
//        String viodePath =request.getSession().getServletContext().getRealPath("upload/viode");
//        // 获取上传的文件名
//        session.setAttribute("error","上传失败");
//        String picfileName = picFile.getOriginalFilename();
//        String appendixFilename = appendixFile.getOriginalFilename();
//        String videoFilename = videoFile.getOriginalFilename();
//        if(!picfileName.equals("")){
//            picfileName = UUID.randomUUID().toString() +"_"+ picfileName;
//            news.setPic("upload/pic/"+picfileName);
//            File uploadpicFile = new File(picPath, picfileName);
//            if (!uploadpicFile.exists()) {
//                uploadpicFile.mkdirs();
//            }
//            picFile.transferTo(uploadpicFile);
//        }
//        //为了确保上传文件的重名问题，对文件名进行处理
//        if(!appendixFilename.equals("")){
//            appendixFilename = UUID.randomUUID().toString() +"_"+ appendixFilename;
//            news.setAppendix("upload/appendix/"+appendixFilename);
//            File appendixFiles = new File(appendixPath, appendixFilename);
//            if (!appendixFiles.exists()) {
//                appendixFiles.mkdirs();
//            }
//            appendixFile.transferTo(appendixFiles);
//        }
//        if(!videoFilename.equals("")) {
//            videoFilename = UUID.randomUUID().toString() +"_"+ videoFilename;
//            // 根据路径构建文件对象
//            news.setVideo("upload/viode/"+videoFilename);
//            // 在构建过程中一定要注意路径问题
//            File videoFiles = new File(viodePath, videoFilename);
//            if (!videoFiles.exists()) {
//                videoFiles.mkdirs();
//            }
//            // 判断指定文件夹uploadfiles是否存在，不存在就创建
//            // 上传文件
//            videoFile.transferTo(videoFiles);
//        }
//        newsService.addNews(news);
//        System.out.println(news);
//        int i = newsService.countNews();
//        if(i%6!=0){i/=6;i+=1;}
//        else{i/=6;}
//        session.setAttribute("error","上传成功");
//        return "redirect:/admin/news/list/"+i;
//    }
///*修改新闻*/
//    @PostMapping("/news/updNews")
//    public String updNews(
//            News news,@RequestParam("picFile") MultipartFile picFile,
//            @RequestParam("appendixFile") MultipartFile appendixFile,
//            @RequestParam("videoFile") MultipartFile videoFile,
//            HttpServletRequest request,
//            HttpSession session
//    ) throws IOException {
//         news =(News) JsonUtile.getObjet(news);
//
//        // 获取文件上传到具体文件夹的绝对路径
//        Admin admin =(Admin) session.getAttribute("ADMIN_SESSION");
//        news.setAccount(admin.getAccount());//设置当前修改人的名字
//        news.setCreateTime(JsonUtile.getDate());//设置当前修改的时间
//        String picPath = request.getSession().getServletContext().getRealPath("upload/pic");
//        String appendixPath =request.getSession().getServletContext().getRealPath("upload/appendix");
//        String viodePath =request.getSession().getServletContext().getRealPath("upload/viode");
//        // 获取上传的文件名
//        //获取当前数据库的
//        News news1 = newsService.selectByPrimaryKey(news.getNewsId());
//        String picfileName = picFile.getOriginalFilename();
//        String appendixFilename = appendixFile.getOriginalFilename();
//        String videoFilename = videoFile.getOriginalFilename();
//        session.setAttribute("error","修改失败");
//        if(!picfileName.equals("")){
//            /*为空的时候不创建图片*/
//            picfileName = UUID.randomUUID().toString() +"_"+ picfileName;
//            news.setPic("upload/pic/"+picfileName);
//            File uploadpicFile = new File(picPath, picfileName);
//            if (!uploadpicFile.exists()) {
//                uploadpicFile.mkdirs();
//            }
//            picFile.transferTo(uploadpicFile);
//        }
//        //为了确保上传文件的重名问题，对文件名进行处理
//        if(!appendixFilename.equals("")){
//            /*为空的时候不创建文件*/
//            appendixFilename = UUID.randomUUID().toString() +"_"+ appendixFilename;
//            news.setAppendix("upload/appendix/"+appendixFilename);
//            File appendixFiles = new File(appendixPath, appendixFilename);
//            if (!appendixFiles.exists()) {
//                appendixFiles.mkdirs();
//            }
//            appendixFile.transferTo(appendixFiles);
//        }
//        if(!videoFilename.equals("")) {
//            /*为空的时候不创建视频*/
//            videoFilename = UUID.randomUUID().toString() +"_"+ videoFilename;
//            // 根据路径构建文件对象
//            news.setVideo("upload/viode/"+videoFilename);
//            // 在构建过程中一定要注意路径问题
//            File videoFiles = new File(viodePath, videoFilename);
//            if (!videoFiles.exists()) {
//                videoFiles.mkdirs();
//            }
//            // 判断指定文件夹uploadfiles是否存在，不存在就创建
//            // 上传文件
//            videoFile.transferTo(videoFiles);
//        }
//        news.setNum(news1.getNum());
//        newsService.updNews(news);
//        session.setAttribute("error","修改成功");
//        return "redirect:/admin/news/list/0";
//    }
///*删除新闻 通过 id*/
//    @PostMapping("/news/DelNews")
//    public String delNews(@RequestParam("newsColumId") int newsColumId,HttpSession session){
//        int i = newsService.delNewsById(newsColumId);
//        session.setAttribute("error","删除成功!");
//        return "redirect:/admin/news/list/0";
//    }
//    /*查询新闻通过id*/
//    @GetMapping("/news/queryNewsByid")
//    @ResponseBody
//    public String queryNewsByid(@RequestParam("newsid") int newsid) throws JsonProcessingException {
//        News news = newsService.selectByPrimaryKey(newsid);
//        return  JsonUtile.getJSON(news);
//    }
//
//
//
//
//
//    /*
//     * 新闻分类列表查询
//     * */
//@GetMapping("/news/lists")
//public String lists(){
//    return "redirect:/admin/news/list/0";
//}
//    @PostMapping("/news/lists")
//    public String lists(News news,Model model){
//        //新闻查询
//
//        news =(News) JsonUtile.getObjet(news);
//        System.out.println("新闻"+news);
//        boolean nullTrue = JsonUtile.getNullTrue(news);
//        if(nullTrue==true){
//            /*为空*/
//            return "redirect:/admin/news/list/0";
//        }
//        List<News> news1 = newsService.queryNewsList(news);
//        model.addAttribute("newList",news1);
//        return "NewsS/newsmain";
//    }
//
//
//












//
//    /*栏目管理*/
//    @GetMapping("/newsColumn/list")
//    public String NewColumnlist(Model model){
//        List<Newscolumn> newscolumns = newsColumnService.querAllNewsColum();
//        model.addAttribute("newsColumList",newscolumns);
//        return "NewsS/NewColum";
//    }
//
//    @PostMapping("/news/newsColum")
//    @ResponseBody
//    public String newsColum() throws JsonProcessingException {
//        List<Newscolumn> newscolumns = newsColumnService.querAllNewsColum();
//        return JsonUtile.getJSON(newscolumns);
//    }
//    //分类查询栏目
//    @GetMapping("news/newsColum")
//    public String newsColum(Newscolumn newscolumn,Model model){
//       List<Newscolumn> lis= this.newsColumnService.selectByPrimary((Newscolumn) JsonUtile.getObjet(newscolumn));
//        model.addAttribute("newsColumList",lis);
//        return "NewsS/NewColum";
//    }
//    @GetMapping("news/updNewsColum")
//    @ResponseBody
//    public String updNewsColum(@RequestParam("newsColumnId") int newsColumnId) throws JsonProcessingException {
//        /*返回要修改新闻栏目的id所有信息*/
//        Newscolumn newscolumn = newsColumnService.queryNewsColumn(newsColumnId);
//        return JsonUtile.getJSON(newscolumn);
//    }
//    @PostMapping("news/updNewsColum")
//    public String updNewsColum(Newscolumn newscolumn,HttpSession session){
//        /*修改新闻栏目*/
//        newscolumn = (Newscolumn)JsonUtile.getObjet(newscolumn);
//        boolean nullTrue = JsonUtile.getNullTrue(newscolumn);
//        if(nullTrue==true){
//            session.setAttribute("error","修改栏目信息失败！");
//            return "redirect:/admin/newsColumn/list";
//        }
//        int i = newsColumnService.updateByPrimaryKeySelective(newscolumn);
//        session.setAttribute("error","修改栏目信息成功！");
//        return "redirect:/admin/newsColumn/list";
//    }
//    /*添加一个栏目*/
//    @PostMapping("/admin/addNewsColumn")
//    public String addNewsColumn(Newscolumn newscolumn,HttpSession session){
//        newscolumn= (Newscolumn) JsonUtile.getObjet(newscolumn);
//        boolean nullTrue = JsonUtile.getNullTrue(newscolumn);
//        if(nullTrue==true){
//            session.setAttribute("error","添加失败!");
//            return "redirect:/admin/newsColumn/list";}
//        Newscolumn newscolumn1 = newsColumnService.querCount(newscolumn);
//        if(newscolumn1!=null){
//        /*说明已经有了*/
//            session.setAttribute("error","添加失败已经存在该栏目了!");
//            return "redirect:/admin/newsColumn/list";
//        }
//        int i = newsColumnService.addNewColunm(newscolumn);
//        if(i>0)
//        session.setAttribute("error","添加成功!");
//        else
//            session.setAttribute("error","添加失败!");
//        return "redirect:/admin/newsColumn/list";
//    }
///*删除一个栏目*/
//    @PostMapping("/news/deleteNewsColum")
//    public String deleteNewsColum(@RequestParam("newsColumnId") int newsColumnId,HttpSession session){
//        int i = newsColumnService.deleteByPrimaryKey(newsColumnId);
//        if(i<1){session.setAttribute("error","删除栏目失败！");}
//        else{session.setAttribute("error","删除栏目成功!");}
//        return "redirect:/admin/newsColumn/list";
//    }









//
//    /*留言管理*/
//    @GetMapping("/message/list")
//    public String MessageList(Model model){
//        return "NewsS/guestsMain";
//    }
//    @PostMapping("/message/list")
//    @ResponseBody
//    public String MessageList() throws JsonProcessingException {
//        List<Guest> guests = guestSerive.selectGuest();
//        return JsonUtile.getJSON(guests);
//    }
//    @PostMapping("/message/listx")
//    @ResponseBody
//    public String MessageXqing(@RequestParam("id") int guestId) throws JsonProcessingException {
//        Guest guest = guestSerive.selectByPrimaryKey(guestId);
//        //来到这里代表已经看过了
//        guest.setNewstatus("0");
//        guestSerive.updateByPrimaryKey(guest);
//        return JsonUtile.getJSON(guestSerive.selectGuest());
//    }
//
//    @GetMapping("/message/listx")
//    @ResponseBody
//    public String  GuestlistStart(@RequestParam("start") int start) throws JsonProcessingException {
//      List<Guest> gs=  guestSerive.selectByStat(start);
//      return JsonUtile.getJSON(gs);
//    }
    
}
