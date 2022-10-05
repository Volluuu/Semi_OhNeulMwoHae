package bit.data.dto;

import lombok.Data;

@Data
public class FoodDto {
	private int food_num;
	private String title;
	private String addr;
	private String category;
	private String menu;
	private String photo;
	private String tel;
	private String lat;
	private String lon;
	private int gu;
	private int readcount;
	private int user_num;
	private double staravg;
	private int answercount;
}
