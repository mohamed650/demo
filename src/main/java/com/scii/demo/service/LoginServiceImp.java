package com.scii.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scii.demo.mapper.LoginMapper;
import com.scii.demo.model.LoginModel;

@Service
public class LoginServiceImp implements LoginService {

	@Autowired
	private LoginMapper loginMapper;
	
	@Override
	public LoginModel isValidUser(LoginModel login) {
		LoginModel logins = loginMapper.getUser(login);
		return logins;
	}
}
