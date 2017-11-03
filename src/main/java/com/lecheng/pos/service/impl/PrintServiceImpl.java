package com.lecheng.pos.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lecheng.pos.pojo.Goods;
import com.lecheng.pos.pojo.ShopList;
import com.lecheng.pos.pojo.ToPrintList;
import com.lecheng.pos.service.GoodsService;
import com.lecheng.pos.service.PrintService;

@Service
public class PrintServiceImpl implements PrintService {

	@Autowired
	GoodsService goodsService;
	@Override
	public void print(List<ShopList> list) {
		Map<ToPrintList, Integer> map = setInfo(convert(list));
		
		System.out.println("名称\t" + "数量\t" + "单价\t" + "小计");
		
		Set<ToPrintList> set = map.keySet();
		
		for (ToPrintList toPrintList : set) {
			System.out.println(toPrintList.getGoodName() + "\t" + toPrintList.getGoodNum() + toPrintList.getGoodSku()
						+ "\t" + toPrintList.getGoodPrice() + "\t" + 
						(toPrintList.getGoodPrice() * map.get(toPrintList)));
		}
	}
	
	/**
	 * 将小票清单中条码和数量分隔
	 * @param list
	 * @return
	 */
	private List<ToPrintList> convert(List<ShopList> list){
		List<ToPrintList> toPrintLists = new ArrayList<>();
		
		for (ShopList shopList : list) {
			String itemId = shopList.getItemId();
			String[] s = itemId.split("-");
			
			ToPrintList printList = new ToPrintList();
			printList.setItemId(s[0]);
			if (s.length == 2) {
				printList.setGoodNum(Integer.valueOf(s[1]));
			}
			
			toPrintLists.add(printList);
		}
		
		return toPrintLists;
	}
	
	/**
	 * 补充购物清单上的商品信息
	 * @param list
	 * @return
	 */
	private Map<ToPrintList, Integer> setInfo(List<ToPrintList> list) {
		
		Map<ToPrintList, Integer> map = new HashMap<>();
		
		for (ToPrintList toPrintList : list) {
			Goods goods = goodsService.queryByItemId(toPrintList.getItemId());

			toPrintList.setGoodName(goods.getGoodName());
			toPrintList.setGoodSku(goods.getGoodSku());
			toPrintList.setGoodPrice(goods.getGoodPrice());
			
			if (map.containsKey(toPrintList)) {
				map.put(toPrintList, (map.get(toPrintList) + 1));
			} else {
				map.put(toPrintList, 1);
			}
		}
		
		return map;
	}
}
