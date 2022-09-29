package bit.data.service;

import bit.data.dto.UserDto;

import java.util.List;

public interface UserServiceInter {

    public int getTotalCount();

    public int getLoginIdSearch(String loginid);

    public void insertUser(UserDto dto);

    public List<UserDto> getAllUsers();

    public UserDto getDataByUserNum(int user_num);

    public String getName(String loginid);

    public int getLoginIdPasswordCheck(String loginid,String password);

    public UserDto getDataByLoginId(String loginid);

    public void updateProfilePhoto(int user_num,String profilephoto);

    public void updateUser(UserDto dto);

    public void deleteUser(int user_num);
}
