package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/*@Setter
@Getter
@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor*/

@Data
public class BoardDto {

	private int num;
	private int readcount;
	private int likes;
	private int regroup;
	private int restep;
	private int relevel;
	private String id;
	private String name;
	private String subject;
	private String content;
	private String photo;
	private Timestamp writeday;
	private int acount;
	
}
























