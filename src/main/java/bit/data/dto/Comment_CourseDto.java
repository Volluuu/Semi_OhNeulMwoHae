package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Comment_CourseDto {
	private int course_num;
	private int user_num;
	private int food_num;
	private int trip_num;
	private int cafe_num;
	private int star;
	private String content;
	private Timestamp writeday;
}
