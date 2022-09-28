package bit.data.service;

import bit.data.dao.FindDaoInter;
import bit.data.dto.FindDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FindService implements FindServiceInter{

    @Autowired
    FindDaoInter findDao;

    @Override
    public int selectTotalCount(String findcolumn, String findword) {
        return 0;
    }

    @Override
    public List<FindDto> findPagingList(String findcolumn, String findword, int startnum, int perpage) {
        return null;
    }

    @Override
    public FindDto selectByNum(int num) {
        return null;
    }

    @Override
    public void insertFindBoard(FindDto dto) {

    }

    @Override
    public void updateReadCount(int num) {

    }

    @Override
    public void updateFindBoard(FindDto dto) {

    }

    @Override
    public void deleteFindBoard(int num) {

    }
}
