/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Administrator
 */
public class Employee {

    private int employeeid;
    private String employeeName, tel, email;
   
    public Employee() {
    }

    public Employee(int employeeid, String employeeName, String tel, String email) {
        this.employeeid = employeeid;
        this.employeeName = employeeName;
        this.tel = tel;
        this.email = email;
    }

    public int getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(int employeeid) {
        this.employeeid = employeeid;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Employee{" + "employeeid=" + employeeid + ", employeeName=" + employeeName + ", tel=" + tel + ", email=" + email + '}';
    }

}
