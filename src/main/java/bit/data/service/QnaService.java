package bit.data.service;

import bit.data.dao.QnaDao;
import bit.data.dao.QnaDaoInter;
import bit.data.dto.QnaDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QnaService implements QnaServiceInter{

	@Autowired
	QnaDaoInter daoInter;

	@Override
	public QnaDto getQna(int qna_num) {
		return daoInter.getQna(qna_num);
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
	public List<QnaDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage) {
		Map<String, Object> map=new HashMap<String, Object>();

		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("startnum", startnum);
		map.put("perpage", perpage);

		return daoInter.getPagingList(map);
	}

	@Override
	public void insertQna(QnaDto dto) {
		/*//새글인지 답글인지 판단해서 로직 설계 필요
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
		dto.setRelevel(relevel);*/

		daoInter.insertQna(dto);
	}

	/*@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<String, Integer>();

		map.put("regroup", regroup);
		map.put("restep", restep);

		daoInter.updateRestep(map);
	}
*/
	/*@Override
	public void updateReadCount(int num) {
		daoInter.updateReadCount(num);
	}*/

	@Override
	public QnaDto getData(int num) {

		return daoInter.getData(num);
	}

	@Override
	public void updateQna(QnaDto dto) {
		daoInter.updateQna(dto);
	}

	@Override
	public void deleteQna(int num) {
		daoInter.deleteQna(num);
	}
}
