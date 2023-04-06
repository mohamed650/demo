package com.scii.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.scii.demo.model.RegisterModel;
import com.scii.demo.model.SalaryModel;
import com.scii.demo.service.EMSService;
import com.scii.demo.service.RegisterService;

@Controller
public class EmployeeListController {
	
	private ModelAndView modelAndView;
	
	@Autowired
	private RegisterService registerservice;
	
	@Autowired
	EMSService emsService;
	
	@RequestMapping(value = "/employeelist", method = RequestMethod.GET) 
	public @ResponseBody Object showDiscontinuedEmployeePage() 
	{
		List<RegisterModel> register = registerservice.getEmployeeInfo();
		return  register;
	}
	
	@RequestMapping(value = "/update-Employee", method = RequestMethod.POST)
	public @ResponseBody Object saveUser(HttpServletResponse response, HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute("registermodel") RegisterModel registermodel) throws JsonProcessingException 
	{
		modelAndView = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		int status = registerservice.UpdateEmployee(registermodel);
		modelAndView.addObject("status", status);
		if (status == 1) {
			modelAndView.addObject("MESSAGE1", "MSG11");
		} else {
			map.put("MESSAGE1", "MSG15");
		}
		modelAndView.addObject("DepartmentList", registerservice.getDepartmentInfo());
		modelAndView.addObject("DesignationList", registerservice.getDesignationInfo());
		modelAndView.setViewName("employeeList");
		return modelAndView;
	}
	
	@RequestMapping(value = "/update-Salary", method = RequestMethod.POST)
			public @ResponseBody Object saveUser(HttpServletResponse response, HttpServletRequest request, HttpSession httpSession,
					 @ModelAttribute("salarymodel") SalaryModel salarymodel) throws JsonProcessingException 
	{
		modelAndView = new ModelAndView();
		
		if (salarymodel.getSalary_date() != null) {
			int status = registerservice.UpdateSalary(salarymodel);
			modelAndView.addObject("status", status);
			modelAndView.addObject("DepartmentList", registerservice.getDepartmentInfo());
			modelAndView.addObject("DesignationList", registerservice.getDesignationInfo());
			modelAndView.setViewName("employeeList");
		}
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/getSalaryDetailsbyId", method = RequestMethod.POST)
	public @ResponseBody Object getSalaryDetailsbyId(HttpServletRequest request)
	{
		Map<Object, Object> map = new HashMap<Object, Object>();
		ObjectMapper mapper = new ObjectMapper(); 
		String msg = null;
		
		SalaryModel salaryModel = new SalaryModel();
		salaryModel.setEmployee_id(request.getParameter("emp_id"));
		salaryModel.setSalary_date(request.getParameter("month_year"));
		salaryModel = emsService.getSalaryDetails(salaryModel);
		if (salaryModel == null) {
			map.put("ERRORMSG", "MSG9");
		} else {
			map.put("SalaryModel", salaryModel);
		map.put("ERRORMSG", null);
		}
		try {
			msg = mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return msg;
	}
}
