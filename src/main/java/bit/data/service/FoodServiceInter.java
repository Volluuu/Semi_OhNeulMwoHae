package bit.data.service;


import bit.data.dto.FoodDto;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface FoodServiceInter {
    public int selectTotalCount(String foodcolumn, String foodword);
    public List<FoodDto> selectPagingList(String foodcolumn, String foodword, int startnum, int perpage);
    public void insertFood(FoodDto dto);
    public void updateReadCount(int food_num);
    public void deleteFood(int food_num);
    public void updateFood(FoodDto dto);
    public void likesInsert(int food_num);
    public void likesUpdate(int food_num);
}
