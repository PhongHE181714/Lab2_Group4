/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOPASSAGER;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Acount;
import model.Passager;

/**
 *
 * @author BAO CHAU
 */
public class Thongtincanhan extends HttpServlet {

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
            out.println("<title>Servlet Thongtincanhan</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Thongtincanhan at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Acount userAccount = (Acount) session.getAttribute("account");
        int passengerID = userAccount.getPassagerid();
        DAOPASSAGER dao = new DAOPASSAGER();
        Passager p = dao.getPassengerbyID(passengerID);
        request.setAttribute("id", p.getId());
        request.setAttribute("name", p.getName());
        request.setAttribute("tel", p.getTel());
        request.setAttribute("cardid", p.getCard());
        request.setAttribute("email", p.getEmail());
        request.getRequestDispatcher("ttcn.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Acount userAccount = (Acount) session.getAttribute("account");
        int passengerID = userAccount.getPassagerid();
        String name = request.getParameter("name");
        String tel = request.getParameter("tel");
        String cardid = request.getParameter("cardid");
        String email = request.getParameter("email");
        System.out.println("Name: " + name);
        System.out.println("Tel: " + tel); // Kiểm tra giá trị tel
        System.out.println("Card ID: " + cardid);
        System.out.println("Email: " + email);
        DAOPASSAGER dao = new DAOPASSAGER();
        dao.updatePassengerProfile(passengerID, new Passager(passengerID, name, tel, cardid, email));
        Passager p = dao.getPassengerbyID(passengerID);
        request.setAttribute("id", p.getId());
        request.setAttribute("name", name);
        request.setAttribute("tel", tel);
        request.setAttribute("cardid", p.getCard());
        request.setAttribute("email", p.getEmail());
        request.getRequestDispatcher("ttcn.jsp").forward(request, response);
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
