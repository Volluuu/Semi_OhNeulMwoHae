package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Data
public class UserDto {
	private int user_num;
	private long kakao_id;
	private String naver_id;
	private String loginid;
	private String password;
	private String name;
	private String nickname;
	private String age;
	private String gender;
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
