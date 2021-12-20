package com.duck.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.duck.room.dto.Interest;

public interface InterestMapper {
	
	public List<Interest> list();
	
	public Integer addInterest(@Param("u_id") String u_id, @Param("o_id") Integer o_id);
	
	public Integer deleteInterest(@Param("u_id") String u_id, @Param("o_id") Integer o_id);
	
	public Object getSelect(@Param("u_id") String u_id);
}
