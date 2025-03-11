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
public class ChangePassword extends DBContext {

    public boolean checkPassword(String username, String password) {
        boolean isMatch = false;
        String sql = "SELECT a.AccountPass from Account a WHERE a.AccountUser = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String storedPassword = rs.getString(1);
                isMatch = storedPassword.equals(password);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isMatch;
    }

    public boolean updatePassword(String username, String newPassword) {
        String sql = "UPDATE Account SET AccountPass = ? WHERE AccountUser = ?"; 
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, username);
            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }
    public static void main(String[] args) {
        ChangePassword change = new ChangePassword();
        System.out.println(change.updatePassword("kiennv1", "pass1"));
    }
}