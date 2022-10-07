package bit.data.service;

import bit.data.dao.UserDaoInter;
import bit.data.dto.UserDto;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kotlinx.serialization.json.Json;
import net.nurigo.sdk.message.model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
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

    public String getKakaoAccessToken(String code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        try {

            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);


            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=3ed5690883b3d1e49474845d49aad6d5"); // TODO REST_API_KEY 입력
            sb.append("&redirect_uri=http://localhost:9000/user/kakao"); // TODO 인가코드 받은 redirect_uri 입력
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(br);

            access_Token = jsonNode.get("access_token").toString();
            refresh_Token = jsonNode.get("refresh_token").toString();

            br.close();
            bw.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;
    }

    public UserDto getUserInfo(String access_token) {
        String host = "https://kapi.kakao.com/v2/user/me";
        UserDto result = new UserDto();
        try {
            URL url = new URL(host);

            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestProperty("Authorization", "Bearer " + access_token);
            urlConnection.setRequestMethod("GET");

            int responseCode = urlConnection.getResponseCode();
            System.out.println("responseCode = " + responseCode);


            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));


            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(br);

            result.setNickname(jsonNode.get("properties").get("nickname").asText());
            result.setEmail(jsonNode.get("kakao_account").get("email").asText());
            result.setAge(jsonNode.get("kakao_account").get("age_range").asText());
            result.setGender(jsonNode.get("kakao_account").get("gender").asText());
            System.out.println(result);

            br.close();


        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;
    }

    public UserDto getAgreementInfo(String access_token)
    {
        UserDto result = new UserDto();
        String host = "https://kapi.kakao.com/v2/user/scopes";
        try{
            URL url = new URL(host);
            HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
            urlConnection.setRequestMethod("GET");
            urlConnection.setRequestProperty("Authorization", "Bearer "+access_token);

            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));

            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(br);

            System.out.println(jsonNode.toString());

            // result is json format
            br.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

}