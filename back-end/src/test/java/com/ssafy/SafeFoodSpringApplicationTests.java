package com.ssafy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.Date;
import java.util.List;

import com.ssafy.dao.IntakeRepo;
import com.ssafy.dto.Intake;

import static org.hamcrest.CoreMatchers.is;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SafeFoodSpringApplicationTests {

	@Autowired
	IntakeRepo repo;

	@Test
	void contextLoads() {
		List<Intake> lists = repo.select(new Intake("ssafy3", new Date(2019, 11, 28), 4));

		assertEquals(lists.get(0).getId(), is("ssafy3"));
		assertEquals(lists.get(0).getDate(), is(new Date(2019, 11, 28)));
		assertEquals(lists.get(0).getCode(), is("1"));
	}

}
