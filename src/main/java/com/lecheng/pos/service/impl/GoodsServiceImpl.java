package com.lecheng.pos.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lecheng.pos.dao.GoodsDao;
import com.lecheng.pos.pojo.Goods;
import com.lecheng.pos.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsDao goodsDao;
	
	@Override
	public Goods queryById(int id) {
		
		return goodsDao.queryById(id);
	}

	@Override
	public List<Goods> queryAll() {
		return goodsDao.queryAll();
	}

	@Override
	public void updateDiscountById(Goods goods) {
		goodsDao.updateDiscountById(goods);
	}

	@Override
	public Goods queryByItemId(String itemId) {
		
		return goodsDao.queryByItemId(itemId);
	}

}
