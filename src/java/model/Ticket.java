/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author BAO CHAU
 */
public class Ticket {
    private int ticketID,passengerID,price,IdFlightTime;
    private String flightNumber,depart,arrival,deparTime,arrivalTime;
    private int Ticketclass;

    public Ticket() {
    }

    public Ticket(int ticketID, int passengerID, int price, int IdFlightTime, String flightNumber, String depart, String arrival, int Ticketclass,String deparTime,String arrivalTime) {
        this.ticketID = ticketID;
        this.passengerID = passengerID;
        this.price = price;
        this.IdFlightTime = IdFlightTime;
        this.flightNumber = flightNumber;
        this.depart = depart;
        this.arrival = arrival;
        this.Ticketclass = Ticketclass;
        this.deparTime = deparTime;
        this.arrivalTime = arrivalTime;
    }

    public Ticket(int passengerID, int price, int IdFlightTime, String flightNumber, String depart, String arrival, int Ticketclass) {
        this.passengerID = passengerID;
        this.price = price;
        this.IdFlightTime = IdFlightTime;
        this.flightNumber = flightNumber;
        this.depart = depart;
        this.arrival = arrival;
        this.Ticketclass = Ticketclass;
    }

    public int getTicketID() {
        return ticketID;
    }

    public void setTicketID(int ticketID) {
        this.ticketID = ticketID;
    }

    public int getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(int passengerID) {
        this.passengerID = passengerID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getDepart() {
        return depart;
    }

    public void setDepart(String depart) {
        this.depart = depart;
    }

    public String getArrival() {
        return arrival;
    }

    public void setArrival(String arrival) {
        this.arrival = arrival;
    }
    public int getIdFlightTime() {
        return IdFlightTime;
    }

    public void setIdFlightTime(int IdFlightTime) {
        this.IdFlightTime = IdFlightTime;
    }

    public int getTicketclass() {
        return Ticketclass;
    }

    public void setTicketclass(int Ticketclass) {
        this.Ticketclass = Ticketclass;
    }

    public String getDeparTime() {
        return deparTime;
    }

    public void setDeparTime(String deparTime) {
        this.deparTime = deparTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }
    
    
}
