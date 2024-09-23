package com.example.hanju.cart.model.dto;

import lombok.Data;

@Data
public class CartCheckDto {
    private String cartId;
    private int productCount;

	public String getCartId() {
		return cartId;
	}
	public int getProductCount() {
		return productCount;
	}

}
