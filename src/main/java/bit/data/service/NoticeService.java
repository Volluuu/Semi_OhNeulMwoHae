package bit.data.service;

import bit.data.dao.NoticeDaoInter;
import bit.data.dao.QnaDaoInter;
import bit.data.dto.NoticeDto;
import bit.data.dto.QnaDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NoticeService implements NoticeServiceInter {

	@Autowired
	NoticeDaoInter daoInter;

	@Override
	public NoticeDto getNotice(int notice_num) {
		return daoInter.getNotice(notice_num);
	}

	@Override
	public int getMaxNum() {
		return daoInter.getMaxNum();
	}

	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
		Map<String, String> map=new HashMap<String, String>();

		map.put("searchcolumn",searchcolumn);
		map.put("searchword",searchword);

		return daoInter.getTotalCount(map);
	}

	@Override
	public List<NoticeDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage) {
		Map<String, Object> map=new HashMap<String, Object>();

		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("startnum", startnum);
		map.put("perpage", perpage);

		return daoInter.getPagingList(map);
	}

	@Override
	public void insertNotice(NoticeDto dto) {
		daoInter.insertNotice(dto);
	}

	@Override
	public NoticeDto getData(int num) {
		return daoInter.getData(num);
	}

	@Override
	public void updateNotice(NoticeDto dto) {
		daoInter.updateNotice(dto);
	}

	@Override
	public void deleteNotice(int num) {
		daoInter.deleteNotice(num);
	}
}
