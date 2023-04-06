package com.scii.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scii.demo.mapper.EMSMapper;
import com.scii.demo.model.DepartmentModel;
import com.scii.demo.model.EmployeeModel;
import com.scii.demo.model.SalaryMasterModel;
import com.scii.demo.model.SalaryModel;

@Service
public class EMSServiceImpl implements EMSService {

	@Autowired
	EMSMapper emsMapper;
	
	@Override
	public List<EmployeeModel> getEmployeeDetailsList(EmployeeModel empModel) {
		List<EmployeeModel> list = emsMapper.getEmployeeList(empModel);
		return list;
	}

	@Override
	public int getDeleteDiscontEmployee(String id) {
		int status = emsMapper.deleteDiscontEmployee(id);
		return status;
	}

	@Override
	public SalaryModel getSalaryDetails(SalaryModel salary) {
		SalaryModel salaryModel = new SalaryModel();
		salaryModel = emsMapper.getSalaryDetailsByIdandDate(salary);
		return salaryModel;
	}

	@Override
	public SalaryMasterModel getSalaryCalculationDetails() {
		return emsMapper.getMasterTableValues();
	}

	@Override
	public List<String> getBatchList() {
		return emsMapper.getBatchListfromEmployeeTable();
	}

	@Override
	public List<DepartmentModel> getDepartmentList() {
		return emsMapper.getDepartmentListfromEmployeeTable();
	}
}
