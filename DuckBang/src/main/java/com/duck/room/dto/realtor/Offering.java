package com.duck.room.dto.realtor;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Offering {
	private Integer o_id;
	private String o_approval_state;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date o_register_date;
	private String r_id;
	private Integer l_code;
}
