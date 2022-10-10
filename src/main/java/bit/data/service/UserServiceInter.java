package bit.data.service;

import bit.data.dto.UserDto;
import com.fasterxml.jackson.databind.JsonNode;

import java.io.IOException;
import java.util.List;

public interface UserServiceInter {


    public UserDto findPasswordById(String loginid);
    public int findPasswordCheckById(String loginid);
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

    public int getLoginIdPasswordCheck(String loginid,String password);

    public UserDto getDataByLoginId(String loginid);

    public void updateProfilePhoto(int user_num,String profilephoto);

    public void updateUser(UserDto dto);

    public void deleteUser(int user_num);

    public String getKakaoAccessToken(String code);

    public String getNaverAccessToken(String code, String state);

    public UserDto getUserInfo(String access_token);

    public UserDto getNaverUserInfo(String access_token);

    public UserDto getAgreementInfo(String access_token);

}
