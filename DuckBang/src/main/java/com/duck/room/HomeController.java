package com.duck.room;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duck.room.mapper.InfoMapper;
import com.duck.room.mapper.OfferingMapper;
import com.duck.room.mapper.UsersMapper;

@Controller
public class HomeController { 
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	
	@Autowired
	OfferingMapper om;
	
	@Autowired	
	InfoMapper im;
	
	@Autowired
	UsersMapper um;
	
	@RequestMapping("/abo")
	public String abo() {
		return "/abo/index";
	}
	
	@RequestMapping("/main/tou")
	public String tou() {
		return "/details/tou";
	}
	
	@RequestMapping("/agree/1")
	public String agree1() {
		return "/agree/1";
	}
	
	@RequestMapping("/agree/2")
	public String agree2() {
		return "/agree/2";
	}
	
	@RequestMapping("/agree/3")
	public String agree3() {
		return "/agree/3";
	}

	@RequestMapping("/membership")
	public String membership() {
		return "/login/membership/join";
	}
	
	@RequestMapping("/memberInfo")
	public String memberInfo() {
		return "/login/membership/info";
	}
	
	@RequestMapping("/signin")
	public String Sginin() {
		return "/join/signin";
	}
	
	@RequestMapping("/check_uid")
	public String check_uid(@RequestParam("user_id") String u_id,@RequestParam("user_pw_input") String u_pass, Model model) {
		int check = um.checkUser(u_id);
		if(check > 0) {
			model.addAttribute("check", true);
			return "redirect:/signin";
		}else {
			um.newUser(u_id, u_pass);
			model.addAttribute("id", u_id);
			return "/join/signin2";
		}
	}
}