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
public class DeleteNV extends DBContext {

    public void deleteExecutionByID(int id) {
        String sql1 = "delete from Account where EmployeeId = ?";
        String sql2 = "delete from Employee where Employeeid = ?";

        try {
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ps1.setInt(1, id);
            ps1.executeUpdate();
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, id);
            ps2.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
    }

    public static void main(String[] args) {
        DeleteNV delete = new DeleteNV();
     delete.deleteExecutionByID(7);
    }
}
