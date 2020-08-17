package com.qfedu.dao;

import com.qfedu.pojo.App;

import java.util.List;

public interface IAppDao {

    List<App> getAllApps();

    boolean saveApp(App app);

    boolean deleteApp(int appid);

    boolean updateApp(App app);

}
