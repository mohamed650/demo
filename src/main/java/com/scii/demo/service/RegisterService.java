package com.scii.demo.service;

import java.util.List;

import com.scii.demo.model.DepartmentModel;
import com.scii.demo.model.DesignationModel;
import com.scii.demo.model.RegisterModel;
import com.scii.demo.model.SalaryModel;

public interface RegisterService {
	
	List<DepartmentModel> getDepartmentInfo();
	
	List<DesignationModel> getDesignationInfo();
	
	public int insertOrUpdateEmployee(RegisterModel registermodel);
	
	public int UpdateEmployee(RegisterModel registermodel);
	
	List<RegisterModel> getEmployeeInfo();
	
	public int UpdateSalary(SalaryModel salarymodel);
}
