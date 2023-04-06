package com.scii.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.scii.demo.model.LoginModel;

@Mapper
public interface LoginMapper {

	public LoginModel getUser(LoginModel login);
}
