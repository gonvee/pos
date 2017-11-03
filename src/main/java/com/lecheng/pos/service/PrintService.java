package com.lecheng.pos.service;

import java.util.List;

import com.lecheng.pos.pojo.ShopList;

public interface PrintService {

	void print(List<ShopList> list);
}
