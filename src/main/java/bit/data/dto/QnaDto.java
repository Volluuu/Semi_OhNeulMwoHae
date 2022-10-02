package bit.data.dto;

import lombok.Data;

@Data
public class QnaDto {
	private int qna_num;
	private int user_num;
	private String subject;
	private String content;
	private String answer;

}
