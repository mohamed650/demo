package com.scii.demo.mapper;

import java.util.List;

import com.scii.demo.model.DepartmentModel;
import com.scii.demo.model.EmployeeModel;
import com.scii.demo.model.SalaryMasterModel;
import com.scii.demo.model.SalaryModel;

public interface EMSMapper {

	List<EmployeeModel> getEmployeeList(EmployeeModel empModel);

	int deleteDiscontEmployee(String id);

	SalaryModel getSalaryDetailsByIdandDate(SalaryModel salary);

	SalaryMasterModel getMasterTableValues();

	List<String> getBatchListfromEmployeeTable();

	List<DepartmentModel> getDepartmentListfromEmployeeTable();

}