/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Administrator
 */
public class PassagerInfor {

    private int passengerId;
    private String passengerName;

    private String className;
    private String bookingDate;
    private String departureTime;
    private String arrivalTime;
    private String departureAirport;
    private String arrivalAirport;
    private String flightNumber;
    private int price;
    private int isPaid;

    public PassagerInfor() {
    }

    public PassagerInfor(int passengerId, String passengerName, String className, String bookingDate, String departureTime, String arrivalTime, String departureAirport, String arrivalAirport, String flightNumber, int price, int isPaid) {
        this.passengerId = passengerId;
        this.passengerName = passengerName;
        this.className = className;
        this.bookingDate = bookingDate;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.departureAirport = departureAirport;
        this.arrivalAirport = arrivalAirport;
        this.flightNumber = flightNumber;
        this.price = price;
        this.isPaid = isPaid;
    }

    

    public int getPassengerId() {
        return passengerId;
    }

    public void setPassengerId(int passengerId) {
        this.passengerId = passengerId;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
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

    public int getIsPaid() {
        return isPaid;
    }

    public void setIsPaid(int isPaid) {
        this.isPaid = isPaid;
    }

    public String getPaymentStatus() {
        if (isPaid == 1) {
            return "Đã Thanh Toán";
        } else {
            return "Chưa Thanh Toán";
        }
    }

    @Override
    public String toString() {
        return "PassagerInfor{" + "passengerId=" + passengerId + ", passengerName=" + passengerName + ", className=" + className + ", bookingDate=" + bookingDate + ", departureTime=" + departureTime + ", arrivalTime=" + arrivalTime + ", departureAirport=" + departureAirport + ", arrivalAirport=" + arrivalAirport + ", flightNumber=" + flightNumber + ", price=" + price + ", isPaid=" + isPaid + '}';
    }

}
