package com.qfedu.pojo;

public class Customer {

    private int cid;
    private String cname;
    private String password;
    private String nickname;
    private String addr;
    private double money;
    private int cstate;

    public Customer() {
    }

    public Customer(int cid, String cname, String password, String nickname, String addr, double money, int cstate) {
        this.cid = cid;
        this.cname = cname;
        this.password = password;
        this.nickname = nickname;
        this.addr = addr;
        this.money = money;
        this.cstate = cstate;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", addr='" + addr + '\'' +
                ", money=" + money +
                ", cstate=" + cstate +
                '}';
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public int getCstate() {
        return cstate;
    }

    public void setCstate(int cstate) {
        this.cstate = cstate;
    }
}
