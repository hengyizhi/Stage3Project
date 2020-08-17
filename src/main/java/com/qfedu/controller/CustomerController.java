package com.qfedu.controller;

import com.alibaba.fastjson.JSONObject;
import com.qfedu.pojo.Customer;
import com.qfedu.service.ICustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CustomerController {

    @Resource
    private ICustomerService customerService;

    @GetMapping("/Customers")
    @ResponseBody
    public List<Customer> getAllCustomers(){

        return customerService.getAllCustomers();
    }

    @GetMapping("/CustomersLayUI")
    @ResponseBody
    public Map<String, Object> getLayUIData(int page,int limit){

        List<Customer> list = customerService.getAllCustomers();
        List<Customer> list2= customerService.getCustomersByPage(page,limit);
        Map<String, Object> map = new HashMap<>();

        map.put("code", 0);
        map.put("msg", "");
        map.put("count", list.size());
        map.put("data", list2);

        return map;
    }

//    @GetMapping("/CustomersLayUI")
//    @ResponseBody
//    public Map<String, Object> getLayUIData(){
//
//        List<Customer> list = customerService.getAllCustomers();
//
//        Map<String, Object> map = new HashMap<>();
//
//        map.put("code", 0);
//        map.put("msg", "");
//        map.put("count", list.size());
//        map.put("data", list);
//
//        return map;
//    }

    @RequestMapping("/saveCustomer")
    @ResponseBody
    public String saveCustomer(Customer customer){

//        customerService.saveCustomer(customer);
//
//        return "redirect:/customerTable.jsp";

        if (customerService.saveCustomer(customer)) {
            return "success";
        }
        return "false";
    }

//    @RequestMapping("/insertCustomer")
//    public String insertCustomer(){
//        return "insert";
//    }

    @PostMapping("/deleteCustomer/{cid}")
    @ResponseBody
    public String deleteCustomer(@PathVariable int cid){

        if(customerService.deleteCustomer(cid)){
            return "success";
        }
        return "failed";
    }

    @PostMapping("/updateCustomer")
    public String updateCustomer(Customer customer){
        customerService.updateCustomer(customer);

        return "customerTable.jsp";
    }



//    @GetMapping("/{cid}")
//    public Customer getCustomerByCid(@PathVariable int cid){
//        return customerService.getCustomerByCid(cid);
//    }

//
//    @GetMapping("/{path}")
//    public String getPath(@PathVariable String path){
//
//        return path + ".jsp";
//    }

    @RequestMapping("/deleteCustomers")
    public String deleteUsers(HttpServletRequest request) {
        String list = request.getParameter("clients");
        List customers = JSONObject.parseObject(list, List.class);
        List<Integer> ids = new ArrayList<>();
        if (customers == null) {
            return "customerTable.jsp";
        }
        Customer customer = null;

        for (int i = 0; i < customers.size(); i++) {
            System.out.println(customers.get(i));
            customer = JSONObject.parseObject(customers.get(i).toString(), Customer.class);
            if (customer != null) {
                ids.add(customer.getCid());
            }
        }
        if (customer == null) {
            return "customerTable.jsp";
        }

        System.out.println(ids);
        customerService.deleteCustomers(ids);
        return "customerTable.jsp";
    }

}

