/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
public class tracuukhachhang extends HttpServlet {

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
            out.println("<title>Servlet tracuukhachhang</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet tracuukhachhang at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        TRACUU d = new TRACUU();
        List<PassagerInfor> list = null;
        int page = 1;
        int itemsPerPage = 100; // Set this to 100 to display 100 items per page
        int totalPages;

        if (id != null && !id.isEmpty()) {
            int idInt = Integer.parseInt(id);
            list = d.getById(idInt);
            totalPages = 1; // If only one record, set total pages to 1
        } else {
            list = d.getAll();
            int totalItems = list.size();
            totalPages = (totalItems + itemsPerPage - 1) / itemsPerPage;

            String pageParam = request.getParameter("page");
            page = (pageParam == null) ? 1 : Integer.parseInt(pageParam);

            int start = (page - 1) * itemsPerPage;
            int end = Math.min(page * itemsPerPage, totalItems);
            list = d.getlistbyPage(list, start, end); // This becomes the paginated list
        }

        request.setAttribute("list", list);  // Store only the paginated list
        request.setAttribute("page", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("admin_tracuukh.jsp").forward(request, response);
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
