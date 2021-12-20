package com.duck.room.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.duck.room.dto.Interest;
import com.duck.room.mapper.InterestMapper;

@RestController
@RequestMapping("/")
public class InterestController {
	
	@Autowired
	InterestMapper im;
	
	/*
	@RequestMapping("/interest")
	public String interest(Model model, HttpServletRequest request) {
		im.addInterest(request.getParameter("interest_email"), Integer.parseInt(request.getParameter("interest_o_id")));
		
		return "/main/elements/interest";
	}
	
	@RequestMapping("/deleteInterest")
	public String deleteInterest(Model model, HttpServletRequest request) {
		im.deleteInterest(request.getParameter("interest_email"), Integer.parseInt(request.getParameter("interest_o_id")));
		
		return "/main/elements/interest";
	}
	*/
	
	@PostMapping(value = "/interest", produces = MediaType.APPLICATION_JSON_VALUE )
	public List<Interest> getInterest(Model model, HttpServletRequest request, @RequestBody Interest interest){
		
		im.addInterest(interest.getU_id(), interest.getO_id());
		List<Interest> interest_list = im.list();
		
		
		return interest_list;
	}
	
	@PostMapping(value = "/deleteInterest", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Interest> deleteInterest(Model model, HttpServletRequest request, @RequestBody Interest interest){
		
		im.deleteInterest(interest.getU_id(), interest.getO_id());
		List<Interest> interest_list = im.list();
		
		
		return interest_list;
	}
	
	
}












