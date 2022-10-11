package bit.data.dao;

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
    public UserDto findPasswordById(String loginid){
        return session.selectOne(ns+"findPasswordById",loginid);
    }

    //메일확인
    @Override
    public int findPasswordCheckById(String loginid){
        return session.selectOne(ns+"findPasswordCheckById", loginid);
    }


    @Override
    public List<UserDto> findIdByName(String name)throws Exception{
        return session.selectList(ns+"findIdByName", name);
    }

    @Override
    public int findIdCheckByName(String name)throws Exception{
        return session.selectOne(ns+"findIdCheckByName", name);
    }

    @Override
    public UserDto getUserByKakaoId(long kakao_id) {
        return session.selectOne(ns+"getUserByKakaoId", kakao_id);
    }

    @Override
    public UserDto getUserByNaverId(String naver_id) {
        return session.selectOne(ns+"getUserByNaverId", naver_id);
    }

    @Override
    public int getTotalCount() {
        // TODO Auto-generated method stub
        //원래는 앞에 namespace.id인대 생략가능
        //다른 파일에 같은 아이디가 있을 수도 있으므로 붙이는것이 좋음
        return session.selectOne(ns+"getTotalCount");
    }

    //회원이 있는지 여부 확인
    @Override
    public int getLoginIdSearch(String loginid) {
        // TODO Auto-generated method stub
        return session.selectOne(ns+"getLoginIdSearch", loginid);
        //1아니면 0이 반환됨
    }

    @Override
    public int loginNicknameCheck(String nickname) {
        return session.selectOne(ns+"loginNicknameCheck", nickname);
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