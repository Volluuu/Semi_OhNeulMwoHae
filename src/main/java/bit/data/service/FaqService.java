package bit.data.service;

import bit.data.dao.FaqDaoInter;
import bit.data.dao.NoticeDaoInter;
import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FaqService implements FaqServiceInter {

	@Autowired
	FaqDaoInter daoInter;

	@Override
	public FaqDto getFaq(int faq_num) {
		return daoInter.getFaq(faq_num);
	}

	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
		Map<String, String> map=new HashMap<String, String>();

		map.put("searchcolumn",searchcolumn);
		map.put("searchword",searchword);

		return daoInter.getTotalCount(map);
	}

	@Override
	public List<FaqDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage) {
		Map<String, Object> map=new HashMap<String, Object>();

		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("startnum", startnum);
		map.put("perpage", perpage);

		return daoInter.getPagingList(map);
	}

	@Override
	public void insertFaq(FaqDto dto) {
		daoInter.insertFaq(dto);
	}

	@Override
	public FaqDto getUser_num(int user_num) {
		return daoInter.getUser_num(user_num);
	}

	@Override
	public void updateFaq(FaqDto dto) {
		daoInter.updateFaq(dto);
	}

	@Override
	public void deleteFaq(int num) {
		daoInter.deleteFaq(num);
	}
}
