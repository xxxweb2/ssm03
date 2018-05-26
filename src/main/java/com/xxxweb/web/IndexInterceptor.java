package com.xxxweb.web;

import com.xxxweb.entity.QfUser;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IndexInterceptor implements HandlerInterceptor {
    //    @Autowired
//    SystemService systemService;
//
//    @Autowired
//    SkrService skrService;
//
//    @Autowired
//    FlashService flashService;
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        String requestType = request.getHeader("X-Requested-With");


        System.out.println("method: " + requestType);

        if (requestType == null) {
            ModelMap modelMap = modelAndView.getModelMap();
            HttpSession session = request.getSession();
            QfUser user = (QfUser) session.getAttribute("user");

            if (user != null) {
                String name = user.getName();
                String job = user.getJob();
                int weight = user.getWeight();
                int id = user.getId();
                modelMap.addAttribute("name", name);
                modelMap.addAttribute("job", job);
                modelMap.addAttribute("weight", weight);
                modelMap.addAttribute("userid", id);
            }
        }
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
