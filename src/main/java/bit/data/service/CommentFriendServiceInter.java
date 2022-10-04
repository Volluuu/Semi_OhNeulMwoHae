package bit.data.service;

import bit.data.dto.CommentFriendDto;

import javax.xml.stream.events.Comment;
import java.util.List;
import java.util.Map;

public interface CommentFriendServiceInter {

    public int selectMaxNum(int find_num);
    public int selectMaxDiff(int find_num);

    public int selectMaxRestep(int find_num, int regroup, int diff);

    public List<CommentFriendDto> selectAllComments(int find_num);
    public void insertComment(CommentFriendDto dto);
    public void updateCommentFriend(CommentFriendDto dto);
    public void updateRestep(int regroup, int restep);
    public void updateRestepDiff(int regroup, int diff, int restep);

    public void updateRestepMinus(int regroup, int restep);

    public CommentFriendDto selectCommentByNum(int friend_num);
    public void deleteByNum(int friend_num);

}
