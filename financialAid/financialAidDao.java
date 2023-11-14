package financialAid;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.util.*;
import java.sql.*;

/**
 *
 * @author User
 */
public class financialAidDao {

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

    public static int save(FinancialAid e) {
        int status = 0;
        try {
            Connection con = financialAidDao.getConnection();
            String sInsertQry = "INSERT INTO financial(financial_name, program, overview, criteria, amount, deadline) VALUES(?,?,?,?,?,?)";

            PreparedStatement myPS = con.prepareStatement(sInsertQry);

            myPS.setString(1, e.getName());
            myPS.setString(2, e.getProgram());
            myPS.setString(3, e.getOverview());
            myPS.setString(4, e.getCriteria());
            myPS.setInt(5, e.getAmount());
            myPS.setString(6, e.getDateline());

            status = myPS.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static int update(FinancialAid e) {
        int status = 0;
        try {
            Connection con = financialAidDao.getConnection();
            String sUpdateQuery = "UPDATE financial SET program=?, overview=?, criteria=?, amount=?, deadline=? WHERE financial_name=?";

            PreparedStatement myPS = con.prepareStatement(sUpdateQuery);

            myPS.setString(1, e.getProgram());
            myPS.setString(2, e.getOverview());
            myPS.setString(3, e.getCriteria());
            myPS.setInt(4, e.getAmount());
            myPS.setString(5, e.getDateline());
            myPS.setString(6, e.getName());

            status = myPS.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static int delete(String name) {
        int status = 0;
        try {
            Connection con = financialAidDao.getConnection();
            String sInsertQry = "DELETE FROM financial WHERE financial_name=?";

            PreparedStatement myPS = con.prepareStatement(sInsertQry);

            myPS.setString(1, name);

            status = myPS.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static FinancialAid getFinancialAidByName(String name) {
        FinancialAid e = null;

        try {
            Connection con = financialAidDao.getConnection();
            String sSelectQry = "SELECT * FROM financial WHERE financial_name=?";
            PreparedStatement myPS = con.prepareStatement(sSelectQry);
            myPS.setString(1, name);
            ResultSet rs = myPS.executeQuery();
            if (rs.next()) {
                e = new FinancialAid();
                //e.setId(rs.getInt(1));//tukar sini jugok maybe akan ada masalah
                e.setName(rs.getString(1));
                e.setProgram(rs.getString(2));
                e.setOverview(rs.getString(3)); // Corrected column index
                e.setCriteria(rs.getString(4)); // Corrected column index
                e.setAmount(rs.getInt(5));
                e.setDateline(rs.getString(6));
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return e;
    }

    public static List<FinancialAid> getAllFinancialAid() {
        List<FinancialAid> list = new ArrayList<FinancialAid>();

        try {
            Connection con = financialAidDao.getConnection();
            String sInsertQry = "SELECT * FROM financial";
            PreparedStatement myPS = con.prepareStatement(sInsertQry);
            ResultSet rs = myPS.executeQuery();
            while (rs.next()) {
                FinancialAid e = new FinancialAid();

                //e.setId(rs.getInt(1));//tukar sini tadi
                e.setName(rs.getString(1));
                e.setProgram(rs.getString(2));
                e.setOverview(rs.getString(3)); // Corrected column index
                e.setCriteria(rs.getString(4)); // Corrected column index
                e.setAmount(rs.getInt(5));
                e.setDateline(rs.getString(6));

                list.add(e);
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return list;

    }
}
