package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class SubsDto {
	private int subs_num;
	private int user_num;
	private int food_num;
	private int trip_num;
	private int cafe_num;
	private Timestamp writeday;
}
