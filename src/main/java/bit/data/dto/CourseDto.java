package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CourseDto {
	private int cos_num;
	private int cnt;
	private String title;
	private int user_num;
	private String step1;
	private String step2;
	private String step3;
	private String step4;
	private String step5;
	private Timestamp writeday;
}
