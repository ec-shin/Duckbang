package com.duck.room.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.duck.room.mapper.MainMapper;
import com.duck.room.mapper.OfferingMapper;
import com.duck.room.mapper.UsersMapper;
import com.duck.room.service.KakaoService;
import com.duck.room.service.NaverLoginBO;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class LoginController {
    @Autowired
    UsersMapper um;
    
	@Autowired
	OfferingMapper om;
	
	@Autowired  
	MainMapper mm;
    
    @Autowired
    KakaoService kakaoService;
    
    @Autowired
    NaverLoginBO naverLoginBO;
    
    @RequestMapping("/login")
    public String userLogin(Model model, HttpSession session) {
        model.addAttribute("user", um.getUser());
        
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        model.addAttribute("url", naverAuthUrl);
        
        return "/login/login";
    }
    
    @RequestMapping("/kakaoLogin")
    public String home(@RequestParam(value = "code", required = false) String code, Model model) throws Exception{
        String access_Token = kakaoService.getAccessToken(code);
        Integer pass = (int)(Math.random() * 10000 + 1);
        HashMap<String, String> userInfo = kakaoService.getUserInfo(access_Token);           
        
        String user_email = userInfo.get("email");
        
        if(um.getSelectUser(user_email)==null) {
            um.insertSocialId(user_email, Integer.toString(pass));
        }
        
        model.addAttribute("access_Token",access_Token);
        model.addAttribute("email", userInfo.get("email"));
        model.addAttribute("name", userInfo.get("nickname"));
              
        return "/login/kakao";
    }
    
    @RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request)
            throws IOException {
        
        request.setCharacterEncoding("UTF-8");
        Integer pass = (int)(Math.random() * 10000 + 1);
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        String apiResult = naverLoginBO.getUserProfile(oauthToken);               
        
        model.addAttribute("result", apiResult);
 
        return "/login/naver";
    }
    
    @PostMapping("/main")
    public String naverToMain(HttpServletRequest request, Model model, @CookieValue(value = "user_id", defaultValue = "0") String user_id) {
        Integer pass = (int)(Math.random() * 10000 + 1);
        Cookie cookies[] = request.getCookies();
        String user_email = null;
        
        for(Cookie cookie: cookies) {
            if(cookie.getName().equals("user_id")) {
                user_email = URLDecoder.decode(cookie.getValue());
            }
        }
        System.out.println("user_email : " + user_email);
        if(user_email != null) {      
        	System.out.println(um.getSelectUser(user_email));
            if(um.getSelectUser(user_email)==null) {
                um.insertSocialId(user_email, Integer.toString(pass));
            }
        }
        String name = "";
        if(user_id.contains("@")) {
			int index = user_id.indexOf("@");
			name = user_id.substring(0, index);
		}
		
		model.addAttribute("explain_1", om.getRoomAvg("원룸", "월세"));
		model.addAttribute("explain_2", om.getRoomAvg("원룸", "전세")); 
		model.addAttribute("explain_3", om.getRoomAvg("투룸", "월세"));
		model.addAttribute("explain_4", om.getRoomAvg("투룸", "전세"));
		model.addAttribute("explain_5", om.getRoomAvg("오피스텔", "월세"));
		model.addAttribute("explain_6", om.getRoomAvg("오피스텔", "전세"));
		model.addAttribute("recommend", mm.getRecommendList());
		model.addAttribute("name", name);
		return "/main/index";
    }
    
 }