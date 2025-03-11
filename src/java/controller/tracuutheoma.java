/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOTicket;
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
import model.PassagerInfor;

/**
 *
 * @author Administrator
 */
public class tracuutheoma extends HttpServlet {

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
            out.println("<title>Servlet tracuutheoma</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet tracuutheoma at " + request.getContextPath() + "</h1>");
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
        TRACUU t = new TRACUU();
        DAOTicket dao = new DAOTicket();
        String id = request.getParameter("id");

        PassagerInfor p = null;
        if (id != null && !id.isEmpty()) {
            try {
                int idd = Integer.parseInt(id);
                List<PassagerInfor> list = t.getById(idd);
                if (!t.checkID(idd)) {
                    request.setAttribute("error", "Không Tìm Thấy Mã Khách Hàng Này!");
                    list = t.getAll();
                    session.setAttribute("list", list);
                } else {
                    list = t.getById(idd);
                    session.setAttribute("list", list);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "ID phải là số.");
                List<PassagerInfor> list = t.getAll();
                session.setAttribute("list", list);
            }
        } else {
            List<PassagerInfor> list = t.getAll();
            session.setAttribute("list", list);
        }
        session.setAttribute("pp", p);
        request.getRequestDispatcher("tracuutheoid.jsp").forward(request, response);
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
