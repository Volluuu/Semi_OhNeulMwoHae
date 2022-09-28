package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class FindDto {
	private int find_num;
	private int user_num;
	private String subject;
	private String content;
	private String photo;
	private int readcount;
	private Timestamp writeday;
}
