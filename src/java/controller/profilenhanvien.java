/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOEMPLOYEE;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Acount;
import model.Employee;

/**
 *
 * @author Administrator
 */
public class profilenhanvien extends HttpServlet {

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
            out.println("<title>Servlet profilenhanvien</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet profilenhanvien at " + request.getContextPath() + "</h1>");
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
        Integer employeeID = (Integer) session.getAttribute("employeeid");
        String id = request.getParameter("id");
        if (employeeID == null) {
            request.setAttribute("error", "No employee ID in session.");
            request.getRequestDispatcher("login").forward(request, response);
            return;
        }
        DAOEMPLOYEE dao = new DAOEMPLOYEE();
        Employee employee = dao.employ(employeeID);
        if (id != null && !id.isEmpty()) {
            Employee employees = dao.employ(employeeID);
            request.setAttribute("e", employee);
        }

        request.setAttribute("pp", employee);

        request.getRequestDispatcher("profilenhanvien.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer employeeID = (Integer) session.getAttribute("employeeid");

        if (employeeID == null) {
            request.setAttribute("error", "Không có ID nhân viên trong session.");
            request.getRequestDispatcher("login").forward(request, response);
            return;
        }

        String employeeName = request.getParameter("name");
        String tel = request.getParameter("number");
        String email = request.getParameter("email");

        if (employeeName == null || employeeName.isEmpty() || tel.isEmpty() || tel == null || email.isEmpty() || email == null) {

            response.sendRedirect("profilenhanvien");
            return;
        } else {

            Employee employee = new Employee();
            employee.setEmployeeid(employeeID);
            employee.setEmployeeName(employeeName);
            employee.setTel(tel);
            employee.setEmail(email);

            DAOEMPLOYEE dao = new DAOEMPLOYEE();
            boolean updated = dao.updateEmployee(employee);

            if (updated) {
                request.setAttribute("error", "Thay Đổi Thành Công");
                response.sendRedirect("profilenhanvien");
            } else {
                request.setAttribute("error", "Thay Đổi Thất Bại");
                request.getRequestDispatcher("profilenhanvien.jsp").forward(request, response);
            }
        }
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
