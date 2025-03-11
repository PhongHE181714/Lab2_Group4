/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Passager;
import java.sql.*;

/**
 *
 * @author Administrator
 */
public class DAOPASSAGER extends DBContext {

    public List<Passager> getAll() {
        List<Passager> list = new ArrayList<>();
        String sql = "select * from Passenger";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Passager e = new Passager(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(e);
            }

        } catch (SQLException ex) {

        }
        return list;
    }

    public Passager getPassengerbyID(int id) {
        String sql = "Select * from Passenger where PassengerId = " + id;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Passager p = new Passager(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5));
                return p;
            }

        } catch (SQLException ex) {

        }
        return null;
    }

    public boolean updatePassengerProfile(int id, Passager p) {
        String sql = "UPDATE Passenger SET PassengerName = ?, PassengerTel = ?, PassengerIdCard = ?, PassengerEmail = ? WHERE PassengerId = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            // Gán các giá trị cập nhật cho các cột
            ps.setString(1, p.getName());
            ps.setString(2, p.getTel());
            ps.setString(3, p.getCard());
            ps.setString(4, p.getEmail());
            ps.setInt(5, p.getId());

            // Thực thi câu lệnh UPDATE
            int rowsAffected = ps.executeUpdate();

            // Kiểm tra xem có hàng nào được cập nhật không
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        DAOPASSAGER dao = new DAOPASSAGER();
        System.out.println("" +  dao.updatePassengerProfile(3, new Passager(3, "khanh", "0912345678", "ID03", "khanh03@gmail.com")));
       
    }
}
