package com.scii.demo.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RegisterModel {
	String employee_id;
	String first_name;
	String last_name;
	String date_of_birth;
	String address;
	String gender;
	String contact_number;
	String email_id;
	String date_of_joining;
	String batch;
	String department_id;
	String designation_id;
	String account_number;
	String pan;
	String pf_account_number;
	String discontinued;
	String date_of_leaving;
	String salary_date;
	int basic_salary;
	double worked_days;
	double sick_leave;
	double earned_leave;
	String department_name;
	String designation_name;
}
