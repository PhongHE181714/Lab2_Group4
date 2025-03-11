/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.FlightLook;
import java.sql.*;

/**
 *
 * @author Administrator
 */
public class DAOMAYBAY extends DBContext {

    public List<FlightLook> getAll() {
        List<FlightLook> list = new ArrayList<>();

        String sql = "SELECT \n"
                + "\n"
                + "    f.FlightNumber,\n"
                + "    ft.DepartureTime,\n"
                + "    ft.ArrivalTime,\n"
                + "    ar.AirportName,\n"
                + "    arr.AirportName,\n"
                + "    COUNT(t.TicketId),\n"
                + "    SUM(t.price)\n"
                + "FROM Flight f\n"
                + "LEFT JOIN FlightTime ft ON f.IdFlight = ft.IdFlight\n"
                + "LEFT JOIN Ticket t ON ft.IdFlightTime = t.IdFlightTime\n"
                + "LEFT JOIN Airport ar ON f.DepartureAirportId = ar.AirportId\n"
                + "LEFT JOIN Airport arr ON f.ArrivalAirportId = arr.AirportId\n"
                + "GROUP BY f.IdFlight, f.FlightNumber, ft.DepartureTime, ft.ArrivalTime, ar.AirportName, arr.AirportName;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FlightLook e = new FlightLook(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getInt(7));
                list.add(e);
            }

        } catch (SQLException ex) {

        }
        return list;
    }

    public List<FlightLook> getFlight(String name) {
        List<FlightLook> list = new ArrayList<>();

        String sql = "SELECT \n"
                + "    f.FlightNumber,\n"
                + "    ft.DepartureTime,\n"
                + "    ft.ArrivalTime,\n"
                + "    ar.AirportName AS DepartureAirport,\n"
                + "    arr.AirportName AS ArrivalAirport,\n"
                + "    COUNT(t.TicketId) AS TicketCount,\n"
                + "    SUM(t.price) AS TotalRevenue\n"
                + "FROM Flight f\n"
                + "LEFT JOIN FlightTime ft ON f.IdFlight = ft.IdFlight\n"
                + "LEFT JOIN Ticket t ON ft.IdFlightTime = t.IdFlightTime\n"
                + "LEFT JOIN Airport ar ON f.DepartureAirportId = ar.AirportId\n"
                + "LEFT JOIN Airport arr ON f.ArrivalAirportId = arr.AirportId\n"
                + "GROUP BY f.IdFlight, f.FlightNumber, ft.DepartureTime, ft.ArrivalTime, ar.AirportName, arr.AirportName\n"
                + "HAVING f.FlightNumber = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FlightLook e = new FlightLook(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getInt(7));
                list.add(e);
            }

        } catch (SQLException ex) {

        }
        return list;
    }

    public static void main(String[] args) {
        DAOMAYBAY dao = new DAOMAYBAY();
        List<FlightLook> l = dao.getFlight("VN310");
        if(l == null ){
            System.out.println("ádasd" );
        }
    }

}
