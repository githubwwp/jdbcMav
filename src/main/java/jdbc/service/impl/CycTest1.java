package jdbc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CycTest1 {

	@Autowired
	private CycTest2 cycTest2;

}
