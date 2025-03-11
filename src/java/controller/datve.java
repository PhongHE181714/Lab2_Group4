package controller;

import dal.DAOFLIGHT;
import dal.DAOTicket;
import model.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import model.Acount;
import model.Ticket;

public class datve extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String trip = request.getParameter("trip");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String departure = request.getParameter("departure");
        String returnDate = request.getParameter("return");
        String ticketclass = request.getParameter("tclass");
        String quantity = request.getParameter("soluongdat");

        // Kiểm tra ngày khởi hành
        if (departure == null || departure.isEmpty()) {
            request.setAttribute("error", "Departure date must not be null.");
            request.getRequestDispatcher("Vemaybay.jsp").forward(request, response);
            return;
        }

        // Kiểm tra thành phố đi và đến
        if (from.equals(to)) {
            request.setAttribute("error", "Departure and arrival cities cannot be the same.");
            request.getRequestDispatcher("Vemaybay.jsp").forward(request, response);
            return;
        }

        // Tìm kiếm chuyến bay
        DAOFLIGHT dao = new DAOFLIGHT();
        List<Flight> dlist = dao.getFlightsByDates(departure, departure, trip, from, to);
        request.setAttribute("dlist", dlist);

        List<Flight> rlist = new ArrayList<>();
        if ("roundtrip".equals(trip)) {
            rlist = dao.getFlightsByDates(returnDate, returnDate, trip, to, from);
            request.setAttribute("rlist", rlist);
        }

        // Lưu trữ các tham số tìm kiếm vào session để sử dụng trong doPost
        HttpSession session = request.getSession();
        session.setAttribute("trip", trip);
        session.setAttribute("from", from);
        session.setAttribute("to", to);
        session.setAttribute("departure", departure);
        session.setAttribute("returnDate", returnDate);
        session.setAttribute("tclass", ticketclass);
        session.setAttribute("soluongdat", quantity);

        session.removeAttribute("chosenDepartureFlightId");
        session.removeAttribute("chosenReturnFlightId");        // Forward đến JSP
        request.getRequestDispatcher("Vemaybay.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flightId = request.getParameter("flightId");
        String listType = request.getParameter("listType");

        HttpSession session = request.getSession();

        // Retrieve stored search criteria from session
        String trip = (String) session.getAttribute("trip");
        String from = (String) session.getAttribute("from");
        String to = (String) session.getAttribute("to");
        String departure = (String) session.getAttribute("departure");
        String returnDate = (String) session.getAttribute("returnDate");
        String ticketclass = (String) session.getAttribute("tclass");
        String quantity = (String) session.getAttribute("soluongdat");
        int number = 0;
        try {
            number = Integer.parseInt(quantity);
            if (number > 6 || number < 1) {
                throw new Exception();
            }
        } catch (Exception e) {
            request.setAttribute("error", "Bạn chỉ có thể đặt tối đa 6 vé trên 1 chuyến");
            request.getRequestDispatcher("Vemaybay.jsp").forward(request, response);
            return;
        }
        // Re-fetch flights based on the same criteria
        DAOFLIGHT dao = new DAOFLIGHT();
        List<Flight> dlist = dao.getFlightsByDates(departure, departure, trip, from, to);
        request.setAttribute("dlist", dlist);

        List<Flight> rlist = new ArrayList<>();
        if ("roundtrip".equals(trip)) {
            rlist = dao.getFlightsByDates(returnDate, returnDate, trip, to, from);
            request.setAttribute("rlist", rlist);
        }

        Acount userAccount = (Acount) session.getAttribute("account");

        int passengerID = userAccount.getPassagerid();  // Assuming Account has getPassengerID() method

        // Retrieve flight information based on chosen flight ID
        Flight chosenFlight = null;
        int flightIdInt = Integer.parseInt(flightId);  // Convert flightId to an int

        if ("dlist".equals(listType)) {
            chosenFlight = dlist.stream()
                    .filter(f -> f.getIdFlighttime() == flightIdInt) // Compare with int
                    .findFirst()
                    .orElse(null);
            session.setAttribute("chosenDepartureFlightId", flightId);  // Store chosen ID in session
        } else if ("rlist".equals(listType)) {
            chosenFlight = rlist.stream()
                    .filter(f -> f.getIdFlighttime() == flightIdInt) // Compare with int
                    .findFirst()
                    .orElse(null);
            session.setAttribute("chosenReturnFlightId", flightId);  // Store chosen ID in session
        }
      
        Ticket ticket = null;
        if (ticketclass.equals("thuong")) {
            ticket = new Ticket(
                    passengerID,
                    chosenFlight.getPrice(), // Price from flight
                    chosenFlight.getIdFlighttime(), // Flight ID
                    chosenFlight.getFlightNumber(), // Flight number
                    from, // Departure (from)
                    to, // Arrival (to)
                    1 // Default ticketClass = 1
            );
        } else {
            ticket = new Ticket(
                    passengerID,
                    chosenFlight.getPrice(), // Price from flight
                    chosenFlight.getIdFlighttime(), // Flight ID
                    chosenFlight.getFlightNumber(), // Flight number
                    from, // Departure (from)
                    to, // Arrival (to)
                    2 // Default ticketClass = 1
            );
        }

        DAOTicket daoT = new DAOTicket();
        
        for (int i = 0; i < number; i++) {
            daoT.addTicket(ticket);
        }

        // Forward back to the JSP with updated information
        request.getRequestDispatcher("Vemaybay.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Flight Booking Controller";
    }
}
