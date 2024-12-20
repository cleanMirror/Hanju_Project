package com.example.hanju.main.model;

import lombok.Data;
import lombok.Getter;

@Data
public class Product {
	// hanju_product 테이블 컬럼
    private int productId;
    private String type;
    private String productName;
    private int price;
    private String sellerId;
    private String madeBy;
    private int alcohol;
    private int sparkling;
    private int sweet;
    private int sour;
    private int bitter;
    private int body;
    private int stock;
    private int capacity;
    private String material;
    
    // 조인 컬럼
    private String filePath;		// hanju_image 테이블 컬럼
    private String fileOrgName;		// hanju_image 테이블 컬럼
    private String codeName;		// hanju_code
}
