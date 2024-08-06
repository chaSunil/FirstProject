package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import dao.TestDao;
import service.TestService;

@Controller
public class TestController {

	@Autowired
	TestDao test_dao;
	
	@Autowired
	TestService test_service;
	
	
	
}
