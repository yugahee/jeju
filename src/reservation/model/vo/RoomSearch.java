package reservation.model.vo;

public class RoomSearch {
	private String location;
	private String room_type; 
	private String building_type;
	private String specialFac;
	
	
	public RoomSearch() {}


	public RoomSearch(String location, String room_type, String building_type, String specialFac) {
		super();
		this.location = location;
		this.room_type = room_type;
		this.building_type = building_type;
		this.specialFac = specialFac;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getRoom_type() {
		return room_type;
	}


	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}


	public String getBuilding_type() {
		return building_type;
	}


	public void setBuilding_type(String building_type) {
		this.building_type = building_type;
	}


	public String getSpecialFac() {
		return specialFac;
	}


	public void setSpecialFac(String specialFac) {
		this.specialFac = specialFac;
	}


	@Override
	public String toString() {
		return "RoomSearch [location=" + location + ", room_type=" + room_type + ", building_type=" + building_type
				+ ", specialFac=" + specialFac + "]";
	}
	
	
	
	
	
}
