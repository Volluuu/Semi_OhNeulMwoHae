package bit.data.dto;

import lombok.Data;

@Data
public class TripDto {
	private int trip_num;
	private String title;
	private String addr;
	private String photo;
	private String content;
	private String lat;
	private String lon;
	private int gu;
	private int readcount;
}
