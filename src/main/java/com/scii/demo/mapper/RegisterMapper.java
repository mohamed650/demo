package com.scii.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.scii.demo.model.DepartmentModel;
import com.scii.demo.model.DesignationModel;
import com.scii.demo.model.RegisterModel;
import com.scii.demo.model.SalaryModel;

@Mapper
public interface RegisterMapper {
	
	List<DepartmentModel> getDepartmentInfo();
	
	List<DesignationModel> getDesignationInfo();
	
	int insertOrUpdateEmployee(RegisterModel registermodel);
	
	int UpdateEmployee(RegisterModel registermodel);
	
	List<RegisterModel> getEmployeeInfo();
	
	int insertorUpdateSalary(SalaryModel salarymodel);
}
