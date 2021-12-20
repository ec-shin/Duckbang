package com.duck.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.duck.room.dto.info.Info;
import com.duck.room.dto.info.InfoImg;
import com.duck.room.dto.info.InfoOption;
import com.duck.room.dto.info.InfoOther;
import com.duck.room.dto.info.InfoPrice;
import com.duck.room.dto.info.InfoSecurity;
import com.duck.room.dto.info.InfoTop1;
import com.duck.room.dto.info.InfoTop2;


public interface InfoMapper {
	public InfoPrice getPrice(@Param("o_id") Integer o_id);
	
	public InfoTop1 getTop1(@Param("o_id") Integer o_id);
	
	public InfoTop2 getTop2(@Param("o_id") Integer o_id);
	
	public Info getInfo(@Param("o_id") Integer o_id);
	
	public InfoImg getImg(@Param("o_id") Integer o_id);
	
	public InfoOption getOption(@Param("o_id") Integer o_id);
	
	public InfoSecurity getSecurity(@Param("o_id") Integer o_id);
	
	public List<InfoOther> getOther(@Param("r_id") String r_id);
}