package com.qfedu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class App {

    private int appid;
    private int cid;
    private String appname;
    private String appkey;
    private String appsecret;
    private String appurl;
    private int linit;
    private String appdesc;

}
