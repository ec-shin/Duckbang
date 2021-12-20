package com.duck.room.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.duck.room.dto.info.Info;
import com.duck.room.mapper.InfoMapper;
import com.duck.room.mapper.InterestMapper;
import com.duck.room.mapper.MapMapper;

@Controller
public class MapController {

	@Autowired
	MapMapper mapMapper;
	
	@Autowired 
	InfoMapper im;
	
	@Autowired
	InterestMapper interestMapper;
	
	@GetMapping("/map")
	public String mapMarkers(Model model, String room_kind) {
		
		ArrayList<Integer> o_id = new ArrayList<>();
		ArrayList<String> xcordinate = new ArrayList<>();
		ArrayList<String> ycordinate = new ArrayList<>();
		ArrayList<String> room_kinds = new ArrayList<>();
		String room_kind_kor = "";
		
		if(room_kind.equals("all")) {
			for(int i = 0; i < mapMapper.getAllList().size(); ++i) {
				o_id.add(mapMapper.getAllList().get(i).getO_id());
				xcordinate.add(mapMapper.getAllList().get(i).getL_xcordinate());
				ycordinate.add(mapMapper.getAllList().get(i).getL_ycordinate());
			}
			
			for(int i = 0; i < mapMapper.getAllSummaryList().size(); ++i) {
				room_kinds.add(mapMapper.getAllSummaryList().get(i).getOd_room_kind());
			}
			
			model.addAttribute("o_id", o_id);
			model.addAttribute("xcordinate", xcordinate);
			model.addAttribute("ycordinate", ycordinate);
			model.addAttribute("check", "get");
			model.addAttribute("room_kinds", room_kinds);
			model.addAttribute("summaryLists", mapMapper.getAllSummaryList());
			
		} else {
			if(room_kind.equals("apart")) {
				room_kind_kor = "아파트";
			} else if(room_kind.equals("tworoom")) {
				room_kind_kor = "투룸";
			} else if(room_kind.equals("oneroom")) {
				room_kind_kor = "원룸";
			} else if(room_kind.equals("office")) {
				room_kind_kor = "오피스텔";
			}
			
			for(int i = 0; i < mapMapper.getList(room_kind_kor).size(); ++i) {
				o_id.add(mapMapper.getList(room_kind_kor).get(i).getO_id());
				xcordinate.add(mapMapper.getList(room_kind_kor).get(i).getL_xcordinate());
				ycordinate.add(mapMapper.getList(room_kind_kor).get(i).getL_ycordinate());
			}
			
			model.addAttribute("o_id", o_id);
			model.addAttribute("xcordinate", xcordinate);
			model.addAttribute("ycordinate", ycordinate);
			model.addAttribute("room_kind", room_kind_kor);
			model.addAttribute("room_kinds", room_kind);
			model.addAttribute("check", "get");
			model.addAttribute("summaryLists", mapMapper.getSummaryList(room_kind_kor));
		}
		
		model.addAttribute("interest_list", interestMapper.list());
		
		return "map/index";
	}
	
	@PostMapping("/map")
	public String mapMarker(Model model, HttpServletRequest request) {
		String room_kind = request.getParameter("check"); 
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		String room_kind_kor = "";
		
		if(room_kind.equals("1")) {
			room_kind_kor = "아파트";
		} else if(room_kind.equals("2")) {
			room_kind_kor = "투룸";
		} else if(room_kind.equals("3")) {
			room_kind_kor = "원룸";
		} else if(room_kind.equals("4")) {
			room_kind_kor = "오피스텔";
		}
		ArrayList<Integer> o_id = new ArrayList<>();
		ArrayList<String> xcordinate = new ArrayList<>();
		ArrayList<String> ycordinate = new ArrayList<>();
		
		for(int i = 0; i < mapMapper.getList(room_kind_kor).size(); ++i) {
			o_id.add(mapMapper.getList(room_kind_kor).get(i).getO_id());
			xcordinate.add(mapMapper.getList(room_kind_kor).get(i).getL_xcordinate());
			ycordinate.add(mapMapper.getList(room_kind_kor).get(i).getL_ycordinate());
		}
		
		model.addAttribute("o_id", o_id);
		model.addAttribute("xcordinate", xcordinate);
		model.addAttribute("ycordinate", ycordinate);
		model.addAttribute("room_kind", room_kind_kor);
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		model.addAttribute("check", "post");
		model.addAttribute("summaryLists", mapMapper.getSummaryList(room_kind_kor));
		model.addAttribute("interest_list", interestMapper.list());
		
		return "map/index";
	}
	
	@GetMapping("/info")
	public String o_id_info(Integer o_id, Model model) {
		if(o_id == null) {
			return "main/index";
		}

		model.addAttribute("price", im.getPrice(o_id));
		model.addAttribute("InfoTop1", im.getTop1(o_id));
		model.addAttribute("InfoTop2", im.getTop2(o_id));
		model.addAttribute("Info1", im.getInfo(o_id));
		model.addAttribute("InfoImg", im.getImg(o_id));
		model.addAttribute("InfoOption", im.getOption(o_id));
		model.addAttribute("InfoSecurity", im.getSecurity(o_id));
		model.addAttribute("InfoOther", im.getOther(im.getTop2(o_id).getR_id()));
		model.addAttribute("interest_list", interestMapper.list());
		
		return "info/index";
	}
}
