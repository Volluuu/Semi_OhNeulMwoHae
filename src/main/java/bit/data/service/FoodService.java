package bit.data.service;

import bit.data.dao.FoodDaoInter;
import bit.data.dto.FoodDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FoodService implements FoodServiceInter {

    @Autowired
    FoodDaoInter fooddao;

    @Override
    public int selectTotalCount(String foodcolumn, String foodword, int gu) {
        Map<String, Object> map=new HashMap<>();
        map.put("foodcolumn", foodcolumn);
        map.put("foodword", foodword);
        map.put("gu",gu);
        return fooddao.selectTotalCount(map);
    }

        @Override
        public List<FoodDto> selectPagingList(String foodcolumn, String foodword, int startnum, int perpage, int gu) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("foodcolumn", foodcolumn);
            map.put("foodsword", foodword);
            map.put("startnum", startnum);
            map.put("perpage", perpage);
            map.put("gu",gu);
            return fooddao.selectPagingList(map);
        }

    @Override
    public void insertFood(FoodDto dto) {
        fooddao.insertFood(dto);
    }

    @Override
    public void updateReadCount(int food_num) {
        fooddao.updateReadCount(food_num);
    }

    @Override
    public void deleteFood(int food_num) {
        fooddao.deleteFood(food_num);
    }

    @Override
    public void updateFood(FoodDto dto) {
        fooddao.updateFood(dto);
    }

    @Override
    public void likesInsert(int food_num) {
        fooddao.likesInsert(food_num);
    }

    @Override
    public void likesUpdate(int food_num) {
        fooddao.likesUpdate(food_num);
    }

    @Override
    public FoodDto selectByNum(int food_num) {
        return fooddao.selectByNum(food_num);
    }
}
