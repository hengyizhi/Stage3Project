package com.qfedu.dao;

import com.qfedu.pojo.Manager;

public interface IMagDao {

    Manager selectByNamePass(String name, String pass);
}
