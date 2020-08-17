package com.qfedu.controller;

import com.qfedu.pojo.App;
import com.qfedu.pojo.Customer;
import com.qfedu.service.IAppService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ApplicationController {

    @Resource
    private IAppService appService;

    @GetMapping("/Apps")
    @ResponseBody
    public List<App> getAllApps(){
        return appService.getAllApps();
    }

    @GetMapping("/AppsLayUI")
    @ResponseBody
    public Map<String, Object> getLayUIData(int page,int limit){

        List<App> list = appService.getAllApps();
        List<App> list2= appService.getAppsByPage(page,limit);
        Map<String, Object> map = new HashMap<>();

        map.put("code", 0);
        map.put("msg", "");
        map.put("count", list.size());
        map.put("data", list2);

        return map;
    }

    @RequestMapping("/saveApp")
    public String saveApp(App app){

        appService.saveApp(app);

        return "redirect:/appTable.jsp";
    }


    @PostMapping("/deleteApp/{appid}")
    @ResponseBody
    public String deleteApp(@PathVariable int appid){

        if(appService.deleteApp(appid)){
            return "success";
        }
        return "failed";
    }

    @PostMapping("/updateApp")
    public String updateApp(App app){
        appService.updateApp(app);

        return "appTable.jsp";
    }

}
