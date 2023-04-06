package com.scii.demo.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SalaryModel {
	private String employee_id;
	private String salary_date;
	private int    basic_salary;
	private double worked_days;
	private double sick_leave;
	private double earned_leave;
	private double medical_reimbursement;
	private double lta_reimbursement;
	private double el_reimbursement;
}
