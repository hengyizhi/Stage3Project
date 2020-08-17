package com.qfedu.service;

import com.qfedu.pojo.Customer;

import java.util.List;

public interface ICustomerService {

    List<Customer> getAllCustomers();

    boolean saveCustomer(Customer customer);

    boolean deleteCustomer(int cid);

    boolean updateCustomer(Customer customer);

    List<Customer> getCustomersByPage(int cp, int ps);

    int deleteCustomers(List<Integer> cid);

//    Customer getCustomerByCid(int cid);
}
