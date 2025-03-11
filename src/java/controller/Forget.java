/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAODangNhap;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author BAO CHAU
 */
public class Forget extends HttpServlet {

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
            out.println("<title>Servlet Forget</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Forget at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String username = request.getParameter("tendangnhap");
        String email = request.getParameter("email");
        String newPassword = request.getParameter("matkhau");
        String passwordagain = request.getParameter("matkhaulai");
        DAODangNhap dao = new DAODangNhap();

        String errorMessage = null;
        String targetPage = "forget.jsp"; // Mặc định chuyển hướng đến forget.jsp

        if (!dao.CheckUser(username)) {
            errorMessage = "Tên tài khoản không tồn tại!";
        } else if (!dao.checkEmail(username, email)) {
            errorMessage = "Email không khớp với email đã đăng ký";
        } else if (!newPassword.equals(passwordagain)) {
            errorMessage = "Mật khẩu mới và nhập lại mật khẩu không khớp!";
        } else {
            boolean updated = dao.Forgetpass(username, newPassword);
            if (updated) {
                errorMessage = "Cập nhật thành công.";
                targetPage = "dangnhap.jsp"; // Nếu cập nhật thành công, chuyển sang trang đăng nhập
            } else {
                errorMessage = "Cập nhật mật khẩu thất bại!";
            }
        }

        // Set attribute chỉ 1 lần
        request.setAttribute("ten", username);
        request.setAttribute("email", email);
        request.setAttribute("matkhau", newPassword);
        request.setAttribute("again", passwordagain);
        request.setAttribute("error", errorMessage);

        // Forward về trang phù hợp
        request.getRequestDispatcher(targetPage).forward(request, response);
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
