package com.lecheng.pos.service;

import java.util.List;

import com.lecheng.pos.pojo.ShopList;

/**
 * 购物单打印接口
 * @author David
 *
 */
public interface ListPrinter {

	public void print(List<ShopList> list);
	
}
