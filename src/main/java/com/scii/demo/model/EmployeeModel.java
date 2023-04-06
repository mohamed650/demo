package com.scii.demo.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeModel {
	private String employee_id;		// character varying(5)
	private String first_name;		// character varying(30)
	private String last_name;		// character varying(30)
	private String date_of_birth;	// character varying(15)
	private String address;			// character varying(120)
	private char   gender;			// character varying(1)
	private String contact_number;	// character varying(15)
	private String email_id;		// character varying(40)
	private String date_of_joining;	// character varying(15)
	private String batch;			// character varying(4)
	private String department_id;	// character varying(3)
	private String designation_id;	// character varying(3)
	private String bank_name;		// character varying(30)
	private String account_number;	// character varying(20)
	private String pan;				// character varying(20)
	private String pf_account_number;	// character varying(20)
	private char   discontinued;		// character varying(1)
	private String date_of_leaving;	// character varying(15)
	
	private String department_name;
	private String designation_name;
}
