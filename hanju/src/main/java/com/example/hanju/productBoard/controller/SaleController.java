package com.example.hanju.productBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.hanju.productBoard.service.SaleService;
import com.google.gson.Gson;

@Controller
public class SaleController {
	
	@Autowired
	SaleService saleService;
	
	// market/allProducts.jsp 연동
	@RequestMapping("market/productList.do")
	public String marketAll(Model model) throws Exception {
		return "market/allProducts";
	}
	// market/traditionProducts.jsp 연동
	@RequestMapping("market/traditionProducts.do")
	public String tradAlcohol(Model model) throws Exception {
		return "market/traditionProducts";
	}
	// market/giftSets.jsp 연동
	@RequestMapping("market/giftSets.do")
	public String giftSet(Model model) throws Exception {
		return "market/giftSets";
	}
	
	
	// @ResponseBody
	// market/productList.do
	@RequestMapping(value = "market/productList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String prodList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = saleService.getProductList(map);
		return new Gson().toJson(resultMap);
	}
	
	// market/traditionProducts.do
	@RequestMapping(value = "market/traditionAlcohol.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String tradList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = saleService.getTradAlcohol(map);
		return new Gson().toJson(resultMap);
	}
	
	// market/giftSets.do
	@RequestMapping(value = "market/giftSets.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String giftList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = saleService.getGiftSet(map);
		return new Gson().toJson(resultMap);
	}
	
	// 코드 리스트
	@RequestMapping(value = "/code-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String itemGroupList(Model model, @RequestParam HashMap<String, Object> listMap) throws Exception { 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = saleService.selectCodeList(listMap);
		return new Gson().toJson(resultMap);
	}
}