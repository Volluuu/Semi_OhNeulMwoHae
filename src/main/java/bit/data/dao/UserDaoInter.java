package bit.data.dao;


import bit.data.dto.UserDto;

import java.util.List;
import java.util.Map;

public interface UserDaoInter {

    public int findPassword(String password,String email,String loginid);
    public int findPasswordCheck(UserDto userdto);
    public UserDto findIdByName(String name);
    public int findIdCheckByName(String name);
    public UserDto getUserByKakaoId(long kakao_id);
    public UserDto getUserByNaverId(String naver_id);
    public int getTotalCount();
    public int getLoginIdSearch(String loginid);
    public int loginNicknameCheck(String nickname);
    public void insertUser(UserDto dto);
    public List<UserDto> getAllUsers();
    public UserDto getDataByUserNum(int user_num);
    public String getName(String loginid);
    public int getLoginIdPasswordCheck(Map<String, String> map);
    public UserDto getDataByLoginId(String loginid);
    public void updateProfilePhoto(Map<String, Object> map);
    public void updateUser(UserDto dto);
    public void deleteUser(int user_num);

}