package com.example.hanju.details.model;

import lombok.Data;

@Data
public class Details {
    private String productId;
    private String type;
    private String productName;
    private String price;
    private String sellerId;
    private String madeBy;
    private String alcohol;
    private String sparkling;
    private String sweet;
    private String sour;
    private String bitter;
    private String body;
    private String stock;
    private String capacity;
    private String color;
    private String material;

    //CODE
    private String kind;
    private String codeName;
    private String code;
    private String codeFull;
    private String parentCode;

    //NORMAL_SELL
    private String sellId;
    private String discount;
    private String cDateTime;
    private String contents;
    private String description;

    //pickUpStore
    private String storeId;
    private String storeName;
    private String address;
    private String zipNo;
    private String roadaddrpart1;
    private String addrdetail;
    private String phone;

    //groupSell
    private String groupSellId;
    private String targetAmount;
    private String startDate;
    private String endDate;
    private String userId;
    private String currentAmount;
}
