package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Comment_FriendDto {
	private int friend_num;
	private int find_num;
	private int user_num;
	private String content;
	private Timestamp writeday;
	private int regroup;
	private int restep;
	private int relevel;
}
