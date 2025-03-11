/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;


import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import java.sql.Connection;
import java.sql.SQLException;

public class CheckIDTest {
    private TRACUU dao;
    private Connection connection;

    @Before
    public void setUp() throws SQLException {
        DBContext dbContext = new DBContext();
        connection = dbContext.connection;
        if (connection == null) {
            throw new SQLException("Không thể kết nối đến cơ sở dữ liệu!");
        }
        dao = new TRACUU();
    }

    @Test
    public void testCheckID_ExistingID() {
        boolean result = dao.checkID(1); // Giả sử ID 1 tồn tại trong bảng Passenger
        assertTrue(result);
    }

    @Test
    public void testCheckID_NonExistingID() {
        boolean result = dao.checkID(99999); // Giả sử ID 99999 không tồn tại
        assertFalse(result);
    }

    @Test
    public void testCheckID_BoundaryCase() {
        boolean result = dao.checkID(0); // Kiểm tra với ID nhỏ nhất có thể
        assertFalse(result);
    }

    @Test
    public void testCheckID_NegativeID() {
        boolean result = dao.checkID(-5); // Kiểm tra với giá trị âm
        assertFalse(result);
    }
}