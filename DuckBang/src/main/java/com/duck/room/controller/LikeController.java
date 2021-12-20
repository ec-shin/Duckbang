package com.duck.room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;

import com.duck.room.mapper.InterestMapper;
import com.duck.room.mapper.LikeMapper;

@Controller
public class LikeController {
	
	@Autowired
	LikeMapper lm;
	
	@Autowired
	InterestMapper interMapper;
	
	@GetMapping("/like")
	public String likeList(@CookieValue(value = "user_id", defaultValue = "0") String user_id, Model model) {
		/*
		 	쿠키에서 받은 id로 DB 접속
		 */
		model.addAttribute("likeRoom",lm.getLike(user_id));
		model.addAttribute("interest_list", interMapper.list());
		
		return "/like/index";
	}
}
