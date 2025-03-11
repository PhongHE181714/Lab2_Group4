package dal;

import java.util.List;
import model.Passager;
import org.junit.*;
import static org.junit.Assert.*;
import org.junit.runners.MethodSorters;

@FixMethodOrder(MethodSorters.NAME_ASCENDING) // Sắp xếp test theo tên phương thức
public class DAOPASSAGERTest {
    private static DAOPASSAGER instance;

    @BeforeClass
    public static void setUpClass() {
        instance = new DAOPASSAGER();
    }

    @AfterClass
    public static void tearDownClass() {
        instance = null;
    }

    @Test
    public void testA_GetAll() {
        List<Passager> result = instance.getAll();
        assertNotNull("Danh sách hành khách không co", result);
        assertTrue("Danh sách phải có hành khách", result.size() > 0);
    }

    @Test
    public void testB_GetPassengerbyID() {
        Passager result = instance.getPassengerbyID(1);
        assertNotNull("Không tìm thấy hành khách có ID", result);
        assertEquals("ID không khớp", 1, result.getId());
    }

    @Test
    public void testC_UpdatePassengerProfile() {
        Passager updatedPassenger = new Passager(3, "long", "0912345678", "ID03", "long@gmail.com");
        boolean updateResult = instance.updatePassengerProfile(3, updatedPassenger);
        assertTrue("Cập nhật thất bại", updateResult);

        Passager result = instance.getPassengerbyID(3);
        assertNotNull("Không tìm thấy hành khách sau cập nhật", result);
        assertEquals("Tên không được cập nhật", "long", result.getName());
    }
}
