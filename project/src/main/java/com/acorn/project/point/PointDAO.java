package com.acorn.project.point;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.project.user.User;
import com.acorn.project.user.UserDAO;

@Repository
public class PointDAO implements PointDAOI  {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.acorn.PointMapper.";
    
    @Autowired
    UserDAO userDAO;

    
	@Override
	public int count() {
		return session.selectOne(namespace+"count");
	}
	
	@Override
    public List<Point> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }

	@Override
    public List<Point> selectById(String userId) throws Exception {
        return session.selectList(namespace+"selectById", userId);
    }

	@Override
    public int buyBoard(Point point, User user) throws Exception {
        return session.insert(namespace+"buyBoard", point);
    }

	@Override
    public int buyPoint(Point point, User user) throws Exception {
        return session.insert(namespace+"buyPoint", point);
    }

	@Override
    public int pointRefund(Point point, User user) throws Exception {
        return session.insert(namespace+"pointRefund", point);
    }
	
	public static void main(String[] args) throws Exception {
		PointDAO dao = new PointDAO();
		Point point = new Point();
		point.setBoardCode("b0001");
		point.setPointAmount(100);
		User user = new User();
		
		System.out.println(dao.buyBoard(point, user));
	}
}

 