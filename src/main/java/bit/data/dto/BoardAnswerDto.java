package bit.data.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BoardAnswerDto {

	private int idx;
	private String id;
	private String name;
	private String photo;
	private String message;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
	private Timestamp writeday;
	private int num;
	
}
