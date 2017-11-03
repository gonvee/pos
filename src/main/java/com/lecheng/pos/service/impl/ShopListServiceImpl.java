package com.lecheng.pos.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lecheng.pos.dao.ShopListDao;
import com.lecheng.pos.pojo.ShopList;
import com.lecheng.pos.service.ShopListService;

@Service
public class ShopListServiceImpl implements ShopListService{

	@Autowired
	private ShopListDao shopListDao;
	
	@Override
	public List<ShopList> queryAll() {
		return shopListDao.queryAll();
	}

}
