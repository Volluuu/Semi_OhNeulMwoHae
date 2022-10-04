package bit.data.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentCourseDto {
	private int course_num;
	private int user_num;
	private int food_num;
	private int trip_num;
	private int cafe_num;
	private int star;
	private String content;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
	private Timestamp writeday;
}
