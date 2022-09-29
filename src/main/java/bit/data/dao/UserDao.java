package bit.data.dao;

import bit.data.dto.MemberDto;
import bit.data.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class UserDao implements UserDaoInter{

    @Autowired
    SqlSession session;
    String ns="bit.data.dao.UserDao.";

    @Override
    public int getTotalCount() {
        // TODO Auto-generated method stub
        //원래는 앞에 namespace.id인대 생략가능
        //다른 파일에 같은 아이디가 있을 수도 있으므로 붙이는것이 좋음
        return session.selectOne(ns+"getTotalCount");
    }

    @Override
    public int getLoginIdSearch(String loginid) {
        // TODO Auto-generated method stub
        return session.selectOne(ns+"getLoginIdSearch", loginid);
        //1아니면 0이 반환됨
    }

    @Override
    public void insertUser(UserDto dto) {
        // TODO Auto-generated method stub
        session.insert(ns+"insertUser", dto);
    }

    @Override
    public List<UserDto> getAllUsers() {
        // TODO Auto-generated method stub
        return session.selectList(ns+"getAllUsers");
    }

    @Override
    public UserDto getDataByUserNum(int user_num) {
        // TODO Auto-generated method stub
        return session.selectOne(ns+"getDataByUserNum",user_num);
    }

    @Override
    public String getName(String loginid) {
        // TODO Auto-generated method stub
        return session.selectOne(ns+"getName",loginid);
    }

    @Override
    public int getLoginIdPasswordCheck(Map<String, String> map) {
        // TODO Auto-generated method stub
        return session.selectOne(ns+"getLoginIdPasswordCheck",map);
    }

    @Override
    public UserDto getDataByLoginId(String loginid) {
        // TODO Auto-generated method stub
        return session.selectOne(ns+"getDataByLoginId",loginid);
    }

    @Override
    public void updateProfilePhoto(Map<String, Object> map) {
        // TODO Auto-generated method stub
        session.update(ns+"updateProfilePhoto",map);
    }

    @Override
    public void updateUser(UserDto dto) {
        // TODO Auto-generated method stub
        session.update(ns+"updateUser",dto);
    }

    @Override
    public void deleteUser(int user_num) {
        // TODO Auto-generated method stub
        session.delete(ns+"deleteUser",user_num);
    }

}
