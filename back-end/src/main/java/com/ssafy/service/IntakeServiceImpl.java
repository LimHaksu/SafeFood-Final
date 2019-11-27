package com.ssafy.service;

import java.util.List;

import com.ssafy.dao.IntakeRepo;
import com.ssafy.dto.Intake;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IntakeServiceImpl implements IntakeService {

	@Autowired
	IntakeRepo repo;

	// @Override
	// public List<Reply> select() {
	// return repo.select();
	// }

	@Override
	public List<Intake> select(Intake intake) {
		return repo.select(intake);
	}

	@Override
	public boolean insert(Intake intake) {
		return repo.insert(intake) >= 1 ? true : false;
	}

	@Override
	public boolean delete(Intake intake) {
		return repo.delete(intake) >= 1 ? true : false;
	}

}
