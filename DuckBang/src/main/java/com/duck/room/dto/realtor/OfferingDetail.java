package com.duck.room.dto.realtor;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OfferingDetail {
	private Integer o_id;
	private String od_room_kind;
	private Integer od_whole_floor;
	private Integer od_apply_floor;
	private Integer od_private_area2;
	private Float od_private_area;
	private String od_supply_area;
	private Integer od_room_count;
	private Integer od_bathroom_count;
	private String od_heating_kind;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date od_occupy_date;
	private String od_construction_use;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date od_use_approval_date;
	private String od_pet_possibility;
}
