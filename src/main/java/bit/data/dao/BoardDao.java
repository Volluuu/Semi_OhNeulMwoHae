package bit.data.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.BoardDto;

@Repository //자동 bean등록
public class BoardDao implements BoardDaoInter {

	@Autowired
	SqlSession session;
	
	String ns="bit.data.dao.BoardDao.";
	
	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getMaxNum");
	}

	@Override
	public int getTotalCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getTotalCount", map);
	}

	@Override
	public List<BoardDto> getPagingList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getPagingList", map);
	}

	@Override
	public void insertBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		session.insert(ns+"insertBoard",dto);
	}

	@Override
	public void updateRestep(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		session.update(ns+"updateRestep", map);
	}

	@Override
	public void updateReadCount(int num) {
		// TODO Auto-generated method stub
		session.update(ns+"updateReadCount",num);
	}

	@Override
	public BoardDto getData(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"selectByNum",num);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		session.update(ns+"updateBoard", dto);
	}

	@Override
	public void deleteBoard(int num) {
		// TODO Auto-generated method stub
		session.delete(ns+"deleteBoard",num);
	}

	@Override
	public void likesUpdate(int num) {
		// TODO Auto-generated method stub
		session.update(ns+"likesUpdate",num);
	}
	
	@Override
	public void likesUpdate2(int num) {
		// TODO Auto-generated method stub
		session.update(ns+"likesUpdate2",num);
	}
}
