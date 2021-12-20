package com.duck.room.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duck.room.dto.realtor.Image;
import com.duck.room.dto.realtor.Location;
import com.duck.room.dto.realtor.Offering;
import com.duck.room.dto.realtor.OfferingDetail;
import com.duck.room.dto.realtor.OfferingKind;
import com.duck.room.dto.realtor.OfferingOption;
import com.duck.room.dto.realtor.OfferingSecurity;
import com.duck.room.mapper.MainMapper;
import com.duck.room.mapper.OfferingMapper;
import com.duck.room.mapper.RealtorMapper;

@Controller
public class RealtorController {
	
	@Autowired 
	RealtorMapper rm;
	@Autowired
	OfferingMapper om;
	@Autowired  
	MainMapper mm;
	
	@RequestMapping("/regist")
	public String regist(HttpServletRequest request, HttpServletResponse response, Model model) throws NumberFormatException, ParseException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(request.getParameter("realtor_agreeChk") == null) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('매물관리규정 동의에 체크해주세요.'); </script>");
			out.flush();
			return "/realtor/room";	
		}else if(request.getParameter("realtor_agreeChk").equals("on")){
			int parking_fee = 0;
			if(request.getParameter("ok_parking_fee").equals("")) {
				parking_fee = 0;
			}else {
				parking_fee = Integer.parseInt(request.getParameter("ok_parking_fee"));
			}
			
	
			String od_short_lease = "불가능";
			
			if(request.getParameter("od_short_lease")==null) {
				od_short_lease = "불가능";
			}else if(request.getParameter("od_short_lease").equals("on")){
				od_short_lease = "가능";
			}
			
			int l_code = rm.getLcode() + 1;
			int o_id = rm.getOid() + 1;
			System.out.println(rm.addLocation(new Location(l_code, request.getParameter("l_xcordinate"), request.getParameter("l_ycordinate"))));
			System.out.println(rm.addOffering(new Offering(o_id, "pass", new Date(new java.util.Date().getTime()), "5", l_code)));
			System.out.println(rm.addKind(new OfferingKind(o_id, request.getParameter("ok_code"),
					Integer.parseInt(request.getParameter("ok_deposit")), 
					Integer.parseInt(request.getParameter("ok_maintenance_cost")), 
					Integer.parseInt(request.getParameter("ok_month_of_payment")), 
					parking_fee, 
					od_short_lease)));
			
			System.out.println(rm.addImage(new Image(
					o_id, 
					request.getParameter("image_1"),
					request.getParameter("image_2"),
					request.getParameter("image_3"),
					request.getParameter("image_4"),
					request.getParameter("image_5"))));
		
			System.out.println(rm.addDetail(new OfferingDetail(
					o_id, 
					request.getParameter("room_kind"), 
					Integer.parseInt(request.getParameter("od_whole_floor")),
					Integer.parseInt(request.getParameter("od_apply_floor")),
					Integer.parseInt(request.getParameter("od_private_area2")),
					Float.parseFloat(request.getParameter("od_private_area")),
					request.getParameter("od_supply_area"),
					Integer.parseInt(request.getParameter("od_room_count")),
					Integer.parseInt(request.getParameter("od_bathroom_count")),
					request.getParameter("od_heating_kind"),
					Date.valueOf(request.getParameter("od_occupy_date")),
					request.getParameter("od_construction_use"),
					new Date(new java.util.Date().getTime()),
					"불가능" )));
			
			
			String[] optionChk = {"N","N","N","N","N","N","N","N","N","N","N","N","N"};
			for(String option : request.getParameterValues("option")) {
				optionChk[Integer.parseInt(option)] = "Y";
			}
			System.out.println(rm.addOption(new OfferingOption(
					o_id, 
					optionChk[0], 
					optionChk[1], 
					optionChk[2], 
					optionChk[3], 
					optionChk[4], 
					optionChk[5], 
					optionChk[6], 
					optionChk[7], 
					optionChk[8], 
					optionChk[9], 
					optionChk[10], 
					optionChk[11], 
					optionChk[12])));
			
			
			String[] securityChk = {"N","N","N","N","N"};
			for(String security : request.getParameterValues("security")) {
				securityChk[Integer.parseInt(security)] = "Y";
			}
			System.out.println(rm.addSecurity(new OfferingSecurity(
					o_id,
					securityChk[0], 
					securityChk[1], 
					securityChk[2], 
					securityChk[3], 
					securityChk[4])));
		
			model.addAttribute("explain_1", om.getRoomAvg("원룸", "월세"));
			model.addAttribute("explain_2", om.getRoomAvg("원룸", "전세")); 
			model.addAttribute("explain_3", om.getRoomAvg("투룸", "월세"));
			model.addAttribute("explain_4", om.getRoomAvg("투룸", "전세"));
			model.addAttribute("explain_5", om.getRoomAvg("오피스텔", "월세"));
			model.addAttribute("explain_6", om.getRoomAvg("오피스텔", "전세"));
			model.addAttribute("recommend", mm.getRecommendList());
			return "/main/index";
		}
		
	return "/main/index";
	}
	
}
