/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.HashSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Ticket;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.Acount;

/**
 *
 * @author BAO CHAU
 */
public class DAOTicket extends DBContext {

    public List<Ticket> getAllTicketByPassengerID(int passengerID) {
        List<Ticket> list = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd-HH:mm");
        String sql = "SELECT t.TicketId tid, t.TicketIdPassenger tpid, t.price price, f.FlightNumber flightN, "
                + "dp.AirportName DpName, ar.AirportName ArName, ft.ArrivalTime ArTime, ft.DepartureTime DpTime, t.IsPaid,t.ClassId "
                + "FROM Ticket t "
                + "JOIN FlightTime ft ON t.IdFlightTime = ft.IdFlightTime "
                + "JOIN Flight f ON f.IdFlight = ft.IdFlight "
                + "JOIN Airport ar ON ar.AirportId = f.ArrivalAirportId "
                + "JOIN Airport dp ON dp.AirportId = f.DepartureAirportId "
                + "WHERE t.TicketIdPassenger = " + passengerID + " AND t.IsPaid = 0";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ticket t = new Ticket();
                t.setTicketID(rs.getInt("tid"));
                t.setPassengerID(rs.getInt("tpid"));
                t.setPrice(rs.getInt("price"));
                t.setFlightNumber(rs.getString("flightN"));
                t.setDepart(rs.getString("DpName"));
                t.setArrival(rs.getString("ArName"));
                t.setTicketclass(rs.getInt("ClassId"));
                Timestamp arrivalTimestamp = rs.getTimestamp("ArTime");
                Timestamp departureTimestamp = rs.getTimestamp("DpTime");

                if (arrivalTimestamp != null) {
                    t.setArrivalTime(arrivalTimestamp.toLocalDateTime().format(formatter));
                }
                if (departureTimestamp != null) {
                    t.setDeparTime(departureTimestamp.toLocalDateTime().format(formatter));
                }
                list.add(t);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public List<Ticket> showAllTicketByPassengerID(int passengerID) {
        List<Ticket> list = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd-HH:mm");
        String sql = "SELECT t.TicketId tid, t.TicketIdPassenger tpid, t.price price, f.FlightNumber flightN, "
                + "dp.AirportName DpName, ar.AirportName ArName, ft.ArrivalTime ArTime, ft.DepartureTime DpTime, t.IsPaid,t.ClassId "
                + "FROM Ticket t "
                + "JOIN FlightTime ft ON t.IdFlightTime = ft.IdFlightTime "
                + "JOIN Flight f ON f.IdFlight = ft.IdFlight "
                + "JOIN Airport ar ON ar.AirportId = f.ArrivalAirportId "
                + "JOIN Airport dp ON dp.AirportId = f.DepartureAirportId "
                + "WHERE t.TicketIdPassenger = " + passengerID;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ticket t = new Ticket();
                t.setTicketID(rs.getInt("tid"));
                t.setPassengerID(rs.getInt("tpid"));
                t.setPrice(rs.getInt("price"));
                t.setFlightNumber(rs.getString("flightN"));
                t.setDepart(rs.getString("DpName"));
                t.setArrival(rs.getString("ArName"));
                t.setTicketclass(rs.getInt("ClassId"));
                Timestamp arrivalTimestamp = rs.getTimestamp("ArTime");
                Timestamp departureTimestamp = rs.getTimestamp("DpTime");

                if (arrivalTimestamp != null) {
                    t.setArrivalTime(arrivalTimestamp.toLocalDateTime().format(formatter));
                }
                if (departureTimestamp != null) {
                    t.setDeparTime(departureTimestamp.toLocalDateTime().format(formatter));
                }
                list.add(t);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public boolean addTicket(Ticket ticket) {
        String sql = "insert into Ticket(TicketIdPassenger,IdFlightTime,ClassId,BookingDate,IsPaid,Price) values(?,?,?,?,?,?)";
        PreparedStatement pre;
        LocalDateTime now = LocalDateTime.now();

        // Định dạng LocalDateTime theo định dạng yyyy-MM-dd HH:mm:ss
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = now.format(formatter);
        try {
            pre = connection.prepareStatement(sql);
            pre.setInt(1, ticket.getPassengerID());
            pre.setInt(2, ticket.getIdFlightTime());
            pre.setInt(3, ticket.getTicketclass());
            pre.setString(4, formattedDateTime);
            pre.setInt(5, 0);
            pre.setInt(6, 0);
            int row = pre.executeUpdate();
            return row > 0;
        } catch (SQLException E) {
            E.printStackTrace();
            return false;
        }

    }

    public boolean deleteTicket(int ticketID) {
        String sql = "delete from Ticket where TicketId = " + ticketID;
        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTicket.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Định dạng LocalDateTime theo định dạng yyyy-MM-dd HH:mm:ss
        return true;
    }

    public boolean updateTicket(int passengerID) {
        String sql = "UPDATE Ticket\n"
                + " Set IsPaid = 1\n"
                + " where TicketIdPassenger = " + passengerID;
        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTicket.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Định dạng LocalDateTime theo định dạng yyyy-MM-dd HH:mm:ss
        return true;
    }

    public static void main(String[] args) {
        DAOTicket t = new DAOTicket();
        List<Ticket> list = t.showAllTicketByPassengerID(3);
        for (Ticket ticket : list) {
            System.out.println("" + ticket.getTicketID());
        }

    }
}
