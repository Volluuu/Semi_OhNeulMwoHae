package bit.data.service;

import bit.data.dto.QnaDto;

import java.util.List;
import java.util.Map;

public interface AdminServiceInter {
    public int getTotalCount(Map<String, String> qnamap);
    public List<QnaDto> getAllData();
    public int selectCafeTotalCount(Map<String, String> cafemap);
    public int selectFoodTotalCount(Map<String, String> foodmap);
    public int selectTripTotalCount(Map<String, String> tripmap);
}
