package com.duck.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.duck.room.dto.abo.AboInfo;
import com.duck.room.dto.abo.AboRoomList;

public interface AboMapper {
	public AboInfo getInfo(@Param("r_id") String r_id);
	
	public List<AboRoomList> getRoom(@Param("r_id") String r_id);
}
