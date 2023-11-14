/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package admin.register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class AdminDao {

     public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            String myURL = "jdbc:mysql://localhost/assignment";
            con = DriverManager.getConnection(myURL, "root", "admin");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    
    public void addAdmin(Admin admin) {
        try {
            Connection connection = AdminDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO users(userid, firstname, lastname) VALUES (?,?,?)");

            preparedStatement.setString(1, admin.getEmail());
            preparedStatement.setString(2, admin.getPassword());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteAdmin(String email) {
        try {
            Connection connection = AdminDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM admin WHERE admin=?");

            preparedStatement.setString(1, email);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(Admin admin) {
        try {
            Connection connection = AdminDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE users SET email=?, password=? WHERE email=?");

            preparedStatement.setString(1, admin.getEmail());
            preparedStatement.setString(2, admin.getPassword());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Admin> getAllAdmin() {
        List<Admin> admins = new ArrayList<Admin>();
        try {
            Connection connection = AdminDao.getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM admin");
            while (rs.next()) {
                Admin admin = new Admin();
                admin.setEmail(rs.getString("email"));
                admin.setPassword(rs.getString("password"));
                admins.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admins;
    }

    public Admin getAdminByEmail(String email) {
        Admin admin = new Admin();
        try {
            Connection connection = AdminDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM admin WHERE email=?");
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                admin.setEmail(rs.getString("email"));
                admin.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
}
