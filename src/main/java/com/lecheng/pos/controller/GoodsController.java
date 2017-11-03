package com.lecheng.pos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lecheng.pos.pojo.Discount;
import com.lecheng.pos.pojo.Goods;
import com.lecheng.pos.pojo.ShopList;
import com.lecheng.pos.service.DiscountService;
import com.lecheng.pos.service.GoodsService;
import com.lecheng.pos.service.PrintService;
import com.lecheng.pos.service.ShopListService;

@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private ShopListService shopListService;
	@Autowired
	private DiscountService discountService;
	@Autowired
	private PrintService printService;
	
	@RequestMapping(value="/goodsList",method=RequestMethod.GET)
	public String queryAll(Model model) {
		List<Discount> discounts = discountService.queryAll();
		model.addAttribute("discounts", discounts);
		
		List<Goods> gList = goodsService.queryAll();
		model.addAttribute("gList", gList);
		
		return "goodsList";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(@RequestBody List<Goods> list) {
		System.out.println(list.toString());
		
		for (Goods goods : list) {
			goodsService.updateDiscountById(goods);
		}

		return "redirect:/goodsList";
	}
	
	@RequestMapping(value="/print", method=RequestMethod.POST)
	public void print() {
		List<ShopList> list = shopListService.queryAll();
		
		printService.print(list);
	}
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String welcome(Model model) {
		return queryAll(model);
	}
}
