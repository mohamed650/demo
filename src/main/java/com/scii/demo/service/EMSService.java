package com.scii.demo.service;

import java.util.List;

import com.scii.demo.model.DepartmentModel;
import com.scii.demo.model.EmployeeModel;
import com.scii.demo.model.SalaryMasterModel;
import com.scii.demo.model.SalaryModel;

public interface EMSService {
	
	public List<EmployeeModel> getEmployeeDetailsList(EmployeeModel empModel);

	public int getDeleteDiscontEmployee(String id);

	public SalaryModel getSalaryDetails(SalaryModel salaryModel);

	public SalaryMasterModel getSalaryCalculationDetails();

	public List<String> getBatchList();

	public List<DepartmentModel> getDepartmentList();
}
