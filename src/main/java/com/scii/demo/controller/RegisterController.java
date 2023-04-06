package com.scii.demo.controller;

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
import com.scii.demo.model.DepartmentModel;
import com.scii.demo.model.DesignationModel;
import com.scii.demo.model.RegisterModel;
import com.scii.demo.service.RegisterService;

@Controller
public class RegisterController {

	private ModelAndView modelAndView;
	@Autowired
	private RegisterService registerservice;

	@RequestMapping(value = "/Register")
	public ModelAndView showDiscontinuedEmployeePage11(DepartmentModel departmentmodel,
			DesignationModel designationmodel, ModelAndView model) 
	{
		model.addObject("errorMessage", "User_name or Password is wrong!!");
		model.addObject("DepartmentList", registerservice.getDepartmentInfo());
		model.addObject("DesignationList", registerservice.getDesignationInfo());
		model.setViewName("registerEmployee");
		return model;
	}
	
	@RequestMapping(value = "/save-Employee", method = RequestMethod.POST)
	public @ResponseBody Object saveUser(HttpServletResponse response, HttpServletRequest request, HttpSession httpSession,
			 @ModelAttribute("registermodel") RegisterModel registermodel) throws JsonProcessingException 
	{
		modelAndView = new ModelAndView();
		modelAndView.addObject("DepartmentList", registerservice.getDepartmentInfo());
		modelAndView.addObject("DesignationList", registerservice.getDesignationInfo());
		int status = registerservice.insertOrUpdateEmployee(registermodel);
		modelAndView.addObject("status", status);
		 if (status == 1 ) {
			 modelAndView.addObject("MESSAGE","Employee Registed Successfully");
		} else {
			 modelAndView.addObject("MESSAGE","Failed to Register");
		}
		
		modelAndView.setViewName("registerEmployee");
		return modelAndView;
	}
}
