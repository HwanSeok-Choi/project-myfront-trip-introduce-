package tourprj;

import org.json.JSONObject;

public class EventDto2 {
	
	Object title;
	Object firstimage;
	Object addr1;
	Object addr2;
	Object eventstartdate;
	Object eventenddate;;
	
	public EventDto2() {
		// TODO Auto-generated constructor stub
	}

	public Object getTitle() {
		return title;
	}

	public void setTitle(Object title) {
		this.title = title;
	}

	public Object getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(Object firstimage) {
		this.firstimage = firstimage;
	}

	public Object getAddr1() {
		return addr1;
	}

	public void setAddr1(Object addr1) {
		this.addr1 = addr1;
	}

	public Object getAddr2() {
		return addr2;
	}

	public void setAddr2(Object addr2) {
		this.addr2 = addr2;
	}

	public Object getEventstartdate() {
		return eventstartdate;
	}

	public void setEventstartdate(Object eventstartdate) {
		this.eventstartdate = eventstartdate;
	}

	public Object getEventenddate() {
		return eventenddate;
	}

	public void setEventenddate(Object eventenddate) {
		this.eventenddate = eventenddate;
	}

	public EventDto2(Object title, Object firstimage, Object addr1, Object addr2, Object eventstartdate,
			Object eventenddate) {
		super();
		this.title = title;
		this.firstimage = firstimage;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.eventstartdate = eventstartdate;
		this.eventenddate = eventenddate;
	}
	
	

}
