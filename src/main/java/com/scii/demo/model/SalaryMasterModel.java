package com.scii.demo.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SalaryMasterModel {
	private float DPA;
	private float HRA;
	private float Conveyance;
	private float column_A_Others;
	private float PF;
	private float ESI;
	private float profession_tax1;
	private float profession_tax2;
	private float profession_tax3;
	private float income_tax;
	private float staff_welfare;
	private float column_B_Others;
	private float column_C_Others;
}
