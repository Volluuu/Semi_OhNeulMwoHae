package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberDto {
	private int user_num;
	private String loginid;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String hp;
	private String profilephoto;
	private String interest;
	private String mycourse;
	private String alarm;
	private String isadmin;
	private Timestamp gaipday;

}
