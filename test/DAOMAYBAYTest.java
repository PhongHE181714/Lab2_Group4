
import dal.DAOMAYBAY;
import dal.DBContext;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import model.FlightLook;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class DAOMAYBAYTest {

    private DAOMAYBAY dao;
    private Connection connection;

    @Before
    public void setUp() throws SQLException {
        DBContext dbContext = new DBContext(); // Không kế thừa DBContext nữa
        connection = dbContext.connection;

        if (connection == null) {
            throw new SQLException("Không thể kết nối đến cơ sở dữ liệu!");
        }

        dao = new DAOMAYBAY();
    }

    @Test
    public void testGetFlight_WithNullName_ShouldReturnEmptyList() {
        List<FlightLook> result = dao.getFlight(null);
        assertNotNull( result);
        assertTrue( result.isEmpty());
    }

    @Test
    public void testGetFlight_WithValidFlightVN105_ShouldReturnNonEmptyList() {
        List<FlightLook> result = dao.getFlight("VN105");
        assertNotNull( result);
        assertFalse( result.isEmpty());
    }

    @Test
    public void testGetFlight_WithValidFlightVN310_ShouldReturnNonEmptyList() {
        List<FlightLook> result = dao.getFlight("VN310");
        assertNotNull( result);
        assertTrue( result.isEmpty());
    }

    @After
    public void tearDown() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }

}
