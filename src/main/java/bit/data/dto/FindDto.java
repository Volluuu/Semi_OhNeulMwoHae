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
	private int answercount;
	private String name;
	private String nickname;
	private String loginid;
	private String find1;
	private String find2;
	private String find3;
	private String find4;
	private String find5;
}
