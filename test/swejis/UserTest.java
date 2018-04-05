/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package swejis;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import java.sql.*;
import static org.junit.Assert.*;

/**
 *
 * @author TeamVideoSummarization
 */
public class UserTest {
    
    public UserTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void logIn() throws IOException {
        // TODO review the generated test code and remove the default call to fail.
        BufferedReader br = new BufferedReader(new FileReader("/users/TeamVideoSummarization/status.txt"));
        String status = br.readLine();
        assertEquals("status", "logged in", status);
//        fail("The test case is a prototype.");
    }
    
    @Test
    public void logOut() throws IOException {
        // TODO review the generated test code and remove the default call to fail.
        BufferedReader br = new BufferedReader(new FileReader("/users/TeamVideoSummarization/status.txt"));
        String status = br.readLine();
        assertEquals("status", "logged out", status);
//        fail("The test case is a prototype.");
    }
    
    @Test
    public void user() throws IOException, ClassNotFoundException, SQLException {
        // TODO review the generated test code and remove the default call to fail.
        BufferedReader br = new BufferedReader(new FileReader("/users/TeamVideoSummarization/username.txt"));
        String status = br.readLine();
        assertEquals("username", "b", status);
        
        br = new BufferedReader(new FileReader("/users/TeamVideoSummarization/realname.txt"));
        String status2 = br.readLine();
        assertEquals("realname", "B B", status2);
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");    
        PreparedStatement pst = conn.prepareStatement("select pass from login where user='"+status+"';");
        ResultSet rs = pst.executeQuery();
        String pwd="";
        if(rs.next())
            pwd = rs.getString("pass");
        
        assertEquals("password", "b", pwd);
//        fail("The test case is a prototype.");
    }
    
    @Test
    public void userType() throws IOException {
        // TODO review the generated test code and remove the default call to fail.
        BufferedReader br = new BufferedReader(new FileReader("/users/TeamVideoSummarization/type.txt"));
        String status = br.readLine();
        assertEquals("type", "lawyer", status);
//        fail("The test case is a prototype.");
    }
    
    
}
