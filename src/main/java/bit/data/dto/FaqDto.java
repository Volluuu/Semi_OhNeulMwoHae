package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class FaqDto {
    private int faq_num;
    private int user_num;
    private String subject;
    private String content;
    private String answer;
    private Timestamp writeday;
}
