package bit.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.BoardDaoInter;
import bit.data.dto.BoardDto;

@Service
public class BoardService implements BoardServiceInter {

	@Autowired
	BoardDaoInter daoInter;
	
	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return daoInter.getMaxNum();
	}

	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
		
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		
		
		return daoInter.getTotalCount(map);
	}

	@Override
	public List<BoardDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage) 
	{
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("startnum", startnum);
		map.put("perpage", perpage);
		
		
		return daoInter.getPagingList(map);
	}

	@Override
	public void insertBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		//새글인지 답글인지 판단해서 로직 설계 필요
		int num=dto.getNum();//새글일 경우는 0이 들어감
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0)
		{
			regroup=this.getMaxNum();
			restep=0;
			relevel=0;
		}else {//답글일 경우
			//같은 그룹중 전달받은 restep보다 큰값들은 모두 일괄적으로 +1을 해준다
			this.updateRestep(regroup, restep);
			//그리고 나서 전달받은 값보다 1크게 db에 저장한다
			restep++;
			relevel++;
		}
		//변경된 값들은 다시 dto에 넣는다
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		daoInter.insertBoard(dto);
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		daoInter.updateRestep(map);
	}

	@Override
	public void updateReadCount(int num) {
		// TODO Auto-generated method stub
		daoInter.updateReadCount(num);
	}

	@Override
	public BoardDto getData(int num) {
		// TODO Auto-generated method stub
		return daoInter.getData(num);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		daoInter.updateBoard(dto);
	}

	@Override
	public void deleteBoard(int num) {
		// TODO Auto-generated method stub
		daoInter.deleteBoard(num);
	}

	@Override
	public void likesUpdate(int num) {
		// TODO Auto-generated method stub
		daoInter.likesUpdate(num);
	}
	
	@Override
	public void likesUpdate2(int num) {
		// TODO Auto-generated method stub
		daoInter.likesUpdate2(num);
	}

}





















