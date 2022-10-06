package bit.data.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
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
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
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
	private String find1photo;
	private String find2photo;
	private String find3photo;
	private String find4photo;
	private String find5photo;
	private String find1title;
	private String find2title;
	private String find3title;
	private String find4title;
	private String find5title;
}
