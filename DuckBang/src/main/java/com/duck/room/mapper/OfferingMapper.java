package com.duck.room.mapper;


import org.apache.ibatis.annotations.Param;
import com.duck.room.dto.main.RoomAvg;


public interface OfferingMapper {

	public RoomAvg getRoomAvg(@Param("od_room_kind") String od_room_kind, @Param("ok_code")String ok_code);
}