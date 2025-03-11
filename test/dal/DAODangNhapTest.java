/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.SQLException;
import model.Acount;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.After;

/**
 *
 * @author BAO CHAU
 */
public class DAODangNhapTest {

    private DAODangNhap dao;
    private Connection connection;

    @Before
    public void setUp() throws SQLException {
        DBContext dbContext = new DBContext(); // Không kế thừa DBContext nữa
        connection = dbContext.connection;

        if (connection == null) {
            throw new SQLException("Không thể kết nối đến cơ sở dữ liệu!");
        }

        dao = new DAODangNhap();
    }

    public DAODangNhapTest() {
    }

    @Test
    public void testDangnhap_NullUser() {
        Acount result = dao.Dangnhap(null, "password1");
        assertNull(result);
    }

    @Test
    public void testDangnhap_NullPassword() {
        Acount result = dao.Dangnhap("admin1", null);
        assertNull(result);
    }

    @Test
    public void testDangnhap_ValidAdmin() {
        Acount result = dao.Dangnhap("admin1", "admin12");
        assertNotNull(result);
        assertEquals("admin1", result.getUser());
        assertEquals("admin12", result.getPass());
        assertEquals(1, result.getR().getRoleid());
        assertEquals(1, result.getEmployeeid());
    }

    @Test
    public void testDangnhap_ValidPassenger() {
        Acount result = dao.Dangnhap("kiennv1", "password1");
        assertNotNull(result);
        assertEquals("kiennv1", result.getUser());
        assertEquals("password1", result.getPass());
        assertEquals(1, result.getPassagerid());
        assertEquals(3, result.getR().getRoleid());
    }

    @Test
    public void testDangnhap_WrongPassword() {
        Acount result = dao.Dangnhap("admin1", "password1");
        assertNull(result);
    }

    @Test
    public void testDangnhap_WrongUser() {
        Acount result = dao.Dangnhap("abc", "password1");
        assertNull(result);
    }

    @Test
    public void testCheckEmailNull() {
        boolean check = dao.checkEmail1(null);
        assertEquals(true, check);
    }
    
     @Test
    public void testCheckEmailPassenger() {
        boolean check = dao.checkEmail1("kiennv1@gmail.com");
        assertEquals(false, check);
    }
    
     @Test
    public void testCheckEmailEmployee() {
        boolean check = dao.checkEmail1("phongvg04@gmail.com");
        assertEquals(false, check);
    }
    

    @After
    public void tearDown() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }

}
