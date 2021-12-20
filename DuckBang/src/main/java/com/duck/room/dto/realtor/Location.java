package com.duck.room.dto.realtor;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Location {
	private Integer l_code;
	private String l_xcordinate;
	private String l_ycordinate;
}
