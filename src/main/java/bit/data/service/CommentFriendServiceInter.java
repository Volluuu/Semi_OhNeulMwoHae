package bit.data.service;

import bit.data.dto.CommentFriendDto;

import java.util.List;
import java.util.Map;

public interface CommentFriendServiceInter {

    public List<CommentFriendDto> selectAllComments(int friend_num);
    public void insertComment(CommentFriendDto dto);
    public void updateRestep(int regroup, int restep);
    public CommentFriendDto selectCommentByNum(int num);
    public void deleteByNum(int num);

}
