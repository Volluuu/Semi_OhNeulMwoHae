package bit.data.service;

import bit.data.dao.CafeDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CafeService {

    @Autowired
    CafeDaoInter cafedao;


}
