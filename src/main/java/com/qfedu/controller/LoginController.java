package com.qfedu.controller;

import com.qfedu.pojo.Manager;
import com.qfedu.service.IMagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;


@RestController
public class LoginController {

    @Resource
    private IMagService magService;

    @RequestMapping("login")
    public ModelAndView login(String name, String pass){
//        System.out.println("IMagService=="+magService);
        ModelAndView model = new ModelAndView();

        Manager m=magService.selectByNamePass(name, pass);
//        System.out.println("m======="+m);
        if(m!=null){
            //登录成功,返回xxx.jsp
//            model.addObject("username", magService.getUsername());
            model.setViewName("home.jsp");
        }else{
            //失败,返回登录页面
            model.setViewName("index.jsp");
        }
        return model;



    }

}