package com.lecheng.pos.dao;

import java.util.List;

import com.lecheng.pos.pojo.Goods;

public interface GoodsDao {
	
	/**
	 * 通过ID查询
	 * @param id
	 * @return
	 */
	Goods queryById(int id);
	
	/**
	 * 查询所有
	 * @return
	 */
	List<Goods> queryAll();

	
	/**
	 * 更新数据
	 * @param goods
	 */
	void updateDiscountById(Goods goods);
	
	/**
	 * 通过条码查询商品
	 * @return
	 */
	Goods queryByItemId(String itemId);
}
