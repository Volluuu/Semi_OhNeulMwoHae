package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.MemberDto;

public interface MemberDaoInter {

	public int getTotalCount();
	public List<MemberDto> getAllMembers();
	public void insertMember(MemberDto dto);
	public int getSearchId(String id);
	public String getName(String id);
	
	public int getIdPassCheck(Map<String, String> map);
	public MemberDto getDataById(String id);
	public MemberDto getDataByNum(int num);
	public void updatePhoto(Map<String, Object> map);
	public void updateMember(MemberDto dto);
	public void deleteMember(int num);
}
