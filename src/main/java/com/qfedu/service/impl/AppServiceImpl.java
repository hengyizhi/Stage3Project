package com.qfedu.service.impl;

import com.github.pagehelper.PageHelper;
import com.qfedu.dao.IAppDao;
import com.qfedu.pojo.App;
import com.qfedu.service.IAppService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AppServiceImpl implements IAppService {

    @Resource
    private IAppDao appDao;

    @Override
    public List<App> getAllApps() {
        return appDao.getAllApps();
    }

    @Override
    public List<App> getAppsByPage(int cp, int ps) {
        PageHelper.startPage(cp,ps);
        return appDao.getAllApps();
    }

    @Override
    public boolean saveApp(App app) {
        return appDao.saveApp(app);
    }

    @Override
    public boolean deleteApp(int appid) {
        return appDao.deleteApp(appid);
    }

    @Override
    public boolean updateApp(App app) {
        return appDao.updateApp(app);
    }
}
