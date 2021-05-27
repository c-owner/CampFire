package com.campfire.service;

import org.springframework.stereotype.Service;

import com.campfire.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class UserServiceImpl implements UserService{
	private UserMapper mapper;
	
}
