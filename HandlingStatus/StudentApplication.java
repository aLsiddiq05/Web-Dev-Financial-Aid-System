/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package HandlingStatus;

import java.util.Date;
import java.sql.Time;
import java.sql.Timestamp;

/**
 *
 * @author User
 */
public class StudentApplication {
    private int applicationId;
    private String payslip;
    private String cgpa;
    private String path;
    private Date submissionDate; // Updated data type to java.util.Date
    private Time submissionTime; // Updated data type to java.sql.Time
    private String application_status;
    private String stu_email;
    private String financial_name;

    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public String getPayslip() {
        return payslip;
    }

    public void setPayslip(String payslip) {
        this.payslip = payslip;
    }

    public String getCgpa() {
        return cgpa;
    }

    public void setCgpa(String cgpa) {
        this.cgpa = cgpa;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Date getSubmissionDate() {
        return submissionDate;
    }

    public void setSubmissionDate(Date submissionDate) {
        this.submissionDate = submissionDate;
    }

    public Time getSubmissionTime() {
        return submissionTime;
    }

    public void setSubmissionTime(Time submissionTime) {
        this.submissionTime = submissionTime;
    }

    public String getApplication_status() {
        return application_status;
    }

    public void setApplication_status(String application_status) {
        this.application_status = application_status;
    }

    public String getStu_email() {
        return stu_email;
    }

    public void setStu_email(String stu_email) {
        this.stu_email = stu_email;
    }

    public String getFinancial_name() {
        return financial_name;
    }

    public void setFinancial_name(String financial_name) {
        this.financial_name = financial_name;
    }
}