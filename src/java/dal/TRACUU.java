/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.PassagerInfor;
import java.sql.*;

/**
 *
 * @author Administrator
 */
public class TRACUU extends DBContext {

    public List<PassagerInfor> getAll() {
        List<PassagerInfor> list = new ArrayList<>();
        String sql = "select p.PassengerId,p.PassengerName,c.ClassName,t.BookingDate ,f.DepartureTime,f.ArrivalTime,\n"
                + "ar.AirportName,arr.AirportName,ft.FlightNumber,t.price,t.IsPaid\n"
                + "from Passenger p join Ticket t on p.PassengerId = t.TicketIdPassenger join Account a on p.PassengerId = a.PassengerId join Class c on c.ClassId = t.ClassId JOIN  FlightTime f\n"
                + "on f.IdFlightTime = t.IdFlightTime\n"
                + "join Flight ft on f.IdFlight = ft.IdFlight \n"
                + "join Airport ar on ft.DepartureAirportId = ar.AirportId\n"
                + "join Airport arr on ft.ArrivalAirportId = arr.AirportId";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PassagerInfor p = new PassagerInfor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getInt(10), rs.getInt(11));
                list.add(p);
            }

        } catch (SQLException ex) {

        }
        return list;
    }

    public PassagerInfor getByIdP(int id) {

        String sql = "select p.PassengerId,p.PassengerName,c.ClassName,t.BookingDate ,f.DepartureTime,f.ArrivalTime,\n"
                + "ar.AirportName,arr.AirportName,ft.FlightNumber,t.price,t.IsPaid\n"
                + "from Passenger p join Ticket t on p.PassengerId = t.TicketIdPassenger join Account a on p.PassengerId = a.PassengerId join Class c on c.ClassId = t.ClassId JOIN  FlightTime f\n"
                + "on f.IdFlightTime = t.IdFlightTime\n"
                + "join Flight ft on f.IdFlight = ft.IdFlight \n"
                + "join Airport ar on ft.DepartureAirportId = ar.AirportId\n"
                + "join Airport arr on ft.ArrivalAirportId = arr.AirportId where p.PassengerId= ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                PassagerInfor p = new PassagerInfor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getInt(10), rs.getInt(11));
                return p;
            }
        } catch (SQLException e) {

        }
        return null;

    }

    public List<PassagerInfor> getById(int id) {
        List<PassagerInfor> list = new ArrayList<>();
        String sql = "select p.PassengerId,p.PassengerName,c.ClassName,t.BookingDate ,f.DepartureTime,f.ArrivalTime,\n"
                + "ar.AirportName,arr.AirportName,ft.FlightNumber,t.price,t.IsPaid\n"
                + "from Passenger p join Ticket t on p.PassengerId = t.TicketIdPassenger join Account a on p.PassengerId = a.PassengerId join Class c on c.ClassId = t.ClassId JOIN  FlightTime f\n"
                + "on f.IdFlightTime = t.IdFlightTime\n"
                + "join Flight ft on f.IdFlight = ft.IdFlight \n"
                + "join Airport ar on ft.DepartureAirportId = ar.AirportId\n"
                + "join Airport arr on ft.ArrivalAirportId = arr.AirportId where p.PassengerId= ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                PassagerInfor p = new PassagerInfor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getInt(10), rs.getInt(11));
                list.add(p);
            }
            return list;
        } catch (SQLException e) {

        }
        return null;

    }

    public PassagerInfor getByIdd(int id) {

        String sql = "select p.PassengerId,p.PassengerName,c.ClassName,t.BookingDate ,f.DepartureTime,f.ArrivalTime,\n"
                + "ar.AirportName,arr.AirportName,ft.FlightNumber,t.price,t.IsPaid\n"
                + "from Passenger p join Ticket t on p.PassengerId = t.TicketIdPassenger join Account a on p.PassengerId = a.PassengerId join Class c on c.ClassId = t.ClassId JOIN  FlightTime f\n"
                + "on f.IdFlightTime = t.IdFlightTime\n"
                + "join Flight ft on f.IdFlight = ft.IdFlight \n"
                + "join Airport ar on ft.DepartureAirportId = ar.AirportId\n"
                + "join Airport arr on ft.ArrivalAirportId = arr.AirportId where p.PassengerId= ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                PassagerInfor p = new PassagerInfor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getInt(10), rs.getInt(11));
                return p;
            }
        } catch (SQLException e) {

        }
        return null;

    }

    public List<PassagerInfor> getName(String name) {
        List<PassagerInfor> list = new ArrayList<>();
        String sql = "select p.PassengerId,p.PassengerName,c.ClassName,t.BookingDate ,f.DepartureTime,f.ArrivalTime,\n"
                + "ar.AirportName,arr.AirportName,ft.FlightNumber,t.price,t.IsPaid\n"
                + "from Passenger p join Ticket t on p.PassengerId = t.TicketIdPassenger join Account a on p.PassengerId = a.PassengerId join Class c on c.ClassId = t.ClassId JOIN  FlightTime f\n"
                + "on f.IdFlightTime = t.IdFlightTime\n"
                + "join Flight ft on f.IdFlight = ft.IdFlight \n"
                + "join Airport ar on ft.DepartureAirportId = ar.AirportId\n"
                + "join Airport arr on ft.ArrivalAirportId = arr.AirportId where p.PassengerName =?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                PassagerInfor p = new PassagerInfor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getInt(10), rs.getInt(11));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;

    }

    public List<PassagerInfor> getlistbyPage(List<PassagerInfor> list, int start, int end) {
        if (start >= list.size()) {
            return new ArrayList<>();
        }
        end = Math.min(end, list.size());
        return list.subList(start, end);
    }

    public boolean checkID(int id) {

        String sql = "Select * from Passenger";
        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) == id) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        TRACUU t = new TRACUU();
        System.out.println("" + t.checkID(1016));

    }
}
