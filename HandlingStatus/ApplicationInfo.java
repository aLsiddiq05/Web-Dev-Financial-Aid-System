/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package HandlingStatus;

import financialAid.FinancialAid;

/**
 *
 * @author User
 */
public class ApplicationInfo {

    private StudentApplication application;
    private ViewStudentInfo studentInfo;
    private FinancialAid financialAid;

    // Constructor
    public ApplicationInfo(StudentApplication application, ViewStudentInfo studentInfo, FinancialAid financialAid) {
        this.application = application;
        this.studentInfo = studentInfo;
        this.financialAid = financialAid;
    }

    // Getters
    public StudentApplication getApplication() {
        return application;
    }

    public ViewStudentInfo getStudentInfo() {
        return studentInfo;
    }

    public FinancialAid getFinancialAid() {
        return financialAid;
    }

    public void setApplication(StudentApplication application) {
        this.application = application;
    }

    public void setStudentInfo(ViewStudentInfo studentInfo) {
        this.studentInfo = studentInfo;
    }

    public void setFinancialAid(FinancialAid financialAid) {
        this.financialAid = financialAid;
    }
}
