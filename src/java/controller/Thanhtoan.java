/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOTicket;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Acount;
import model.Ticket;

/**
 *
 * @author BAO CHAU
 */
@WebServlet(name = "Thanhtoan", urlPatterns = {"/thanhtoan"})
public class Thanhtoan extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet Thanhtoan</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Thanhtoan at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOTicket dao = new DAOTicket();
        HttpSession session = request.getSession();
        Acount userAccount = (Acount) session.getAttribute("account");

        int passengerID = userAccount.getPassagerid();
        List<Ticket> list = dao.getAllTicketByPassengerID(passengerID);

        // Lấy danh sách vé
        // Kiểm tra xem danh sách có null hay không
        // Đặt danh sách vé vào thuộc tính yêu cầu
        request.setAttribute("ticketList", list);

        // Chuyển hướng tới trang tracuu.jsp
        request.getRequestDispatcher("tracuu.jsp").forward(request, response);
    }

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
        String action = request.getParameter("action");
        if ("pay".equals(action)) {
            doPay(request, response); // Gọi phương thức doPay
            return;
        }
        String ticketID = request.getParameter("tickettId");
        DAOTicket t = new DAOTicket();
        try {
            int num = Integer.parseInt(ticketID);
            t.deleteTicket(num);

        } catch (Exception e) {
            Logger.getLogger(Thanhtoan.class.getName()).log(Level.SEVERE, null, e);

        }
        // Lấy lại danh sách vé sau khi xóa
        HttpSession session = request.getSession();
        Acount userAccount = (Acount) session.getAttribute("account");
        int passengerID = userAccount.getPassagerid();
        List<Ticket> list = t.getAllTicketByPassengerID(passengerID);
        request.setAttribute("ticketList", list);
        request.getRequestDispatcher("tracuu.jsp").forward(request, response);
    }

    protected void doPay(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOTicket t = new DAOTicket();

        HttpSession session = request.getSession();
        Acount userAccount = (Acount) session.getAttribute("account");
        int passengerID = userAccount.getPassagerid();
        t.updateTicket(passengerID);
        List<Ticket> list = t.getAllTicketByPassengerID(passengerID);
        request.setAttribute("ticketList", list);
        request.getRequestDispatcher("tracuu.jsp").forward(request, response);
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
