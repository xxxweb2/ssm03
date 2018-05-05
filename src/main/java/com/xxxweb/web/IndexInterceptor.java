package com.xxxweb.web;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexInterceptor implements HandlerInterceptor
{
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
//        ModelMap modelMap = modelAndView.getModelMap();
//        List<QfConfigWithBLOBs> allConfig = systemService.getAllConfig();
//        for (QfConfigWithBLOBs item : allConfig) {
//
//            modelMap.addAttribute(item.getNames(), item.getValue());
//        }
////        导航栏
//        List<QfNav> allSkr = skrService.getAllSkrByOn();
//        modelMap.addAttribute("list", allSkr);
//
//        List<QfFlash> allFlashByOn = flashService.getAllFlashByOn();
//        modelMap.addAttribute("banners", allFlashByOn);
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
