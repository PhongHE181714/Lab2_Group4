/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Administrator
 */
public class FlightLook {

    private String flight;
    private String departure;
    private String arrival;
    private String departureairport;
    private String arrivalairport;
    private int ticket;
    private int total;

    // Constructors
    public FlightLook() {
    }

    public FlightLook(String flight, String departure, String arrival, String departureairport, String arrivalairport, int ticket, int total) {
        this.flight = flight;
        this.departure = departure;
        this.arrival = arrival;
        this.departureairport = departureairport;
        this.arrivalairport = arrivalairport;
        this.ticket = ticket;
        this.total = total;
    }

    public String getFlight() {
        return flight;
    }

    public void setFlight(String flight) {
        this.flight = flight;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getArrival() {
        return arrival;
    }

    public void setArrival(String arrival) {
        this.arrival = arrival;
    }

    public String getDepartureairport() {
        return departureairport;
    }

    public void setDepartureairport(String departureairport) {
        this.departureairport = departureairport;
    }

    public String getArrivalairport() {
        return arrivalairport;
    }

    public void setArrivalairport(String arrivalairport) {
        this.arrivalairport = arrivalairport;
    }

    public int getTicket() {
        return ticket;
    }

    public void setTicket(int ticket) {
        this.ticket = ticket;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "FlightLook{" + "flight=" + flight + ", departure=" + departure + ", arrival=" + arrival + ", departureairport=" + departureairport + ", arrivalairport=" + arrivalairport + ", ticket=" + ticket + ", total=" + total + '}';
    }

}
