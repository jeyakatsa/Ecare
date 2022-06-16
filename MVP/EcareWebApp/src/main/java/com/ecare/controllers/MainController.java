package com.ecare.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecare.models.WalletOne;
import com.ecare.models.WalletTwo;
import com.ecare.services.ExchangeService;

@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	private ExchangeService exchangeService;
	
	public MainController(ExchangeService exchangeService) {
		this.exchangeService = exchangeService;
	}
	
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
	public String getWalletOne(@ModelAttribute("walletOne") WalletOne walletOne, Model model) {
		Double numbers = this.exchangeService.getWalletOne();
		model.addAttribute("walletOne", numbers);
		return "test/prototype-test.jsp";
	}
}
