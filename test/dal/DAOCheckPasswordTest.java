package dal;

import java.sql.Connection;
import java.sql.SQLException;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.After;

/**
 * JUnit test cho phương thức checkPassword
 */
public class DAOCheckPasswordTest {

    private ChangePassword dao;
    private Connection connection;

    @Before
    public void setUp() throws SQLException {
        DBContext dbContext = new DBContext();
        connection = dbContext.connection;

        if (connection == null) {
            throw new SQLException("Không thể kết nối đến cơ sở dữ liệu!");
        }

        dao = new ChangePassword();
    }

    public DAOCheckPasswordTest() {
    }

    /**
     * Test case: username = null
     * Kết quả mong đợi: false
     */
    @Test
    public void testCheckPassword_NullUser() {
        boolean result = dao.checkPassword(null, "password123");
        assertFalse(result);
    }

    /**
     * Test case: password = null
     * Kết quả mong đợi: false
     */
    @Test
    public void testCheckPassword_NullPassword() {
        boolean result = dao.checkPassword("admin1", null);
        assertFalse(result);
    }

    /**
     * Test case: username hợp lệ, password hợp lệ
     * Kết quả mong đợi: true
     */
    @Test
    public void testCheckPassword_ValidUserValidPassword() {
        boolean result = dao.checkPassword("admin1", "admin12");
        assertTrue(result);
    }

    /**
     * Test case: username hợp lệ, password sai
     * Kết quả mong đợi: false
     */
    @Test
    public void testCheckPassword_ValidUserWrongPassword() {
        boolean result = dao.checkPassword("admin1", "wrongpass");
        assertFalse(result);
    }

    /**
     * Test case: username không tồn tại
     * Kết quả mong đợi: false
     */
    @Test
    public void testCheckPassword_NonExistingUser() {
        boolean result = dao.checkPassword("nonexistent", "password123");
        assertFalse(result);
    }

    @After
    public void tearDown() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }
}
