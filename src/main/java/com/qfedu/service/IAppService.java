package com.qfedu.service;

import com.qfedu.pojo.App;
import com.qfedu.pojo.Customer;

import java.util.List;

public interface IAppService {

    List<App> getAllApps();

    List<App> getAppsByPage(int cp, int ps);

    boolean saveApp(App app);

    boolean deleteApp(int appid);

    boolean updateApp(App app);
}
