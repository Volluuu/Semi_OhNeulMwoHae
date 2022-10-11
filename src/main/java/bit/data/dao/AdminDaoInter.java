package bit.data.dao;

import bit.data.dto.QnaDto;
import bit.data.dto.UserDto;

import java.util.List;
import java.util.Map;

public interface AdminDaoInter {
    public int getTotalCount();
    public List<QnaDto> getAllData();
    public int selectCafeTotalCount();
    public int selectFoodTotalCount();
    public int selectTripTotalCount();
    public int qnaNotAnswer();

    public int todayReview();
    public List<UserDto> userInfo();
}
