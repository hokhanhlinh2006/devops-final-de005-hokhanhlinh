package com.ptit.devops.hrm.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "employees")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "full_name")
    private String fullName;

    @Column(name = "position")
    private String position;

    @Column(name = "department")
    private String department;

    @Column(name = "email")
    private String email;

    @Column(name = "salary")
    private BigDecimal salary;

    public Long getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getPosition() {
        return position;
    }

    public String getDepartment() {
        return department;
    }

    public String getEmail() {
        return email;
    }

    public BigDecimal getSalary() {
        return salary;
    }
}
