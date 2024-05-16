package com.acorn.project.point;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Component;

import com.acorn.project.user.User;

@Component
public class PointService implements PointServiceI {

	@Inject
	PointDAO dao;
	
	@Override
	public int count() {
		return dao.count();
	}
	
	@Override
	public List<Point> getListAll() throws Exception {
		return dao.selectAll();
	}
	
	@Override
	public List<Point> getPointById(String userId) throws Exception {
		return dao.selectById(userId);
	}
	
	@Override
	public int buyBoard(Point point, User user) throws Exception {
		return dao.buyBoard(point, user);
	}


    @Override
	public int buyPoint(Point point, User user) throws Exception {
        return dao.buyBoard(point, user);
    }

    @Override
	public int pointRefund(Point point, User user) throws Exception {
        return dao.pointRefund(point, user);
    }
	
	
}
