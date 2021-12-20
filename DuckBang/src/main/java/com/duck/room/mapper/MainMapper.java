package com.duck.room.mapper;

import java.util.List;


import com.duck.room.dto.main.Recommend;

public interface MainMapper {
	public List<Recommend> getRecommendList();
}