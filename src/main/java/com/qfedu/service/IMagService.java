package com.qfedu.service;

import com.qfedu.pojo.Manager;

public interface IMagService {

    Manager selectByNamePass(String name, String pass);
}
