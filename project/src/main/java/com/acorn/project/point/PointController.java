package com.acorn.project.point;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.user.User;

@Controller
@RequestMapping("/point/*")
public class PointController {
	@Inject
	PointServiceI service;
	
	@RequestMapping("showMyPoint.do")
	public String showMyPoint() {
		return "point/showMyPoint";
	}
}
