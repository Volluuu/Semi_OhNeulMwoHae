package bit.data.service;

import bit.data.dto.FaqDto;

import java.util.List;

public interface FaqServiceInter {
	public FaqDto getFaq(int faq_num);
	public int getTotalCount(String searchcolumn, String searchword);
	public List<FaqDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage);
	public void insertFaq(FaqDto dto);
	public FaqDto getUser_num(int user_num);
	public void updateFaq(FaqDto dto);
	public void deleteFaq(int faq_num);

}
