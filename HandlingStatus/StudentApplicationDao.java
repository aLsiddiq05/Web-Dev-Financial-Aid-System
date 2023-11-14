/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package HandlingStatus;

import admin.register.DBConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import financialAid.FinancialAid;
import HandlingStatus.ViewStudentInfo;

/**
 *
 * @author User
 */
public class StudentApplicationDao {

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

    public static List<StudentApplication> getAllStudentApplication() throws ClassNotFoundException {
        List<StudentApplication> list = new ArrayList<StudentApplication>();

        try {
            Connection con = StudentApplicationDao.getConnection();
            String appQuery = "SELECT * FROM applications";
            PreparedStatement myPS = con.prepareStatement(appQuery);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                StudentApplication e = new StudentApplication();

                e.setApplicationId(rs.getInt(1));
                e.setPayslip(rs.getString(2));
                e.setCgpa(rs.getString(3));
                e.setPath(rs.getString(4));
                e.setSubmissionDate(rs.getDate(5)); // Assuming column 5 is the submission_datetime column
                e.setSubmissionTime(rs.getTime(5)); // Assuming column 5 is the submission_datetime column
                e.setApplication_status(rs.getString(6));
                e.setStu_email(rs.getString(7));
                e.setFinancial_name(rs.getString(8));

                list.add(e);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int update(StudentApplication e) {
        int status = 0;
        try {
            Connection con = StudentApplicationDao.getConnection();
            String sUpdateQuery = "UPDATE applications SET application_status=? WHERE applicationId=?";

            PreparedStatement myPS = con.prepareStatement(sUpdateQuery);

            myPS.setString(1, e.getApplication_status()); // Set the value for the first parameter
            myPS.setInt(2, e.getApplicationId()); // Set the value for the second parameter

            status = myPS.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    public static int updateStatus(StudentApplication e) {
        int status = 0;
        try {
            Connection con = StudentApplicationDao.getConnection();
            String sUpdateQuery = "UPDATE applications SET application_status=? WHERE applicationId=?";

            PreparedStatement myPS = con.prepareStatement(sUpdateQuery);
            myPS.setString(1, e.getApplication_status()); // Set the value for the first parameter
            myPS.setInt(2, e.getApplicationId()); // Set the value for the second parameter

            status = myPS.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static ApplicationInfo getApllicationInfo2(int applicationId) {
        FinancialAid ev = null;
        ViewStudentInfo ec = null;
        StudentApplication ex = null;
        try {
            Connection con = StudentApplicationDao.getConnection();
            String query = "SELECT s.name, s.email, s.phoneNo, s.matric, s.income,"
                    + "s.bank, s.acc, s.race, s.religion, s.status, s.ic, s.course, "
                    + "f.financial_name, f.program, f.overview, f.criteriea, f.amount, f.deadline, a.path "
                    + "FROM applications a "
                    + "INNER JOIN student s ON a.stu_email = s.email "
                    + "INNER JOIN financial f ON a.financial_name = f.financial_name "
                    + " WHERE applicationId=?";

            PreparedStatement myPS = con.prepareStatement(query);
            myPS.setInt(1, applicationId); // Set the value for the first parameter
            ResultSet rs = myPS.executeQuery();
            if (rs.next()) {
                ex = new StudentApplication();
                ec = new ViewStudentInfo();
                ev = new FinancialAid();

                ec.setName(rs.getString(1));
                ec.setEmail(rs.getString(2));
                ec.setPhoneNumber(rs.getString(3));
                ec.setMatric(rs.getString(4));
                ec.setIncome(rs.getDouble(5));
                ec.setBank(rs.getString(6));
                ec.setAcc(rs.getString(7));
                ec.setRace(rs.getString(8));
                ec.setReligion(rs.getString(9));
                ec.setStatus(rs.getString(10));
                ec.setIc(rs.getString(11));
                ec.setCourse(rs.getString(12));
                ev.setName(rs.getString(13));
                ev.setProgram(rs.getString(14));
                ev.setOverview(rs.getString(15));
                ev.setCriteria(rs.getString(16));
                ev.setAmount(rs.getInt(17));
                ev.setDateline(rs.getString(18));
                ex.setPath(rs.getString(19));
            }

        } catch (Exception ep) {
            ep.printStackTrace();
        }
        return new ApplicationInfo(ex, ec, ev);
    }

    public static ApplicationInfo getApplicationInfo(int applicationId) {
        FinancialAid ev = null;
        ViewStudentInfo ec = null;
        StudentApplication ex = null;
        try {
            // Database code to fetch data
            Connection con = StudentApplicationDao.getConnection();
            String query = "SELECT s.name, s.email, s.phoneNo, s.matric, s.income,"
                    + "s.bank, s.acc, s.race, s.religion, s.status, s.ic, s.course, "
                    + "f.financial_name, f.program, f.overview, f.criteriea, f.amount, f.deadline, a.path "
                    + "FROM applications a "
                    + "INNER JOIN student s ON a.stu_email = s.email "
                    + "INNER JOIN financial f ON a.financial_name = f.financial_name "
                    + " WHERE applicationId=?";

            PreparedStatement myPS = con.prepareStatement(query);
            myPS.setInt(1, applicationId); // Set the value for the first parameter
            ResultSet rs = myPS.executeQuery();

            if (rs.next()) {
                // Retrieve data from the ResultSet and create objects
                ex = new StudentApplication();
                ec = new ViewStudentInfo();
                ev = new FinancialAid();

                ec.setName(rs.getString(1));
                ec.setEmail(rs.getString(2));
                ec.setPhoneNumber(rs.getString(3));
                ec.setMatric(rs.getString(4));
                ec.setIncome(rs.getDouble(5));
                ec.setBank(rs.getString(6));
                ec.setAcc(rs.getString(7));
                ec.setRace(rs.getString(8));
                ec.setReligion(rs.getString(9));
                ec.setStatus(rs.getString(10));
                ec.setIc(rs.getString(11));
                ec.setCourse(rs.getString(12));
                ev.setName(rs.getString(13));
                ev.setProgram(rs.getString(14));
                ev.setOverview(rs.getString(15));
                ev.setCriteria(rs.getString(16));
                ev.setAmount(rs.getInt(17));
                ev.setDateline(rs.getString(18));
                ex.setPath(rs.getString(19));
                // Set the studentInfo object only if the ec object is not null
                if (ec != null) {
                    ec.setName(rs.getString(1));
                    ec.setEmail(rs.getString(2));
                    ec.setPhoneNumber(rs.getString(3));
                    ec.setMatric(rs.getString(4));
                    ec.setIncome(rs.getDouble(5));
                    ec.setBank(rs.getString(6));
                    ec.setAcc(rs.getString(7));
                    ec.setRace(rs.getString(8));
                    ec.setReligion(rs.getString(9));
                    ec.setStatus(rs.getString(10));
                    ec.setIc(rs.getString(11));
                    ec.setCourse(rs.getString(12));
                }
                if (ev != null) {
                    ev.setName(rs.getString(13));
                ev.setProgram(rs.getString(14));
                ev.setOverview(rs.getString(15));
                ev.setCriteria(rs.getString(16));
                ev.setAmount(rs.getInt(17));
                ev.setDateline(rs.getString(18));
                }
            }

            con.close();
        } catch (Exception ep) {
            ep.printStackTrace();
        }

        // Return a new ApplicationInfo object with proper values
        return new ApplicationInfo(ex, ec, ev);
    }

}
