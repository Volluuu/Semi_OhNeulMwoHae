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

   /* @Override
    public void findPassword(String email,String loginid){
        String memberKey = new TempKey().getKey(8,false);
        String password=BCrypt.hashpw(memberKey,BCrypt.gensalt());
        userDao.findPassword(email,loginid,password);
        MailUtils sendMail = new MailUtils(mailSender);
        sendMail.setSubject("[오늘뭐해!? 커뮤니티 임시 비밀번호 입니다.]"); //메일제목
        sendMail.setText(
                "<h1>임시비밀번호 발급</h1>" +
                        "<br/>"+loginid+"님 "+
                        "<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
                        "<br/>임시비밀번호 :   <h2>"+memberKey+"</h2>"+
                        "<br/>로그인 후 비밀번호 변경을 해주세요."+
                        "<a href='http://localhost:9000"+
                        ">메인 페이지</a>");
        sendMail.setFrom("[dmltk1717@naver.com]", "오늘뭐해!?");
        sendMail.setTo(memberEmail);
        sendMail.send();
    };

    @Override
    public int findPasswordCheck(UserDto userdto){
        return userDao.findPasswordCheck(userdto);
    };*/

    @Override
    public UserDto findPasswordById(String loginid){return userDao.findPasswordById(loginid);}

    @Override
    public int findPasswordCheckById(String loginid){return userDao.findPasswordCheckById(loginid);}

    @Override
    public UserDto findIdByName(String name){
        return userDao.findIdByName(name);
    }
    @Override
    public int findIdCheckByName(String name){
        return userDao.findIdCheckByName(name);
    }

    @Override
    public UserDto getUserByKakaoId(long kakao_id) {
        return userDao.getUserByKakaoId(kakao_id);
    }

    @Override
    public UserDto getUserByNaverId(String naver_id) {
        return userDao.getUserByNaverId(naver_id);
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

    public String getNaverAccessToken(String code, String state) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://nid.naver.com/oauth2.0/token";
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
            sb.append("&client_id=h329mamXhLqa2E3NXaS3"); // TODO REST_API_KEY 입력
            sb.append("&client_secret=2hUWbMmbPj"); // TODO 비밀 키 제거 및 갱신 필요
            sb.append("&state=" + state);
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

            result.setKakao_id(jsonNode.get("id").asLong());
            result.setNickname(jsonNode.get("properties").get("nickname").asText());

            // 선택 동의 항목은 주어지지 않을 수도 있으므로 확인 후 가져옴
            JsonNode accessor;
            accessor = jsonNode.get("kakao_account").get("profile");
            result.setName(accessor != null ? (accessor.get("nickname") != null ? accessor.get("nickname").asText() : null) : null);
            accessor = jsonNode.get("kakao_account").get("name");
            result.setName(accessor != null ? accessor.asText() : null);
            accessor = jsonNode.get("kakao_account").get("email");
            result.setEmail(accessor != null ? accessor.asText() : null);
            accessor = jsonNode.get("kakao_account").get("age_range");
            result.setAge(accessor != null ? accessor.asText() : null);
            accessor = jsonNode.get("kakao_account").get("gender");
            result.setGender(accessor != null ? accessor.asText() : null);
            accessor = jsonNode.get("kakao_account").get("profile");
            result.setProfile(accessor != null ? accessor.asText() : null);
            accessor = jsonNode.get("kakao_account").get("phone_number");
            result.setHp(accessor != null ? accessor.asText() : null);

            System.out.println(result);

            br.close();


        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;
    }

    public UserDto getNaverUserInfo(String access_token) {
        String host = "https://openapi.naver.com/v1/nid/me";
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

            System.out.println(jsonNode.toPrettyString());

            result.setNaver_id(jsonNode.get("response").get("id").asText());

            // 선택 동의 항목은 주어지지 않을 수도 있으므로 확인 후 가져옴
            JsonNode accessor;
            accessor = jsonNode.get("response").get("name");
            result.setName(accessor != null ? accessor.asText() : null);
            accessor = jsonNode.get("response").get("nickname");
            result.setNickname(accessor != null ? accessor.asText() : null);
            accessor = jsonNode.get("response").get("email");
            result.setEmail(accessor != null ? accessor.asText() : null);
            accessor = jsonNode.get("response").get("age");
            result.setAge(accessor != null ? accessor.asText() : null);
            accessor = jsonNode.get("response").get("gender");
            result.setGender(accessor != null ? accessor.asText() : null);
            accessor = jsonNode.get("response").get("mobile");
            result.setHp(accessor != null ? accessor.asText() : null);

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