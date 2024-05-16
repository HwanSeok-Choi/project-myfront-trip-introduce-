package com.acorn.project.point;

import java.util.List;

import com.acorn.project.user.User;

public interface PointServiceI {

	int count();

	List<Point> getListAll() throws Exception;

	List<Point> getPointById(String userId) throws Exception;

	int buyBoard(Point point, User user) throws Exception;

	int buyPoint(Point point, User user) throws Exception;

	int pointRefund(Point point, User user) throws Exception;

}