package com.ptit.devops.hrm.controller;

import com.ptit.devops.hrm.entity.Employee;
import com.ptit.devops.hrm.repository.EmployeeRepository;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class EmployeeController {

    private final EmployeeRepository repository;

    public EmployeeController(EmployeeRepository repository) {
        this.repository = repository;
    }

    /** GET /api/employees - danh sách nhân viên */
    @GetMapping("/employees")
    public List<Employee> findAll() {
        return repository.findAll(Sort.by("id"));
    }
}
