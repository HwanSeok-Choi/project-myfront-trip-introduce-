package com.acorn.project.point;

import java.util.List;

import com.acorn.project.user.User;

public interface PointDAOI {

	int count();

	List<Point> selectAll() throws Exception;

	List<Point> selectById(String userId) throws Exception;
	
	int buyPoint(Point point, User user) throws Exception;

	int buyBoard(Point point, User user) throws Exception;

	int pointRefund(Point point, User user) throws Exception;
}