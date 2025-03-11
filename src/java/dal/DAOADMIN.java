/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;

/**
 *
 * @author Administrator
 */
public class DAOADMIN extends DBContext {

    public long LoiNhuan() {
        String sql = "SELECT SUM(Price) AS TotalRevenue\n"
                + "FROM Ticket\n"
                + "WHERE IsPaid = 1";
        long total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getLong(1);
            }
        } catch (SQLException E) {

        }
        return total;

    }

    public int getTotalTicketSold() {
        String sql = "SELECT COUNT(Ticketid) AS TotalTicketsSold FROM Ticket WHERE IsPaid = 1";
        int total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException E) {

        }
        return total;

    }

    public int getTotalEmployee() {
        String sql = "SELECT COUNT(EmployeeId) AS TotalEmployees FROM Employee";
        int total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException E) {

        }
        return total;
    }

    public int getTotalUser() {
        String sql = "SELECT COUNT(Accountid) AS TotalUsers FROM Account a join Role r on a.RoleId = r.RoleId where r.RoleId = 3";
        int total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException E) {

        }
        return total;
    }

    public int getGhe() {
        String sql = "select count(c.ClassName) from Class c join Ticket t on c.ClassId = t.ClassId where c.ClassName = N'Thương gia'";
        int total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException E) {

        }
        return total;
    }

    public int DoanhThu() {
        String sql = "SELECT SUM(price) AS TotalRevenuePaid\n"
                + "FROM Ticket";
        int total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException E) {

        }
        return total;
    }

    public int ChuaNhan() {
        String sql = "SELECT SUM(price) AS TotalUnpaidAmount\n"
                + "FROM Ticket\n"
                + "WHERE IsPaid = 0;";
        int total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException E) {

        }
        return total;
    }

    public int SoChuyenBay() {
        String sql = "SELECT COUNT(*) AS TotalFlights\n"
                + "FROM Flight;";
        int total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException E) {

        }
        return total;
    }
}
