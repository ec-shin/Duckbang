package com.duck.room.dto.realtor;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OfferingKind {
	private Integer o_id;
	private String ok_code;
	private Integer ok_deposit;
	private Integer ok_maintenance_cost;
	private Integer ok_month_of_payment;
	private Integer ok_parking_pee;
	private String od_short_lease;
}
