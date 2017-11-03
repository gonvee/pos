package com.lecheng.pos.dao;

import java.util.List;

import com.lecheng.pos.pojo.ShopList;

public interface ShopListDao {

	/**
	 * 查询所有项
	 * @return
	 */
	public List<ShopList> queryAll();
}
