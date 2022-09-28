package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class UserDto {
	private int user_num;
	private String loginid;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String hp;
	private String profile;
	private String interest;
	private String mycourse;
	private String profilephoto;
	private String alarm;
	private String isadmin;
	private Timestamp gaipday;
}
