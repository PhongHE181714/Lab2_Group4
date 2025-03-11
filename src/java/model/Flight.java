package model;

import java.sql.Timestamp;

public class Flight {

    private int idFlighttime;
    private String cityTo;
    private String cityFrom;
    private String departureAirport;
    private String arrivalAirport;
    private String flightNumber;
    private int price;
    private String departureTime;
    private String arrivalTime;

    public Flight() {
    }

    public Flight(int idFlighttime, String Cityto, String Cityfrom, String departureAirport, String arrivalAirport, String flightNumber, int price, String departureTime, String arrivalTime) {
        this.idFlighttime = idFlighttime;
        this.cityTo = Cityto;
        this.cityFrom = Cityfrom;
        this.departureAirport = departureAirport;
        this.arrivalAirport = arrivalAirport;
        this.flightNumber = flightNumber;
        this.price = price;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
    }

    public Flight(String Cityto, String Cityfrom, String departureAirport, String arrivalAirport, String flightNumber, int price, String departureTime, String arrivalTime) {
        this.cityTo = Cityto;
        this.cityFrom = Cityfrom;
        this.departureAirport = departureAirport;
        this.arrivalAirport = arrivalAirport;
        this.flightNumber = flightNumber;
        this.price = price;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
    }

    public String getCityto() {
        return cityTo;
    }

    public void setCityto(String Cityto) {
        this.cityTo = Cityto;
    }

    public String getCityfrom() {
        return cityFrom;
    }

    public void setCityfrom(String Cityfrom) {
        this.cityFrom = Cityfrom;
    }

    public String getDepartureAirport() {
        return departureAirport;
    }

    public void setDepartureAirport(String departureAirport) {
        this.departureAirport = departureAirport;
    }

    public String getArrivalAirport() {
        return arrivalAirport;
    }

    public void setArrivalAirport(String arrivalAirport) {
        this.arrivalAirport = arrivalAirport;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public int getIdFlighttime() {
        return idFlighttime;
    }

    public void setIdFlighttime(int idFlighttime) {
        this.idFlighttime = idFlighttime;
    }

}
