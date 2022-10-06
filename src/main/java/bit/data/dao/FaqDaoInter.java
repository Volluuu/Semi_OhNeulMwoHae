package bit.data.dao;

import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;

import java.util.List;
import java.util.Map;

public interface FaqDaoInter {
	public FaqDto getFaq(int faq_num);
	public int getTotalCount(Map<String, String> map);
	public List<FaqDto> getPagingList(Map<String, Object> map);
	public void insertFaq(FaqDto dto);
	public FaqDto getUser_num(int user_num);
	public void updateFaq(FaqDto dto);
	public void deleteFaq(int faq_num);
}