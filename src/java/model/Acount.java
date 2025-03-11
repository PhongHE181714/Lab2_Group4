/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import model.Role;

/**
 *
 * @author Administrator
 */
public class Acount {

    private int accountid, employeeid, passagerid;
    String user, pass;
    Role r;

    public Acount() {
    }

    public Acount(String user, String pass, Role r, int passagerid) {
        this.user = user;
        this.pass = pass;
        this.r = r;
        this.passagerid = passagerid;
    }

    public Acount(String user, String pass, Role r) {
        this.user = user;
        this.pass = pass;
        this.r = r;
    }

    public Acount(int employeeid, String user, String pass, Role r) {
        this.employeeid = employeeid;
        this.user = user;
        this.pass = pass;
        this.r = r;
    }

    public int getAccountid() {
        return accountid;
    }

    public void setAccountid(int accountid) {
        this.accountid = accountid;
    }

    public int getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(int employeeid) {
        this.employeeid = employeeid;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Role getR() {
        return r;
    }

    public void setR(Role r) {
        this.r = r;
    }

    public int getPassagerid() {
        return passagerid;
    }

    public void setPassagerid(int passagerid) {
        this.passagerid = passagerid;
    }

}
