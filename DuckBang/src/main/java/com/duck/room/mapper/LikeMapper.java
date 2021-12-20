package com.duck.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.duck.room.dto.like.Like;

public interface LikeMapper {
	public List<Like> getLike(@Param("u_id") String u_id);
}
