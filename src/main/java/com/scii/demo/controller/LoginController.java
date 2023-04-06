package com.scii.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.scii.demo.model.LoginModel;
import com.scii.demo.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView showDiscontinuedEmployeePage11() 
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;
	}
	
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public ModelAndView showDiscontinuedEmployeePage12() 
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
	
		return model;
	}
	
	@RequestMapping(value = "/userlogin", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
									@ModelAttribute("login") LoginModel login) 
	{
		ModelAndView model = null;
		LoginModel login1 = loginService.isValidUser(login);
		if (null != login1) {
			model = new ModelAndView("employeeList");
			
			// Adding session id to DB
			String session_id = request.getSession().getId();
			request.getSession().setAttribute("MY_SESSION_ID", session_id);
		}
		else {
			model = new ModelAndView("login");
			model.addObject("errorMessage", "User_name or Password is wrong!!");
		}
		return model;
	}
}
