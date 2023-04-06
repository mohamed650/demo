package com.scii.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.scii.demo.model.DepartmentModel;
import com.scii.demo.model.EmployeeModel;
import com.scii.demo.model.SalaryMasterModel;
import com.scii.demo.model.SalaryModel;
import com.scii.demo.service.EMSService;
import com.scii.demo.service.RegisterService;

@Controller
public class EMSController {
	
	/*
	 * Autowiring feature of spring framework enables you to inject the object dependency implicitly. 
	 * It internally uses setter or constructor injection. 
	 * Autowiring can't be used to inject primitive and string values.
	 */
	@Autowired
	EMSService emsService;
	@Autowired
	private RegisterService registerservice;
	
	@RequestMapping(value = "/employeeList", method = RequestMethod.GET)
	public ModelAndView showEmployeeListPage() {
		ModelAndView model = new ModelAndView();
		model.addObject("DepartmentList", registerservice.getDepartmentInfo());
		model.addObject("DesignationList", registerservice.getDesignationInfo());
		model.setViewName("employeeList");
		return model;
	}

	@RequestMapping(value = "/registerEmployee", method = RequestMethod.GET)
	public ModelAndView showRegisterEmployeePage() {
		ModelAndView model = new ModelAndView();
		model.addObject("DepartmentList", registerservice.getDepartmentInfo());
		model.addObject("DesignationList", registerservice.getDesignationInfo());
		model.setViewName("registerEmployee");
		return model;
	}

	@RequestMapping(value = "/discontEmp", method = RequestMethod.GET)
	public ModelAndView showDiscontinuedEmployeePage() {
		ModelAndView model = new ModelAndView();
		List<String> batches = emsService.getBatchList();
		List<DepartmentModel> departments = emsService.getDepartmentList();
		model.addObject("batch_list", batches);
		model.addObject("department_list", departments);
		model.setViewName("discontinuedEmployee");
		return model;
	}
	
	@RequestMapping(value = "/salary", method = RequestMethod.GET)
	public ModelAndView showSalaryPage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("salaryRetrievalForm");
		return model;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String showLoginPage(HttpServletRequest request) {
		//System.out.println("Session@/logout1: "+request.getSession(false));
		if(request.getSession(false) != null) {
			//System.out.println("Session: "+request.getSession(false).getId());
			request.getSession(false).invalidate();
		}
		//System.out.println("Session@/logout2: "+request.getSession(false));
		return "redirect:/";
	}
	
	@RequestMapping(value = "/getDiscontEmployeeList", method = RequestMethod.GET)
	public @ResponseBody Object getDiscontEmployeeList() {
		EmployeeModel empModel = new EmployeeModel();
		empModel.setEmployee_id(null);
		empModel.setDiscontinued('1');	// To get only discontinued employees
		// Here we will get list of employees having discontinued_flag as '1'
		List<EmployeeModel> listofEmps = emsService.getEmployeeDetailsList(empModel);
		return listofEmps;
	}
	
	@RequestMapping(value = "/deleteEmployee", method = RequestMethod.GET)
	public @ResponseBody Object getDeleteEmployee(HttpServletRequest request) {
		int status;
		status = emsService.getDeleteDiscontEmployee(request.getParameter("emp_id"));
		return status;
	}
	
	@RequestMapping(value = "/getEmployeeIdsList", method = RequestMethod.GET)
	public @ResponseBody Object getEmployeeIdsList() {
		EmployeeModel empModel = new EmployeeModel();
		empModel.setEmployee_id(null);
		empModel.setDiscontinued('0');	// To get all employees
		// Here we will get list of ALL employees
		List<EmployeeModel> list = emsService.getEmployeeDetailsList(empModel);
		Map<String, String> map = new HashMap<String, String>();
		for (EmployeeModel model : list) {
			map.put(model.getEmployee_id(), model.getFirst_name());
		}
		return map;
	}

	@RequestMapping(value = "/getRetrieveSalaryDetailsById", method = RequestMethod.POST)
	public @ResponseBody Object getRetrieveSalaryusingID(HttpServletRequest request) {
		
		EmployeeModel empModel = new EmployeeModel();
		SalaryModel salaryModel = new SalaryModel();
		SalaryMasterModel salaryMasterModel = new SalaryMasterModel();
		
		// Here we will get only the selected employee details based on ID
		empModel.setEmployee_id(request.getParameter("emp_id"));
		empModel.setDiscontinued('0');
		empModel = emsService.getEmployeeDetailsList(empModel).get(0);
		
		// Here fetch the salary details based on selected Employee ID and Month&Year
		salaryModel.setEmployee_id(request.getParameter("emp_id"));
		
		// format the salary date string to the form as mmyyyy
		String salaryDate = request.getParameter("month_year").substring(0, 2).concat(request.getParameter("month_year").substring(3));
		salaryModel.setSalary_date(salaryDate);
		salaryModel = emsService.getSalaryDetails(salaryModel);
		salaryMasterModel = emsService.getSalaryCalculationDetails();

		String msg = null;
		try {
			Map<Object, Object> map = new HashMap<Object, Object>();
			ObjectMapper mapper = new ObjectMapper(); 
			if (empModel == null || salaryModel == null || salaryMasterModel == null) {
				map.put("ERRORMSG", "MSG9");
			} else {
				map.put("EmployeeModel", empModel);
				map.put("SalaryModel", salaryModel);
				map.put("SalaryCalculations", salaryMasterModel);
				map.put("ERRORMSG", null);
			}
			msg = mapper.writeValueAsString(map);
			
		} catch(NullPointerException | JsonProcessingException e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	@RequestMapping(value = "/checkSession", method = RequestMethod.GET)
	public @ResponseBody Object checkSessionTimeout(HttpServletRequest request) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		HttpSession session = request.getSession(false);

		if(session == null) {
			map.put("ERRORMSG", "MSG17");
		} else {
			/*
			 *  Here Session is available. But we have to check it is Old session or new session to control back button processing from browser
			 *  If it is Old session then we can continue. Otherwise we can redirect to Login page.
			 *  (since a new session will be created automatically when we redirect to login page after session timeout)
			 */
			String session_id_Old = (String) request.getSession().getAttribute("MY_SESSION_ID"); //This is from DB saved while last login
			String session_id_current = request.getSession().getId();	// This is new id from HTTPrequest
			
			//System.out.println("session_id_Old: "+session_id_Old);
			//System.out.println("session_id_new: "+session_id_current);
			if(session_id_current.equals(session_id_Old)) {
				//System.out.println("TRUE--> Session is alive");
				map.put("ERRORMSG", null);
			} else {
				//System.out.println("FALSE--> Session Expired");
				map.put("ERRORMSG", "MSG17");
			}
		}
		return map;
	}
}
