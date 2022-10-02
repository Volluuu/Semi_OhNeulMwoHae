package bit.data.service;

import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;

import java.util.List;

public interface FaqServiceInter {
	public FaqDto getFaq(int faq_num);
	public int getMaxNum();
	public int getTotalCount(String searchcolumn, String searchword);
	public List<FaqDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage);
	public void insertFaq(FaqDto dto);
	/*public void updateRestep(int regroup,int restep);*/
	/*public void updateReadCount(int num);*/
	public FaqDto getData(int num);
	public void updateFaq(FaqDto dto);
	public void deleteFaq(int num);

}
