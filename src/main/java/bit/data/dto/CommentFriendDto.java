package bit.data.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentFriendDto {
	private int friend_num;
	private int find_num;
	private int user_num;
	private String content;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
	private Timestamp writeday;
	private int regroup;
	private int restep;
	private int relevel;
	private String name;
	private String nickname;
	private String loginid;
	private int diff;

}
