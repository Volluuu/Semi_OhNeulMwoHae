package bit.data.dao;

import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class FaqDao implements FaqDaoInter {
	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.FaqDao.";

	@Override
	public FaqDto getFaq(int faq_num) {
		return session.selectOne(ns+"getFaq",faq_num);
	}

	@Override
	public int getTotalCount(Map<String, String> map) {
		return session.selectOne(ns+"getTotalCount",map);
	}

	@Override
	public List<FaqDto> getPagingList(Map<String, Object> map) {
		return session.selectList(ns+"getPagingList",map);
	}

	@Override
	public void insertFaq(FaqDto dto) {
		session.insert(ns+"insertFaq",dto);
	}

	@Override
	public FaqDto getUser_num(int user_num) {
		return session.selectOne(ns+"getUser_num",user_num);
	}

	@Override
	public void updateFaq(FaqDto dto) {
		session.update(ns+"updateFaq",dto);
	}

	@Override
	public void deleteFaq(int faq_num) {
		session.delete(ns+"deleteFaq",faq_num);
	}
}
