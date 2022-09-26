package bit.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.MemberDaoInter;
import bit.data.dto.MemberDto;

@Service
public class MemberService implements MemberServiceInter {
	
	@Autowired
	MemberDaoInter memberDao;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return memberDao.getTotalCount();
	}

	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return memberDao.getAllMembers();
	}

	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		memberDao.insertMember(dto);
	}

	@Override
	public int getSearchId(String id) {
		// TODO Auto-generated method stub
		return memberDao.getSearchId(id);
	}

	@Override
	public String getName(String id) {
		// TODO Auto-generated method stub
		return memberDao.getName(id);
	}

	
	
	
	@Override
	public int getIdPassCheck(String id, String pass) {
		// TODO Auto-generated method stub
		System.out.println(id);
		System.out.println(pass);
		Map<String, String> map=new HashMap<String, String>();
		map.put("loginid", id);
		map.put("loginpass", pass);
		
		return memberDao.getIdPassCheck(map);
	}

	@Override
	public MemberDto getDataById(String id) {
		// TODO Auto-generated method stub
		
		return memberDao.getDataById(id);
	}

	@Override
	public MemberDto getDataByNum(int num) {
		// TODO Auto-generated method stub
		
		return memberDao.getDataByNum(num);
	}

	@Override
	public void updatePhoto(int num, String photo) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("num", num);
		map.put("photo", photo);
		
		memberDao.updatePhoto(map);
	}

	@Override
	public void updateMember(MemberDto dto) {
		// TODO Auto-generated method stub
		memberDao.updateMember(dto);
	}

	@Override
	public void deleteMember(int num) {
		// TODO Auto-generated method stub
		memberDao.deleteMember(num);
	}

	
	
}
