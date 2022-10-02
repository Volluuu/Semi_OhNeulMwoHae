package bit.data.dao;

import bit.data.dto.FaqDto;

import java.util.List;
import java.util.Map;

public interface FaqDaoInter {
	public FaqDto getFaq(int faq_num);
	public int getMaxNum();
	public int getTotalCount(Map<String, String> map);
	public List<FaqDto> getPagingList(Map<String, Object> map);
	public void insertFaq(FaqDto dto);
/*	public void updateRestep(Map<String, Integer> map);
	public void updateReadCount(int num);*/
	public FaqDto getData(int num);
	public void updateFaq(FaqDto dto);
	public void deleteFaq(int num);
}