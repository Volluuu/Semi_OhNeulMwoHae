package bit.data.dao;

import bit.data.dto.CommentFriendDto;

import java.util.List;
import java.util.Map;

public interface CommentFriendDaoInter {
    public List<CommentFriendDto> selectAllComments(int find_num);
    public void insertComment(CommentFriendDto dto);
    public void updateRestep(Map<String, Integer> map);
    public CommentFriendDto selectCommentByNum(int friend_num);
    public void deleteByNum(int friend_num);
}
