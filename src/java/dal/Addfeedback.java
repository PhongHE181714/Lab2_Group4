/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Feedback;
import java.sql.*;

/**
 *
 * @author Administrator
 */
public class Addfeedback extends DBContext {

    public boolean cmt(Feedback f) {
        String sql = "INSERT INTO [dbo].[BinhLuan]\n"
                + "    (PassengerID, NoiDungNhom, DanhGia, NgayBinhLuan)\n"
                + "VALUES\n"
                + "    (?, ?, ?, GETDATE());";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, f.getPasssagerid());
            ps.setString(2, f.getFeedbackText());
            ps.setInt(3, f.getRating());
            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException ex) {
            System.out.println(ex);
            ex.printStackTrace();
            return false;
        }
    }

    public Integer getID(String username) {

        String sql = "select a.PassengerId from Account a where a.AccountUser = ?";
        Integer customerId = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                customerId = rs.getInt(1);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return customerId;

    }

    public boolean isAccountExists(String username, String email) {
        String sql = "select COUNT(*) from Account a join Passenger p on a.AccountId = p.PassengerId where a.AccountUser = ? and p.PassengerEmail = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public List<Feedback> getAllcmt() {
        List<Feedback> list = new ArrayList<>();
        String sql = "select b.BinhLuanID,p.PassengerId,a.AccountUser,b.NoiDungNhom,\n"
                + "b.DanhGia,b.NgayBinhLuan,b.EmployID,b.PhanHoiNhanVien,b.NgayPhanHoiNhanVien,b.DaTraLoi from BinhLuan b join Passenger p on b.PassengerID = \n"
                + "p.PassengerId join Account a on a.PassengerId = p.PassengerId";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(rs.getInt(1), rs.getInt(2), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(3),
                        rs.getInt(7), rs.getString(8), rs.getString(9), rs.getInt(10));
                list.add(f);
            }

        } catch (SQLException ex) {

        }
        return list;
    }

    public boolean updateFeedback(int feedbackId, String newFeedbackText, int newRating) {
        String sql = "UPDATE [dbo].[BinhLuan] SET [NoiDungNhom] = ?, [DanhGia] = ?, [NgayBinhLuan] = GETDATE() WHERE [FeedbackId] = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, newFeedbackText);
            ps.setInt(2, newRating);
            ps.setInt(3, feedbackId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void deleteFeedback(int id) {
        String sql = "delete from BinhLuan where BinhLuanID = ?; ";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException E) {

        }
    }

    public List<Feedback> getmessenger(int passengerId) {
        List<Feedback> List = new ArrayList<>();
        String sql = "SELECT PhanHoiNhanVien, NgayPhanHoiNhanVien FROM BinhLuan WHERE PassengerID = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, passengerId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Feedback f = new Feedback(rs.getString(1), rs.getString(2));
                List.add(f);

            }
            return List;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    public int getbyid(int idfeedback) {
        List<Feedback> List = new ArrayList<>();
        String sql = "select PassengerID from BinhLuan where BinhLuanID = ?";
        int passengerid = 0;

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, idfeedback);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                passengerid = rs.getInt(1);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return passengerid;

    }

    public static void main(String[] args) {
        Addfeedback a = new Addfeedback();
        a.updateFeedback(1, "Ok", 5);
    }
}
