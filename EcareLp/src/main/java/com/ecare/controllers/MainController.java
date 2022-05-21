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
	
	@GetMapping("/ethereum")
	public String Ethereum() {
		return "Ethereum.jsp";
	}
	
	@GetMapping("/javascript")
	public String JavaScriptDoc() {
		return "JavaScript-Doc-Page.jsp";
	}
	
	@GetMapping("/productpage")
	public String ProductLandingPage() {
		return "Product-Landing-Page.jsp";
	}
	
//	@GetMapping("/surveyform")
//	public String SurveyForm() {
//		return "Survey-Form.jsp";
//	}
	
	@GetMapping("/tribute")
	public String TributePage() {
		return "Tribute-Page.jsp";
	}
	
	
}
