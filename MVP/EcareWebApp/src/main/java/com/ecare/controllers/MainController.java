package com.ecare.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {
	
	@GetMapping("")
	public String Index() {
		return "index.jsp";
	}
	
	@GetMapping("/prototype")
	public String Prototype() {
		return "prototype.jsp";
	}
	
	
	//Comment out bottom getters after successful tests
	@GetMapping("/test")
	public String Test() {
		return "test/index-test.jsp";
	}
	
	@GetMapping("/prototype-test")
	public String PrototypeTest() {
		return "test/prototype-test.jsp";
	}
}
