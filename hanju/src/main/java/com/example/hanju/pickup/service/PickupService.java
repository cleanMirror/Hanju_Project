package com.example.hanju.pickup.service;

import java.util.Map;

public interface PickupService {

    Map<String,Object> getBoardList(Map<String,Object> map);
    Map<String,Object> searchProduct(Map<String,Object> map);

}
