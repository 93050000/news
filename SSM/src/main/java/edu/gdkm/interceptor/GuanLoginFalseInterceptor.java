package edu.gdkm.interceptor;

import com.mysql.cj.Session;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GuanLoginFalseInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session =httpServletRequest.getSession();
        Object admin_session = session.getAttribute("ADMIN_SESSION");
        if(admin_session!=null){
            System.out.println("已登录拦截重复登录!");
            httpServletRequest.getRequestDispatcher("/admin/admin").forward(httpServletRequest,httpServletResponse);
            return false;
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
