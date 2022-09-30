package bit.data.service;

import bit.data.dao.CommentFriendDaoInter;
import bit.data.dto.CommentFriendDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommentFriendService implements  CommentFriendServiceInter{

    @Autowired
    CommentFriendDaoInter commentFriendDao;

    @Override
    public int selectMaxNum(int find_num) {
        return commentFriendDao.selectMaxNum(find_num);
    }

    @Override
    public List<CommentFriendDto> selectAllComments(int find_num) {
        return commentFriendDao.selectAllComments(find_num);
    }

    @Override
    public void insertComment(CommentFriendDto dto) {

        commentFriendDao.insertComment(dto);
    }

    @Override
    public void updateCommentFriend(CommentFriendDto dto) {
        commentFriendDao.updateCommentFriend(dto);
    }

    @Override
    public void updateRestep(int regroup, int restep) {
        Map<String, Integer> map=new HashMap<String, Integer>();
        map.put("regroup", regroup);
        map.put("restep", restep);
        commentFriendDao.updateRestep(map);
    }

    @Override
    public CommentFriendDto selectCommentByNum(int friend_num) {
        return commentFriendDao.selectCommentByNum(friend_num);
    }

    @Override
    public void deleteByNum(int friend_num) {
        commentFriendDao.deleteByNum(friend_num);
    }
}
