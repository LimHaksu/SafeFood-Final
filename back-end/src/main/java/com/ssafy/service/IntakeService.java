package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Intake;

public interface IntakeService {
	// public List<Reply> select();

	public List<Intake> select(Intake intake);

	public boolean insert(Intake intake);

	public boolean update(Intake intake);

	public boolean delete(Intake intake);
}
