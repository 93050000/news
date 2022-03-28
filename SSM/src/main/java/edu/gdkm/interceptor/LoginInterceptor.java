package edu.gdkm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.gdkm.po.Admin;

public class LoginInterceptor  implements HandlerInterceptor {


    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session=httpServletRequest.getSession();
        Object admin_session = session.getAttribute("ADMIN_SESSION");
        if(admin_session==null){
            /*没有登录*/
            httpServletRequest.setAttribute("msg","请登录！");
            httpServletRequest.getRequestDispatcher("/WEB-INF/jsp/logins.jsp").forward(httpServletRequest,httpServletResponse);
            System.out.println("有个人想不登陆就打开其他页面，被机智的我拦住了！");
        }else{
            return true;
        }
        return false;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
