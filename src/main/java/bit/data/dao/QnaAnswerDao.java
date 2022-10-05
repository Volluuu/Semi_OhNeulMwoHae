//package bit.data.dao;
//
//import bit.data.dto.QnaAnswerDto;
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import java.util.List;
//
//@Repository
//public class QnaAnswerDao implements QnaAnswerDaoInter {
//
//    @Autowired
//    SqlSession session;
//
//    @Autowired
//    String ns="bit.data.dao.QnaAnswerDao.";
//
//    @Override
//    public List<QnaAnswerDto> getAllAnswerList(int answer_num) {
//        return session.selectOne(ns+"selectAllDatas",answer_num);
//    }
//
//    @Override
//    public void inserAnswer(QnaAnswerDto dto) {
//        session.insert(ns+"inserAnswer",dto);
//    }
//
//    @Override
//    public QnaAnswerDto getAnswer(int qna_num) {
//        return session.selectOne(ns+"selectAnswerByQna_num",qna_num);
//    }
//
//    @Override
//    public QnaAnswerDto getUserAnswer(int user_num) {
//        return session.selectOne(ns+"selectAnswerByUser_num",user_num);
//    }
//
//    @Override
//    public void deleteAnswer(int qna_num) {
//        session.delete(ns+"deleteAnswer",qna_num);
//    }
//}
