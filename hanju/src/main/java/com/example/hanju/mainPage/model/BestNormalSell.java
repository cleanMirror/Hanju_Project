package com.example.hanju.mainPage.model;

import lombok.Data;

@Data
public class BestNormalSell {

	private String sellId;
	private String productName;
	private int price;
	private String priceComma;
	private int discount;
	private String filePath;
	private String discountPrice;	// 할인 가격
	
}
