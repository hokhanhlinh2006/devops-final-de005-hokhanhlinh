package com.ptit.devops.hrm.repository;

import com.ptit.devops.hrm.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
}
