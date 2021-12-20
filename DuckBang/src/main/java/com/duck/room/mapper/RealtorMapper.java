package com.duck.room.mapper;

import com.duck.room.dto.realtor.Image;
import com.duck.room.dto.realtor.Location;
import com.duck.room.dto.realtor.Offering;
import com.duck.room.dto.realtor.OfferingDetail;
import com.duck.room.dto.realtor.OfferingKind;
import com.duck.room.dto.realtor.OfferingOption;
import com.duck.room.dto.realtor.OfferingSecurity;

public interface RealtorMapper {

	public boolean addImage(Image image);
	public boolean addLocation(Location location);
	public boolean addOffering(Offering offering);
	public boolean addKind(OfferingKind kind);
	public boolean addDetail(OfferingDetail detail);
	public boolean addOption(OfferingOption option);
	public boolean addSecurity(OfferingSecurity security);
	
	public int getLcode();
	public int getOid();
}
