package com.scii.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.scii.demo.mapper.RegisterMapper;
import com.scii.demo.model.DepartmentModel;
import com.scii.demo.model.DesignationModel;
import com.scii.demo.model.RegisterModel;
import com.scii.demo.model.SalaryModel;

@Service
public class RegisterServiceImp implements RegisterService {

	@Autowired
	private RegisterMapper registermapper;

	@Override
	public List<DepartmentModel> getDepartmentInfo() {
		List<DepartmentModel> department = registermapper.getDepartmentInfo();
		return department;
	}

	@Override
	public List<DesignationModel> getDesignationInfo() {
		List<DesignationModel> designation = registermapper.getDesignationInfo();
		return designation;
	}

	@Override 
	public int insertOrUpdateEmployee(RegisterModel registermodel) {
		int status = registermapper.insertOrUpdateEmployee(registermodel);
		return status; 
	}
	
	@Override 
	public int UpdateEmployee(RegisterModel registermodel) {
		int status = registermapper.UpdateEmployee(registermodel);
		return status; 
	}

	@Override
	public List<RegisterModel> getEmployeeInfo() {
		List<RegisterModel> register = registermapper.getEmployeeInfo();
		return register;
	}
		
	@Override 
	public int UpdateSalary(SalaryModel salrymodel) {
		int status = registermapper.insertorUpdateSalary(salrymodel);
		return status; 
	}
}
