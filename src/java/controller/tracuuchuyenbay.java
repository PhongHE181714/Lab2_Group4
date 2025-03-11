/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOMAYBAY;
import dal.TRACUU;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import javax.print.attribute.standard.Fidelity;
import model.FlightLook;
import model.PassagerInfor;

/**
 *
 * @author Administrator
 */
public class tracuuchuyenbay extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet tracuuchuyenbay</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet tracuuchuyenbay at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAOMAYBAY t = new DAOMAYBAY();

        List<FlightLook> p = null;
        String name = request.getParameter("name");

        if (name != null && !name.trim().isEmpty()) {
            p = t.getFlight(name);
            if (p == null || p.isEmpty()) {
                request.setAttribute("error", "Không Tìm Thấy Chuyến Bay Này!");
                p = new ArrayList<>();
              
            }
        } else {
            p = t.getAll();
        }

        session.setAttribute("pp", p);
        request.getRequestDispatcher("tracuucb.jsp").forward(request, response);
    }


    /*
    package dao;

import model.FlightLook;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FlightLookDAO {
    private Connection connection;

    public FlightLookDAO(Connection connection) {
        this.connection = connection;
    }

    // Method to get all flights
    public List<FlightLook> getAllFlights() {
        List<FlightLook> flights = new ArrayList<>();
        String sql = "SELECT * FROM flights"; // Adjust table name as needed

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                FlightLook flight = new FlightLook(
                    rs.getString("flight"),
                    rs.getString("departure"),
                    rs.getString("arrival"),
                    rs.getString("departureairport"),
                    rs.getString("arrivalairport"),
                    rs.getInt("ticket"),
                    rs.getInt("total")
                );
                flights.add(flight);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flights;
    }

    // Method to add a new flight
    public boolean addFlight(FlightLook flight) {
        String sql = "INSERT INTO flights (flight, departure, arrival, departureairport, arrivalairport, ticket, total) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, flight.getFlight());
            pstmt.setString(2, flight.getDeparture());
            pstmt.setString(3, flight.getArrival());
            pstmt.setString(4, flight.getDepartureairport());
            pstmt.setString(5, flight.getArrivalairport());
            pstmt.setInt(6, flight.getTicket());
            pstmt.setInt(7, flight.getTotal());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to update an existing flight
    public boolean updateFlight(FlightLook flight) {
        String sql = "UPDATE flights SET departure = ?, arrival = ?, departureairport = ?, arrivalairport = ?, ticket = ?, total = ? WHERE flight = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, flight.getDeparture());
            pstmt.setString(2, flight.getArrival());
            pstmt.setString(3, flight.getDepartureairport());
            pstmt.setString(4, flight.getArrivalairport());
            pstmt.setInt(5, flight.getTicket());
            pstmt.setInt(6, flight.getTotal());
            pstmt.setString(7, flight.getFlight());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete a flight
    public boolean deleteFlight(String flight) {
        String sql = "DELETE FROM flights WHERE flight = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, flight);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

     */
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
