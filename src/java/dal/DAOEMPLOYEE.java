/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.Employee;
import java.sql.*;
import java.util.ArrayList;
import model.Feedback;

/**
 *
 * @author Administrator
 */
public class DAOEMPLOYEE extends DBContext {

    public List<Employee> getall() {
        List<Employee> list = new ArrayList<>();
        String sql = "select * from Employee";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee e = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(e);
            }
        } catch (SQLException E) {

        }
        return list;
    }

    public Employee employ(int id) {
        String sql = "select * from Employee where EmployeeId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public boolean updateEmployee(Employee employee) {
        String sql = "UPDATE [dbo].[Employee]\n"
                + "SET \n"
                + "    [EmployeeName] = ?, \n"
                + "    [EmployeeTel] = ?, \n"
                + "    [EmployeeEmail] = ?\n"
                + "WHERE \n"
                + "    [EmployeeId] = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, employee.getEmployeeName());
            stmt.setString(2, employee.getTel());
            stmt.setString(3, employee.getEmail());
            stmt.setInt(4, employee.getEmployeeid());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            System.out.println("Update error: " + ex.getMessage());
            return false;
        }
    }

    public boolean updateFeedback(String phanhoi, int traloi, int employid, int feedbackid) {
        String sql = "UPDATE [dbo].[BinhLuan]\n"
                + "SET [PhanHoiNhanVien] = ?,              \n"
                + "    [NgayPhanHoiNhanVien] = GETDATE(), \n"
                + "    [DaTraLoi] = ?,                       \n"
                + "    [EmployID] = ?                        \n"
                + "WHERE  [BinhLuanID]= ?;  ";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, phanhoi);
            stmt.setInt(2, traloi);
            stmt.setInt(3, employid);
            stmt.setInt(4, feedbackid);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getidnv(int Passengerid) {
        String sql = "select BinhLuanID from BinhLuan where PassengerID = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, Passengerid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int feedbackid = rs.getInt(1);
                return feedbackid;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
        DAOEMPLOYEE dao = new DAOEMPLOYEE();

        int passengerId = 111;
        int employId = 27;
        String feedbackResponse = "Cảm Ơn Quý Khách";

        int feedbackId = dao.getidnv(passengerId);

        if (feedbackId == 0) {
            System.out.println("Không tìm thấy phản hồi cho PassengerID: " + passengerId);
            return;
        }

        boolean result = dao.updateFeedback(feedbackResponse, 1, employId, feedbackId);

        if (result) {
            System.out.println("Cập nhật phản hồi thành công!");
        } else {
            System.out.println("Cập nhật phản hồi thất bại.");
        }
    }
}
