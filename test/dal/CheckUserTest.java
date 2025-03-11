package dal;

import java.sql.Connection;
import java.sql.SQLException;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.After;

/**
 * JUnit Test for CheckUser method in DAODangNhap class
 */
public class CheckUserTest {

    private DAODangNhap dao;
    private Connection connection;

    @Before
    public void setUp() throws SQLException {
        DBContext dbContext = new DBContext();
        connection = dbContext.connection;

        if (connection == null) {
            throw new SQLException("Không thể kết nối đến cơ sở dữ liệu!");
        }

        dao = new DAODangNhap();
    }

    @Test
    public void testCheckUser_ExistingUser() {
        boolean result = dao.CheckUser("admin1");
        assertTrue(result);
    }

    @Test
    public void testCheckUser_NonExistingUser() {
        boolean result = dao.CheckUser("lamnb");
        assertFalse(result);
    }

    @Test
    public void testCheckUser_EmptyUsername() {
        boolean result = dao.CheckUser("");
        assertFalse(result);
    }

    @Test
    public void testCheckUser_NullUsername() {
        boolean result = dao.CheckUser(null);
        assertFalse(result);
    }

    @After
    public void tearDown() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }
}