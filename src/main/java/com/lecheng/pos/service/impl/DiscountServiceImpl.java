package com.lecheng.pos.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lecheng.pos.dao.DiscountDao;
import com.lecheng.pos.pojo.Discount;
import com.lecheng.pos.service.DiscountService;

@Service
public class DiscountServiceImpl implements DiscountService{

	@Autowired
	private DiscountDao discountDao;
	
	@Override
	public List<Discount> queryAll() {
		
		return discountDao.queryAll();
	}

}
