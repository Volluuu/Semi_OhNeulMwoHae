package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberDto {
	private int num;
	private String loginid;
	private String pass;
	private String name;
	private String photo;
	private String hp;
	private String email;
	private String address;
	private Timestamp gaipday;

	
}
