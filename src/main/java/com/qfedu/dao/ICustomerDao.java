package com.qfedu.dao;

import com.qfedu.pojo.Customer;

import java.util.List;

public interface ICustomerDao {

    List<Customer> getAllCustomers();

    boolean saveCustomer(Customer customer);

    int deleteCustomer(int cid);

    boolean updateCustomer(Customer customer);

    int deleteCustomers(List<Integer> cid);

//    Customer getCustomerByCid(int cid);

}
