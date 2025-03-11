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
public class ADDNHANVIEN extends DBContext {

    public boolean isUsernameExists(String username) {
        String sql = "SELECT COUNT(*) FROM Account WHERE AccountUser = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean getNhanVien(String name, String tel, String email, int roleid, String username, String password) {

        String sql1 = "INSERT INTO [dbo].[Employee]\n"
                + "           ([EmployeeName]\n"
                + "           ,[EmployeeTel]\n"
                + "           ,[EmployeeEmail]\n"
                + "           ,[RoleId])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        String sql2 = "INSERT INTO [dbo].[Account]\n"
                + "           ([AccountUser]\n"
                + "           ,[AccountPass]\n"
                + "           ,[RoleId]\n"
                + "           ,[EmployeeId])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, name);
            ps.setString(2, tel);
            ps.setString(3, email);
            ps.setInt(4, roleid);
            int affectedRows = ps.executeUpdate();
            int employeeId = -1;

           
            if (affectedRows > 0) {
                ResultSet rs = ps.getGeneratedKeys(); 
                if (rs.next()) {
                    employeeId = rs.getInt(1); 
                }
            }
           
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setString(1, username);
            ps2.setString(2, password);
            ps2.setInt(3, roleid);
            ps2.setInt(4, employeeId);
            ps2.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println(sql1);
            ex.printStackTrace();
        }
        return false;
    }

    
}
