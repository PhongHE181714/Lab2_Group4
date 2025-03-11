/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ChangePassword;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Acount;

/**
 *
 * @author Administrator
 */
public class thaydoimatkhau extends HttpServlet {

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
            out.println("<title>Servlet thaydoimatkhau</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet thaydoimatkhau at " + request.getContextPath() + "</h1>");
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
        String matkhaucu = request.getParameter("matkhaucu");
        String matkhau = request.getParameter("matkhau");
        String matkhaumoi = request.getParameter("matkhaumoi");

        ChangePassword change = new ChangePassword();
        HttpSession session = request.getSession();
        Acount acc = (Acount) session.getAttribute("account");
        String username = acc.getUser();

        if (!change.checkPassword(username, matkhaucu)) {
            request.setAttribute("error", "Mật khẩu cũ không đúng!");
            request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
        } else if (matkhau.equals(matkhaucu)) {
            request.setAttribute("error", "Mật khẩu mới không được giống với mật khẩu cũ!");
            request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
        } else if (!matkhau.equals(matkhaumoi)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp với mật khẩu mới");
            request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
        } else {
            boolean updated = change.updatePassword(username, matkhaumoi);
            if (updated) {
                request.setAttribute("error", "Mật khẩu đã được thay đổi thành công.");
                request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
                // Ensure method exits after redirect
            } else {
                request.setAttribute("error", "Thay đổi mật khẩu không thành công!");
                request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
            }
        }
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
