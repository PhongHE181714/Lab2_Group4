/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Acount;
import model.Role;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Passager;

/**
 *
 * @author Administrator
 */
public class DAODangNhap extends DBContext {

    public Acount Dangnhap(String user, String pass) {

        String sql = "select * from Account A left JOIN Role R ON A.RoleId = R.RoleId \n"
                + " left join Passenger p on A.PassengerId = p.PassengerId \n"
                + "left join Employee e on A.EmployeeId = e.EmployeeId\n"
                + "where AccountUser = ? AND AccountPass = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, user);
            stmt.setString(2, pass);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Role r = new Role(rs.getInt(7), rs.getString(8));
                    if (rs.getInt(7) == 1 || rs.getInt(7) == 2) {
                        return new Acount(rs.getInt("EmployeeId"), rs.getString(2), rs.getString(3), r);
                    } else {
                        return new Acount(rs.getString(2), rs.getString(3), r, rs.getInt(9));
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAODangNhap.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public boolean CheckUser(String username) {
        String sql = "select count(*)from Account a  where  a.AccountUser = ?";
        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {

        }
        return false;
    }

    public boolean addAccount(Acount acount) {
        String sql = "insert into Account (AccountUser,AccountPass,RoleId,PassengerId) values (?,?,?,?)";
        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);
            pre.setString(1, acount.getUser());
            pre.setString(2, acount.getPass());
            pre.setInt(3, acount.getR().getRoleid());
            pre.setInt(4, acount.getPassagerid());
            int row = pre.executeUpdate();
            return row > 0;
        } catch (SQLException E) {
            E.printStackTrace();
            return false;
        }

    }

    public boolean Forgetpass(String username, String newpassword) {
        String sql = "UPDATE Account SET AccountPass = ? WHERE AccountUser = ?";
        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);

            pre.setString(1, newpassword);
            pre.setString(2, username);
            int row = pre.executeUpdate();

            return row > 0;
        } catch (SQLException E) {
            E.printStackTrace();
            return false;
        }

    }

    public boolean checkEmail(String username, String email) {
        String sql = "Select a.AccountUser,p.PassengerEmail from Account a join Passenger p on "
                + "a.PassengerId = p.PassengerId  where  a.AccountUser = ?";
        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getString(2).equals(email);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return false;
    }

    public boolean addPassenger(Passager p) {
        String sql = "insert into Passenger(PassengerName,PassengerTel,PassengerIdCard,"
                + "PassengerEmail)\n"
                + "values(?,?,?,?)";
        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);
            pre.setString(1, p.getName());
            pre.setString(2, p.getTel());
            pre.setString(3, p.getCard());
            pre.setString(4, p.getEmail());
            int row = pre.executeUpdate();
            return row > 0;
        } catch (SQLException E) {
            E.printStackTrace();
            return false;
        }
    }

    public boolean checkEmail1(String email) {
        String sql = "Select * from Passenger ";
        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                if (rs.getString(5).equals(email)) {
                    return false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return true;
    }

    public int getIDPassenger() {
        String sql = "SELECT TOP 1 PassengerId FROM Passenger ORDER BY PassengerId DESC;"; // Chỉ lấy cột PassengerId
        try (PreparedStatement pre = connection.prepareStatement(sql); ResultSet rs = pre.executeQuery()) {

            if (rs.next()) { // Kiểm tra xem có bản ghi nào không
                return rs.getInt("PassengerId"); // Trả về giá trị của cột PassengerId
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Hoặc trả về giá trị khác để chỉ ra không tìm thấy ID
    }

    public static void main(String[] args) {
        DAODangNhap dao = new DAODangNhap();
        boolean a = dao.checkEmail1("kiennv1@gmail.com");
        System.out.println("" + a);

    }
}
