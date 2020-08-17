package com.qfedu.service.impl;

import com.qfedu.dao.IMagDao;
import com.qfedu.pojo.Manager;
import com.qfedu.service.IMagService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class MagServiceImpl implements IMagService {

    @Resource
    private IMagDao magDao;

    @Override
    public Manager selectByNamePass(String name, String pass) {
        return magDao.selectByNamePass(name, pass);
    }
}
