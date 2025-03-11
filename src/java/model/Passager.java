/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Administrator
 */
public class Passager {

    private int id;
    String name, tel, card, email;

    public Passager() {
    }

    public Passager(String name, String tel, String card, String email) {
        this.name = name;
        this.tel = tel;
        this.card = card;
        this.email = email;
    }

    public Passager(int id, String name, String tel, String card, String email) {
        this.id = id;
        this.name = name;
        this.tel = tel;
        this.card = card;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
