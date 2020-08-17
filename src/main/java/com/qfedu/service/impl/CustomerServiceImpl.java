package com.qfedu.service.impl;

import com.github.pagehelper.PageHelper;
import com.qfedu.dao.ICustomerDao;
import com.qfedu.pojo.Customer;
import com.qfedu.service.ICustomerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CustomerServiceImpl implements ICustomerService {

    @Resource
    private ICustomerDao customerDao;

    @Override
    public List<Customer> getAllCustomers() {

        return customerDao.getAllCustomers();
    }

    @Override
    public boolean saveCustomer(Customer customer) {

        return customerDao.saveCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int cid) {
        return customerDao.deleteCustomer(cid) > 0;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return customerDao.updateCustomer(customer);
    }

    @Override
    public List<Customer> getCustomersByPage(int cp, int ps) {

        PageHelper.startPage(cp,ps);
        return customerDao.getAllCustomers();

    }

    @Override
    public int deleteCustomers(List<Integer> cid) {
        return customerDao.deleteCustomers(cid);
    }

//    @Override
//    public Customer getCustomerByCid(int cid) {
//        return customerDao.getCustomerByCid(cid);
//    }
}
