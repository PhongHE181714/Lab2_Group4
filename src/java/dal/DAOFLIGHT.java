package dal;

import model.Flight;

import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class DAOFLIGHT extends DBContext {

   

    public List<Flight> getFlightsByDates(String departureDateTime, String arrivalTime, String tripType, String fromCity, String toCity) {
        List<Flight> list = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd-HH:mm");
        String sql = "Select cf.CityName Cityfrom,ct.CityName Cityto,dp.AirportName DepartureA,ar.AirportName ArrialA,f.PriceBase,"
                + "ft.DepartureTime,ft.ArrivalTime,f.FlightNumber,ft.IdFlightTime from FlightTime ft join Flight f on ft.IdFlight "
                + "= f.IdFlight\n"
                + "join Airport ar on f.ArrivalAirportId = ar.AirportId\n"
                + "join Airport dp on f.DepartureAirportId = dp.AirportId\n"
                + "join City cf on cf.CityId = dp.CityId\n"
                + "join City ct on ct.CityId = ar.CityId";

        // Add condition for roundtrip
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            // Set departure date parameter
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Flight f = new Flight();
                f.setCityfrom(rs.getString("Cityfrom"));
                f.setCityto(rs.getString("Cityto"));
                f.setPrice(rs.getInt("PriceBase"));
                f.setDepartureAirport(rs.getString("DepartureA"));
                f.setArrivalAirport(rs.getString("ArrialA"));
                f.setFlightNumber(rs.getString("FlightNumber"));
                f.setIdFlighttime(rs.getInt("IdFlightTime"));
                Timestamp arrivalTimestamp = rs.getTimestamp("ArrivalTime");
                Timestamp departureTimestamp = rs.getTimestamp("DepartureTime");

                if (arrivalTimestamp != null) {
                    f.setArrivalTime(arrivalTimestamp.toLocalDateTime().format(formatter));
                }
                if (departureTimestamp != null) {
                    f.setDepartureTime(departureTimestamp.toLocalDateTime().format(formatter));
                }
                if (f.getCityfrom().equals(fromCity) && f.getCityto().equals(toCity)
                        && f.getDepartureTime().substring(0, 10).equals(departureDateTime)
                        && f.getArrivalTime().substring(0, 10).equals(arrivalTime)) {
                    list.add(f);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }

   
}
