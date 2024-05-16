package com.acorn.project.point;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Point {
	private String pointCode;
    private String userCode;
    private String boardCode;
    private int pointStatus;
    private int pointAmount;
    private Timestamp pointDate;
}