package com.duck.room.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoomController {

	// 메인페이지 불러올 때
	@RequestMapping("/duckbang")
	public String home() {
		/*
		 	temp.jsp
		 	DB
		 	특정지역(일단 미정)
			img
			원룸/투룸/오피스텔
			전세/월세  +  가격
			층 + 면적(m) + 관리비
			입주가능일
			Attribute 명 recommend_list
		 */
		
		/*
			explain.jsp
			DB
			특정지역(일단 미정)
			해당 지역의 원룸 보증금 평균 + 원룸 월세 평균
			해당 지역의 원룸 전세 평균
			
			해당 지역의 투쓰리룸 보증금 평균 + 투쓰리룸 월세 평균
			해당 지역의 투쓰리룸 전세 평균
			
			해당 지역의 오피스텔 보증금 평균 + 투쓰리룸 월세 평균
			해당 지역의 오피스텔 전세 평균
			
			해당 지역의 원룸 수
			해당 지역의 투쓰리룸 수
			해당 지역의 오피스텔 수
			Attribute 명 explain_list
		 */
		return "/main/index";
	}

	// 로고의 버튼을 누를 때
	@GetMapping("/duckbang/map?type") 
	public String map1(@ModelAttribute String type){
		/*
			어떤 타입을 눌렀는지(아파트, 원룸, 오피스텔, 투쓰리룸)
			DB
			해당 타입의 매물 리스트를 받아온다
			Attribute 명 list
		 */
		
		return "/map/index";
	}
	
	// 로그인 및 회원가입 버튼을 눌렀을 때
	@RequestMapping("duckbang/login")
	public String login() {
		return "/login/index";
	}
	
	// 검색창에 검색해서 넘길때 +
	@GetMapping("/duckbang/map?type=${type}")
	public String map2(@ModelAttribute String type, HttpServletRequest request) {
		/*
		  	request.setAttribute("search", request.getParameter(검색어 input name));
		  	DB 해당 지역의 해당 타입의 매물 리스트를 받아온다
		  	Attribute 명 list
		 */
		return "/map/index";
	}
	
	// 추천매물에서 매물을 클릭했을 때 + footer에서 검색
	@GetMapping("/duckbang/info?매물번호=${매물번호}")
	public String info(@ModelAttribute String 매물번호) {
		/*
		   해당 매물번호에 대한 정보를 받아옴
		   Attribute 
		 */
		return "info/index";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	
	// 중개소 더보기 버튼
	@GetMapping("/duckbang/agent?중개등록번호")
	public String agent(String 중개등록번호) {
		/*
		 	해당 중개등록번호의 중개사정보를 담은 객체 하나를 attribute에 넣어서 보내줌
		 */
		return "abo/index";
	}
}