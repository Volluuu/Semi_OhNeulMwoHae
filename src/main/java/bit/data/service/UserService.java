package bit.data.service;

import bit.data.dao.UserDaoInter;
import bit.data.dto.UserDto;
import net.nurigo.sdk.message.model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Service
public class UserService implements UserServiceInter{

    @Autowired
    UserDaoInter userDao;

    @Override
    public UserDto findIdByName(String name){
        return userDao.findIdByName(name);
    }
    @Override
    public int findIdCheckByName(String name){
        return userDao.findIdCheckByName(name);
    }

    @Override
    public int getTotalCount() {
        // TODO Auto-generated method stub
        return userDao.getTotalCount();
    }

    @Override
    public int getLoginIdSearch(String loginid) {
        // TODO Auto-generated method stub
        return userDao.getLoginIdSearch(loginid);
    }

    @Override
    public int loginNicknameCheck(String nickname) {
        return userDao.loginNicknameCheck(nickname);
    }

    @Override
    public void insertUser(UserDto dto) {
        // TODO Auto-generated method stub
        userDao.insertUser(dto);
    }

    @Override
    public List<UserDto> getAllUsers() {
        // TODO Auto-generated method stub
        return userDao.getAllUsers();
    }

    @Override
    public UserDto getDataByUserNum(int user_num) {
        // TODO Auto-generated method stub

        return userDao.getDataByUserNum(user_num);
    }

    @Override
    public String getName(String loginid) {
        // TODO Auto-generated method stub
        return userDao.getName(loginid);
    }

    @Override
    public int getLoginIdPasswordCheck(String loginid, String password) {
        // TODO Auto-generated method stub
        System.out.println(loginid);
        System.out.println(password);
        Map<String, String> map=new HashMap<String, String>();
        map.put("loginid", loginid);
        map.put("password", password);

        return userDao.getLoginIdPasswordCheck(map);
    }

    @Override
    public UserDto getDataByLoginId(String loginid) {
        // TODO Auto-generated method stub

        return userDao.getDataByLoginId(loginid);
    }



    @Override
    public void updateProfilePhoto(int user_num, String profilephoto) {
        // TODO Auto-generated method stub
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("user_num", user_num);
        map.put("profilephoto", profilephoto);

        userDao.updateProfilePhoto(map);
    }

    @Override
    public void updateUser(UserDto dto) {
        // TODO Auto-generated method stub
        userDao.updateUser(dto);
    }

    @Override
    public void deleteUser(int user_num) {
        // TODO Auto-generated method stub
        userDao.deleteUser(user_num);
    }
}