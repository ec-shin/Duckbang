package com.duck.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.duck.room.dto.map.Location;
import com.duck.room.dto.map.SummaryOffering;

public interface MapMapper {
	
	// room_kind별로 location에서 x좌표, y좌표 다 가져오기
	public List<Location> getList(@Param("room_kind") String room_kind);
	
	// 모든 매물 다 가져오기
	public List<Location> getAllList();
	
	// room_kind별로 지도 옆에 띄워줄 정보 가져오기
	public List<SummaryOffering> getSummaryList(@Param("room_kind") String room_kind);
	
	// 모든 리스트 가져오기
	public List<SummaryOffering> getAllSummaryList();

}