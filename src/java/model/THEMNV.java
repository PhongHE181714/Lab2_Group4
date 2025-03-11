/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Administrator
 */
public class THEMNV {

    private String accountuser, pass;

    Employee employee;
    int roleid;

    public THEMNV() {
    }

    public THEMNV(String accountuser, String pass, Employee employee, int roleid) {
        this.accountuser = accountuser;
        this.pass = pass;
        this.employee = employee;
        this.roleid = roleid;
    }

    public String getAccountuser() {
        return accountuser;
    }

    public void setAccountuser(String accountuser) {
        this.accountuser = accountuser;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

}
